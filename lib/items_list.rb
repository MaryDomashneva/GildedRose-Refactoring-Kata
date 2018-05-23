require File.join(File.dirname(__FILE__), '../lib/gilded_rose')

class Itemslist
  attr_accessor :items_list

  def initialize(items_list = [])
    @items_list = items_list
  end

  def add_item(item)
    @items_list << item
  end
end
