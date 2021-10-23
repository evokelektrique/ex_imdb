defmodule ExImdb do
  @base_url "https://www.imdb.com/"

  def find(title) do
    case HTTPoison.get(@base_url <> "find?q=" <> title <> "&s=tt") do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        parse(:find, body)

      {:ok, %HTTPoison.Response{status_code: 404}} ->
        IO.puts("Not found")

      {:ok, %HTTPoison.Error{reason: reason}} ->
        IO.inspect(reason)
    end
  end

  def parse(type, body) do
    case type do
      :find ->
        parse_find_titles(body)
    end
  end

  def parse_find_titles(body) do
    {:ok, document} = Floki.parse_document(body)

    document
    |> Floki.find(".findList tr")
    |> Enum.map(fn tr -> parse_find_title(tr) end)
  end

  def parse_find_title(tr) do
    name =
      tr
      |> Floki.find(".result_text a")
      |> Floki.text()

    year =
      tr
      |> Floki.find(".result_text")
      |> Floki.text()
      |> String.split([" (", ")"], trim: true)
      |> Enum.at(1)

    photo =
      tr
      |> Floki.find(".primary_photo img")
      |> Floki.attribute("src")

    %{name: name, year: year, photo: photo}
  end
end
