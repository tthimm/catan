class Player
  COLORS = {"red" => nil, "blue" => nil, "yellow" => nil, "white" => nil}
  attr_accessor :color
  attr_accessor :name

  def initialize(name)
    self.name = name
    @color = nil
  end

  def color=(col)
    unless @color.nil? then
      COLORS[@color] = nil
      @color = nil
    end
    if COLORS[col].nil? then
      @color = col
      COLORS[col] = true # color used
    else
      raise ColorException, JSON.generate({"error" =>
       "available colors: '#{available_colors}'"})
    end
  end

  def name=(name)
    @name = name[0..20]
  end

  def available_colors
    colors = []
    COLORS.each_pair {|k, v|
     if v.nil? then
       colors << k
     end
    }
    return colors.join(", ")
  end


end

