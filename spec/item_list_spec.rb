require File.join(File.dirname(__FILE__), '../lib/gilded_rose')

describe Item_list do
  it 'responds to #add_item' do
    expect(subject).to respond_to(:add_item).with(1).argument
  end

  describe '#initialize' do
    it 'create a correct list' do
      new_list = Item_list.new
      expect(new_list.item_list).to eq([])
    end
  end

  describe '#add_item' do
    it 'ads items to the list' do
      new_item = Item.new('club_mate', 30, 100)
      expect(subject.add_item(new_item)).to eq([new_item])
    end
  end
end
