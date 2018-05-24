require File.join(File.dirname(__FILE__), '../lib/gilded_rose')

class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name = 'default', sell_in = 0, quality = 0)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s()
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end
