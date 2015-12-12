#!/usr/bin/env ruby -I lib/
require 'table'
require 'robot'
require 'robot_controller'
require 'command_parser'

TABLE_LENGTH = 5
TABLE_BREADTH = 5

class RobotSimulator
  def self.run
    robot_controller = RobotController.new(Table.new(TABLE_LENGTH, TABLE_BREADTH), Robot.new)
    while command = $stdin.gets
      begin
        command.strip!
        return if command.nil? || command.empty?
        print_result CommandParser.parse(command).execute(robot_controller)
      rescue ParseException => e
        print_result "Error: Unknown command #{e.message}"
      rescue StandardError => e
        print_result "Error: Something went wrong #{e.message}"
      end
    end
  end

  private

  def self.print_result(result)
    $stdout.puts result if result.is_a? String
  end
end

RobotSimulator.run
