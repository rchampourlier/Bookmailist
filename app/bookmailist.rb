class Bookmailist < Sinatra::Base
  
  enable :logging, :dump_errors, :raise_errors
  
  get '/' do
  	@bookmarks = Bookmark.all
    haml :home
  end
  
  post '/incoming_email' do
  	if request.media_type == "application/json"
	  	
	  	email = JSON.parse(request.body.read.to_s)

	  	if email["html"]
				links = LinkExtractor::HTML.from(email["html"])	
				
			elsif email["plain"]
				links = LinkExtractor::Text.from(email["plain"])
			end
			
			links.each do |link|
				Bookmark.create(link)
			end

		end

		200
  end
  
end