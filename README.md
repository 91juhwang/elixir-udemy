# Cards

**TODO: To learn about the basis of functional programming and the basic Elixir code structure**

## Check IDENTICON PROJECT BELOW (Elixir project)

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

## Two types of Data Structure in Elixir

### maps

Maps are collections of key and values. Just like `hashes`!!

```ruby
iex> colors = %{primary: "red", secondary: "blue"}
# returns %{primary: "red"}
iex> colors.primary

# Use with pattern matching
iex> %{secondary: secondary_color}  = colors
# returns blue
iex> secondary_color
```

#### Updating a map structure is confusing!!!!

```ruby
colors = %{primary: "red"}

# returns an error
colors.primary = "blue"
```

In order to update the map, we can do it in 2 ways.

1. With the function
2. With the special syntax

Elixir provides rudimentary functions for manipulating the map.
`put` function:

```ruby
colors # returns %{primary: "red"}
colors_two = Map.put(colors, :primary, "blue")
colors_two.primary # returns blue
colors # Still returns %{primary: "red"}

# Using syntax to update original map
colors_three = %{ colors | primary: "green" }
colors_three.primary # returns green

# adding new key:value to the map
Map.put(colors, secondary_color: "green")
colors # returns # returns %{primary: "red", secondary_color: "green"}
```

## Keyword Lists

```ruby
colors = [{:primary, "red"}, {:secondary, "green"}]
colors[:primary] # returns "red"
colors = [primary: "red", secondary: "green"] # returns samething
%{primary: "red", primary: "blue"} # returns blue and not duplicate keys
```
Keyword list stores the duplicate keys unlike Map.

Keyword List is useful when using something like `ecto`. Because it can store multiple duplicate keys

When using Keyword List, when the last argument of a function is a Keyword List, `[]` can be removed.
ex.

```ruby
# This passes the keyword list as an argument to find_where function
# However, since it's the last argument of the function [] was removed,
# and since duplicate key of 'where' is used, it is a keyword list
query = User.find_where where: user.age > 10, where: user.subscribed == true
```

# Identicon

## Summary

Write a module that generates identicon(auto-generated pixel image), which will return images based on the string inputs.

Identicon requires 5 x 5 grid, 250px x 250px with each square being 50px. Colors will be automatically filled and will always be identical or symmetric about the center.

## Requirements

* Elixir

Check identicon directory in the repository.

## Algorithm

1. String input
2. Compute MD5 hash of string
3. List of numbers based on the string
4. Pick color
5. Build grid squares
6. Convert grid into image
7. Save image as a file