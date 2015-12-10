class RobotController
  def initialize(table, robot)
    @table = table
    @robot = robot
  end

  def place(position)
    @robot.place(position) if @table.within_bounds?(position.point)
  end
end
