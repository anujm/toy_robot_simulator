####TOY ROBOT SIMULATOR

This application simulates the outcome of executing commands on a Toy Robot.

####SYSTEM DEPENDENCIES & CONFIGURATION
ruby >= 2.2.2

####APPLICATION INSTALLATION INSTRUCTIONS
To install the application, cd to the root directory of the project and invoke:
<pre> bundle install </pre>

####USAGE INSTRUCTIONS
1. To run the application with an input file containing commands, invoke the following from the root directory of the project:
<pre>./bin/robot_simulator < /path/to/input</pre>
For example:
<pre>./bin/robot_simulator < test_input.txt</pre>
A file named test_input.txt containing the specified test cases is provided with the project for testing. The application stops reading commands from the file when either an empty line or EOF is encountered.

2. To run the application with manual commands, invoke the following from the root directory of the project:
<pre>./bin/robot_simulator </pre>
You can now provide a different command on each line. The application will exit when an empty line is entered.

####TESTING INSTRUCTIONS
To run the rspec tests, cd to the root directory and invoke:
<pre>bundle exec rspec spec/</pre>

####OVERVIEW

The application is designed to read commands from stdin, simulate the execution of the commands on a toy robot and send the results to stdout.

####INPUT FORMAT

The following commands are supported by the application:
* PLACE x, y, direction

Places the ROBOT on a table at the specified coordinates, facing the specified direction.
<pre>
PLACE 1, 1, NORTH
</pre>
  
x, y coordinates should be integers

direction should be one of - NORTH, EAST, WEST, SOUTH

* MOVE

Moves the robot by a single unit in the direction it currently faces.

* LEFT

Rotates the robot 90 degrees to the left.

* RIGHT

Rotates the robot 90 degrees to the left.

* REPORT

Prints the current position and orientation of the robot.

####OUTPUT FORMAT
The REPORT command prints the robot's current position to the stdin:

For the following input:
<pre>
PLACE 0,0,NORTH
MOVE
REPORT
</pre>

The output would be:
<pre>
Output: 0, 1, NORTH
</pre>

####DESIGN

The command pattern was employed to ensure that adding new commands in the future does not affect unrelated areas of code. The state pattern was used to eliminate conditional statements in the command execution logic and to make the code more concise and readable. Constructor based dependency injection is used as much as possible to ease the writing of unit tests.
The code was written using TDD and particular emphasis was put on making small frequent commits of functionality. There is comprehensive unit test coverage as a result.
