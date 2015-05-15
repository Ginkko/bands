require 'spec_helper'

describe Venue do
  it 'ensures the venue is not a duplicate' do
    Venue.create(name: 'Amphitheatre-O-Rama')
    venue = Venue.new(name: 'Amphitheatre-O-Rama')
    expect(venue.save).to eq(false)
  end
end
