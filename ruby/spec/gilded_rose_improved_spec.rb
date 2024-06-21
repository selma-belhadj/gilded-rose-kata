require File.join(File.dirname(__FILE__), '../gilded_rose_improved')
require File.join(File.dirname(__FILE__), 'gilded_rose_common_tests')

puts "--------------- Refactored Code -----------------"

describe "GildedRose #length of items" do
    items = [
        Item.new(name="+5 Dexterity Vest", sell_in=10, quality=20),
        Item.new(name="Aged Brie", sell_in=2, quality=0),
        Item.new(name="Elixir of the Mongoose", sell_in=5, quality=7),
        Item.new(name="Sulfuras, Hand of Ragnaros", sell_in=0, quality=80),
        Item.new(name="Sulfuras, Hand of Ragnaros", sell_in=-1, quality=80),
        Item.new(name="Backstage passes to a TAFKAL80ETC concert", sell_in=15, quality=20),
        Item.new(name="Backstage passes to a TAFKAL80ETC concert", sell_in=10, quality=49),
        Item.new(name="Backstage passes to a TAFKAL80ETC concert", sell_in=5, quality=49),
        # This Conjured item does not work properly yet
        Item.new(name="Conjured Mana Cake", sell_in=3, quality=6), # <-- :O
    ]

    gilded_rose = GildedRose.new items
    it 'should have items' do
        expect(gilded_rose.items).to eq items
    end

    it 'should have items length' do
        expect(gilded_rose.items.length).to eq 9
    end
end
