require 'bundler'
Bundler.require

require 'gossip'

class ApplicationController < Sinatra::Base
  get '/' do
  	erb :index, locals: {gossips: Gossip.all}
  end

  get '/gossips/new/' do
  	erb :new_gossip
  end

  get '/gossips/:id' do
    Gossip.find(params['id'])
    erb :show, locals: {gossips: Gossip.all, number_of_the_gossip: params['id']}
  end

  post '/gossips/new/' do
    Gossip.new(params["gossip_author"], params["gossip_content"], params["gossip_id"]).save
    redirect '/'
  end
end
