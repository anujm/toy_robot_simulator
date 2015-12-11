require 'state'

class NorthState < State
  def initialize(context)
    super(context)
  end

  def left
    context.position = Position.new(context.position.point, Direction::WEST)
    context.state = WestState.new(context)
  end
end
