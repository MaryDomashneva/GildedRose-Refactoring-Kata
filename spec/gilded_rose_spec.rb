require File.join(File.dirname(__FILE__), '../lib/gilded_rose')

describe GildedRose do

  describe '#initialize' do
    it 'create a correct odject' do
      gilden_rose = GildedRose.new
      expect(gilden_rose.list.items_list).to eq([])
    end
  end

  describe '#indefinite?' do
    context 'when item is indefinite' do
      it 'returns true' do
        new_item = Item.new('Sulfuras', 30, 80)
        expect(subject.indefinite?(new_item)).to eq true
      end
    end

    context 'when item is definite' do
      it 'returns false' do
        new_item = Item.new('Club_mate', 30, 50)
        expect(subject.indefinite?(new_item)).to eq false
      end
    end
  end
end
