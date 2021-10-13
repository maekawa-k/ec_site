class RoomChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    stream_from 'chat' # 追加
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def post_message(data) # 修正
     ActionCable.server.broadcast 'chat', message: data['message'] # 追加
  end
end
