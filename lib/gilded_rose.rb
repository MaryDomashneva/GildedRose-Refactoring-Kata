require File.join(File.dirname(__FILE__), '/item')
require File.join(File.dirname(__FILE__), './item_quality_updaters/item_quality_updaters_factory')
require File.join(File.dirname(__FILE__), './item_sell_in_updaters/item_sell_in_updaters_factory')

# Class responsible for Items quality update
class GildedRose
  attr_accessor :items

  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each do |item|
      item_sell_in_updater = ItemSellInUpdatersFactory.get_item_updater(item)
      item_sell_in_updater.update(item) unless item_sell_in_updater.nil?

      item_quality_updater = ItemQualityUpdatersFactory.get_item_updater(item)
      item_quality_updater.update(item) unless item_quality_updater.nil?
    end
  end
end
