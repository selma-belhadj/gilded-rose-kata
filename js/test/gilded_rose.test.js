// import update_quality from '../src/gilded_rose';
import Item from '../src/gilded_rose';

describe("Item", function() {
  let items = [];
  it("should foo", function() {
    items = [ new Item("foo", 0, 0) ];
    expect(items[0].name).toEqual("foo");
  });

  it("should foo", function() {
    items = [ new Item("foo", 0, 0) ];
    expect(items[0].sell_in).toEqual(0);
  });

  it("should foo", function() {
    items = [ new Item("foo", 0, 0) ];
    expect(items[0].quality).toEqual(0);
  });

});

// describe("update_quality", function() {
//   let Item1= new Item('foo1', 0, 0);
//   let Item2= new Item('foo2', 0, 0);
//   let Item3= new Item('foo3', 0, 0);
//   let items = [Item1, Item2, Item3]; 

//   it("should foo", function() {
//     // items = [ new Item("foo", 0, 0) ];
//     update_quality();
//     expect(items[0].name).toEqual("fixme");
//   });
// });
