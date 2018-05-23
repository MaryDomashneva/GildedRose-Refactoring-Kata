require File.join(File.dirname(__FILE__), '/item')
require File.join(File.dirname(__FILE__), '/string')
require File.join(File.dirname(__FILE__), '/items_list')

class GildedRose
attr_accessor :list

  def initialize(list = Itemslist.new)
    @list = list
  end

  def update_quality()
    @items.each do |item|
      if item.name != "Aged Brie" and item.name != "Backstage passes to a TAFKAL80ETC concert"
        if item.quality > 0
          if item.name != "Sulfuras, Hand of Ragnaros"
            item.quality = item.quality - 1
          end
        end
      else
        if item.quality < 50
          item.quality = item.quality + 1
          if item.name == "Backstage passes to a TAFKAL80ETC concert"
            if item.sell_in < 11
              if item.quality < 50
                item.quality = item.quality + 1
              end
            end
            if item.sell_in < 6
              if item.quality < 50
                item.quality = item.quality + 1
              end
            end
          end
        end
      end
      if item.name != "Sulfuras, Hand of Ragnaros"
        item.sell_in = item.sell_in - 1
      end
      if item.sell_in < 0
        if item.name != "Aged Brie"
          if item.name != "Backstage passes to a TAFKAL80ETC concert"
            if item.quality > 0
              if item.name != "Sulfuras, Hand of Ragnaros"
                item.quality = item.quality - 1
              end
            end
          else
            item.quality = item.quality - item.quality
          end
        else
          if item.quality < 50
            item.quality = item.quality + 1
          end
        end
      end
    end
  end

  private

  def indefinite?(item)
    item.name == 'Sulfuras'
  end

  def legendary?(item)
    item.name == 'Backstage passes' or item.name == 'Aged Brie'
  end

  def still_sell_in?(item)
    item.sell_in > 0
  end

  def riched_quality_limit?(item)
    item.quality >= 50
  end

  def sell_in_time_line_one?(item)
    5 < item.sell_in && item.sell_in<= 10
  end

  def sell_in_time_line_two?(item)
    0 < item.sell_in && item.sell_in<= 5
  end

  def decrease_quality(item)
    item.quality -= 1
  end

  def double_decrease_quality(item)
    item.quality -= 2
  end

  def decrease_sell_in(item)
    item.sell_in -=1
  end
end
