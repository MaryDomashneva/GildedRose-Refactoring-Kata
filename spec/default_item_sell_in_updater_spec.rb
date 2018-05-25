require File.join(File.dirname(__FILE__), '../lib/gilded_rose')
describe DefaultSellInItemUpdater do
  describe '#udate' do
    let(:normal_item) { Item.new('Club_mate', 30, 50) }
    it 'updates sell in dates' do
      updater = DefaultSellInItemUpdater.new
      expect(updater.update(normal_item)).to equal(29)
    end
  end
end
