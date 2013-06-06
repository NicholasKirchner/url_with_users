
get '/signup' do
  @error = session.delete(:error) if session[:error]
  erb :signup
end

post '/create' do
  user = User.new(params)
  if user.valid? 
    user.save
    session[:user] = user
    redirect '/'
  else
    session[:error] = "Your sign up failed. Password must be between five and twenty characters. Try again."
    redirect '/signup'
  end
  
end

get '/user/:user_id' do |user_id|
  @user = session[:user]

  if @user.id == user_id.to_i
    @urls = Url.where("user_id = ?", @user.id)
    p @urls
    erb :user_page
  else
    redirect '/'
  end
end
