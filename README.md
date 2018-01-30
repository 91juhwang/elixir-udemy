# Cards

**TODO: To learn about the basis of functional programming and the basic Elixir code structure**

## Notes

[Udemy Tutorial](https://www.udemy.com/the-complete-elixir-and-phoenix-bootcamp-and-tutorial/learn/v4/overview)

* `iex -S mix` inside the directory where mix.exs is there to compile and run iex

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