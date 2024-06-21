require File.join(File.dirname(__FILE__), '../item')

describe Item do

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

    puts "------- Before Update ----------"
    puts "name, sellIn, quality"
    items.each do |item|
        puts item
    end
    puts "--------------------------------"

    days = 3
    puts "------- After Update of 3 days ----------"
    (0...days).each do |day|
        puts "-------- day #{day} ---------"
        puts "name, sellIn, quality"
        items.each do |item|
            item.update_quality_item
            puts item
        end
        puts ""
    end

###############################
  
    it "does not change the name" do
        expect(items[0].name).to eq "+5 Dexterity Vest"
        expect(items[1].name).to eq "Aged Brie"
        expect(items[2].name).to eq "Elixir of the Mongoose"
        expect(items[3].name).to eq "Sulfuras, Hand of Ragnaros"
        expect(items[4].name).to eq "Sulfuras, Hand of Ragnaros"
        expect(items[5].name).to eq "Backstage passes to a TAFKAL80ETC concert"
        expect(items[6].name).to eq "Backstage passes to a TAFKAL80ETC concert"
        expect(items[7].name).to eq "Backstage passes to a TAFKAL80ETC concert"
        expect(items[8].name).to eq "Conjured Mana Cake"
    end

    it "change the sell_in" do
        expect(items[0].sell_in).to eq 7
        expect(items[1].sell_in).to eq -1
        expect(items[2].sell_in).to eq 2
        expect(items[5].sell_in).to eq 12
        expect(items[6].sell_in).to eq 7
        expect(items[7].sell_in).to eq 2
        expect(items[8].sell_in).to eq 0
    end

    it "does not change the sell_in of Sulfuras" do
        expect(items[3].sell_in).to eq 0
        expect(items[4].sell_in).to eq -1
    end

    it "change the quality" do
        expect(items[0].quality).to eq 17
        expect(items[1].quality).to eq 4
        expect(items[2].quality).to eq 4
        expect(items[5].quality).to eq 23
        expect(items[6].quality).to eq 50
        expect(items[7].quality).to eq 50
        expect(items[8].quality).to eq 3
      end

    it "does not change the quality of Sulfuras" do
        expect(items[3].quality).to eq 80
        expect(items[4].quality).to eq 80
    end

###############################

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
        item.update_quality_item
        expect(item.quality).to eq 1
    end
    
    it 'should update sell_in of item' do
        item = Item.new('foo', 3, 2)
        item.update_quality_item
        expect(item.sell_in).to eq 2
    end

    it 'should update quality of item' do

    end
end