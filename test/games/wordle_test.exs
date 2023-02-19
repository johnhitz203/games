defmodule Games.WordleTest do
  use ExUnit.Case
  doctest Games.Wordle
  alias Games.Wordle

  test "replace_w_green/1 all green" do
    assert Wordle.replace_w_green({["a", "a", "a", "a", "a"], ["a", "a", "a", "a", "a"]}) ==
             {[nil, nil, nil, nil, nil], [:green, :green, :green, :green, :green]}
  end

  test "replace_w_green/1 no green" do
    assert Wordle.replace_w_green({["a", "a", "a", "a", "a"], ["b", "b", "b", "b", "b"]}) ==
             {["a", "a", "a", "a", "a"], ["b", "b", "b", "b", "b"]}
  end

  test "replace_w_green/1 one green at index 0" do
    assert Wordle.replace_w_green({["a", "a", "a", "a", "a"], ["a", "b", "b", "b", "b"]}) ==
             {[nil, "a", "a", "a", "a"], [:green, "b", "b", "b", "b"]}
  end

  test "replace_w_green/1 one green at index 1" do
    assert Wordle.replace_w_green({["b", "a", "b", "b", "b"], ["a", "a", "a", "a", "a"]}) ==
             {["b", nil, "b", "b", "b"], ["a", :green, "a", "a", "a"]}
  end

  test "replace_w_yellow/1 all yellow" do
    assert Games.Wordle.replace_w_yellow({["a", "b", "c", "d", "e"], ["e", "c", "d", "b", "a"]}) ==
             {[nil, nil, nil, nil, nil],
              [
                :yellow,
                :yellow,
                :yellow,
                :yellow,
                :yellow
              ]}
  end

  test "replace_w_yellow/1 yellow at index 0 and 3" do
    assert Games.Wordle.replace_w_yellow({["a", "b", "c", "b", "b"], ["c", "e", "a", "e", "e"]}) ==
             {[nil, "b", nil, "b", "b"],
              [
                :yellow,
                "e",
                :yellow,
                "e",
                "e"
              ]}
  end

  test "replace_w_gray/1 all gray" do
    assert Games.Wordle.replace_w_gray({["a", "a", "a", "a", "a"], ["b", "b", "b", "b", "b"]}) ==
             {[nil, nil, nil, nil, nil],
              [
                :gray,
                :gray,
                :gray,
                :gray,
                :gray
              ]}
  end

  # test "feedback/2 all green" do
  #   assert Games.Wordle.feedback("abcde", "abcde") == [:green, :green, :green, :green, :green]
  # end

  # test "feedback/2 all yellow" do
  #   assert Games.Wordle.feedback("abcde", "ecdba") == [
  #            :yellow,
  #            :yellow,
  #            :yellow,
  #            :yellow,
  #            :yellow
  #          ]
  # end

  # test "feedback/2 all gray" do
  #   assert Games.Wordle.feedback("aaaaa", "bbbbb") == [:gray, :gray, :gray, :gray, :gray]
  # end

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
end
