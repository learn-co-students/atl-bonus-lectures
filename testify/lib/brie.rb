class Brie < Item
  def tick
    @sell_in -= 1
    @quality += 1
    @quality += 1 if @sell_in <= 0
    @quality = 50 if @quality > 50
  end
end