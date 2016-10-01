defmodule Skillz.TrueSkill do
  use GenServer


  ### const


  @script_path Path.join(~w(#{File.cwd!} priv pyskill)) |> to_char_list


  ## apis


  def start_link(opts), do: GenServer.start_link(__MODULE__, :ok, opts)
  def calculate_ranks(pid, %{rating: _, sigma: _} = winner, %{rating: _, sigma: _} = loser, tie \\ false),
  do: GenServer.call(pid, {:calculate_ranks, winner, loser, tie})


  ## init


  def init(:ok) do
    {:ok, pp} = :python.start([{:python_path, @script_path}, {:python, 'python'}])
    {:ok, %{python_process: pp}}
  end


  ## callbacks


  def handle_call({:calculate_ranks, winner, loser, tie}, _from, state) do

    p1 = {winner.rating, winner.sigma}
    p2 = {loser.rating, loser.sigma}

    {{p1_rating, p1_sigma}, {p2_rating, p2_sigma}} = invoke(state.python_process, :calculate_ranks, [p1, p2, tie])

    result = {
      %{rating: p1_rating, sigma: p1_sigma},
      %{rating: p2_rating, sigma: p2_sigma}
    }

    {:reply, result, state}
  end


  ### private methods


  defp invoke(pp, atom, args),
  do: :python.call(pp, :driver, atom, args)

end
