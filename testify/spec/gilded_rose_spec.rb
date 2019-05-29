require_relative 'spec_helper'

describe "Gilded Rose" do

  it "should be able to tick a gilded rose" do
    # given a gilded rose
    rose = GildedRose.new("example", 20, 30)
    # when i tick
    rose.tick
    # then i expect quality and sell_in to go down by one
    expect(rose.sell_in).to eq(19)
    expect(rose.quality).to eq(29)
  end

  it "should decreate quality by two on the sell date" do
    rose = GildedRose.new("example", 0, 10)
    rose.tick
    expect(rose.quality).to eq(8)
    expect(rose.sell_in).to eq(-1)
  end

  it "should decrease quality by two after the sell date" do
    rose = GildedRose.new("example", -1, 10)
    rose.tick
    expect(rose.quality).to eq(8)
    expect(rose.sell_in).to eq(-2)
  end

  it "should never reach negative quality" do
    rose = GildedRose.new("example", 20, 0)
    rose.tick
    expect(rose.quality).to eq(0)
    expect(rose.sell_in).to eq(19)
  end

  it "should lose two quality after the sell by date if it isn't brie" do
    rose = GildedRose.new("example", 0, 12)
    rose.tick
    expect(rose.quality).to eq(10)
    expect(rose.sell_in).to eq(-1)
  end

  it "should increase quality of aged brie when we tick" do
    rose = GildedRose.new("Aged Brie", 20, 30)
    rose.tick
    expect(rose.quality).to eq(31)
    expect(rose.sell_in).to eq(19)
  end

  it "should increase the quality of aged brie after the sell date" do
    rose = GildedRose.new("Aged Brie", 0,  10)
    rose.tick
    expect(rose.quality).to eq(12)
    expect(rose.sell_in).to eq(-1)
  end

  it "should cap quality for brie at 50" do
    rose = GildedRose.new("Aged Brie", 20, 50)
    rose.tick
    expect(rose.quality).to eq(50)
    expect(rose.sell_in).to eq(19)
  end

  it "should cap quality for brie at 50 even after the sell date" do
    rose = GildedRose.new("Aged Brie", -1, 49)
    rose.tick
    expect(rose.quality).to eq(50)
    expect(rose.sell_in).to eq(-2)
  end

  it "should increase quality for backstage passes" do
    rose = GildedRose.new("Backstage passes to a TAFKAL80ETC concert", 20, 30)
    rose.tick
    expect(rose.quality).to eq(31)
    expect(rose.sell_in).to eq(19)
  end

  it "should bump quality by 2 when sell_in is 10 or less for backstage passes" do
    rose = GildedRose.new("Backstage passes to a TAFKAL80ETC concert", 10, 20)
    rose.tick
    expect(rose.quality).to eq(22)
    expect(rose.sell_in).to eq(9)
  end

  it "should bump quality by 3 for passes when sell_in is 5 or less" do
    rose = GildedRose.new("Backstage passes to a TAFKAL80ETC concert", 5, 20)
    rose.tick
    expect(rose.quality).to eq(23)
    expect(rose.sell_in).to eq(4)
  end

  it "should not modify sulfuras, hand of ragnaros for any reason" do
    rose = GildedRose.new("Sulfuras, Hand of Ragnaros", 20, 30)
    rose.tick
    expect(rose.quality).to eq(30)
    expect(rose.sell_in).to eq(20)
  end
  
  it "should cap quality for passes at 50" do
    rose = GildedRose.new("Backstage passes to a TAFKAL80ETC concert", 20, 50)
    rose.tick
    expect(rose.quality).to eq(50)
    expect(rose.sell_in).to eq(19)
  end

  it "should set quality to zero for passes after their sell date" do
    rose = GildedRose.new("Backstage passes to a TAFKAL80ETC concert", 0, 40)
    rose.tick
    expect(rose.quality).to eq(0)
    expect(rose.sell_in).to eq(-1)
  end

  xit "should lower quality by 2 for conjured mana cake" do
    rose = GildedRose.new("Conjured Mana Cake", 5, 10)
    rose.tick
    expect(rose.quality).to eq(8)
    expect(rose.sell_in).to eq(4)
  end

  xit "should limit mana cake to a minimum quality of zero" do
    rose = GildedRose.new("Conjured Mana Cake", 5, 0)
    rose.tick
    expect(rose.quality).to eq(10)
    expect(rose.sell_in).to eq(4)
  end

  xit "should drop quality by 4 on the sell date for mana cake" do
    rose = GildedRose.new("Conjured Mana Cake", 0, 10)
    rose.tick
    expect(rose.quality).to eq(6)
    expect(rose.sell_in).to eq(-1)
  end

  xit "should drop quality by 4 after the sell date for mana cake" do
    rose = GildedRose.new("Conjured Mana Cake", -1, 10)
    rose.tick
    expect(rose.quality).to eq(6)
    expect(rose.sell_in).to eq(-2)
  end

end
