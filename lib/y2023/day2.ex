defmodule Y2023.Day02 do
  def parse_input(input) do
    input
    |> File.read!()
    |> String.split("\n", trim: true)
  end

  def part1(input) do
    input
    |> parse_input()
    |> Enum.map(&get_game_id/1)
  end

  def get_game_id(line) do
    # digits =
    line
    |> String.split(" ", trim: true)
    |> Enum.filter(&(&1 =~ ~r/\d/))

    # game_id = digits |> List.delete("Game") |> List.first()
    # String.to_integer(game_id)
  end
end
