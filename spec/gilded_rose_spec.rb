require File.join(File.dirname(__FILE__), '../lib/gilded_rose')
require File.join(File.dirname(__FILE__), '../lib/item_categories')

describe GildedRose do
  let(:normal_item) { Item.new('Club_mate', 30, 50) }
  let(:ind_item) { Item.new('Sulfuras', 30, 80) }
  let(:back_item) { Item.new('Backstage passes', 30, 50) }
  let(:aged_item) { Item.new('Aged Brie', 30, 50) }
  let(:fast_item) { Item.new('Conjured', 30, 50) }

  describe '#initialize' do
    it 'creates a correct object' do
      new_items = [
        normal_item,
        ind_item,
        back_item,
        aged_item,
        fast_item
      ]
      gildedRose = GildedRose.new(new_items)
      expect(gildedRose.items).to eq(new_items)
    end
  end

  describe '#update_quality' do
    it 'updates quality' do
      new_items = [
        normal_item,
        ind_item,
        back_item,
        aged_item,
        fast_item
      ]
      gildedRose = GildedRose.new(new_items)
      updated_items = gildedRose.update_quality()
      expect(updated_items[0].name).to eq('Club_mate')
      expect(updated_items[0].sell_in).to eq(29)
      expect(updated_items[0].quality).to eq(49)
    end
  end
end
