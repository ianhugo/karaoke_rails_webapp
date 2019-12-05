require 'open-uri'
    require 'nokogiri'

    the_songtitle = 'Faded'
    the_artistname = 'Zhu'

    #the_songtitle.gsub!("\s", "+")
    #the_artistname.gsub!("\s", "+")
    query_string = the_songtitle + "+" + the_artistname
    
    doc1 = Nokogiri::HTML(open('http://www.songlyrics.com/index.php?section=search&searchW='+ query_string + '&submit=Search'))

    result1 =  doc1.xpath('//div[@class="serpresult"]/a').map { |link| link['href'] }.at(0)

      p result1
    result1a = result1.to_str

   
    
    doc2 = Nokogiri::HTML(open("#{result1a}", 'User-Agent' => 'chrome'))
    

    doc3 =  doc2.css('#songLyricsDiv')
    
    doc3.class
    #p doc4
    #.each do |link|
    #a =  link.content
    #puts a
    #end

    
    

