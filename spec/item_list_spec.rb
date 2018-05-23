require File.join(File.dirname(__FILE__), '../lib/gilded_rose')

describe Itemslist do
  it 'responds to #add_item' do
    expect(subject).to respond_to(:add_item).with(1).argument
  end

  describe '#initialize' do
    it 'create a correct list' do
      new_list = Itemslist.new
      expect(new_list.items_list).to eq([])
    end
  end

  describe '#add_item' do
    it 'ads items to the list' do
      new_item = Item.new('Club_mate', 30, 50)
      expect(subject.add_item(new_item)).to eq([new_item])
    end
  end
end
