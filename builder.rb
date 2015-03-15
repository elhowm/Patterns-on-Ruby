#!/home/kris/.rvm/wrappers/ruby-2.2.0/ruby

class Wear
  attr_accessor :head, :body, :legs, :foot
end

class WearBuilder
  attr_accessor :wear

  def what_to_wear
    p "on head: #{@wear.head}; on body: #{@wear.body}; on legs: #{@wear.legs}; on foot: #{@wear.foot}"
  end

  def get_wear
    @wear = Wear.new
  end
end

class WinterWearBuilder < WearBuilder
  def initialize
    get_wear
    @wear.head, @wear.body, @wear.legs, @wear.foot = 'Winter hat', 'Sweater, coat', 'Warm pants', 'Boots'
  end
end

class SummerWearBuilder < WearBuilder
  def initialize
    get_wear
    @wear.head, @wear.body, @wear.legs, @wear.foot = 'Cap', 'T-shirt', 'Shorts', 'Sandals'
  end
end

class Wardrobe
  def set_seaon_builder(season_builder)
    @builder = season_builder
  end

  def what_to_wear
    @builder.what_to_wear unless @builder.nil?
  end
end

p 'IN WINTER:'
builder = WinterWearBuilder.new
wardrobe = Wardrobe.new
wardrobe.set_seaon_builder(builder)
wardrobe.what_to_wear

p 'IN SUMMER:'
builder = SummerWearBuilder.new
wardrobe.set_seaon_builder(builder)
wardrobe.what_to_wear
