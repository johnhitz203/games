defmodule Games.RockPaperScissors do
  def play do
    ai_guess = Enum.random([:rock, :paper, :scissors])
    IO.inspect(ai_guess, label: "ai_guess")

    IO.inspect(binding())

    guess =
      IO.gets("Pick rock, paper, scissors ")
      |> String.trim()
      |> String.to_atom()

    case {guess, ai_guess} do
      {:paper, :rock} -> "player wins with paper covers rock!"
      {:scissors, :paper} -> "Player wins with scissors cuts paper!"
      {:rock, :scissors} -> "player wins with rock breaks scissors"
      {guess, guess} -> "tie"
      _winner -> "You loser!"
    end
  end
end
