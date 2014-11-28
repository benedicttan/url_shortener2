require 'uri'

get '/error/:error' do
  # let user create new short URL, display a list of shortened URLs
  case params[:error]
  when "url"
    @error = "Looks like an invalid URL!"
  end


  # @logged_in = logged_in?
  erb :index
end

get '/' do
  # let user create new short URL, display a list of shortened URLs
  @message = params[:message]
  @urls = Url.all
  erb :index
end

post '/urls' do
  # create a new Url
  if params[:long_url] =~ URI::regexp(['http', 'https'])
    Url.create(long_url: params[:long_url], user_id: session[:id])
    redirect to('/')
  else
    redirect to('/error/url')
  end
end

# e.g., /q6bda
get '/:short_url' do
  # redirect to appropriate "long" URL
  that_url = Url.where(short_url: "http://localhost:9393/" << params[:short_url]).first
  that_url.click_count += 1
  that_url.save
  redirect to(that_url.long_url)
end



