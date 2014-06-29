require 'open-uri'
require 'nokogiri'

    doc = Nokogiri::XML(open('http://wikitravel.org/en/United_States'))
      intro1 =  doc.css('#mw-content-text table tr:eq(1) p:eq(1)')
    
p intro1[0].content
