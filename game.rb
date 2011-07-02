class Game
  attr_reader :players

  def initialize
    @players = []
  end

  def name_already_taken?(name)
    return @players.length > 0 && @players.map(&:name).include?(name)
  end

  def create_player(name)
    if @players.length < 4 && !name_already_taken?(name) then
      player = Player.new(name)
      @players << player
      return player
    else
      raise MaxPlayersException, JSON.generate({"error" =>
       "max players reached"})
      raise NameException, JSON.generate({"error" =>
       "name already taken'"}) if name_already_taken?(name)
    end
  end


end

