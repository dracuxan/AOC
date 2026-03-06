defmodule Y2023.Day01 do
  @words %{
    "one" => "1",
    "two" => "2",
    "three" => "3",
    "four" => "4",
    "five" => "5",
    "six" => "6",
    "seven" => "7",
    "eight" => "8",
    "nine" => "9"
  }
  def parse_input(input) do
    input
    |> File.read!()
    |> String.split("\n", trim: true)
  end

  def part1(input) do
    input
    |> parse_input()
    |> Enum.map(&line_value/1)
    |> Enum.sum()
  end

  def part2(input) do
    input
    |> parse_input()
    |> Enum.map(&line_value_words/1)
    |> Enum.sum()
  end

  defp line_value(line) do
    digits =
      line
      |> String.graphemes()
      |> Enum.filter(&(&1 =~ ~r/\d/))

    first = List.first(digits)
    last = List.last(digits)

    String.to_integer(first <> last)
  end

  defp line_value_words(line) do
    digits = exract_digits(line)
    String.to_integer(List.first(digits) <> List.last(digits))
  end

  defp exract_digits(line) do
    chars = String.graphemes(line)

    Enum.reduce(0..(length(chars) - 1), [], fn i, acc ->
      rest = Enum.drop(chars, i) |> Enum.join()

      cond do
        Regex.match?(~r/^\d/, rest) ->
          [String.first(rest) | acc]

        word = Enum.find(@words, fn {k, _} -> String.starts_with?(rest, k) end) ->
          {_, digit} = word
          [digit | acc]

        true ->
          acc
      end
    end)
    |> Enum.reverse()
  end
end
