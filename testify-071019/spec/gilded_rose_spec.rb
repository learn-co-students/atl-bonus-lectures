require_relative 'spec_helper'

describe "Gilded Rose" do

  it "tick normally advances sell date and reduces quality" do
    rose = GildedRose.new("normal", 10, 10)
    rose.tick
    expect(rose.quality).to eq(9)
    expect(rose.sell_in).to eq(9)
  end

  it "lose an additional quality point if after sell date" do
    rose = GildedRose.new("normal", 0, 10)
    rose.tick
    expect(rose.quality).to eq(8)
    expect(rose.sell_in).to eq(-1)
  end

  it "cannot go below 0 in quality" do
    rose = GildedRose.new("normal", -1, 0)
    rose.tick
    expect(rose.quality).to eq(0)
    expect(rose.sell_in).to eq(-2)
  end

  it "never loses quality or sell_in for Sulfuras" do
    rose = GildedRose.new("Sulfuras, Hand of Ragnaros", 10, 10)
    rose.tick
    expect(rose.quality).to eq(10)
    expect(rose.sell_in).to eq(10)
  end

  it "Aged Brie gains quality when you tick" do
    rose = GildedRose.new("Aged Brie", 10, 10)
    rose.tick
    expect(rose.quality).to eq(11)
    expect(rose.sell_in).to eq(9)
  end

  it "Brie after its sell date gets an extra quality point" do
    rose = GildedRose.new("Aged Brie", 0, 10)
    rose.tick
    expect(rose.quality).to eq(12)
    expect(rose.sell_in).to eq(-1)
  end

  it "caps quality values for Brie at 50" do
    rose = GildedRose.new("Aged Brie", -10, 50)
    rose.tick
    expect(rose.quality).to eq(50)
    expect(rose.sell_in).to eq(-11)
  end

  it "backstage passes get an extra point of quality before the show" do
    rose = GildedRose.new("Backstage passes to a TAFKAL80ETC concert", 10, 10)
    rose.tick
    expect(rose.quality).to eq(12)
    expect(rose.sell_in).to eq(9)
  end

  it "backstage passes are capped at a quality of 50" do
    rose = GildedRose.new("Backstage passes to a TAFKAL80ETC concert", 10, 49)
    rose.tick
    expect(rose.quality).to eq(50)
    expect(rose.sell_in).to eq(9)
  end

  it "backstage passes are worthless after the show" do
    rose = GildedRose.new("Backstage passes to a TAFKAL80ETC concert", 0, 20)
    rose.tick
    expect(rose.quality).to eq(0)
    expect(rose.sell_in).to eq(-1)
  end

end
