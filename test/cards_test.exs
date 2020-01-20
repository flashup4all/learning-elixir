defmodule CardsTest do
  use ExUnit.Case
  doctest Cards

  test "deck of cards must be == 20"  do
  	deck = Cards.create_deck
  	assert length(deck) == 20
  end 

  test "shuffle return a random deck" do
  	deck = Cards.create_deck
  	refute deck == Cards.shuffle(deck)
  end

  test "contains must returns a bool" do
  	
  end
end
