require_relative './item'
require_relative './brie'
require_relative './backstage'
require_relative './conjured'
require_relative './normal'

class GildedRose
  def self.for(name, sell_in, quality)
    items = {
      'Aged Brie' => Brie,
      'Backstage passes to a TAFKAL80ETC concert' => Backstage,
      'Sulfuras, Hand of Ragnaros' => Item,
      'Conjured Mana Cake' => Conjured
    }
    item_class = items[name] || Normal
    item_class.new(name, sell_in, quality)
  end
end