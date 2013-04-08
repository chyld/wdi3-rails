class HomeController < ApplicationController
  def index
  end

  def length
    render :json => {:length => Declaration.first.words.count}
  end

  def data
    position = params[:position]
    declaration = Declaration.first
    code = Code.first
    word = declaration.words.where(:index => position).first.value
    hex = word.each_char.map{|c| code.characters.where(:symbol => c).first.hex}.join.downcase

    begin
      binary = Number.hex2bin(hex)
    rescue
      binary = 'e4404'
    end

    begin
      dec = Number.bin2dec(binary)
    rescue
      dec = 0
    end

    render :json => {word: word, hex: hex, dec: dec, bin: binary}
  end
end
