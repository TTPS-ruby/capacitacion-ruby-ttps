require_relative 'maze'
require 'minitest/autorun'

class TestMaze < MiniTest::Unit::TestCase
  @@maze4x6 = <<-EOS
    ######
    ######
    #@####
    ######
  EOS
  @@maze4x6.gsub!(/^ +/, '')

  def setup
    @maze = Maze::Maze.new(@@maze4x6)
  end

  def test_width
    assert_equal(6, @maze.width)
  end

  def test_height
    assert_equal(4, @maze.height)
  end

  def test_position
    assert_equal([2, 1], @maze.position)
  end

  def test_index_to_coords_nw
    assert_equal([0, 0], @maze.send(:index_to_coords, 0))
  end

  def test_index_to_coords_ne
    maze = Maze::Maze.new "#####@\n######\n######\n######\n"
    assert_equal([0, 5], @maze.send(:index_to_coords, maze.map.index('@')))
  end

  def test_index_to_coords_sw
    maze = Maze::Maze.new "######\n######\n######\n@#####\n"
    assert_equal([3, 0], @maze.send(:index_to_coords, maze.map.index('@')))
  end

  def test_index_to_coords_se
    maze = Maze::Maze.new "######\n######\n######\n#####@\n"
    assert_equal([3, 5], maze.send(:index_to_coords, maze.map.index('@')))
  end

  def test_coords_to_index_nw
    assert_equal(0, @maze.send(:coords_to_index, 0, 0))
  end

  def test_coords_to_index_ne
    maze = Maze::Maze.new "#####@\n######\n######\n######\n"
    assert_equal(maze.map.index('@'), @maze.send(:coords_to_index, 0, 5))
  end

  def test_coords_to_index_sw
    maze = Maze::Maze.new "######\n######\n######\n@#####\n"
    assert_equal(maze.map.index('@'), @maze.send(:coords_to_index, 3, 0))
  end

  def test_coords_to_index_se
    maze = Maze::Maze.new "######\n######\n######\n#####@\n"
    assert_equal(maze.map.index('@'), maze.send(:coords_to_index, 3, 5))
  end

  def test_obstacle_west
    maze = Maze::Maze.new <<-EOS
+--+
|@ |
+--+
    EOS
    assert(maze.obstacle_west?)
    refute(maze.obstacle_east?)
  end

  def test_obstacle_east
    maze = Maze::Maze.new <<-EOS
+--+
| @|
+--+
    EOS
    refute(maze.obstacle_west?)
    assert(maze.obstacle_east?)
  end

  def test_obstacle_north
    maze = Maze::Maze.new <<-EOS
+---+
| @ |
|   |
+---+
    EOS
    assert(maze.obstacle_north?)
    refute(maze.obstacle_south?)
  end

  def test_obstacle_south
    maze = Maze::Maze.new <<-EOS
+---+
|   |
| @ |
+---+
    EOS
    refute(maze.obstacle_north?)
    assert(maze.obstacle_south?)
  end

  def test_win_at_north
    maze = Maze::Maze.new <<-EOS
+@-+
|  |
+--+
    EOS
    assert(maze.win?)
  end

  def test_win_at_south
    maze = Maze::Maze.new <<-EOS
+--+
|  |
+@-+
    EOS
    assert(maze.win?)
  end

  def test_win_at_west
    maze = Maze::Maze.new <<-EOS
+--+
|  @
+--+
    EOS
    assert(maze.win?)
  end

  def test_win_east?
    maze = Maze::Maze.new <<-EOS
+--+
@  |
+--+
    EOS
    assert(maze.win?)
  end

  def test_not_win?
    maze = Maze::Maze.new <<-EOS
+---+
|@  |
+---+
    EOS
    refute(maze.win?)
  end

  def test_north_wall_collision
    maze = Maze::Maze.new <<-EOS
+---+
| @ |
|   |
+---+
    EOS
    assert_raises(Maze::WallCollision) { maze.north }
  end

  def test_south_wall_collision
    maze = Maze::Maze.new <<-EOS
+---+
|   |
| @ |
+---+
    EOS
    assert_raises(Maze::WallCollision) { maze.south }
  end

  def test_west_wall_collision
    maze = Maze::Maze.new <<-EOS
+---+
|   |
|@  |
|   |
+---+
    EOS
    assert_raises(Maze::WallCollision) { maze.west }
  end

  def test_north_wall_collision
    maze = Maze::Maze.new <<-EOS
+---+
|   |
|  @|
|   |
+---+
    EOS
    assert_raises(Maze::WallCollision) { maze.east }
  end

  def test_north_end_of_map
    maze = Maze::Maze.new <<-EOS
+-@-+
|   |
|   |
+---+
    EOS
    assert_raises(Maze::EndOfMap) { maze.north }
  end

  def test_south_end_of_map
    maze = Maze::Maze.new <<-EOS
+---+
|   |
|   |
+-@-+
    EOS
    assert_raises(Maze::EndOfMap) { maze.south }
  end

  def test_west_end_of_map
    maze = Maze::Maze.new <<-EOS
+---+
|   |
@   |
|   |
+---+
    EOS
    assert_raises(Maze::EndOfMap) { maze.west }
  end

  def test_east_end_of_map
    maze = Maze::Maze.new <<-EOS
+---+
|   |
|   @
|   |
+---+
    EOS
    assert_raises(Maze::EndOfMap) { maze.east }
  end

  def test_north_decreases_row_number
    maze = Maze::Maze.new <<-EOS
+ +
|@|
+-+
    EOS
    maze.north
    assert_equal(0, maze.position[0])
  end

  def test_south_increases_row_number
    maze = Maze::Maze.new <<-EOS
+-+
|@|
+ +
    EOS
    maze.south
    assert_equal(2, maze.position[0])
  end

  def test_west_decreases_col_number
    maze = Maze::Maze.new <<-EOS
+-+
 @|
+-+
    EOS
    maze.west
    assert_equal(0, maze.position[1])
  end

  def test_east_increases_col_number
    maze = Maze::Maze.new <<-EOS
+--+
|@ |
+--+
    EOS
    maze.east
    assert_equal(2, maze.position[1])
  end

  def test_play
    maze = Maze::Maze.new <<-EOS
+----+
| @  |
+--+ +
    EOS
    maze.play do
      maze.east
      maze.east
      maze.south
      true
    end
    assert(maze.win?)
  end
end
