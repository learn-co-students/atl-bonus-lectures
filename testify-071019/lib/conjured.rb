class Conjured < Item
  def tick
    @sell_in -= 1
    @quality -= 2
    @quality -= 2 if @sell_in < 0
  end
end