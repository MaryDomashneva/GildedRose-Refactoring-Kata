require File.join(File.dirname(__FILE__), '../lib/item_categorizer')
require File.join(File.dirname(__FILE__), '../lib/item_categories')

describe ItemCategorizer do
  describe '#categorize' do
    let(:categorizer) { ItemCategorizer.new }
    let(:normal_item) { Item.new('Club_mate', 30, 50) }
    let(:ind_item) { Item.new('Sulfuras', 30, 80) }
    let(:back_item) { Item.new('Backstage passes', 30, 50) }
    let(:aged_item) { Item.new('Aged Brie', 30, 50) }
    let(:fast_item) { Item.new('Conjured', 30, 50) }


    it 'returns right category for backstage_pass items' do
      expect(categorizer.categorize(back_item)).to eq(ItemCategory::BACKSTAGE_PASS)
    end

    it 'returns right category for aged_brie items' do
      expect(categorizer.categorize(aged_item)).to eq(ItemCategory::AGED_BRIE)
    end

    it 'returns right category for indefinite items' do
      expect(categorizer.categorize(ind_item)).to eq(ItemCategory::INDEFINITE)
    end

    it 'returns right category for fast_quality_loser items' do
      expect(categorizer.categorize(fast_item)).to eq(ItemCategory::FAST_QUALITY_LOSER)
    end

    it 'returns right category for normal items' do
      expect(categorizer.categorize(normal_item)).to eq(ItemCategory::NORMAL)
    end
  end
end
