require_relative 'place_command'

class CommandParser
  # matches input starting with the string 'PLACE' followed by two comma separated digits and a direction
  # the whitespace matches are present to allow leniency in command input
  PLACE_COMMAND_REGEX = /^PLACE\s*(\d)\s*\,\s*(\d)\,\s*(NORTH|SOUTH|EAST|WEST)$/i

  def self.parse(command)
    if match = command.match(PLACE_COMMAND_REGEX)
      x, y, direction = match.captures
      PlaceCommand.new(x.to_i, y.to_i, direction)
    end
  end
end
