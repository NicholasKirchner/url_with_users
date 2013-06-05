get '/' do
  @short_url = session.delete(:short_url) if session[:short_url]
  p "saved_2 : #{session[:saved]}"
  @saved = session.delete(:saved) if session[:saved] == false
  p "saved_3 : #{@saved}"
  # let user create new short URL, display a list of shortened URLs
  erb :index
end

post '/urls' do
  new_url = Url.new(params)
  saved = new_url.save
  p "saved_1 : #{saved}"
  session[:short_url] = new_url.short_url
  session[:saved] = saved
  redirect '/'
end

# e.g., /q6bda
get '/:short_url' do
  #url = Url.where("short_url = ?", params[:short_url]).first
  url = Url.find_by_short_url(params[:short_url])
  url.click_count += 1
  url.save
  redirect url.long_url
  # redirect to appropriate "long" URL
end