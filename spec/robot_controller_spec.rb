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

    context 'when robot has not been placed on table yet' do
      it 'does not rotate robot to the left' do
        expect(robot).not_to receive(:left)

        controller = RobotController.new(table, robot)
        controller.left
      end
    end

    context 'when robot has been placed on table' do
      it 'rotates robot to the left' do
        position = Position.new(Point.new(1, 2), Direction::NORTH)

        expect(robot).to receive(:left)

        controller = RobotController.new(table, robot)
        controller.place(position)
        controller.left
      end
    end
  end

  describe '#right' do
    let(:table) { Table.new(5, 5) }
    let(:robot) { Robot.new }

    context 'robot has not been placed on table yet' do
      it 'does not rotate robot to the right' do
        expect(robot).not_to receive(:right)

        controller = RobotController.new(table, robot)
        controller.right
      end
    end

    context 'robot has been placed on table' do
      it 'rotates robot to the right' do
        position = Position.new(Point.new(1, 2), Direction::NORTH)

        expect(robot).to receive(:right)

        controller = RobotController.new(table, robot)
        controller.place(position)
        controller.right
      end
    end
  end

  describe '#move' do
    let(:table) { Table.new(5, 5) }
    let(:robot) { Robot.new }

    context 'robot has not been placed on table yet' do
      it 'does not move robot' do
        expect(robot).not_to receive(:move)

        controller = RobotController.new(table, robot)
        controller.move
      end
    end

    context 'robot has been placed on table' do
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
    end
  end
end
