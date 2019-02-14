defmodule LeexYeccExample do

  def parse(string) do
    {:ok, tokens, _} = :lang.string(string)
    {:ok, tree} = :parse.parse(tokens)
    clean(tree)
  end

  defp clean({:object, values}) do
    Enum.reduce(values, %{}, fn ({{:string, _, key}, value}, acc) ->
      Map.put(acc, key, clean(value))
    end)
  end

  defp clean({:array, values}), do: Enum.map(values, &clean/1)
  defp clean({:string, _, val}), do: val
  defp clean({:float, _, val}), do: val
  defp clean({:int, _, val}), do: val
  defp clean({:bool, _, val}), do: val
  defp clean({:null, _, val}), do: val
end
