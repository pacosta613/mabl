require './config/environment'
class ApplicationController < Sinatra::Base

  configure do
    set :views, "app/views"
    enable :sessions
    set :session_secret, "password_security"
  end  

  get '/' do 
    erb :index
  end

  get '/signup' do 
    erb :signup
  end

  post '/signup' do
    user = User.new(:username => params[:username], :password => params[:password])
    if user.save
      redirect "/login"
    else
      redirect "/signup"
    end
  end

  get '/login' do 
    erb :login
  end

  post "/login" do
    user = User.find_by(:username => params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect "/leagues"
    else
      redirect "/login"
    end
  end

  get "/logout" do
    session.clear
    redirect "/"
  end

  helpers do
    def logged_in?
      !!session[:user_id]
    end

    def current_user
      User.find(session[:user_id])
    end
  end

end