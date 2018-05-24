class BackstagePassItemUpdater
  def update(item)
    item.quality = 0 if low_limit_quality?(item)
    item.quality = [item.quality + quality_step(item), 50].min
  end

  private

  def low_limit_quality?(item)
    item.sell_in < 0
  end

  def quality_step(item)
    return 0 if item.sell_in < 0
    return 3 if item.sell_in < 5
    return 2 if item.sell_in < 10
    1
  end

end
