require 'spec_helper'
require 'point'
require 'direction'
require 'position'
require 'robot'
require 'unplaced_state'
require 'north_state'

describe UnplacedState do
  describe 'place' do
    context 'when placed in north direction' do
      it 'should change state to north state' do
        position = Position.new(Point.new(1, 2), Direction::NORTH)
        robot = Robot.new

        UnplacedState.new(robot).place(position)

        expect(robot.state).to be_a(NorthState)
        expect(robot.position).to eq(position)
      end
    end

    context 'when placed in east direction' do
      it 'should change state to east state' do
        position = Position.new(Point.new(1, 2), Direction::EAST)
        robot = Robot.new
        UnplacedState.new(robot).place(position)

        expect(robot.state).to be_a(EastState)
      end
    end

    context 'when placed in south direction' do
      it 'should change state to south state' do
        position = Position.new(Point.new(1, 2), Direction::SOUTH)
        robot = Robot.new
        UnplacedState.new(robot).place(position)

        expect(robot.state).to be_a(SouthState)
      end
    end

    context 'when placed in west direction' do
      it 'should change state to west state' do
        position = Position.new(Point.new(1, 2), Direction::WEST)
        robot = Robot.new
        UnplacedState.new(robot).place(position)

        expect(robot.state).to be_a(WestState)
      end
    end
  end
end
