defmodule Skillz.TrueSkillTest do
  use ExUnit.Case, async: false

  alias Skillz.TrueSkill


  setup context do
    {:ok, pid} = TrueSkill.start_link(name: context.test)
    {:ok, %{module: pid}}
  end

  test "it can calculate ratings", %{module: pid} do

    p1 = %{rating: 1400.0, sigma: 50}
    p2 = %{rating: 1400.0, sigma: 30}

    {p1_new, p2_new} = TrueSkill.calculate_ranks(pid, p1, p2, false)

    assert %{rating: _, sigma: _} = p1_new
    assert %{rating: _, sigma: _} = p2_new
  end
end
