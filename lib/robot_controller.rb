class RobotController
  def initialize(table, robot)
    @table = table
    @robot = robot
  end

  def place(position)
    @robot.place(position)
  end
end
