require 'byebug'

class MazeSolver

    def initialize

        @maze = File.readlines("maze_sample.txt").map(&:chomp)

        @starting_line = @maze.select { |line| line.include?('S')}
        @starting_position = @starting_line[0].index('S')

        @row = @maze.index(@starting_line[0])
        @col = @starting_position

    end

    def try_route

        current_row = @row
        current_col = @col

        route = []

        current_location = @maze[current_row][current_col]
       
        until current_location == 'E'

            possible_right = @maze[current_row][current_col + 1]
            possible_left = @maze[current_row][current_col - 1]
            possible_up = @maze[current_row - 1][current_col]
            possible_down = @maze[current_row + 1][current_col]
    
            
            possible_moves = [ [possible_right,  [current_row, current_col + 1]],
                        [possible_left, [current_row, current_col - 1]],
                        [possible_up, [current_row -1, current_col]],
                        [possible_down, [current_row + 1, current_col]] ]

            
            if possible_moves.any? { |possible_move| possible_move[0] == ' ' || possible_move[0] == 'E' }
                possible_moves.each do |possible_move|
                    if possible_move[0] == 'E'
                        current_row, current_col = possible_move[1]
                        route.each do |position|
                            route_row, route_col = position
                            @maze[route_row][route_col] = 'X'
                        end
                        @maze.each { |line| puts line }
                        return nil
                    end


                end

                chosen_move = possible_moves.select { |possible_move| possible_move[0] == ' ' && !route.include?(possible_move[1]) }.sample
                    if chosen_move == nil
                        self.try_route
                    else
                        route << chosen_move[1]
                        current_row, current_col = chosen_move[1]
                    end

            else

                self.try_route

            end
        end


    end


    







end

print MazeSolver.new.try_route