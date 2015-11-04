# Module containing Maze class and related constants
# - Maze::DEFAULT is a default maze map
# - Maze::COMPASS is a wind rose
module Maze
  DEFAULT = <<-EOS
+-+   +---------------------------+
|                                 |
+------------------------------+  |
|                              |  |
+------------------+  +-----+  |  |
|                  |  |     |     |
|  +----+   +------+  |  |  +-----+
|  |    |             |  |        |
|  |    +-------------+  +----+   |
|                             |   |
|-----------------------------+   |
|             @                   |
+---------------------------------+
  EOS

  COMPASS = <<-EOS
  N
W-+-E
  S
  EOS

  WallCollision = Class.new(Exception)
  EndOfMap = Class.new(Exception)

  # Maze objects allows a character to move arround in a maze.
  # Usage:
  #   maze = Maze.new maze_map
  #   print maze.map
  #   maze.north
  #   maze.win?
  # or:
  #   auto = Maze.new
  #   auto.play do
  #     auto.east unless auto.obstacle_east?
  #     auto.win?
  #   end
  class Maze
    attr_reader :width, :height, :position, :map, :last_move

    def initialize(map = DEFAULT)
      @map = map
      @width = map.index("\n")
      @height = map.count("\n")
      @position = index_to_coords(map.index('@'))
      @last_move = :north
    end

    def obstacle_north?
      row, col = position
      obstacle?(row - 1, col)
    end

    def obstacle_south?
      row, col = position
      obstacle?(row + 1, col)
    end

    def obstacle_west?
      row, col = position
      obstacle?(row, col - 1)
    end

    def obstacle_east?
      row, col = position
      obstacle?(row, col + 1)
    end

    def win?
      row, col = position
      row == 0 || col == 0 || row == height - 1 || col == width - 1
    end

    def north
      @last_move = :north
      update_map do
        row, col = position
        fail EndOfMap if row == 0
        fail WallCollision if obstacle_north?
        @position = [row - 1, col]
      end
    end

    def south
      @last_move = :south
      update_map do
        row, col = position
        fail EndOfMap if row == height - 1
        fail WallCollision if obstacle_south?
        @position = [row + 1, col]
      end
    end

    def east
      @last_move = :east
      update_map do
        row, col = position
       fail EndOfMap if col == width - 1
       fail WallCollision if obstacle_east?
        @position = [row, col + 1]
      end
    end

    def west
      @last_move = :west
      update_map do
        row, col = position
        fail EndOfMap if col == 0
        fail WallCollision if obstacle_west?
        @position = [row, col - 1]
      end
    end

    def obstacle?(row, col)
      map[coords_to_index(row, col)] != ' '
    end

    def to_s
      [COMPASS, map].join("\n")
    end

    def play
      loop do
        break if yield
      end
    end

    private

    def index_to_coords(index)
      row = index / (width + 1)
      col = index % (width + 1)
      [row, col]
    end

    def coords_to_index(row, col)
      row * (width + 1) + col
    end

    def update_map
      old_index = coords_to_index(*position)
      yield
      map[old_index] = ' '
      map[coords_to_index(*position)] = '@'
    end
  end
end
