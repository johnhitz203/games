defmodule Games.WordleTest do
  use ExUnit.Case
  doctest Games.Wordle
  alias Games.Wordle

  test "feedback/2 all green" do
    assert Games.Wordle.feedback("aaaaa", "aaaaa") == [:green, :green, :green, :green, :green]
  end

  test "feedback/2 all gray" do
    assert Games.Wordle.feedback("aaaaa", "bbbbb") == [:gray, :gray, :gray, :gray, :gray]
  end

  test "feedback/2 all yellow" do
    assert Games.Wordle.feedback("ababa", "babab") == [
             :yellow,
             :yellow,
             :yellow,
             :yellow,
             :yellow
           ]
  end

  test "feedback/2 mixed green and gray" do
    assert Games.Wordle.feedback("abcde", "abfgh") == [:green, :green, :gray, :gray, :gray]
  end

  test "feedback/2 mixed green and yellow" do
    assert Games.Wordle.feedback("abcde", "acbde") == [:green, :yellow, :yellow, :green, :green]
  end

  test "feedback/2 yellow and gray" do
    assert Games.Wordle.feedback("acbad", "bfabf") == [:yellow, :gray, :yellow, :yellow, :gray]
  end

  test "feedback/2 mixed green, yellow, and gray" do
    assert Games.Wordle.feedback("abcdf", "bacdl") == [:yellow, :yellow, :green, :green, :gray]
  end

  test "feedback/2 guess has extra char that matches" do
    assert Games.Wordle.feedback("abcdf", "bacda") == [:yellow, :yellow, :green, :green, :gray]
  end
end
