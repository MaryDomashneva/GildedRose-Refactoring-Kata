require File.join(File.dirname(__FILE__), '/item')
require File.join(File.dirname(__FILE__), '/item_quality_calculator')
require File.join(File.dirname(__FILE__), '/item_sell_in_calculator')

class GildedRose
  attr_accessor :items, :item_quality_calculator, :item_sell_in_calculator

  def initialize(items)
    @items = items
    @item_quality_calculator = ItemQualityCalculator.new
    @item_sell_in_calculator = ItemSellInCalculator.new
  end

  def update_quality()
    @items.each do |item|
      item.quality = @item_quality_calculator.calculate_quality_for_item(item)
      item.sell_in = @item_sell_in_calculator.calculate_sell_in_for_item(item)
    end
  end
end
