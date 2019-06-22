defmodule PhoenixChatWeb.ChatChannel do
  use PhoenixChatWeb, :channel
  
  alias PhoenixChat.Chats

  def join("chat:lobby", _payload, socket) do
    {:ok, socket}
  end
 
  # It is also common to receive messages from the client and
  # broadcast to everyone in the current topic (chat:lobby).
  def handle_in("shout", payload, socket) do
    Chats.create_message(payload)
    broadcast socket, "shout", payload
    {:noreply, socket}
  end
end
