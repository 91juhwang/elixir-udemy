defmodule Cards do
  @moduledoc """
    Provides methods for creating and handling deck of cards
  """

  @doc """
    Returns list of strings of playing cards and deck
  """
  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five"]
    suits = ["Spades", "Diamonds", "Clubs", "Hearts"]

    # cards = for value <- values do
    #   for suit <- suits do
    #     "#{value} of #{suit}"
    #   end
    # end

    # List.flatten(cards)

    for suit <- suits, value <- values do
      "#{value} of #{suit}"
    end
  end

  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  @doc """
    Check if a card is inside the created deck

    ## Examples

      iex> deck = Cards.create_deck
      iex> Cards.contains?(deck, "Ace of Spades")
      true

  """

  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  @doc """
    Deals the hand from create_deck function.

    ## Examples

      iex> deck = Cards.create_deck
      iex> {hand, deck} = Cards.deal(deck, 1)
      iex> hand
      ["Ace of Spades"]

  """
  def deal(deck, no_of_hands) do
    Enum.split(deck, no_of_hands)
  end

  def save(deck, file_name) do
    binary = :erlang.term_to_binary(deck)
    File.write(file_name, binary)
  end

  def load(file_name) do
    # By convention, Elixir avoid using if/else
    # File.read file_name returns a tuple with 2 elements
    # Run the case block for matching patterns and return the result.
    case File.read file_name do
      {:ok, binary} ->
        :erlang.binary_to_term binary
      {:error, _reason} ->
        "That file does not exist."
    end
  end

  def create_hand(hand_size) do
    Cards.create_deck
    |> Cards.shuffle
    |> Cards.deal(hand_size)
  end
end
