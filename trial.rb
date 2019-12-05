  require 'open-uri'
    require 'nokogiri'

    the_songtitle = 'Met Gala'
    the_artistname = 'Gucci Mane'

    the_songtitle.gsub!("\s", "+")
    the_artistname.gsub!("\s", "+")
    @query_string = the_songtitle + "+" + the_artistname
    
    #doc1 = Nokogiri::HTML(open('https://search.azlyrics.com/search.php?q='+ @query_string))

    result1 =  doc1.xpath('//td[@class="text-left visitedlyr"]/a').map { |link| link['href'] }.at(0)

      p result1
    result1a = result1.to_str

    p result1a
    
    doc2 = Nokogiri::HTML(open("#{result1a}", 'User-Agent' => 'safari'))
    p doc2

    doc2.css('div:nth-child(10)').each do |link|
    puts link.content
    end
