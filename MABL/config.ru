 require './config/environment'
 require_relative './app/controllers/league_controller'
 require_relative './app/controllers/players_controller'
 require_relative './app/controllers/teams_controller'

use Rack::MethodOverride
use LeagueController
use PlayersController
use TeamsController
run ApplicationController