require 'open-uri'
require 'nokogiri'

    doc = Nokogiri::XML(open('http://wikitravel.org/en/United_States'))
      intro =  doc.css('#mw-content-text table p:eq(2)')
      intro2 =  doc.css('#mw-content-text table p:eq(3)')
      intro.each do |i|
        p i.content
      end
      intro2.each do |i|
        p i.content
      end