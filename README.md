# Multiapi

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

    gem 'multiapi'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install multiapi

## Usage

### Youtube
	
	
	$ info = Multiapi::Youtube.get("http://www.youtube.com/watch?v=SyDGJ3L30hw")
	 
	info.url => "http://www.youtube.com/watch?v=SyDGJ3L30hw"  
	info.video_id => "SyDGJ3L30hw"
	info.embed_url => "http://www.youtube.com/embed/SyDGJ3L30hw"
	info.title => "Youtube"  
	info.description => "https://www.facebook.com/shakirachannel [...]"  
	info.keywords => "keywords"  
	info.duration => 3473 
	info.date => 2012-09-28 15:27:03 UTC 
	info.thumbnail_small => "http://i1.ytimg.com/vi/SyDGJ3L30hw/default.jpg" 
	info.thumbnail_medium => "http://i1.ytimg.com/vi/SyDGJ3L30hw/mqdefault.jpg"
	info.thumbnail_large => "http://i1.ytimg.com/vi/SyDGJ3L30hw/hqdefault.jpg"
	info.view_count => 5228532		  
	info.raw_info => {"version"=>"1.0", "encoding"=>"UTF-8", "entry"=> [...]}
			
		

## Tests

You can run the tests with 

	$ rspec spec

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
