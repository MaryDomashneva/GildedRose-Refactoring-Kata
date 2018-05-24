require File.join(File.dirname(__FILE__), '/item')
require File.join(File.dirname(__FILE__), '/item_quality_calculator')
require File.join(File.dirname(__FILE__), '/item_sell_in_calculator')

# Class responsible for Items quality update
class GildedRose
  attr_accessor :items, :item_quality_calculator, :item_sell_in_calculator
  ITEMS = {
    'brie' => ItemCategory::Brie,
    ItemCategory::AGED_BRIE
    ItemCategory::INDEFINITE
    ItemCategory::FAST_QUALITY_LOSER
    ItemCategory::NORMAL
  }
  def initialize(items)
    @items = items
    @item_quality_calculator = ItemQualityCalculator.new
    @item_sell_in_calculator = ItemSellInCalculator.new
  end

  def update_quality
    @items.each do |item|
      ItemUpdatersFactory.get_item_updater(item).update(item)
      # ITEMS[item.name].new(item).update_quality
      # item.quality = @item_quality_calculator.calculate_quality_for_item(item)
      # item.sell_in = @item_sell_in_calculator.calculate_sell_in_for_item(item)
    end
  end
end


class MaryItemBrie

  def update_quality
  end

  private

  def calc_sell_in
  end

  def quality
  end
end
