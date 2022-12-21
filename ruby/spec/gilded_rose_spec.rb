require File.join(File.dirname(__FILE__), '../gilded_rose')
require File.join(File.dirname(__FILE__), 'gilded_rose_common_tests')

puts "--------------- Original Code -----------------"


describe Item do
  it "should have a name" do
    item = Item.new("foo", 0, 0)
    expect(item.name).to eq "foo"
  end

  it "should have a sell_in" do
    item = Item.new("foo", 0, 0)
    expect(item.sell_in).to eq 0
  end

  it "should have a quality" do
    item = Item.new("foo", 0, 0)
    expect(item.quality).to eq 0
  end

  it "should have a to_s method" do
    item = Item.new("foo", 0, 0)
    expect(item.to_s).to eq "foo, 0, 0"
  end
end