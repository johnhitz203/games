defmodule Games.Wordle do
  @moduledoc """
  Game where player tries to guess a random 5 letter word by placing letters in boxes that represent letters in the word.
  """
  def feedback(answer, guess) do
    answer_list = String.graphemes(answer)
    guess_list = String.graphemes(guess)

    zip_list = zip_w_indices(answer_list, guess_list)
    # |> IO.inspect(label: "zip")

    green_letters = collect_green_letters(zip_list)
    # |> IO.inspect(label: "collect green letters")

    gray_letters = collect_gray_letters(zip_list, answer_list)

    yellow_letters = (zip_list -- green_letters) -- gray_letters

    build_feedback(green_letters, gray_letters, yellow_letters)
  end

  defp build_feedback(green_letters, gray_letters, yellow_letters) do
    map = %{}

    map =
      Enum.reduce(green_letters, map, fn {{_a, g}, i}, map ->
        Map.put(map, i, {g, :green})
      end)

    map =
      Enum.reduce(gray_letters, map, fn {{_a, g}, i}, map ->
        Map.put(map, i, {g, :gray})
      end)

    Enum.reduce(yellow_letters, map, fn {{_a, g}, i}, map ->
      Map.put(map, i, {g, :yellow})
    end)
  end

  ###### Helpers ######

  defp zip_w_indices(answer_list, guess_list) do
    Enum.zip(answer_list, guess_list)
    |> Enum.with_index()
  end

  defp collect_green_letters(list_of_tuples) do
    for {{l, l}, _} = t <- list_of_tuples,
        do: t

    # Enum.filter(list_of_tuples, fn {{a, g}, _} ->
    #   a == g
    # end)
  end

  defp collect_gray_letters(list_of_tuples, answer_list) do
    Enum.filter(list_of_tuples, fn {{_a, g}, _} ->
      g not in answer_list
    end)
  end
end
