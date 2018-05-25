class MainFactory
  def update(item)
    item_sell_in_updater = ItemSellInUpdatersFactory.get_item_updater(item)
    item_sell_in_updater.update(item) unless item_sell_in_updater.nil?

    item_quality_updater = ItemQualityUpdatersFactory.get_item_updater(item)
    item_quality_updater.update(item) unless item_quality_updater.nil?
  end
end
