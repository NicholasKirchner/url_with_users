# get '/urls_home' do
#   @short_url = session.delete(:short_url) if session[:short_url]
#   @saved = session.delete(:saved) if session[:saved] == false
#   # let user create new short URL, display a list of shortened URLs
#   erb :index
# end

post '/urls' do
  params[:user_id] = session[:user].id if session[:user]
  new_url = Url.new(params)
  saved = new_url.save


  session[:short_url] = new_url.short_url
  session[:saved] = saved
  redirect '/'
end

# e.g., /q6bda
get '/l/:short_url' do |short_url|
  #url = Url.where("short_url = ?", params[:short_url]).first
  p "this should run"
  url = Url.find_by_short_url(short_url)
  url.click_count += 1
  url.save
  redirect url.long_url
  # redirect to appropriate "long" URL
end