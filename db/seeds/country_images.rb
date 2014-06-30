flickr = Flickr.new(ENV["FLICKR_KEY"])


Country.all.each do |country|	
	photos = flickr.photos_search(
		content_type: 1, 
		safe_search: 1, 
		tags: "#{country.name}, travel, beautiful",
		tag_mode: "all", 
		privacy_filter: 1, 
		sort: "interestingness-desc",
		media: "photos",
		)
	
	photos[0..3].each do |photo|
		country.images << Image.create(url: photo.source)
	end
end
