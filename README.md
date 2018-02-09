# Cards

**TODO: To learn about the basis of functional programming and the basic Elixir code structure**

## Notes

[Udemy Tutorial](https://www.udemy.com/the-complete-elixir-and-phoenix-bootcamp-and-tutorial/learn/v4/overview)

* `iex -S mix` inside the directory where mix.exs is there to compile and run iex

* Update `defp deps` block to update dependencies just like Gemfile

* Run `mix deps.get` to install the dependecies

## Pattern Matching

* Pattern Matching is Elixir's way for assigning a variable.

* If the data structure and the no of left/right side's elements are same, then the pattern **matches** and assigns the variable.

Ex.)
```ruby
# returns ["red"]
color1 = ["red"]

[color1] = ["red"]

return color1 #returns red

[color1, color2] = ["red", "blue"]
return color1 #returns "red"
return color2 #returns "blue"
```

Ex.2)

`["red", color] = ["red", "blue"]` -> In this case, left hard coded value must match in the right side as well.

## Atoms

`:some_word` is the primitive data type of Elixir. Something like symbols in Ruby.


## Pipe Operator

Chain method using `|>`

With the pipe operator, there is no need to save a variable.
method after `|>` will use the returned result from the method before.

## ExDoc

two version of a documentation.

### Module Documentation
on top of the codes inside the module.

```ruby
  @moduledoc """
    Provides methods for creating and handling deck of cards
  """
```

run mix docs: Generates `docs/index.html`

### Function Documentation
on top of each functions

```ruby
  @doc """
    Check if a card is inside the created deck

    ## Examples

      iex> deck = Cards.create_deck
      iex> Cards.contains?(deck, "Ace of Spades")
      true

  """
```
run mix docs: Generates `docs/index.html`

## Testing

doctest `Module` will include the function documentations' examples.

Example test codes:
```ruby
  test "create_deck makes 20 cards" do
    deck_length = length(Cards.create_deck)
    assert deck_length == 20
  end

  test "Shuffling a deck randomizes" do
    deck = Cards.create_deck
    refute Cards.shuffle(deck) == Cards.create_deck
  end
```