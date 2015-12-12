require 'spec_helper'
require 'robot_controller'
require 'table'
require 'robot'
require 'position'
require 'point'
require 'direction'

describe RobotController do
  let(:table) { Table.new(5, 5) }
  let(:robot) { Robot.new }

  describe '#place' do
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
    it 'rotates robot to the left' do
      position = Position.new(Point.new(1, 2), Direction::NORTH)

      expect(robot).to receive(:left)

      controller = RobotController.new(table, robot)
      controller.place(position)
      controller.left
    end
  end

  describe '#right' do
    it 'rotates robot to the right' do
      position = Position.new(Point.new(1, 2), Direction::NORTH)

      expect(robot).to receive(:right)

      controller = RobotController.new(table, robot)
      controller.place(position)
      controller.right
    end
  end

  describe '#move' do
    context 'robot is not at the edge of the table' do
      it 'moves robot' do
        position = Position.new(Point.new(1, 2), Direction::NORTH)

        expect(table).to receive(:at_edge?).with(position).and_return(false)
        expect(robot).to receive(:move)

        controller = RobotController.new(table, robot)
        controller.place(position)
        controller.move
      end
    end

    context 'robot is at the edge of the table' do
      it 'does not move robot' do
        position = Position.new(Point.new(1, 4), Direction::NORTH)

        expect(table).to receive(:at_edge?).with(position).and_return(true)
        expect(robot).not_to receive(:move)

        controller = RobotController.new(table, robot)
        controller.place(position)
        controller.move
      end
    end

    describe '#report' do
      it 'reports robot position' do
        position = Position.new(Point.new(1, 2), Direction::NORTH)

        expect(robot).to receive(:report)

        controller = RobotController.new(table, robot)
        controller.place(position)
        controller.report
      end
    end
  end
end
