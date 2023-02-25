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

    # letters_with_indices = zip_answer_w_guess_w_indices(answer, guess)

    # green_letters =
    #   filter_for_green(letters_with_indices)
    #   |> IO.inspect()

    # gray_letters = filter_for_gray

    # {answer, guess}
    # |> get_input_lists()
    # |> IO.inspect(label: "feedback pipe")

    # |> get_answer_guess_tuples_w_index()

    answer_list = String.graphemes(answer)
    # |> IO.inspect(label: "answer list")

    guess_list = String.graphemes(guess)

    zip_list = zip_w_indices(answer_list, guess_list)
    # |> IO.inspect(label: "zip")

    green_letters = collect_green_letters(zip_list)
    # |> IO.inspect(label: "green feedback")

    gray_letters = collect_gray_letters(zip_list, answer_list)
    # |> IO.inspect(label: "gray feedback")

    #       answer list: ["w", "h", "e", "r", "e"]
    #       green feedback: [{{"w", "w"}, 0}, {{"r", "r"}, 3}]
    #       gray feedback: [{{"e", "a"}, 2}, {{"e", "s"}, 4}]
    # yellow feedback: ["w", "h", "e", "r", "e"]

    yellow_and_gray_letters = zip_list -- green_letters
    # |> IO.inspect(label: "yellow and gray feedback")

    yellow_letters = yellow_and_gray_letters -- gray_letters
    # |> IO.inspect(label: "yellow")

    # name? build_feedback_map vs. build_feedback
    # Does including map make this too restrictive?
    # ie, it may turn out later that this returns something
    # other than a map.
    build_feedback(green_letters, gray_letters, yellow_letters)

    # map = %{}

    # map =
    #   Enum.reduce(green_letters, map, fn {{a, g}, i}, map ->
    #     Map.put(map, i, {g, :green})
    #   end)

    # map =
    #   Enum.reduce(gray_letters, map, fn {{a, g}, i}, map ->
    #     Map.put(map, i, {g, :gray})
    #   end)

    # map =
    #   Enum.reduce(yellow_letters, map, fn {{a, g}, i}, map ->
    #     Map.put(map, i, {g, :yellow})
    #   end)

    # |> IO.inspect(label: "Map")
  end

  def build_feedback(green_letters, gray_letters, yellow_letters) do
    map = %{}

    map =
      Enum.reduce(green_letters, map, fn {{a, g}, i}, map ->
        Map.put(map, i, {g, :green})
      end)

    map =
      Enum.reduce(gray_letters, map, fn {{a, g}, i}, map ->
        Map.put(map, i, {g, :gray})
      end)

    map =
      Enum.reduce(yellow_letters, map, fn {{a, g}, i}, map ->
        Map.put(map, i, {g, :yellow})
      end)
  end

  ###### Helpers ######

  def zip_w_indices(answer_list, guess_list) do
    Enum.zip(answer_list, guess_list)
    |> Enum.with_index()
  end

  def collect_green_letters(list_of_tuples) do
    # for {{l, l}, _} = t <- list_of_tuples, do: t
    Enum.filter(list_of_tuples, fn {{a, g}, _} ->
      a == g
    end)
  end

  def collect_gray_letters(list_of_tuples, answer_list) do
    Enum.filter(list_of_tuples, fn {{_a, g}, _} ->
      g not in answer_list
    end)
  end

  # def zip_lists_w_indices({answer_list, guess_list} = _lists) do
  #   Enum
  # end

  # def get_input_lists({answer, guess} = _words) do
  #   {
  #     String.graphemes(answer),
  #     String.graphemes(guess)
  #   }
  # end

  # def get_answer_guess_tuples_w_index({answer_list, guess_list} = _lists) do
  #   Enum.zip(answer_list, guess_list)
  #   |> Enum.with_index()
  # end

  # def filter_for_green(
  #       match_indices = [
  #         {{_answer_0, _guess_0}, 0},
  #         {{_answer_1, _guess_1}, 1},
  #         {{_answer_2, _guess_2}, 2},
  #         {{_answer_3, _guess_3}, 3},
  #         {{_answer_4, _guess_4}, 4}
  #       ]
  #     ) do
  #   for {{l, l}, _i} = m <- match_indices, do: m
  # end

  # def filter_for_gray(
  #       match_indices = [
  #         {{_answer_0, _guess_0}, 0},
  #         {{_answer_1, _guess_1}, 1},
  #         {{_answer_2, _guess_2}, 2},
  #         {{_answer_3, _guess_3}, 3},
  #         {{_answer_4, _guess_4}, 4}
  #       ]
  #     ) do
  #   for {{_, g}, _i} = m <- match_indices, do: g != m
  # Enum.filter(match_indices, fn x ->
  #   {{a, g}, i} not in x
  # end)
  # end
end
