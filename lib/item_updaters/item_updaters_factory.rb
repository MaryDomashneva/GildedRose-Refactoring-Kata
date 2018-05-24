require File.join(File.dirname(__FILE__), '../item_categorizer')

class ItemUpdatersFactory

  ITEM_UPDATERS = {
    ItemCategory::BACKSTAGE_PASS => BackstagePassItemUpdater,
    ItemCategory::AGED_BRIE => AgedBrieItemUpdater,
    ItemCategory::INDEFINITE => IndefiniteItemUpdater,
    ItemCategory::FAST_QUALITY_LOSER => FastQualityLoserItemUpdater,
    ItemCategory::NORMAL => NormalItemUpdater,
  }

  def self.get_item_updater(item, item_categorizer = ItemCategorizer.new)
    ITEM_UPDATERS[item_categorizer.categorize(item)]
  end
end
