export const AGED = 'Aged Brie';
export const BACKSTAGE = 'Backstage passes to a TAFKAL80ETC concert';
export const SULFURAS = 'Sulfuras, Hand of Ragnaros';

// export { AGED, BACKSTAGE, SULFURAS };
export default class Item {
  constructor(name, sellIn, quality) {
    this.name = name;
    this.sellIn = sellIn;
    this.quality = quality;
  }

  modifyQuality(degree) {
    if (degree ==  0) {
      return this.quality -= this.quality
    }
    return this.quality += this.quality
  }
  
  modifySellIn(degree) {
    if (degree ==  0) {
      return this.sellIn -= this.sellIn
    }
    return this.sellIn += degree
  }

  checkNameItem(string) {
    if (this.name == string) {
      return true
    }
    return false
  }

  checkQualityLess(quality) {
    if (this.quality < quality) {
      return true
    }
    return false
  }

  checkQualityMore(quality) {
    if (this.quality > quality) {
      return true
    }
    return false
  }

  checkSellInLess(sellIn) {
    if (this.sellIn < sellIn) {
      return true
    }
    return false
  }

}

export function updateQuality(items) {
  items.forEach(item => {
    if (!item.checkNameItem(AGED) && !item.checkNameItem(BACKSTAGE)) {
      if (item.checkQualityMore(0)) {
        if (!item.checkNameItem(SULFURAS)) {
          item.modifyQuality(-1)
        }
      }
    } else {
      if (item.checkQualityLess(50)) {
        item.modifyQuality(1)
        if (item.checkNameItem(BACKSTAGE)) {
          if (item.checkSellInLess(11)) {
            if (item.checkQualityLess(50)) {
              item.modifyQuality(1)
            }
          }
          if (item.checkSellInLess(6)) {
            if (item.checkQualityLess(50)) {
              item.modifyQuality(1)
            }
          }
        }
      }
    }
    if (!item.checkNameItem(SULFURAS)) {
      item.modifySellIn(-1);
    }
    if (item.checkSellInLess(0)) {
      if (!item.checkNameItem(AGED)) {
        if (!item.checkNameItem(BACKSTAGE)) {
          if (item.checkQualityMore(0)) {
            if (!item.checkNameItem(SULFURAS)) {
              item.modifyQuality(-1)
            }
          }
        } else {
          item.modifyQuality(0)
        }
      } else {
        if (item.checkQualityLess(50)) {
          item.modifyQuality(1)
        }
      }
    }
  });
}

// let Item1= new Item(AGED, 0, 5);
// let Item2= new Item('foo2', 0, 0);
// let Item3= new Item('foo3', 2, 6);
// let items = [Item1, Item2, Item3]; // Array of Item objects
// updateQuality(items);
// console.log(items);