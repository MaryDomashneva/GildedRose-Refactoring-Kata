require File.join(File.dirname(__FILE__), '../lib/string')
describe String do

  it 'responds to #create_string' do
    expect(subject).to respond_to(:create_string).with(1).argument
  end

end
