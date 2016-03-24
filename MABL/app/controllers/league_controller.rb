class LeagueController < ApplicationController

  get '/leagues' do 
    @leagues = League.all
    erb :'leagues/index'
  end

  get '/leagues/new' do 
    erb :'leagues/new'
  end

  get '/leagues/:id' do 
    @leagues = League.find_by_id(params[:id])
    erb :'leagues/show'
  end

  post '/leagues' do 
    @leagues = League.new
    @leagues.name = params[:name]
    @leagues.save

    redirect "/leagues/#{@leagues.id}"
  end

end