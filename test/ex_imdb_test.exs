defmodule ExImdbTest do
  use ExUnit.Case
  doctest ExImdb

  describe "Testing find function" do
    setup do
      [
        titles: [%{name: "The Batman", year: 2022}]
      ]
    end

    test "Testing find titles", state do
      assert [%{name: "The Batman", year: 2022}] == state[:titles]
    end
  end
end
