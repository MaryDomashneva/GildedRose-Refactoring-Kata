require File.join(File.dirname(__FILE__), '../lib/item')

describe Item do
  describe '#initialize' do
    it 'create a correct item' do
      new_item = Item.new('Club_mate', 30, 50)
      expect(new_item.name).to eq('Club_mate')
      expect(new_item.sell_in).to eq(30)
      expect(new_item.quality).to eq(50)
    end
  end

  describe '#to_s' do
    it 'produces a string' do
      new_item = Item.new('Club_mate', 30, 50)
      expect(new_item.to_s()).to eq('Club_mate, 30, 50')
    end
  end
end
