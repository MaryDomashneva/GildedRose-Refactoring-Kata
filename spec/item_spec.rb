require File.join(File.dirname(__FILE__), '../lib/gilded_rose')

describe Item do
  describe '#initialize' do
    it 'create a correct item' do
      new_item = Item.new('club_mate', 30, 100)
      expect(new_item.name).to eq('club_mate')
      expect(new_item.sell_in).to eq(30)
      expect(new_item.quality).to eq(100)
    end
  end
end
