defmodule Games.Wordle do
  @moduledoc """
  Game where player tries to guess a random 5 letter word by placing letters in boxes that represent letters in the word.
  """
  def feedback(answer, guess) do
    # Input: two strings which are 5 characters ea
    # What form is my data in
    ## Is there an easier structure to work with
    # Turn both strings to a list characters
    # compare guess and answer
    ## Transformations:
    ### if guess === answer return all green
    ### if guess !== answer
    #### remove value at index i from answer list
    ### compare value in guess at index i against answer value_i
    #### if value at index i is the same in both return green
    #### if value at index i is not the same return yellow
    # Output: a list of 5 atoms consisting of :green, :yellow, :gray

    {answers, guesses} =
      {answer, guess}
      |> strings_to_list()
      |> replace_w_green()
      |> replace_w_yellow()
      |> IO.inspect(label: "guess")

    # |> IO.inspect(label: "Pipeline output")

    # |> graycheck()

    # IO.inspect(guesses, label: "Guesses")
  end

  def strings_to_list({answer, guess}) do
    {
      String.split(answer, "", trim: true),
      String.split(guess, "", trim: true)
    }
  end

  def replace_w_green({answers, guesses}) do
    Enum.zip(answers, guesses)
    |> Enum.reduce([], fn {answer, guess}, acc ->
      if answer == guess do
        acc ++ [{nil, :green}]
      else
        acc ++ [{answer, guess}]
      end

      # |> IO.inspect(label: "Enum.reduce")
    end)
    |> Enum.unzip()

    # |> Enum.map(fn {answer, guess} ->
    #   if answer == guess do
    #     {:green, :green}
    #   else
    #     {answer, guess}
    #   end
    # end)
    # |> Enum.unzip()
  end

  # input
  def replace_w_yellow({answers, guesses}) do
    Enum.zip(answers, guesses)
    |> Enum.reduce([], fn {answer, guess}, acc ->
      if guess in answers do
        acc ++ [{nil, :yellow}]
      else
        acc ++ [{answer, guess}]
      end
    end)
    |> Enum.unzip()
  end

  def replace_w_gray({answers, guesses}) do
    Enum.zip(answers, guesses)
    |> Enum.reduce([], fn {answer, guess}, acc ->
      if guess not in answers do
        acc ++ [{nil, :gray}]
      else
        acc ++ [{answer, guess}]
      end
    end)
    |> Enum.unzip()
  end
end
