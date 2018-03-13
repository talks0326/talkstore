class LocateChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'locate:position'
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def put_latlng(data) #ここが変わった
    LocateChannel.broadcast_to('position', {latitude: data["latitude"], longitude: data["longitude"]}) #ここが変わった
  end
end
