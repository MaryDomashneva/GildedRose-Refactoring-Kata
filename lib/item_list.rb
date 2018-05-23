require File.join(File.dirname(__FILE__), '../lib/gilded_rose')

class Item_list
  attr_accessor :item_list

  def initialize(item_list = [])
    @item_list = item_list
  end

  def add_item(item)
    @item_list << item
  end
end
