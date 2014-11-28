# 4 routes I'll need:
# login
# logout
# create account
# secret page

enable :sessions

def logged_in?
  session[:email] #true if not nil
end

get '/' do
  # Look in app/views/index.erb
  @message = params[:message]
  erb :index
end

post '/' do

  user = User.authenticate(params[:email],params[:password])

  if !user
    redirect to ('/?message="Invalid username/password"')
  elsif params[:email] == user.email
    session[:email] = user.email
    erb :secret
  end

end

get '/secret' do
  halt 401, "401: This page is secret" unless logged_in?
  erb :secret
end

post '/secret' do
  session[:email] = nil
  redirect to ('/?message="Successfully logged out"')
end

post '/create' do
  new_user = User.create(name: params[:name], email: params[:email], password: params[:password])

  if new_user.valid?
    message = "Account successfully created. Please login below."
  else
    message = "Invalid field(s)"
  end

  redirect to ('/?message=' << message)
end