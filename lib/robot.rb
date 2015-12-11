require 'unplaced_state'

class Robot
  attr_accessor :position, :state

  def initialize
    @state = UnplacedState.new(self)
  end

  def place(position)
    @state = UnplacedState.new(self)
    @state.place(position)
  end

  def left
    @state.left
  end

  def right
    @state.right
  end

  def move
    @state.move
  end
end
