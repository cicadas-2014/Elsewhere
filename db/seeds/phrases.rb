terms = ["hello", "please", "thanks", "where is the bathroom"]
uri_terms = terms.map { |term| term.gsub(" ", "%20") }

source_language = "en"


target_language = []

countries = Country.all
countries.each do | country | 
	unless country.language_code.nil?
		target_language << country.id 
		target_language << country.language_code.downcase
	end
end



target_language.each_slice(2) do |country_id, target_language|	
	
	uri_terms.each_slice(4) do |hello, please, thanks, bathroom|
		
		r_hello = URI("https://translate.google.com/translate_a/single?client=t&sl=#{source_language}&tl=#{target_language}&hl=en&dt=bd&dt=ex&dt=ld&dt=md&dt=qc&dt=rw&dt=rm&dt=ss&dt=t&dt=at&dt=sw&ie=UTF-8&oe=UTF-8&oc=2&prev=btn&ssel=0&tsel=0&q=#{hello}")	
	    hello_r = Net::HTTP.get_response(r_hello)
	    if hello_r.code == "200" && hello_r.body.match(/(\[\[\[")(.+?)(")/)
	       hello_phrase = hello_r.body.match(/(\[\[\[")(.+?)(")/)[2]  
	    else
	       hello_phrase = "wazzup"
	    end

		r_please = URI("https://translate.google.com/translate_a/single?client=t&sl=#{source_language}&tl=#{target_language}&hl=en&dt=bd&dt=ex&dt=ld&dt=md&dt=qc&dt=rw&dt=rm&dt=ss&dt=t&dt=at&dt=sw&ie=UTF-8&oe=UTF-8&oc=2&prev=btn&ssel=0&tsel=0&q=#{please}")
		please_r = Net::HTTP.get_response(r_please)
		if please_r.code == "200" && please_r.body.match(/(\[\[\[")(.+?)(")/)
		   please_phrase = please_r.body.match(/(\[\[\[")(.+?)(")/)[2]
		else
		   please_phrase = "Pretty Please"
		end
		
		r_thanks = URI("https://translate.google.com/translate_a/single?client=t&sl=#{source_language}&tl=#{target_language}&hl=en&dt=bd&dt=ex&dt=ld&dt=md&dt=qc&dt=rw&dt=rm&dt=ss&dt=t&dt=at&dt=sw&ie=UTF-8&oe=UTF-8&oc=2&prev=btn&ssel=0&tsel=0&q=#{thanks}")
		thanks_r = Net::HTTP.get_response(r_thanks)
		if thanks_r.code == "200" && thanks_r.body.match(/(\[\[\[")(.+?)(")/)
		   thanks_phrase = thanks_r.body.match(/(\[\[\[")(.+?)(")/)[2]
		else
		   thanks_phrase = "Much Obliged Partner"
		end

		r_bathroom = URI("https://translate.google.com/translate_a/single?client=t&sl=#{source_language}&tl=#{target_language}&hl=en&dt=bd&dt=ex&dt=ld&dt=md&dt=qc&dt=rw&dt=rm&dt=ss&dt=t&dt=at&dt=sw&ie=UTF-8&oe=UTF-8&oc=2&prev=btn&ssel=0&tsel=0&q=#{bathroom}")
		bathroom_r = Net::HTTP.get_response(r_bathroom)
		if bathroom_r.code == "200" && bathroom_r.body.match(/(\[\[\[")(.+?)(")/)
		   bathroom_phrase = bathroom_r.body.match(/(\[\[\[")(.+?)(")/)[2]
		else
		   bathroom_phrase = "Latrine Please"
		end

		Phrase.create(hello: hello_phrase.force_encoding('UTF-8'), please: please_phrase.force_encoding('UTF-8'), thanks: thanks_phrase.force_encoding('UTF-8'), bathroom: bathroom_phrase.force_encoding('UTF-8'), country_id: country_id)
	    
	end
	
end
