defmodule Cards do
  @moduledoc """
  Documentation for Cards.
  provides methods for creating and handling deck of Cards
  """

  @doc """
    returns a list of strings representing a deck of playing cards
  """
  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five"]
    suits = ["Spades", "Clubs", "Hearts", "Diamond"]
    # cards = for value <- values do
    #   for suit <- suits do
    #     "#{value} of #{suit}"
    #   end
    # end
    # List.flatten(cards)
    for value <- values, suit <- suits do
      "#{value} of #{suit}"
    end
  end
  def shuffle(deck) do
    Enum.shuffle(deck)
  end
  ## @method container
  # check if card exists in the deck list 
  # return boolean
  def contains?(deck, card) do
    Enum.member?(deck, card)
  end
  @doc """
    Divides a deck into a hand and a remainder of the deck
    the `hand_size` argument indicates how many cards should be in the hand

## Examples

      iex> deck = Cards.create_deck
      iex> { hand, deck } = Cards.deal(deck, 1)
      iex> hand
      ["Ace of Spades"]
      
  """
  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  def save(deck, file_name) do
    binary = :erlang.term_to_binary(deck)
    File.write(file_name, binary)
  end

  def read(file_name) do
    case File.read(file_name) do
       { :ok, binary } -> :erlang.binary_to_term binary
       { :error, _ } -> "that file does not exists"
    end
  end
  def create_hand(hand_size) do
    Cards.create_deck
    |> Cards.shuffle
    |> Cards.deal(hand_size)
  end
end
