defmodule Games.WordleTest do
  use ExUnit.Case
  doctest Games.Wordle
  alias Games.Wordle

  describe "feedback/1" do
    test "feedback/1 mix of green, gray, and yellow" do
      assert Games.Wordle.feedback({"pzazz", "spazz"}) == %{
               0 => {"s", :gray},
               1 => {"p", :yellow},
               2 => {"a", :green},
               3 => {"z", :green},
               4 => {"z", :green}
             }
    end

    test "feedback/1 all yellow" do
      assert Games.Wordle.feedback({"abcde", "ecdba"}) == %{
               0 => {"e", :yellow},
               1 => {"c", :yellow},
               2 => {"d", :yellow},
               3 => {"b", :yellow},
               4 => {"a", :yellow}
             }
    end

    test "feedback/1 all gray" do
      assert Games.Wordle.feedback({"aaaaa", "bbbbb"}) == %{
               0 => {"b", :gray},
               1 => {"b", :gray},
               2 => {"b", :gray},
               3 => {"b", :gray},
               4 => {"b", :gray}
             }
    end

    test "feedback/1 all green" do
      assert Games.Wordle.feedback({"aaaaa", "aaaaa"}) == %{
               0 => {"a", :green},
               1 => {"a", :green},
               2 => {"a", :green},
               3 => {"a", :green},
               4 => {"a", :green}
             }
    end
  end
end
