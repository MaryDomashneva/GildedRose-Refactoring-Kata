require File.join(File.dirname(__FILE__), '../lib/gilded_rose')

describe GildedRose do

  describe '#initialize' do
    it 'create a correct odject' do
      gilden_rose = GildedRose.new
      expect(gilden_rose.list.items_list).to eq([])
    end
  end

  # describe '#indefinite?' do
  #   context 'when item is indefinite' do
  #     it 'returns true' do
  #       new_item = Item.new('Sulfuras', 30, 80)
  #       expect(subject.indefinite?(new_item)).to eq true
  #     end
  #   end
  #
  #   context 'when item is definite' do
  #     it 'returns false' do
  #       new_item = Item.new('Club_mate', 30, 50)
  #       expect(subject.indefinite?(new_item)).to eq false
  #     end
  #   end
  # end
  #
  # describe '#legendary?' do
  #   context 'when item is legendary' do
  #     it 'returns true' do
  #       new_item = Item.new('Backstage passes', 30, 50)
  #       expect(subject.legendary?(new_item)).to eq true
  #     end
  #   end
  #
  #   context 'when item is not legendary' do
  #     it 'returns false' do
  #       new_item = Item.new('Club_mate', 30, 50)
  #       expect(subject.legendary?(new_item)).to eq false
  #     end
  #   end
  # end
  #
  # describe '#still_sell_in?' do
  #   context 'when item is still in line with estimated storage days' do
  #     it 'returns true' do
  #       new_item = Item.new('Backstage passes', 30, 50)
  #       expect(subject.legendary?(new_item)).to eq true
  #     end
  #   end
  #
  #   context 'when item is not anymore in line with estimated storage days' do
  #     it 'returns false' do
  #       new_item = Item.new('Club_mate', 0, 50)
  #       expect(subject.legendary?(new_item)).to eq false
  #     end
  #   end
  # end
  #
  # describe '#decrease_quality' do
  #   it 'decrease quality by 1' do
  #     new_item = Item.new('Club_mate', 30, 50)
  #     subject.decrease_quality(new_item)
  #     expect(new_item.quality).to eq(49)
  #   end
  # end
  #
  # describe '#double_decrease_quality' do
  #   it 'decrease quality by 2' do
  #     new_item = Item.new('Club_mate', 30, 50)
  #     subject.double_decrease_quality(new_item)
  #     expect(new_item.quality).to eq(48)
  #   end
  # end
  #
  # describe '#decrease_sell_in' do
  #   it 'decrease sell_in by 1' do
  #     new_item = Item.new('Club_mate', 30, 50)
  #     subject.decrease_sell_in(new_item)
  #     expect(new_item.sell_in).to eq(29)
  #   end
  # end
  #
  # describe '#sell_in_time_line_one' do
  #   context 'when item in first sell in time line' do
  #     it 'returns true' do
  #       new_item = Item.new('Club_mate', 8, 50)
  #       expect(subject.sell_in_time_line_one?(new_item)).to eq true
  #     end
  #   end
  #
  #   context 'when item not in first sell in time line' do
  #     it 'returns false' do
  #       new_item = Item.new('Club_mate', 3, 50)
  #       expect(subject.sell_in_time_line_one?(new_item)).to eq false
  #     end
  #   end
  # end
end
