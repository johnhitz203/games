defmodule GuessingGame do
  # Generate a random number between 1 - 10
  # take a guess between 1 and 10
  # if guess != our ?random #
  # return Incorrect!
  def play do
    correct_guess = Enum.random(1..10)
    IO.inspect(correct_guess)
    # IO.gets("Enter a guess between 1 and 10: ")
    # case guess do
  end
end
