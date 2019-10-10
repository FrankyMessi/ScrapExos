require 'rubygems'
require 'nokogiri'
require 'open-uri'



def crypto_data
  page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
    crypto = []
        page.xpath("//a[@class='currency-name-container link-secondary']").each do |node|  
        crypto << node.text  
        end 
        return crypto
end

#crypto_data

def rate_data
  page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
    rate = []
      page.xpath('//*[@class="price"]').each do |node|
      rate << node.text    
      end 
      return rate
end

#rate_data

def synchro_data(crypto, rate)
  data_board = []
    rate.size.times do |i|
    data_board << {crypto[i] => rate[i]}
    end
    return data_board
end

def perform
  page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
    crypto = crypto_data
    rate = rate_data
    hash_array = synchro_data(crypto, rate)
    print hash_array
end

perform




