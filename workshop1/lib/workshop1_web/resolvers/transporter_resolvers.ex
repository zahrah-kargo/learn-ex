defmodule Workshop1Web.NewsResolver do
  alias Workshop1.Transporter

  def all_links(_root, _args, _info) do
    {:ok, News.list_links()}
  end
end
