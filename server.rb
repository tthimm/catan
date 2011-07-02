require 'environment'

@game = Game.new
host = 'localhost'
port = 1234
server = TCPServer.new(host, port)

def parse_input_for(key)
  input = JSON.parse(@session.gets)
  if input.has_key?(key) then
    return input[key]
  else
    return false
  end
end

while (@session = server.accept) do
  Thread.start do
    begin
      player = @game.create_player(parse_input_for("name"))
      @session.puts JSON.generate({:player => :created})
      player.color = parse_input_for("color")
      @session.puts JSON.generate({:color => :ok})
    rescue Exception => e
      @session.puts e.message
    end
  end
end

