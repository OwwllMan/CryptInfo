require 'rubygems'
require 'nokogiri'
require 'open-uri'

class CryptScrap

    def initialize
        @url = Nokogiri::HTML(open('https://coinmarketcap.com/all/views/all/'))
    end 
    
    def crypto_name
      arrayOfCryptoName =[]
      @url.css('a.currency-name-container').each do |value|
        arrayOfCryptoName << value.text
      end
      return arrayOfCryptoName
    end

    def crypto_value
      arrayOfCryptoValue = []
      @url.css('a.price').each do |name|
        arrayOfCryptoValue  << name.text
      end
      return arrayOfCryptoValue 
    end

    def hash_names_and_values(crypto_name,crypto_value)
      @hashOfNamesAndValues = Hash[crypto_name.zip(crypto_value)]
    end

    def save_hash
        Crypto.delete_all
        @hashOfNamesAndValues.each do |k,v|
            Crypto.create(cryptoname: k, cryptovalue: v)
        end
    end
    
    def perform
    hash_names_and_values(crypto_name, crypto_value)
    end
end




