require File.join(File.dirname(__FILE__), '../lib/gilded_rose')
require File.join(File.dirname(__FILE__), '../lib/item_categories')

describe GildedRose do

  describe '#initialize' do
    it 'create a correct odject' do
      new_item = Item.new('Club_mate', 30, 50)
      gilden_rose = GildedRose.new(new_item)
      expect(gilden_rose.items).to eq(new_item)
    end
  end

  describe '#update_quality' do

  end
end
