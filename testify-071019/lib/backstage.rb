class Backstage < Item  
  def tick
    @sell_in -= 1
    @quality += 1
    @quality += 1 if @sell_in < 10
    @quality = 50 if @quality > 50
    @quality = 0 if @sell_in < 0
  end
end