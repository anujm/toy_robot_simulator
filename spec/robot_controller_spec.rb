require 'spec_helper'
require 'robot_controller'
require 'table'
require 'robot'
require 'position'
require 'point'
require 'direction'

describe RobotController do
  describe '#place' do
    let(:table) { Table.new(5, 5) }
    let(:robot) { Robot.new }

    context 'position is within table bounds' do
      it 'places robot on table' do
        position = Position.new(Point.new(1, 2), Direction::NORTH)

        expect(robot).to receive(:place).with(position)

        controller = RobotController.new(table, robot)
        controller.place(position)
      end
    end

    context 'position is outside table bounds' do
      it 'does not place robot on table' do
        position = Position.new(Point.new(-1, 2), Direction::NORTH)

        expect(robot).not_to receive(:place).with(position)

        controller = RobotController.new(table, robot)
        controller.place(position)
      end
    end
  end

  describe '#left' do
    let(:table) { Table.new(5, 5) }
    let(:robot) { Robot.new }

    it 'rotates robot to the left' do
      position = Position.new(Point.new(1, 2), Direction::NORTH)

      expect(robot).to receive(:place).with(position)
      expect(robot).to receive(:left)

      controller = RobotController.new(table, robot)
      controller.place(position)
      controller.left
    end
  end
end
