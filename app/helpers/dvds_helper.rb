module DvdsHelper
  
  def amazon_url_for(dvd)
    "http://www.amazon.com/dp/#{dvd.asin}"
  end
end
