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

get '/bands/:id' do
  @band = Band.find(params['id'])
  @venues = @band.venues
  @all_venues = Venue.all
  erb :band
end

patch '/bands/:id/update' do
  @band = Band.find(params['id'])
  @band.update(name: params['new_band_name'])
  redirect to "/bands/#{@band.id}"
end

delete '/bands/:id/delete' do
  Band.find(params['id']).destroy
  redirect to '/bands'
end

patch '/bands/:id/add/venue' do
  @band = Band.find(params['id'])
  added_venues = Venue.find(params['venue_id'])
  added_venues.each do |venue|
    @band.venues.push(venue)
  end
  @venues = @band.venues
  redirect to "/bands/#{params['id']}"
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

get '/venues/:id' do
  @venue = Venue.find(params['id'])
  @bands = @venue.bands
  @all_bands = Band.all
  erb :venue
end

patch '/venues/:id/add/band' do
  @venue = Venue.find(params['id'])
  added_bands = Band.find(params['band_id'])
  added_bands.each do |band|
    @venue.bands.push(band)
  end
  @bands = @venue.bands
  redirect to "/venues/#{params['id']}"
end
