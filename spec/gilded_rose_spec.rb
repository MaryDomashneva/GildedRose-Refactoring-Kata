require File.join(File.dirname(__FILE__), '../lib/gilded_rose')
require File.join(File.dirname(__FILE__), '../lib/item')

describe GildedRose do

  describe "#update_quality" do
    it "does not change the name" do
      items = [Item.new("fixme", 0, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].name).to eq "fixme"
    end
  end

end
