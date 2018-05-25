# class for fast quality items
class FastQualityLoserItemQualityUpdater
  def update(item)
    item.quality = [item.quality - quality_step(item), 0].max
  end

  private

  def quality_step(item)
    item.sell_in < 0 ? 4 : 2
  end
end
