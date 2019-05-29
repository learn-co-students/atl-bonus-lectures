class GildedRose
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def tick
    if name == 'example'
      return example_tick
    elsif name == 'Aged Brie'
      return brie_tick
    elsif name == 'Backstage passes to a TAFKAL80ETC concert'
      return backstage_tick
    elsif name == 'Sulfuras, Hand of Ragnaros'
      return sulfuras_tick
    end
    if @name != "Aged Brie" and @name != "Backstage passes to a TAFKAL80ETC concert"
      if @quality > 0
        if @name != "Sulfuras, Hand of Ragnaros"
          @quality = @quality - 1
        end
      end
    else
      if @quality < 50
        @quality = @quality + 1
        if @name == "Backstage passes to a TAFKAL80ETC concert"
          if @sell_in < 11
            if @quality < 50
              @quality = @quality + 1
            end
          end
          if @sell_in < 6
            if @quality < 50
              @quality = @quality + 1
            end
          end
        end
      end
    end
    if @name != "Sulfuras, Hand of Ragnaros"
      @sell_in = @sell_in - 1
    end
    if @sell_in < 0
      if @name != "Aged Brie"
        if @name != "Backstage passes to a TAFKAL80ETC concert"
          if @quality > 0
            if @name != "Sulfuras, Hand of Ragnaros"
              @quality = @quality - 1
            end
          end
        else
          @quality = @quality - @quality
        end
      else
        if @quality < 50
          @quality = @quality + 1
        end
      end
    end
  end

  def example_tick
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
end