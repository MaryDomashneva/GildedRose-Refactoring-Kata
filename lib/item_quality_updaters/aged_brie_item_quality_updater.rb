class AgedBrieItemQualityUpdater
  def update(item)
    item.quality = [item.quality + quality_step(item), 50].min
  end

  private

  def quality_step(item)
    item.sell_in < 0 ? 2 : 1
  end
end
