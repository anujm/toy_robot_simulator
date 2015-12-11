require 'spec_helper'
require 'robot'
require 'point'
require 'direction'
require 'position'

describe Robot do
  describe 'initialize' do
    it 'creates robot in the Unplaced State' do
      robot = Robot.new
      expect(robot.state).to be_a(UnplacedState)
    end
  end

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

  describe '#left' do
    context 'when facing north' do
      it 'changes robot direction to west' do
        point = Point.new(1, 2)
        direction = Direction::NORTH

        robot = Robot.new
        robot.place(Position.new(point, direction))
        robot.left

        expect(robot.position.point).to eq(point)
        expect(robot.position.direction).to eq(Direction::WEST)
      end
    end

    context 'when facing east' do
      it 'changes robot direction to north' do
        point = Point.new(1, 2)
        direction = Direction::EAST

        robot = Robot.new
        robot.place(Position.new(point, direction))
        robot.left

        expect(robot.position.point).to eq(point)
        expect(robot.position.direction).to eq(Direction::NORTH)
      end
    end

    context 'when facing south' do
      it 'changes robot direction to east' do
        point = Point.new(1, 2)
        direction = Direction::SOUTH

        robot = Robot.new
        robot.place(Position.new(point, direction))
        robot.left

        expect(robot.position.point).to eq(point)
        expect(robot.position.direction).to eq(Direction::EAST)
      end
    end

    context 'when facing west' do
      it 'changes robot direction to south' do
        point = Point.new(1, 2)
        direction = Direction::WEST

        robot = Robot.new
        robot.place(Position.new(point, direction))
        robot.left

        expect(robot.position.point).to eq(point)
        expect(robot.position.direction).to eq(Direction::SOUTH)
      end
    end
  end
end
