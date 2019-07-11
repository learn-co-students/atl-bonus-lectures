class Normal < Item
  def tick
    @sell_in -= 1
    @quality -= 1
    @quality -= 1 if @sell_in < 0
    @quality = 0 if @quality < 0
  end
end