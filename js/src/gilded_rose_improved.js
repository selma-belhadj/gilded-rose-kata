AGED = 'Aged Brie'
BACKSTAGE = 'Backstage passes to a TAFKAL80ETC concert'
SULFURAS = 'Sulfuras, Hand of Ragnaros'

class Item {
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
      items[i].sellIn = items[i].sellIn - 1;
    }
    if (items[i].checkSellInLess(0)) {
      if (!items[i].checkNameItem(AGED)) {
        if (!items[i].checkNameItem(BACKSTAGE)) {
          if (items[i].checkQualityMore(0)) {
            if (!items[i].checkNameItem(SULFURAS)) {
              items[i].modifyQuality(-1)
            }
          }
        } else {
          items[i].modifyQuality(0)
        }
      } else {
        if (items[i].checkQualityLess(50)) {
          items[i].modifyQuality(1)
        }
      }
    }
  });
}
