require 'spec_helper'
require 'table'
require 'point'

describe Table do
  describe '#within_bounds?' do
    let(:table) { Table.new(5, 5) }

    it 'should return true if point is within table bounds' do
      expect(table.within_bounds?(Point.new(0, 0))).to be_truthy
      expect(table.within_bounds?(Point.new(1, 2))).to be_truthy
      expect(table.within_bounds?(Point.new(4, 4))).to be_truthy
    end

    it 'should return false if point is outside table bounds' do
      expect(table.within_bounds?(Point.new(5, 5))).to be_falsey
      expect(table.within_bounds?(Point.new(-1, -1))).to be_falsey
    end
  end

  describe '#at_edge?' do
    let(:table) { Table.new(5, 5) }

    context 'position faces north' do
      it 'should return true when at the northern edge' do
        point_at_northern_edge = Point.new(1, 4)
        expect(table.at_edge?(Position.new(point_at_northern_edge, Direction::NORTH))).to be_truthy
      end

      it 'should return false when not at the northern edge' do
        point = Point.new(4, 1)
        expect(table.at_edge?(Position.new(point, Direction::NORTH))).to be_falsey
      end
    end

    context 'position faces south' do
      it 'should return true when at the southern edge' do
        point_at_southern_edge = Point.new(1, 0)
        expect(table.at_edge?(Position.new(point_at_southern_edge, Direction::SOUTH))).to be_truthy
      end

      it 'should return false when not at the southern edge' do
        point = Point.new(0, 1)
        expect(table.at_edge?(Position.new(point, Direction::SOUTH))).to be_falsey
      end
    end

    context 'position faces east' do
      it 'should return true when at the eastern edge' do
        point_at_eastern_edge = Point.new(4, 1)
        expect(table.at_edge?(Position.new(point_at_eastern_edge, Direction::EAST))).to be_truthy
      end

      it 'should return false when not at the eastern edge' do
        point = Point.new(1, 4)
        expect(table.at_edge?(Position.new(point, Direction::EAST))).to be_falsey
      end
    end

    context 'position faces west' do
      it 'should return true when at the the western edge' do
        point_at_western_edge = Point.new(0, 1)
        expect(table.at_edge?(Position.new(point_at_western_edge, Direction::WEST))).to be_truthy
      end

      it 'should return false when not at the western edge' do
        point = Point.new(1, 0)
        expect(table.at_edge?(Position.new(point, Direction::WEST))).to be_falsey
      end
    end
  end
end
