defmodule Games.GuessingGame do
  def play do
    correct_guess = Enum.random(1..10)
    IO.inspect(correct_guess, label: "correct_guess")

    get_guess(correct_guess)

    IO.inspect(binding())
  end

  def get_guess(correct_guess) do
    guess =
      IO.gets("Enter a number between 1 and 10: ")
      |> String.trim()
      |> String.to_integer()

    Games.GuessingGame.check_guess(guess, correct_guess)
  end

  def check_guess(guess, correct_guess) do
    cond do
      correct_guess == guess ->
        IO.puts("Correct!")

      guess > correct_guess ->
        IO.puts("To High!")
        get_guess(correct_guess)

      guess < correct_guess ->
        IO.puts("To Low!")
        get_guess(correct_guess)
    end
  end
end
