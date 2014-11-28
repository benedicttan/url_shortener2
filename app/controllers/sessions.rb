# 4 routes I'll need:
# login
# logout
# create account
# secret page

enable :sessions

post '/login' do

  user = User.authenticate(params[:email],params[:password])

  if !user
    @message = "Invalid username/password"
    erb :index
  elsif params[:email] == user.email
    session[:email] = user.email
    session[:id] = user.id
    @message = "Logged in"
    erb :index
  end
end

# to log out
post '/secret' do
  session[:email] = nil
  session[:id] = nil
  @message = "Successfully logged out"
  erb :index
end
