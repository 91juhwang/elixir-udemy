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


### Function Documentation