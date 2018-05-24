require File.join(File.dirname(__FILE__), './item_categorizer')

class ItemQualityChangeStep

  def initialize(item_categorizer = ItemCategorizer.new)
    @item_categorizer = item_categorizer
  end

  def quality_step_for_item(item)
    item_category = @item_categorizer.categorize(item)
    return 1 if has_default_quality_step?(item_category)

    step_method = "quality_step_for_#{item_category}_item".to_sym
    send(step_method, item)
  end

  private

  def quality_step_for_backstage_pass_item(item)
    return 0 if item.sell_in < 0
    return 3 if item.sell_in <= 5
    return 2 if item.sell_in <= 10
    return 1
  end

  def quality_step_for_indefinite_item(item)
    return 0
  end

  def has_default_quality_step?(item_category)
    item_category == ItemCategory::AGED_BRIE ||
    item_category == ItemCategory::FAST_QUALITY_LOSER ||
    item_category == ItemCategory::NORMAL
  end

end
