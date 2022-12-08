AGED = 'Aged Brie'
BACKSTAGE = 'Backstage passes to a TAFKAL80ETC concert'
SULFURAS = 'Sulfuras, Hand of Ragnaros'

function Item(name, sellIn, quality) {
  this.name = name;
  this.sellIn = sellIn;
  this.quality = quality;
}

function modifyQuality(degree) {
  if (degree ==  0) {
    return this.quality -= this.quality
  }
  return this.quality += this.quality
}

function modifySellIn(degree) {
  if (degree ==  0) {
    return this.sellIn -= this.sellIn
  }
  return this.sellIn += degree
}

let items = []

export function updateQuality() {
  for (let i = 0; i < items.length; i++) {
    if (items[i].name != 'Aged Brie' && items[i].name != BACKSTAGE) {
      if (items[i].quality > 0) {
        if (items[i].name != SULFURAS) {
          items[i].quality = modifyQuality(-1)
        }
      }
    } else {
      if (items[i].quality < 50) {
        items[i].quality = modifyQuality(1)
        if (items[i].name == BACKSTAGE) {
          if (items[i].sellIn < 11) {
            if (items[i].quality < 50) {
              items[i].quality = modifyQuality(1)
            }
          }
          if (items[i].sellIn < 6) {
            if (items[i].quality < 50) {
              items[i].quality = modifyQuality(1)
            }
          }
        }
      }
    }
    if (items[i].name != SULFURAS) {
      items[i].sellIn = items[i].sellIn - 1;
    }
    if (items[i].sellIn < 0) {
      if (items[i].name != 'Aged Brie') {
        if (items[i].name != BACKSTAGE) {
          if (items[i].quality > 0) {
            if (items[i].name != SULFURAS) {
              items[i].quality = modifyQuality(-1)
            }
          }
        } else {
          items[i].quality = modifyQuality(0)
        }
      } else {
        if (items[i].quality < 50) {
          items[i].quality = modifyQuality(1)
        }
      }
    }
  }
}
