defmodule LeexYeccExample do
  def parse(string) when is_bitstring(string), do: string |> String.to_charlist() |> parse()
  def parse(string) do
    with {:ok, tokens, _} <- :lang.string(string) do
      :parse.parse(tokens)
    else
      err -> err
    end
  end
end
