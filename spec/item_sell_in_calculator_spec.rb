require File.join(File.dirname(__FILE__), '../lib/item_sell_in_calculator')
require File.join(File.dirname(__FILE__), '../lib/item_categories')

describe ItemSellInCalculator do

  let(:new_item_categorizer) { ItemCategorizer.new }
  let(:new_item) { Item.new('Club_mate', 30, 50) }
  let(:ind_item) { Item.new('Sulfuras', 30, 80) }


  describe '#initialize' do
    it 'initialized with right categorizer' do
      # new_item_categorizer = ItemCategorizer.new
      # new_item = Item.new('Club_mate', 30, 50)
      sell_in_calculator = ItemSellInCalculator.new(new_item_categorizer)
      expect(sell_in_calculator.item_categorizer).to eq(new_item_categorizer)
    end
  end

  describe '#calculate_sell_in_for_item' do
    let(:sell_in_calculator) { ItemSellInCalculator.new(new_item_categorizer) }

    it 'counts down sell in days for not INDEFINITE items' do
      expect(sell_in_calculator.calculate_sell_in_for_item(new_item)).to eq(29)
    end

    it 'returns not changed sell in days for INDEFINITE items' do
      expect(sell_in_calculator.calculate_sell_in_for_item(ind_item)).to eq(30)
    end
  end
end
