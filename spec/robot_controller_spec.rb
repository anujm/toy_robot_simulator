require 'spec_helper'
require 'robot_controller'
require 'table'
require 'robot'
require 'position'
require 'point'
require 'direction'

describe RobotController do
  describe '#place' do
    it 'places robot on the table' do
      table = Table.new(5, 5)
      robot = Robot.new
      point = Point.new(1, 2)
      direction = Direction::NORTH
      position = Position.new(point, direction)

      expect(robot).to receive(:place).with(position)

      controller = RobotController.new(table, robot)
      controller.place(position)
    end
  end
end
