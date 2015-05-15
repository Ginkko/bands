require('sinatra')
require('sinatra/reloader')
require('sinatra/activerecord')
also_reload('lib/**/*.rb')
require 'pg'
require 'pry'
require './lib/band'
require './lib/venue'

get '/' do
  erb :index
end

get '/reset' do
  Band.all.each do |band|
    band.destroy
  end
  Venue.all.each do |venue|
    venue.destroy
  end
  redirect to '/'
end

get '/bands' do
  @all_bands = Band.all
  erb :bands
end

post '/bands/new' do
  band = Band.new(name: params['band_name'])
  if band.save
    redirect to '/bands'
  else
    @object_with_errors = band
    @path = '/bands/new'
    erb :errors
  end
end

get '/venues' do
  @all_venues = Venue.all
  erb :venues
end

post '/venues/new' do
  venue = Venue.new(name: params['venue_name'])
  if venue.save
    redirect to '/venues'
  else
    @object_with_errors = venue
    @path = '/venues/new'
    erb :errors
  end
end
