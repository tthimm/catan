require 'socket'
require 'rubygems'
require 'json'

class Client
  attr_accessor :session

  def connect
    @session = TCPSocket.open('localhost', 1234)
  end

  def disconnect
    @session.close
  end

  def login_as(name)
    @session.puts JSON.generate({:name => name})
  end

  def set_color_to(col)
    @session.puts JSON.generate({:color => col})
  end


end

client = Client.new
client.connect
client.login_as("player1")
puts JSON.parse(client.session.gets).inspect
client.set_color_to("yellow")
puts JSON.parse(client.session.gets).inspect
client.disconnect

