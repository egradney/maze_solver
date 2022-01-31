

class MazeSolver

    def initialize

        @maze = File.readlines("maze_sample.txt").map(&:chomp)

        @starting_line = @maze.select { |line| line.include?('S')}
        @starting_position = @starting_line[0].index('S')

        row = @maze.index(@starting_line[0])
        col = @starting_position

        @start_point = @maze[row][col]


    end

    def try_route

        current_location = @maze[row][col]

        possible_right = @maze[row][col + 1]
        possible_left = @maze[row][col - 1]
        possible_up = @maze[row -1][col]
        possible_down = @maze[row + 1][col]

        possible_moves = [possible_down, possible_left, possible_right, possible_up]

       


    end


    







end

MazeSolver.new