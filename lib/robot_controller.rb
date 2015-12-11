class RobotController
  def initialize(table, robot)
    @table = table
    @robot = robot
    @placed = false
  end

  def place(position)
    if @table.within_bounds?(position.point)
      @robot.place(position)
      @placed = true
    end
  end

  def left
    @robot.left if @placed
  end

  def right
    @robot.right if @placed
  end
end
