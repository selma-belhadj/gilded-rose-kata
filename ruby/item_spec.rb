require_relative 'item'
require_relative 'gilded_rose_improved.rb'

# items = [
#     Item.new(name="+5 Dexterity Vest", sell_in=10, quality=20),
#     Item.new(name="Aged Brie", sell_in=2, quality=0),
#     Item.new(name="Elixir of the Mongoose", sell_in=5, quality=7),
#     Item.new(name="Sulfuras, Hand of Ragnaros", sell_in=0, quality=80),
#     Item.new(name="Sulfuras, Hand of Ragnaros", sell_in=-1, quality=80),
#     Item.new(name="Backstage passes to a TAFKAL80ETC concert", sell_in=15, quality=20),
#     Item.new(name="Backstage passes to a TAFKAL80ETC concert", sell_in=10, quality=49),
#     Item.new(name="Backstage passes to a TAFKAL80ETC concert", sell_in=5, quality=49),
#     # This Conjured item does not work properly yet
#     Item.new(name="Conjured Mana Cake", sell_in=3, quality=6), # <-- :O
# ]

describe Item do
    it 'should have a name' do
        item = Item.new('foo', 0, 0)
        expect(item.name).to eq 'foo'    
    end

    it 'should have a sell_in' do
        item = Item.new('foo', 0, 0)
        expect(item.sell_in).to eq 0
    end

    it 'should have a quality' do
        item = Item.new('foo', 0, 0)
        expect(item.quality).to eq 0
    end  
end

describe ModifyItem do
    it 'should modify quality by increasing it' do
        item = Item.new('foo', 0, 0)
        item.modify_quality(1)
        expect(item.quality).to eq 1
    end

    it 'should modify quality by decreasing it' do
        item = Item.new('foo', 0, 3)
        item.modify_quality(-1)
        expect(item.quality).to eq 2 
    end

    it 'should modify quality by setting it to 0' do
        item = Item.new('foo', 0, 3)
        item.modify_quality(0)
        expect(item.quality).to eq 0
    end

    it 'should modify sell_in by increasing it' do
        item = Item.new('foo', 0, 0)
        item.modify_sell_in(1)
        expect(item.sell_in).to eq 1
    end

    it 'should modify sell_in by decreasing it' do
        item = Item.new('foo', 3, 0)
        item.modify_sell_in(-1)
        expect(item.sell_in).to eq 2
    end

    it 'should modify sell_in by setting it to 0' do
        item = Item.new('foo', 3, 0)
        item.modify_sell_in(0)
        expect(item.sell_in).to eq 0
    end
end

describe UpdateItem do
    it 'should update quality of item' do
        item = Item.new('foo', 3, 2)
        item.update_quality_item
        expect(item.quality).to eq 1
    end

    it 'should update sell_in of item' do
        item = Item.new('foo', 3, 2)
        item.update_quality_item
        expect(item.sell_in).to eq 2
    end
    
    it 'should update quality of item' do
        item = Item.new('foo', 3, 2)
        update_quality_item(item)
        expect(item.quality).to eq 1
    end
    
    it 'should update sell_in of item' do
        item = Item.new('foo', 3, 2)
        update_quality_item(item)
        expect(item.sell_in).to eq 2
    end
end