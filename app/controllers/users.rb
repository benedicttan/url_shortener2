post '/create' do
  new_user = User.create(name: params[:name], email: params[:email], password: params[:password])

  if new_user.valid?
    message = "Account successfully created. Please login below."
  else
    message = "Invalid field(s)"
  end

  @message = message
  erb :index
end