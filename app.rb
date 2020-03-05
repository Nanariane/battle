# frozen_string_literal: true

require 'sinatra/base'
require_relative 'lib/player.rb'

class Battle < Sinatra::Base
  enable :sessions

  get '/' do
    erb :index
  end

  post '/names' do
    # no need of below's instance variables anymore, let's refactor them to global variables with $signs
    # session[:player_1_name] = params[:player_1_name]
    # session[:player_2_name] = params[:player_2_name]
    $player_1 = Player.new(params[:player_1_name])
    $player_2 = Player.new(params[:player_2_name])
    redirect '/play'
  end

  get '/play' do
    # refactoring the session $player
    # @player_1_name = session[:player_1_name]
    # @player_2_name = session[:player_2_name]
    @player_1 = $player_1
    @player_2 = $player_2
    erb :play
  end

  get '/attack' do
    # refactoring the session with $player
    # @player_1_name = session[:player_1_name]
    # @player_2_name = session[:player_2_name]
    # @player_1_name = $player_1.name
    # @player_2_name = $player_2.name
    @player_1 = $player_1
    @player_2 = $player_2
    # @player_1.attack(@player_2)
    Game.new.attack(@player_2)
    erb :attack
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
