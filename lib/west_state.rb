require 'state'

class WestState < State
  def initialize(context)
    super(context)
  end

  def left
    context.position = Position.new(context.position.point, Direction::SOUTH)
    context.state = SouthState.new(context)
  end
end
