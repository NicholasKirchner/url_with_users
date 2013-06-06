get '/' do
  @short_url = session.delete(:short_url) if session[:short_url]
  @saved = session.delete(:saved) if session[:saved] == false
  @user = session[:user] if session[:user]
  erb :index
end