require File.join(File.dirname(__FILE__), '../lib/item_categorizer')
require File.join(File.dirname(__FILE__), '../lib/item_quality_multiplier')

describe ItemQualityMultiplier do
  let(:categorizer) { ItemCategorizer.new }
  let(:normal_item) { Item.new('Club_mate', -2, 50) }
  let(:ind_item) { Item.new('Sulfuras', 30, 80) }
  let(:aged_item) { Item.new('Aged Brie', 30, 50) }
  let(:fast_item) { Item.new('Conjured', 30, 50) }

  describe '#initialize' do
    it 'returns right object' do
      multiplair = ItemQualityMultiplier.new(categorizer)
      expect(multiplair.item_categorizer).to eq(categorizer)
    end
  end

  describe '#multiplier_for_item' do
    let(:multiplair) { ItemQualityMultiplier.new(categorizer) }

    it 'returns right multiplier for Aged Brie' do
      expect(multiplair.multiplier_for_item(aged_item)).to eq(1)
    end

    it 'returns right multiplier for Sulfuras' do
      expect(multiplair.multiplier_for_item(ind_item)).to eq(-1)
    end

    it 'returns right multiplier for Fast Quality Loser' do
      expect(multiplair.multiplier_for_item(fast_item)).to eq(-2)
    end
    it 'returns right multiplier after sell in day' do
      expect(multiplair.multiplier_for_item(normal_item)).to eq(-2)
    end
  end
end
