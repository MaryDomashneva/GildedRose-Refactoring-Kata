require File.join(File.dirname(__FILE__), '../lib/gilded_rose')
class String

  def create_string(item = Item.new)
    "#{item.name}, #{item.sell_in}, #{item.quality}"
  end
end
