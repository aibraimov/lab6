class Publisher
  # In order to publish message we need a exchange name.
  # Note that RabbitMQ does not care about the payload -
  # we will be using JSON-encoded strings
  def self.publish(exchange, message1 = '', message2 = '')
    # grab the fanout exchange
    x = channel.fanout("lab5.#{exchange}")
    puts "hehe"+message1.to_s+message2.to_s
    # and simply publish message
    x.publish(message1.to_s+"+"+message2.to_s)
  end

  def self.channel
    @channel ||= connection.create_channel
  end

  # We are using default settings here
  # The `Bunny.new(...)` is a place to
  # put any specific RabbitMQ settings
  # like host or port
  def self.connection
    @connection ||= Bunny.new.tap do |c|
      c.start
    end
  end
end