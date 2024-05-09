require 'spec_helper'

RSpec.describe 'Ship' do 
  describe '#initialize' do 
    it 'should be able to build ships' do
      ship = Ship.new('Logan\'s Frigate', 2)
      expect(ship.name).to eq('Logan\'s Frigate' )
      expect(ship.length).to eq(2)
      expect(ship.health).to eq(2)
      expect(ship.sunk?).to eq(false)
    end 
  end
  describe 'inital play' do 
    it 'should be able to sink a ship' do 
      ship = Ship.new('Logan\'s Frigate', 2)
      ship.hit
      ship.hit
      expect(ship.health).to eq(0)
      expect(ship.sunk?).to eq(true)

    end
  end
end 