class LeaguesController < ApplicationController

  get '/leagues' do 
    @leagues = Leagues.all
    erb :'leagues/index'
  end

  get '/leagues/new' do 
    erb :'leagues/new'
  end

  get '/leagues/:id' do 
    @leagues = Leagues.find_by_id(params[:id])
    erb :'leagues/show'
  end

  get '/leagues/:id/edit' do 
    @leagues = Leagues.find(params[:id])
    erb :'leagues/edit'
  end

  post '/leagues/:id' do 
    @leagues = Leagues.find(params[:id])
    @leagues.save

    redirect "/leagues/#{@leagues.id}"
  end

  post '/leagues' do 
    @leagues = Leagues.new
    @leagues.name = params[:name]
    @leagues.save

    redirect "/leagues/#{@leagues.id}"
  end

  delete '/leagues/:id/delete' do 
    league = Leagues.find(params[:id])
    league.destroy
    redirect "/leagues"
  end

end