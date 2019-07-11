require_relative "item"
require_relative "aged_brie"
require_relative "backstage"
require_relative "conjured"
require_relative "normal"

ITEM_TYPES = {
  "Aged Brie" => AgedBrie,
  "Backstage passes to a TAFKAL80ETC concert" => Backstage,
  "Conjured Mana Cake" => Conjured,
  "Sulfuras, Hand of Ragnaros" => Item
}

class ItemFactory
  def self.for(name, sell_in, quality)
    item_class = ITEM_TYPES[name] || Normal
    return item_class.new(name, sell_in, quality)
  end
end