class RobotController
  def initialize(table, robot)
    @table = table
    @robot = robot
  end

  def place(position)
    if @table.within_bounds?(position.point)
      @robot.place(position)
    end
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

  private

  def movement_possible?
    !unplaced? && !@table.at_edge?(@robot.position)
  end

  def unplaced?
    @robot.state.is_a?(UnplacedState)
  end
end
