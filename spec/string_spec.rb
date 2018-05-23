require File.join(File.dirname(__FILE__), '../lib/string')
describe String do

  it 'responds to #create_string' do
    expect(subject).to respond_to(:create_string).with(1).argument
  end

  it 'creats a string' do
    new_item = Item.new('Club_mate', 30, 50)
    expect(subject.create_string(new_item)).to eq("Club_mate, 30, 50")
  end

end
