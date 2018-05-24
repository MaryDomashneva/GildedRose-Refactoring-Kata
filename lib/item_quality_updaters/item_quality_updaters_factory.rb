require File.join(File.dirname(__FILE__), '../item_categorizer')
require File.join(File.dirname(__FILE__), './backstage_pass_item_quality_updater')
require File.join(File.dirname(__FILE__), './aged_brie_item_quality_updater')
require File.join(File.dirname(__FILE__), './fast_quality_loser_item_quality_updater')
require File.join(File.dirname(__FILE__), './normal_item_quality_updater')

class ItemQualityUpdatersFactory

  ITEM_UPDATERS = {
    ItemCategory::BACKSTAGE_PASS => BackstagePassItemUpdater,
    ItemCategory::AGED_BRIE => AgedBrieItemQualityUpdater,
    ItemCategory::FAST_QUALITY_LOSER => FastQualityLoserItemQualityUpdater,
    ItemCategory::NORMAL => NormalItemQualityUpdater,
  }

  def self.get_item_updater(item, item_categorizer = ItemCategorizer.new)
    updater_class = ITEM_UPDATERS[item_categorizer.categorize(item)]
    updater_class.nil? ? nil : updater_class.new
  end
end
