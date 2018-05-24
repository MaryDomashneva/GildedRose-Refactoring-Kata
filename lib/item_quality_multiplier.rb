require File.join(File.dirname(__FILE__), './item_categorizer')

class ItemQualityMultiplier

  DEFAULT_MULTIPLIER = -1

  def initialize(item_categorizer = ItemCategorizer.new)
    @item_categorizer = item_categorizer
  end

  def multiplier_for_item(item)
    item_category = @item_categorizer.categorize(item)
    multiplier = DEFAULT_MULTIPLIER
    multiplier = -multiplier if (item_category == ItemCategory::AGED_BRIE || item_category == ItemCategory::BACKSTAGE_PASS)
    multiplier *= 2 if item.sell_in <= 0
    multiplier *= 2 if item_category == ItemCategory::FAST_QUALITY_LOSER
    multiplier
  end

end
