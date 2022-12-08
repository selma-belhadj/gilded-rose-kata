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

}



let items = []

export function updateQuality() {
  for (let i = 0; i < items.length; i++) {
    if (!items[i].checkNameItem(AGED) && !items[i].checkNameItem(BACKSTAGE)) {
      if (items[i].quality > 0) {
        if (!items[i].checkNameItem(SULFURAS)) {
          items[i].modifyQuality(-1)
        }
      }
    } else {
      if (items[i].quality < 50) {
        items[i].modifyQuality(1)
        if (items[i].checkNameItem(BACKSTAGE)) {
          if (items[i].sellIn < 11) {
            if (items[i].quality < 50) {
              items[i].modifyQuality(1)
            }
          }
          if (items[i].sellIn < 6) {
            if (items[i].quality < 50) {
              items[i].modifyQuality(1)
            }
          }
        }
      }
    }
    if (!items[i].checkNameItem(SULFURAS)) {
      items[i].sellIn = items[i].sellIn - 1;
    }
    if (items[i].sellIn < 0) {
      if (!items[i].checkNameItem(AGED)) {
        if (!items[i].checkNameItem(BACKSTAGE)) {
          if (items[i].quality > 0) {
            if (!items[i].checkNameItem(SULFURAS)) {
              items[i].modifyQuality(-1)
            }
          }
        } else {
          items[i].modifyQuality(0)
        }
      } else {
        if (items[i].quality < 50) {
          items[i].modifyQuality(1)
        }
      }
    }
  }
}
