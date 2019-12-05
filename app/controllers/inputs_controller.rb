class InputsController < ApplicationController
  
  def input
    render ({ :template => "front_page.html.erb"})
  end 

  def search
    #require 'google/api_client'
    #require 'optimist'
    require 'open-uri'
    #require 'json'
    #lyric search
     
    the_songtitle = params.fetch(:q_songtitle)
    the_artistname = params.fetch(:qs_artistname)

    #a = the_songtitle.gsub!("\s", "+")
    #b = the_artistname.gsub!("\s", "+")
    @query_string = the_songtitle + "+" + the_artistname
    
    doc1 = Nokogiri::HTML(open('http://www.songlyrics.com/index.php?section=search&searchW='+ @query_string + '&submit=Search'))

    result1 =  doc1.xpath('//div[@class="serpresult"]/a').map { |link| link['href'] }.at(0)

      p result1
    result1a = result1.to_str

   
    
    doc2 = Nokogiri::HTML(open("#{result1a}", 'User-Agent' => 'safari'))
    

    #doc3 = doc2.xpath('//*[(@id = "songLyricsDiv")]')
    #doc2.css('#songLyricsDiv')
    doc3 =  doc2.css('#songLyricsDiv')
    
    doc4 = doc3.to_s.split("<br>\n").join(",")

    doc5 = doc4.gsub!("<p id=\"songLyricsDiv\" class=\"songLyricsV14 iComment-text\">", "")
    
    @doc6 = doc5.gsub!("<br></p>", "")
    
    # @doc4 = doc3.to_s.split("<br>\n").gsub("<p id=\"songLyricsDiv\" class=\"songLyricsV14 iComment-text\">", "")
    #@doc4  = doca.gsub!("<p id=\"songLyricsDiv\" class=\"songLyricsV14 iComment-text\">", "")
    #@doc4 = docb.gsub!("<br></p>", "")
    #puts link.content
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

  def display
  
  end


end  