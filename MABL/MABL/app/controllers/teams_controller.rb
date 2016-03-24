class TeamsController < ApplicationController

  get '/teams' do 
    @teams = Teams.all
    erb :'teams/index'
  end

  get '/teams/new' do 
    erb :'teams/new'
  end

  get '/teams/:id' do 
    @teams = Teams.find_by_id(params[:id])
    erb :'teams/show'
  end

  post '/teams' do 
    @teams = Teams.new
    @teams.name = params[:name]
    @teams.save

    redirect "/teams/#{@teams.id}"
  end

  delete '/teams/:id/delete' do 
    teams = Teams.find(params[:id])
    teams.destroy
    redirect "/teams"
  end

end