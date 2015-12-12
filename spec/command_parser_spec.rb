require 'rspec'
require 'command_parser'
require 'direction'

describe CommandParser do
  describe '#parse' do
    context 'input matches the PLACE regex' do
      it 'should return PLACE command' do
        expect(CommandParser.parse('PLACE 1,2,NORTH')).to be_an(PlaceCommand)
        expect(CommandParser.parse('PLACE     1,     2,EAST')).to be_an(PlaceCommand)
        expect(CommandParser.parse('PLACE 1,2,    WEST')).to be_an(PlaceCommand)
        expect(CommandParser.parse('PLACE 1,2,    SOUTH')).to be_an(PlaceCommand)
      end

      it 'should initialise PLACE command with position' do
        place_command = CommandParser.parse('PLACE 1,2,NORTH')
        expect(place_command.position.point.x).to eq(1)
        expect(place_command.position.point.y).to eq(2)
        expect(place_command.position.direction).to eq(Direction::NORTH)

        place_command = CommandParser.parse('PLACE 1,2,EAST')
        expect(place_command.position.direction).to eq(Direction::EAST)

        place_command = CommandParser.parse('PLACE 1,2,WEST')
        expect(place_command.position.direction).to eq(Direction::WEST)

        place_command = CommandParser.parse('PLACE 1,2,SOUTH')
        expect(place_command.position.direction).to eq(Direction::SOUTH)
      end
    end
  end
end