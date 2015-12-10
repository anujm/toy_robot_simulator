require 'spec_helper'
require 'table'
require 'point'

describe Table do
  describe '#within_bounds?' do
    it 'should return true if point is within table bounds' do
      table = Table.new(5, 5)

      expect(table.within_bounds?(Point.new(0, 0))).to be_truthy
      expect(table.within_bounds?(Point.new(1, 2))).to be_truthy
      expect(table.within_bounds?(Point.new(4, 4))).to be_truthy
    end

    it 'should return false if point is outside table bounds' do
      table = Table.new(5, 5)

      expect(table.within_bounds?(Point.new(5, 5))).to be_falsey
      expect(table.within_bounds?(Point.new(-1, -1))).to be_falsey
    end
  end
end
