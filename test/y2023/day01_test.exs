defmodule Y2023.Day01Test do
  use ExUnit.Case

  import Y2023.Day01

  test "part1" do
    input = "lib/y2023/input/day1.txt"
    result = part1(input)

    assert result == 54239
  end

  test "part2" do
    input = "lib/y2023/input/day1.txt"
    result = part2(input)

    assert result == 55343
  end
end
