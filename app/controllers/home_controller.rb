class HomeController < ApplicationController
  require 'crypt_scrap_service'
  def index
    @values = CryptScrap.new.perform
    @array = []
    a = 0
    while a < @values.keys.length do
      @array << [@values.keys[a], @values.keys[a]]
      a +=1
    end
    @CryptoName = params[:crpt]
    @CryptoValue = @values[params[:crpt]]
  end
end
