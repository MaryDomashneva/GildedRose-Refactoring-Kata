require File.join(File.dirname(__FILE__), '../lib/item_categorizer')
require File.join(File.dirname(__FILE__), '../lib/item_quality_calculator')

describe ItemQualityCalculator do
  let(:categorizer) { ItemCategorizer.new }
  let(:quality_multiplier) { ItemQualityMultiplier.new(categorizer) }
  let(:quality_change_step) { ItemQualityChangeStep.new((categorizer))}
  let(:normal_item) { Item.new('Club_mate', 30, 50) }
  let(:ind_item) { Item.new('Sulfuras', 30, 80) }
  let(:low_limit_item) { Item.new('Backstage passes', -1, 50) }

  describe '#initialize' do
    it 'returns right object' do
      quality_calculator = ItemQualityCalculator.new(quality_multiplier, quality_change_step, categorizer)
      expect(quality_calculator.quality_multiplier).to eq(quality_multiplier)
      expect(quality_calculator.quality_change_step).to eq(quality_change_step)
      expect(quality_calculator.item_categorizer).to eq(categorizer)
    end
  end

  describe '#calculate_quality_for_item' do
    let(:quality_calculator) { ItemQualityCalculator.new(quality_multiplier, quality_change_step, categorizer) }

    context 'for low limit item' do
      it 'returns right quality' do
        expect(quality_calculator.calculate_quality_for_item(low_limit_item)).to eq(0)
      end
    end

    context 'for indefinite item' do
      it 'returns right quality' do
        expect(quality_calculator.calculate_quality_for_item(ind_item)).to eq(80)
      end
    end

    context 'for normal item' do
      it 'returns right quality' do
        expect(quality_calculator.calculate_quality_for_item(normal_item)).to eq(49)
      end
    end
  end
end
