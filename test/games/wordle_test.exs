defmodule Games.WordleTest do
  use ExUnit.Case
  doctest Games.Wordle
  alias Games.Wordle

  test "zip lists with indices" do
    assert Wordle.zip_w_indices(
             String.graphemes("pzazz"),
             String.graphemes("spazz")
           ) == [
             {{"p", "s"}, 0},
             {{"z", "p"}, 1},
             {{"a", "a"}, 2},
             {{"z", "z"}, 3},
             {{"z", "z"}, 4}
           ]
  end

  test "get list of green letter tuples" do
    assert Wordle.collect_green_letters([
             {{"p", "s"}, 0},
             {{"z", "p"}, 1},
             {{"a", "a"}, 2},
             {{"z", "z"}, 3},
             {{"z", "z"}, 4}
           ]) == [
             {{"a", "a"}, 2},
             {{"z", "z"}, 3},
             {{"z", "z"}, 4}
           ]
  end

  test "get list of gray letter tuples" do
    assert Wordle.collect_gray_letters(
             [
               {{"p", "s"}, 0},
               {{"z", "p"}, 1},
               {{"a", "a"}, 2},
               {{"z", "z"}, 3},
               {{"z", "z"}, 4}
             ],
             ["p", "z", "a", "z", "z"]
           ) == [{{"p", "s"}, 0}]
  end

  test "feedback/2 mix of green, gray, and yellow" do
    assert Games.Wordle.feedback("pzazz", "spazz") == %{
             0 => {"s", :gray},
             1 => {"p", :yellow},
             2 => {"a", :green},
             3 => {"z", :green},
             4 => {"z", :green}
           }
  end

  test "feedback/2 all yellow" do
    assert Games.Wordle.feedback("abcde", "ecdba") == %{
             0 => {"e", :yellow},
             1 => {"c", :yellow},
             2 => {"d", :yellow},
             3 => {"b", :yellow},
             4 => {"a", :yellow}
           }
  end

  test "feedback/2 all gray" do
    assert Games.Wordle.feedback("aaaaa", "bbbbb") == %{
             0 => {"b", :gray},
             1 => {"b", :gray},
             2 => {"b", :gray},
             3 => {"b", :gray},
             4 => {"b", :gray}
           }
  end

  test "feedback/2 all green" do
    assert Games.Wordle.feedback("aaaaa", "aaaaa") == %{
             0 => {"a", :green},
             1 => {"a", :green},
             2 => {"a", :green},
             3 => {"a", :green},
             4 => {"a", :green}
           }
  end
end

# test "feedback/2 mixed green and gray" do
#   assert Games.Wordle.feedback("abcde", "abfgh") == [:green, :green, :gray, :gray, :gray]
# end

# test "feedback/2 mixed green and yellow" do
#   assert Games.Wordle.feedback("abcde", "acbde") == [:green, :yellow, :yellow, :green, :green]
# end

# test "feedback/2 yellow and gray" do
#   assert Games.Wordle.feedback("acbad", "bfabf") == [:yellow, :gray, :yellow, :yellow, :gray]
# end

# test "feedback/2 mixed green, yellow, and gray" do
#   assert Games.Wordle.feedback("abcdf", "bacdl") == [:yellow, :yellow, :green, :green, :gray]
# end

# test "feedback/2 guess has extra char that matches" do
#   assert Games.Wordle.feedback("abcdf", "bacda") == [:yellow, :yellow, :green, :green, :gray]
# end

# test "feedback/2 all yellow" do
#   assert Games.Wordle.feedback("ababa", "babab") == [
#            :yellow,
#            :yellow,
#            :yellow,
#            :yellow,
#            :gray
#          ]
# end
# end
