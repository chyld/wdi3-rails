module ApplicationHelper
  def show_song(song)
    if is_user?
      if song.in?(@auth.songs)
        '<p>' + link_to(number_to_currency(song.cost * 0.70), refund_song_path(song), :method => :post, :class => 'button radius tiny success') + '</p>' +
        audio_tag(song.filename, :controls => true)
      elsif song.cost <= @auth.balance
        link_to(number_to_currency(song.cost), cart_song_path(song), :class => 'button radius tiny')
      else
        link_to(number_to_currency(song.cost), '#', :class => 'button radius tiny alert')
      end
    end
  end
  def show_album(album)
    if is_user?
      if album.in?(@auth.albums)
        link_to('Purchased', '#', :class => 'button radius tiny success')
      elsif album.cost(@auth.songs) <= @auth.balance
        link_to(number_to_currency(album.cost(@auth.songs)), purchase_album_path(album), :method => :post, :class => 'button radius tiny')
      else
        link_to(number_to_currency(album.cost(@auth.songs)), '#', :class => 'button radius tiny alert')
      end
    end
  end
  def is_admin?
    @auth.present? && @auth.is_admin
  end
  def is_user?
    @auth.present? && !@auth.is_admin
  end
  def albumnav
    links = ""

    if @auth
      @auth.albums.each do |album|
        links += "<li>#{link_to(album.name, album)}</li>"
      end
    end

    links
  end
  def mixtapenav
    links = ""

    if @auth
      @auth.mixtapes.each do |mixtape|
        links += "<li>#{link_to(mixtape.name, mixtape)}</li>"
      end
    end

    links
  end
  def intellinav
    links = ""

    if @auth.present?
      if @auth.is_admin
        links += "<li>#{link_to('Show Users', users_path)}</li>"
      end

      links += "<li>#{link_to('Edit', edit_users_path)}</li>"
      links += "<li>#{link_to(@auth.name + ' - ' + number_to_currency(@auth.balance), login_path, :method => :delete, :confirm => "Are you sure?")}</li>"
    else
      "<li>#{link_to('Create Account', new_user_path)}</li>" +
      "<li>#{link_to('Login', login_path)}</li>"
    end
  end
end
