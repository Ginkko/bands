require 'spec_helper'

describe Venue do
  it 'ensures the venue is not a duplicate' do
    Venue.create(name: 'Amphitheatre-O-Rama')
    venue = Venue.new(name: 'Amphitheatre-O-Rama')
    expect(venue.save).to eq(false)
  end

  it('will change the name of the venue to titlecase on creation') do
   venue = Venue.create({name: "janus landing"})
   expect(venue.name).to eq("Janus Landing")
 end

end
