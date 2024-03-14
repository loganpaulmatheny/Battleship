require 'spec_helper'

RSpec.describe 'Ship' do 
  describe '#initialize' do 
    it 'should be able to build ships' do
      ship = Ship.new('Logan\'s Frigate', 2)
      expect(ship.name).to eq('Logan\'s Frigate' )
    end 
  end 
end 