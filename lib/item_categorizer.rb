require File.join(File.dirname(__FILE__), './item_categories')

# Class returns the category of Item by name
class ItemCategorizer
  def categorize(item)
    return ItemCategory::BACKSTAGE_PASS if backstage_pass?(item)
    return ItemCategory::AGED_BRIE if aged_brie?(item)
    return ItemCategory::INDEFINITE if indefinite?(item)
    return ItemCategory::FAST_QUALITY_LOSER if fast_quality_loser?(item)
    ItemCategory::NORMAL
  end

  private

  def indefinite?(item)
    item.name.include? 'Sulfuras'
  end

  def aged_brie?(item)
    item.name == 'Aged Brie'
  end

  def fast_quality_loser?(item)
    item.name == 'Conjured'
  end

  def backstage_pass?(item)
    item.name.include? 'Backstage passes'
  end
end
