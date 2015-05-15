require 'spec_helper'

describe Band do
  it 'ensures the band is not a duplicate' do
    Band.create(name: 'Poison Sauce')
    band = Band.new(name: 'Poison Sauce')
    expect(band.save).to eq(false)
  end
end
