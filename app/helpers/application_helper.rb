module ApplicationHelper
def broadcast(channel, &block)
    message = {:channel => channel, :data => capture(&block)}
    uri = URI.parse("http://limitless-mountain-5940.herokuapp.com/faye")
    Net::HTTP.post_form(uri, :message => message.to_json)
  end
end
