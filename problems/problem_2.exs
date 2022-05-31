items = IO.gets("list: ")

items = String.replace(items, "\n", "") |> String.split(" ", trim: true)
IO.inspect(items)

defmodule Item do
  def filterItems(val, acc) do
    case Integer.parse(val) do
      {int_val, ""} when Bitwise.band(int_val,1) == 1 ->
        Map.merge(acc, %{
          number: acc.number ++ [val],
          odd_number: acc.odd_number ++ [val]
        })

      {int_val, ""} when Bitwise.band(int_val,1) == 0 ->
        Map.merge(acc, %{
          number: acc.number ++ [val],
          even_number: acc.even_number ++ [val]
        })

      _ -> Map.put(acc, :text, acc.text ++ [val])
    end
  end
end

result = Enum.reduce(items, %{
  number: [],
  odd_number: [],
  even_number: [],
  text: []
}, fn val, acc -> Item.filterItems(val, acc) end)

IO.inspect result

search = IO.gets("search: ")
search = String.replace(search, "\n", "")
IO.inspect Enum.find_index(items, fn x -> x == search end)
