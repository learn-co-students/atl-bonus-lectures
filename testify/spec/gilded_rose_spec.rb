require_relative 'spec_helper'

describe "Gilded Rose" do
  it "should be able to tick a gilded rose" do
    # given a gilded rose
    rose = GildedRose.new("example", 20, 30)
    # when i tick
    rose.tick
    # then i expect to see something
    expect(rose.sell_in).to eq(19)
    expect(rose.quality).to eq(29)
  end

  it "should increase quality of aged brie when we tick" do
    rose = GildedRose.new("Aged Brie", 20, 30)
    rose.tick
    expect(rose.quality).to eq(31)
  end

  it "should increase quality for backstage passes" do
    rose = GildedRose.new("Backstage passes to a TAFKAL80ETC concert", 20, 30)
    rose.tick
    expect(rose.quality).to eq(31)
  end

  it "should never reach negative quality" do
    rose = GildedRose.new("example", 20, 0)
    rose.tick
    expect(rose.quality).to eq(0)
  end

  it "should do something special when sell_in is 10 or less" do
  end

  it "should do something special when sell_in is 5 or less" do
  end
end
