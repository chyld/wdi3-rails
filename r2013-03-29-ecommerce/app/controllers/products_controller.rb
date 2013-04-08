class ProductsController < ApplicationController
  def index
    @products = Product.filtered
  end

  def new
    @product = Product.new
  end

  def purchase
    product = Product.find(params[:id])

    begin
      if @auth.customer_id.nil?
        customer = Stripe::Customer.create(email: @auth.email, card: params[:token])
        @auth.customer_id = customer.id
        @auth.save
      end
      Stripe::Charge.create(customer: @auth.customer_id, amount: (product.cost * 100).to_i, description: product.name, currency: 'usd')
    rescue Stripe::CardError => @error
    end

    if @error.nil?
      @auth.products << product
      Notifications.purchased_product(@auth, product).deliver
    end

    @products = Product.filtered
  end

  def search
    query = params[:query]
    @products = Product.where("name @@ :q or description @@ :q or image @@ :q or address @@ :q", :q => query)

    tags = Tag.where("name @@ :q", :q => query)
    @products += tags.map(&:products).flatten
    @products.uniq!

    render :filter
  end

  def filter
    tag = Tag.find(params[:tag_id])
    @products = tag.products
  end

  def create
    @product = Product.create(params[:product])
    tags = params[:tags].split(',')
    tags.each do |tag|
      tag = tag.squish
      t = Tag.where(name: tag).first
      t = Tag.new(name: tag) if t.nil?
      @product.tags << t
    end

    @products = Product.filtered
  end
end
