import updateQuality from '../src/gilded_rose_improved';
import Item from '../src/gilded_rose_improved';
import { AGED, BACKSTAGE, SULFURAS } from '../src/gilded_rose_improved';


describe("Item", function() {
  let items = [];
  it("should foo", function() {
    items = [ new Item("foo", 0, 0) ];
    expect(items[0].name).toEqual("foo");
  });

  it("should foo", function() {
    items = [ new Item("foo", 0, 0) ];
    expect(items[0].sellIn).toEqual(0);
  });

  it("should foo", function() {
    items = [ new Item("foo", 0, 0) ];
    expect(items[0].quality).toEqual(0);
  });

});

describe("updateQuality", function() {
  let Item1= new Item('foo1', 0, 0);
  let Item2= new Item('foo2', 2, 0);
  let Item3= new Item('foo3', 0, 3);
  let Item4= new Item(AGED, 2, 4);

  let items = [Item1, Item2, Item3, Item4]; 
  new updateQuality(items);

  it("should foo name ", function() {
    expect(items[0].name).toEqual("foo1");
  });

  it("should foo sellIn", function() {
    expect(items[1].sellIn).toEqual(1);
  });

  it("should foo quality", function() {
    expect(items[2].quality).toEqual(12);
  });

  it("should AGED name ", function() {
    expect(items[3].name).toEqual(AGED);
  });
  
});
