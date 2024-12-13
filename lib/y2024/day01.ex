defmodule Y2024.Day01 do
  def parse_input(input) do
    input
    |> File.read!()
    |> String.split("\n", trim: true)
    |> Enum.map(&String.split(&1, " ", trim: true))
    |> Enum.map(fn row -> Enum.map(row, &String.to_integer/1) end)
    |> List.zip()
    # Converts [{1, 4}, {2, 5}] to [[1, 2], [4, 5]]
    |> Enum.map(&Tuple.to_list/1)
  end

  def part1(input) do
    input
    |> parse_input()
    # Sort each column independently
    |> Enum.map(&Enum.sort/1)
    # Pair sorted values back into tuples
    |> Enum.zip()
    # Find the absolute difference
    |> Enum.map(fn {a, b} -> abs(a - b) end)
    # Sum the differences
    |> Enum.sum()
  end

  def part2(input) do
    new_input = parse_input(input)
    [l, r] = new_input
    rf = Enum.frequencies(r)

    Enum.reduce(l, 0, fn val, acc -> acc + val * Map.get(rf, val, 0) end)
  end
end
