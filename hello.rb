
 
    require 'open-uri'
    require 'nokogiri'
    require 'net/http'

    #doc = Nokogiri::HTML(open("http://azlyrics.com/lyrics/guccimane/metgala.html", 'User-Agent' => 'chrome'))

    #doc = Nokogiri::HTML(open("https://www.azlyrics.com", 'User-Agent' => 'safari'))

    #doc = Nokogiri::HTML(open("https://www.azlyrics.com/lyrics/menitrust/nortoncommanderalbumv.html", 'User-Agent' => 'safari'))
    #p doc

    #doc.css('div:nth-child(10)').each do |link|
    #puts link.content
    #end

    # doc.css('div:nth-child(10)').class

    #open("www.azlyrics.com", "User-Agent" => "somethingletmeinplease")

    #Net::HTTP.get("https://www.azlyrics.com")

    #uri = URI('https://www.azlyrics.com/lyrics/guccimane/metgala.html')
    #abc = Net::HTTP.get(uri)   
    #doc = Nokogiri::HTML(abc)

   #p doc

   
    #result = Net::HTTP.get(URI.parse('https://www.azlyrics.com/lyrics/guccimane/metgala.html'))
    #p result

    #result1 = Net::HTTP.get('http://www.azlyrics.com/lyrics/guccimane/metgala.html', '/index.html')

    
  #require 'rest-client'
  #data = RestClient.get("http://www.azlyrics.com", 'User-Agent' => 'safari')
  #puts data.body