defmodule Y2024.Day01Test do
  use ExUnit.Case

  import Y2024.Day01

  test "part1" do
    input = "lib/y2024/input/d01t.txt"
    result = part1(input)

    assert result == 11
  end

  test "part2" do
    input = "lib/y2024/input/d01t.txt"
    result = part2(input)

    assert result
  end
end
