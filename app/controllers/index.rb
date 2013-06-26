get '/' do
  # Look in app/views/index.erb
  erb :index
end

post '/url' do 
	@long_url = params[:url]
	p @long_url
	new_url = ShortenedUrl.create(url: @long_url)
	p new_url
	@short_url = 'http://localhost:9393/' + new_url.short_url
	erb :new_url_page
end


get '/:short_url' do 
p	params
short_address	= ShortenedUrl.find_by_short_url(params[:short_url])
redirect "http://www.#{short_address.url}"
end