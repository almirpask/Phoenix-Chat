defmodule PhoenixChatWeb.PageController do
  use PhoenixChatWeb, :controller

  alias PhoenixChat.Chats

  def index(conn, _params) do
    messages = Chats.list_messages
    render(conn, "index.html", messages: messages)
  end
end
