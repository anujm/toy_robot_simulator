require 'spec_helper'
require 'robot'
require 'point'
require 'direction'
require 'position'

describe Robot do
  describe '#place' do
    it 'changes robot position to specified position' do
      point = Point.new(1, 2)
      direction = Direction::NORTH

      robot = Robot.new
      robot.place(Position.new(point, direction))

      expect(robot.position.point).to eq(point)
      expect(robot.position.direction).to eq(direction)
    end
  end
end
