require File.join(File.dirname(__FILE__), './item_quality_multiplier')
require File.join(File.dirname(__FILE__), './item_categorizer')
require File.join(File.dirname(__FILE__), './item_quality_change_step')

# Returns new quality of item
class ItemQualityCalculator
  attr_accessor :quality_multiplier, :quality_change_step, :item_categorizer

  QUALITY_LIMIT_INDEFINITE = 80
  QUALITY_HIGH_LIMIT = 50
  QUALITY_LOW_LIMIT = 0

  def initialize(
    quality_multiplier = ItemQualityMultiplier.new,
    quality_change_step = ItemQualityChangeStep.new,
    item_categorizer = ItemCategorizer.new
  )
    @quality_multiplier = quality_multiplier
    @quality_change_step = quality_change_step
    @item_categorizer = item_categorizer
  end

  def calculate_quality_for_item(item)
    item_category = @item_categorizer.categorize(item)
    return QUALITY_LOW_LIMIT if low_limit_quality?(item.sell_in, item_category)
    return QUALITY_LIMIT_INDEFINITE if item_category == ItemCategory::INDEFINITE

    quaility_step = @quality_change_step.quality_step_for_item(item)
    quaility_step_multiplier = @quality_multiplier.multiplier_for_item(item)
    new_quality = item.quality + quaility_step * quaility_step_multiplier
    [[new_quality, QUALITY_HIGH_LIMIT].min, QUALITY_LOW_LIMIT].max
  end

  private

  def low_limit_quality?(sell_in, item_category)
    item_category == ItemCategory::BACKSTAGE_PASS && sell_in <= 0
  end
end
