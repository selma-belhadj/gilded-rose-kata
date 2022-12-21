describe "#update_quality" do
  it "does not change the name" do
    items = [Item.new("foo", 0, 0)]
    GildedRose.new(items).update_quality()
    expect(items[0].name).to eq "foo"
    expect(items[0].sell_in).to eq -1
    expect(items[0].quality).to eq 0
  end

  it "change the sell_in" do
    items = [Item.new("foo", 0, 0)]
    GildedRose.new(items).update_quality()
    expect(items[0].sell_in).to eq -1
  end

  it "does not change the quality" do
    items = [Item.new("foo", 0, 0)]
    GildedRose.new(items).update_quality()
    expect(items[0].quality).to eq 0
  end
end

describe "GildedRose #update_quality cases" do
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
      puts "------- Before Update ----------"
      puts "name, sellIn, quality"
      items.each do |item|
        puts item
      end
      puts "--------------------------------"

      days = 3
      puts "------- After Update of 3 days ----------"
      (0...days).each do |day|
        gilded_rose.update_quality
        puts "-------- day #{day} ---------"
        puts "name, sellIn, quality"
        items.each do |item|
          puts item
        end
        puts ""
      end

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

end