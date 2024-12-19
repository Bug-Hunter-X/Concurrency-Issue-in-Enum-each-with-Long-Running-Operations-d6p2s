```elixir
list = [1, 2, 3, 4, 5]

Enum.map(Task.async_stream(list, fn x ->
  if x == 3 do
    Process.sleep(1000) # Simulate a long-running operation
  end
  {:ok, x}
 end), fn task ->
  Task.await(task)
end)
|> Enum.each(fn x -> IO.puts(x) end)
```