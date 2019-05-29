class GildedRose
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def tick
    if name == 'Aged Brie'
      return brie_tick
    elsif name == 'Backstage passes to a TAFKAL80ETC concert'
      return backstage_tick
    elsif name == 'Sulfuras, Hand of Ragnaros'
      return sulfuras_tick
    elsif name == "Conjured Mana Cake"
      return conjured_tick
    else
      normal_tick
    end
  end

  def normal_tick
    @sell_in -= 1
    @quality -= 1
    @quality -= 1 if @sell_in <= 0
    @quality = 0 if @quality < 0
  end

  def brie_tick
    @sell_in -= 1
    @quality += 1
    @quality += 1 if @sell_in <= 0
    @quality = 50 if @quality > 50
  end

  def backstage_tick
    @sell_in -= 1
    @quality += 1
    @quality += 1 if @sell_in <= 10
    @quality += 1 if @sell_in <= 5
    @quality = 50 if @quality > 50
    @quality = 0 if @sell_in < 0
  end

  def sulfuras_tick
  end

  def conjured_tick
    @sell_in -= 1
    @quality -= 2
    @quality -= 2 if @sell_in <= 0
    @quality = 0 if @quality < 0
  end
end