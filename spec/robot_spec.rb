require 'spec_helper'
require 'robot'
require 'point'
require 'direction'
require 'position'

describe Robot do
  describe '#initialize' do
    it 'creates robot in the Unplaced State' do
      robot = Robot.new
      expect(robot.state).to be_a(UnplacedState)
    end
  end

  describe '#place' do
    context 'when placed in north direction' do
      it 'should change state to north state' do
        position = Position.new(Point.new(1, 2), Direction::NORTH)
        robot = Robot.new

        robot.place(position)

        expect(robot.state).to be_a(NorthState)
        expect(robot.position).to eq(position)
      end
    end

    context 'when placed in east direction' do
      it 'should change state to east state' do
        position = Position.new(Point.new(1, 2), Direction::EAST)
        robot = Robot.new

        robot.place(position)

        expect(robot.state).to be_a(EastState)
        expect(robot.position).to eq(position)
      end
    end

    context 'when placed in south direction' do
      it 'should change state to south state' do
        position = Position.new(Point.new(1, 2), Direction::SOUTH)
        robot = Robot.new

        robot.place(position)

        expect(robot.state).to be_a(SouthState)
        expect(robot.position).to eq(position)
      end
    end

    context 'when placed in west direction' do
      it 'should change state to west state' do
        position = Position.new(Point.new(1, 2), Direction::WEST)
        robot = Robot.new

        robot.place(position)

        expect(robot.state).to be_a(WestState)
        expect(robot.position).to eq(position)
      end
    end
  end

  describe '#left' do
    context 'not placed on table yet' do
      it 'does not change position' do
        robot = Robot.new
        expect { robot.left }.not_to change { robot.position }
      end
    end

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

  describe '#right' do
    context 'not placed on table yet' do
      it 'does not change position' do
        robot = Robot.new
        expect { robot.right }.not_to change { robot.position }
      end
    end

    context 'when facing north' do
      it 'changes robot direction to east' do
        point = Point.new(1, 2)
        direction = Direction::NORTH

        robot = Robot.new
        robot.place(Position.new(point, direction))
        robot.right

        expect(robot.position.point).to eq(point)
        expect(robot.position.direction).to eq(Direction::EAST)
      end
    end

    context 'when facing east' do
      it 'changes robot direction to south' do
        point = Point.new(1, 2)
        direction = Direction::EAST

        robot = Robot.new
        robot.place(Position.new(point, direction))
        robot.right

        expect(robot.position.point).to eq(point)
        expect(robot.position.direction).to eq(Direction::SOUTH)
      end
    end

    context 'when facing south' do
      it 'changes robot direction to west' do
        point = Point.new(1, 2)
        direction = Direction::SOUTH

        robot = Robot.new
        robot.place(Position.new(point, direction))
        robot.right

        expect(robot.position.point).to eq(point)
        expect(robot.position.direction).to eq(Direction::WEST)
      end
    end

    context 'when facing west' do
      it 'changes robot direction to north' do
        point = Point.new(1, 2)
        direction = Direction::WEST

        robot = Robot.new
        robot.place(Position.new(point, direction))
        robot.right

        expect(robot.position.point).to eq(point)
        expect(robot.position.direction).to eq(Direction::NORTH)
      end
    end
  end

  describe '#move' do
    context 'not placed on table yet' do
      it 'does not change position' do
        robot = Robot.new
        expect { robot.move }.not_to change { robot.position }
      end
    end

    context 'when facing north' do
      it 'moves one unit to the north' do
        point = Point.new(1, 2)
        direction = Direction::NORTH

        robot = Robot.new
        robot.place(Position.new(point, direction))
        robot.move

        expect(robot.position.point.x).to eq(point.x)
        expect(robot.position.point.y).to eq(point.y + 1)
        expect(robot.position.direction).to eq(Direction::NORTH)
      end
    end

    context 'when facing east' do
      it 'moves one unit to the east' do
        point = Point.new(1, 2)
        direction = Direction::EAST

        robot = Robot.new
        robot.place(Position.new(point, direction))
        robot.move

        expect(robot.position.point.x).to eq(point.x + 1)
        expect(robot.position.point.y).to eq(point.y)
        expect(robot.position.direction).to eq(Direction::EAST)
      end
    end

    context 'when facing south' do
      it 'moves robot one unit to the south' do
        point = Point.new(1, 2)
        direction = Direction::SOUTH

        robot = Robot.new
        robot.place(Position.new(point, direction))
        robot.move

        expect(robot.position.point.x).to eq(point.x)
        expect(robot.position.point.y).to eq(point.y - 1)
        expect(robot.position.direction).to eq(Direction::SOUTH)
      end
    end

    context 'when facing west' do
      it 'changes robot direction to north' do
        point = Point.new(1, 2)
        direction = Direction::WEST

        robot = Robot.new
        robot.place(Position.new(point, direction))
        robot.move

        expect(robot.position.point.x).to eq(point.x - 1)
        expect(robot.position.point.y).to eq(point.y)
        expect(robot.position.direction).to eq(Direction::WEST)
      end
    end
  end

  describe '#report' do
    context 'not placed on table yet' do
      it 'does not return robot position' do
        robot = Robot.new
        expect(robot.report).to be_nil
      end
    end

    context 'when facing north' do
      it 'returns robot position' do
        robot = Robot.new
        point = Point.new(1, 2)
        direction = Direction::NORTH
        position = Position.new(point, direction)

        robot.place(position)
        robot.move

        expect(robot.report).to eq('1,3,NORTH')
      end
    end

    context 'when facing south' do
      it 'returns robot position' do
        robot = Robot.new
        point = Point.new(1, 2)
        direction = Direction::SOUTH
        position = Position.new(point, direction)

        robot.place(position)
        robot.move

        expect(robot.report).to eq('1,1,SOUTH')
      end
    end

    context 'when facing east' do
      it 'returns robot position' do
        robot = Robot.new
        point = Point.new(1, 2)
        direction = Direction::EAST
        position = Position.new(point, direction)

        robot.place(position)
        robot.move

        expect(robot.report).to eq('2,2,EAST')
      end
    end

    context 'when facing west' do
      it 'returns robot position' do
        robot = Robot.new
        point = Point.new(1, 2)
        direction = Direction::WEST
        position = Position.new(point, direction)

        robot.place(position)
        robot.move

        expect(robot.report).to eq('0,2,WEST')
      end
    end
  end
end
