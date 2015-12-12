class RobotController
  def initialize(table, robot)
    @table = table
    @robot = robot
  end

  def place(position)
    @robot.place(position) if placement_possible?(position)
  end

  def left
    @robot.left
  end

  def right
    @robot.right
  end

  def move
    @robot.move if movement_possible?
  end

  def report
    @robot.report
  end

  private

  def placement_possible?(position)
    @table.within_bounds?(position.point)
  end

  def movement_possible?
    !unplaced? && !@table.at_edge?(@robot.position)
  end

  def unplaced?
    @robot.state.is_a?(UnplacedState)
  end
end
