defmodule Cards do

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

  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  def deal(deck, no_of_hands) do
    Enum.split(deck, no_of_hands)
  end

  def save(deck, file_name) do
    binary = :erlang.term_to_binary(deck)
    File.write(file_name, binary)
  end

  def load(file_name) do
    {status, binary} = File.read file_name
    # By convention, Elixir avoid using if/else
    case status do
      :ok ->
        :erlang.binary_to_term binary
      :error ->
        "That file does not exist."
    end
  end
end
