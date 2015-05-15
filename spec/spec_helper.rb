ENV['RACK_ENV'] = 'test'

require 'sinatra/activerecord'
require 'rspec'
require 'band'
require 'venue'
require 'pry'
require 'pg'

RSpec.configure do |config|
  config.before(:each) do
    Band.all.each do |band|
      band.destroy
    end
    Venue.all.each do |venue|
      venue.destroy
    end
  end
  config.after(:each) do
    Band.all.each do |band|
      band.destroy
    end
    Venue.all.each do |venue|
      venue.destroy
    end
  end
end
