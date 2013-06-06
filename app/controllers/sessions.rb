post '/login' do
  user = User.authenticate(params[:email],params[:password])
  session[:user] = user
  redirect '/'
end

get '/logout' do
  session[:user] = nil
  redirect '/'
end