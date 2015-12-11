require 'state'
require 'direction'
require 'north_state'
require 'east_state'
require 'south_state'
require 'west_state'

class UnplacedState < State
  DIRECTION_TO_STATE_MAP = {
      Direction::NORTH => NorthState,
      Direction::EAST => EastState,
      Direction::SOUTH => SouthState,
      Direction::WEST => WestState,
  }

  def initialize(context)
    super(context)
  end

  def place(position)
    context.position = position
    context.state = DIRECTION_TO_STATE_MAP[position.direction].send(:new, self)
  end
end
