class ReportCommand
  def execute(robot_controller)
    output = robot_controller.report
    "Output: #{output}" if !output.nil?
  end
end
