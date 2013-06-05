get '/' do
  @short_url = session.delete(:short_url) if session[:short_url]
  # let user create new short URL, display a list of shortened URLs
  erb :index
end

post '/urls' do
  new_url = Url.create(params)
  session[:short_url] = new_url.short_url
  redirect '/'
end

# e.g., /q6bda
get '/:short_url' do
  # redirect to appropriate "long" URL
end