class InputsController < ApplicationController
  
  def input
    render ({ :template => "front_page.html.erb"})
  end 

  def search
    #require 'google/api_client'
    #require 'optimist'
    #require 'json'
    
    require 'open-uri'
    
    
    #lyric search
    the_songtitle = params.fetch(:q_songtitle)
    the_artistname = params.fetch(:qs_artistname)

    
    @query_string = the_songtitle + "+" + the_artistname
    
    doc1 = Nokogiri::HTML(open('http://www.songlyrics.com/index.php?section=search&searchW='+ @query_string + '&submit=Search'))

    result1 =  doc1.xpath('//div[@class="serpresult"]/a').map { |link| link['href'] }.at(0)

      p result1
    result1a = result1.to_str

   
    doc2 = Nokogiri::HTML(open("#{result1a}", 'User-Agent' => 'safari'))
    
    doc3 =  doc2.css('#songLyricsDiv')
    
    doc4 = doc3.to_s.split("<br>\n").join("\n")

    doc5 = doc4.gsub!("<p id=\"songLyricsDiv\" class=\"songLyricsV14 iComment-text\">", "")
    
    doc6 = doc5.gsub!("<br></p>", "")

    if doc6 == nil
      @storevalue = "Sorry this song does not have lyrics at the moment. Please try another song :)"
    else
      doc7 = doc6.split("\n\n")

    @storevalue = '' 
    doc7.each do |block|
      @storevalue = @storevalue + '<p>'
      @storevalue = @storevalue + block
      @storevalue = @storevalue +'</p>'
    end
    end

    #doc6.each_with_index do |block, index|

    #small_array.push(block)
    
     # counter = counter + 1
    
      #if counter == 6 || index == doc4.length
       # big_array.push(small_array)
        #counter = 1
        #small_array = []
      #nd
    #end    
    
    

    #videosearch

      api_key = 'AIzaSyCmIgTF16TFvt2wfrspmud-C3psqp3GbwI'

      url = "https://www.googleapis.com/youtube/v3/search?part=snippet&q=" + @query_string + "&key=" + api_key

      aka = open(url).read

      parsed_data = JSON.parse(aka)

      results = parsed_data.fetch("items").at(0)

      result1 = results.fetch("id")

      @result2 = result1.fetch("videoId")

    
    render ({ :template => "display_page.html.erb"})

  end  


end  