require_relative 'place_command'
require_relative 'left_command'
require_relative 'right_command'
require_relative 'report_command'
require_relative 'move_command'

class CommandParser
  # matches input starting with the string 'PLACE' followed by two comma separated digits and a direction
  # the whitespace matches are present to allow leniency in command input
  PLACE_COMMAND_REGEX = /^PLACE\s*(\d)\s*\,\s*(\d)\,\s*(NORTH|SOUTH|EAST|WEST)$/i
  LEFT_COMMAND = 'LEFT'
  RIGHT_COMMAND = 'RIGHT'
  REPORT_COMMAND = 'REPORT'
  MOVE_COMMAND = 'MOVE'

  def self.parse(command)
    if match = command.match(PLACE_COMMAND_REGEX)
      x, y, direction = match.captures
      PlaceCommand.new(x.to_i, y.to_i, direction)
    elsif command == LEFT_COMMAND
      LeftCommand.new
    elsif command == RIGHT_COMMAND
      RightCommand.new
    elsif command == REPORT_COMMAND
      ReportCommand.new
    elsif command == MOVE_COMMAND
      MoveCommand.new
    end
  end
end
