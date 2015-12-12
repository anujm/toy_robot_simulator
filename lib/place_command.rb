require 'point'
require 'position'

class PlaceCommand
  attr_accessor :position

  def initialize(x, y, direction)
    @position = Position.new(Point.new(x, y), direction)
  end

  def execute(robot_controller)
    robot_controller.place(@position)
  end
end
