require File.join(File.dirname(__FILE__), '../lib/gilded_rose')

describe GildedRose do

  describe '#initialize' do
    it 'create a correct odject' do
      gilden_rose = GildedRose.new
      expect(gilden_rose.list.items_list).to eq([])
    end
  end

  describe '#update_quality' do
    it 'updates a list' do
      club_mate = Item.new('Club_mate', 30, 50)
      sulfurans = Item.new('Sulfuras', 30, 80)
      backstage = Item.new('Backstage passes', 30, 30)
      bri = Item.new('Aged Brie', 30, 30)
      conjurd = Item.new('Conjured', 30, 30)

      club_mate_u = Item.new('Club_mate', 29, 49)
      sulfurans_u = Item.new('Sulfuras', 29, 80)
      backstage_u = Item.new('Backstage passes', 29, 31)
      bri_u = Item.new('Aged Brie', 29, 31)
      conjurd_u = Item.new('Conjured', 29, 28)

      provided_list = [
        club_mate,
        sulfurans,
        backstage,
        bri,
        conjurd
      ]

      expected_list = [
        club_mate_u,
        sulfurans_u,
        backstage_u,
        bri_u,
        conjurd_u
      ]

      given_list = Itemslist.new(provided_list)

      gilden_rose = GildedRose.new(given_list)
      gilden_rose.update_quality()
      expect(gilden_rose.list.items_list).to eq(expected_list)
    end
  end
end
