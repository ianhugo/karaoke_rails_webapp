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
    
    doc4 = doc3.to_s.split("<br>\n").join(",")

    doc5 = doc4.gsub!("<p id=\"songLyricsDiv\" class=\"songLyricsV14 iComment-text\">", "")
    
    doc6 = doc5.gsub!("<br></p>", "")
    
    p doc6

    #doc4.each_slice(6).to_a

    #big_array = []
    #small_array = []
    #counter = 1
    #doc4.each_with_index do |block, index|

     # small_array.push(block)
    
      #counter = counter + 1
    
      #if counter == 6 || index == doc4.length
       # big_array.push(small_array)
        #counter = 1
        #small_array = []
      #nd
    #end    

    #p big_array
    #p doc4

    #p doc4
    #.each do |link|
    #a =  link.content
    #puts a
    #end

    
    

