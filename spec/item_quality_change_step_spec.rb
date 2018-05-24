require File.join(File.dirname(__FILE__), '../lib/item_categorizer')
require File.join(File.dirname(__FILE__), '../lib/item_quality_change_step')

describe ItemQualityChangeStep do
  let(:categorizer) { ItemCategorizer.new }

  describe '#initialize' do
    it 'returns right object' do
      step = ItemQualityChangeStep.new(categorizer)
      expect(step.item_categorizer).to eq(categorizer)
    end
  end

  describe '#quality_step_for_item' do
    let(:step) { ItemQualityChangeStep.new(categorizer) }
    let(:ind_item) { Item.new('Sulfuras', 30, 80) }
    let(:backstage_item_1) { Item.new('Backstage passes', -1, 50) }
    let(:backstage_item_2) { Item.new('Backstage passes', 5, 50) }
    let(:backstage_item_3) { Item.new('Backstage passes', 10, 50) }
    let(:backstage_item_4) { Item.new('Backstage passes', 30, 50) }
    let(:def_q_item) { Item.new('Aged Brie', 30, 50) }

    it 'returns right step for indefinite items' do
      expect(step.quality_step_for_item(ind_item)).to eq(0)
    end

    it 'returns right step for default quality items' do
      expect(step.quality_step_for_item(def_q_item)).to eq(1)
    end

    context 'when backstage item has < 0 sel_in days' do
      it 'returns 0' do
        expect(step.quality_step_for_item(backstage_item_1)).to eq(0)
      end
    end

    context 'when backstage item has <= 5 sel_in days' do
      it 'returns 3' do
        expect(step.quality_step_for_item(backstage_item_2)).to eq(3)
      end
    end

    context 'when backstage item has <= 10 sel_in days' do
      it 'returns 3' do
        expect(step.quality_step_for_item(backstage_item_3)).to eq(2)
      end
    end

    context 'when backstage item has > 10 sel_in days' do
      it 'returns 1' do
        expect(step.quality_step_for_item(backstage_item_4)).to eq(1)
      end
    end
  end
end
