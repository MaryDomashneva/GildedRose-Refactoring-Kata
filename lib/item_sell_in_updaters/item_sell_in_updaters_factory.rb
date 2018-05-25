require File.join(File.dirname(__FILE__), '../item_categorizer')
require File.join(File.dirname(__FILE__), '/default_item_sell_in_updater')

# class responsible for return updated class with new sell in days
class ItemSellInUpdatersFactory
  ITEM_UPDATERS = {
    ItemCategory::BACKSTAGE_PASS => DefaultSellInItemUpdater,
    ItemCategory::AGED_BRIE => DefaultSellInItemUpdater,
    ItemCategory::FAST_QUALITY_LOSER => DefaultSellInItemUpdater,
    ItemCategory::NORMAL => DefaultSellInItemUpdater
  }.freeze

  def self.get_item_updater(item, item_categorizer = ItemCategorizer.new)
    updater_class = ITEM_UPDATERS[item_categorizer.categorize(item)]
    updater_class.nil? ? nil : updater_class.new
  end
end
