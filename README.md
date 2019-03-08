# LeexYeccExample

A leex and yecc example for the 2019-03 Montreal Elixir Meetup talk

## Description

This repo uses leex and yecc to tokenize and parse JSON file into a map.

See the full presentation here [https://docs.google.com/presentation/d/1fMbJhD7CNCWylZJqvHioH_f_y7UA0qbmD_infIxLA-w/edit?usp=sharing](https://docs.google.com/presentation/d/1fMbJhD7CNCWylZJqvHioH_f_y7UA0qbmD_infIxLA-w/edit?usp=sharing)

## Usage

### Using the Elixir module

```elixir
iex> json = "{\"user\":{\"name\":\"Bobby Hill\", \"post_ids\": [1,2,3,4]}}"
"{\"user\":{\"name\":\"Bobby Hill\", \"post_ids\": [1,2,3,4]}}"
iex> json |> LeexYeccExample.parse
%{"user" => %{"name" => "Bobby Hill", "post_ids" => [1, 2, 3, 4]}}
```

### Manually
```elixir
iex> json = '{"user":{"name":"Bobby Hill", "post_ids": [1,2,3,4]}}'
'{"user":{"name":"Bobby Hill", "post_ids": [1,2,3,4]}}'
iex> {:ok, tokens, _} = json |> :lang.string
{:ok,
 [
   {:open_curly, 1, :"{"},
   {:string, 1, "user"},
   {:colon, 1, :":"},
   {:open_curly, 1, :"{"},
   {:string, 1, "name"},
   {:colon, 1, :":"},
   {:string, 1, "Bobby Hill"},
   {:comma, 1, :","},
   {:string, 1, "post_ids"},
   {:colon, 1, :":"},
   {:open_array, 1, :"["},
   {:int, 1, 1},
   {:comma, 1, :","},
   {:int, 1, 2},
   {:comma, 1, :","},
   {:int, 1, 3},
   {:comma, 1, :","},
   {:int, 1, 4},
   {:close_array, 1, :"]"},
   {:close_curly, 1, :"}"},
   {:close_curly, 1, :"}"}
 ], 1}
iex> tokens |> :parse.parse
{:ok, %{
  "user" => %{
    "name" => "Bobby Hill",
    "post_ids" => [1, 2, 3, 4]
  }
}}
```
