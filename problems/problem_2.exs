items = IO.gets("list: ")

items = String.replace(items, "\n", "") |> String.split(" ", trim: true)
IO.inspect(items)

result = Enum.reduce(items, %{
  number: [],
  odd_number: [],
  even_number: [],
  text: []
}, fn val, acc ->
  case Integer.parse(val) do
    {int_val, ""} when rem(int_val, 2) == 1 ->
      Map.merge(acc, %{
        number: acc.number ++ [val],
        odd_number: acc.odd_number ++ [val]
      })

    {int_val, ""} when rem(int_val, 2) == 0 ->
      Map.merge(acc, %{
        number: acc.number ++ [val],
        even_number: acc.even_number ++ [val]
      })

    _ -> Map.put(acc, :text, acc.text ++ [val])
  end
end)

IO.inspect result
