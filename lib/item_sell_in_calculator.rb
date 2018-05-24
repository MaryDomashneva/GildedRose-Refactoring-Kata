require File.join(File.dirname(__FILE__), './item_categorizer')

# Class counts down sell in days depending on Item Category
class ItemSellInCalculator
  attr_accessor :item_categorizer

  def initialize(item_categorizer = ItemCategorizer.new)
    @item_categorizer = item_categorizer
  end

  def calculate_sell_in_for_item(item)
    item_category = @item_categorizer.categorize(item)
    item_category == ItemCategory::INDEFINITE ? item.sell_in : item.sell_in - 1
  end
end
