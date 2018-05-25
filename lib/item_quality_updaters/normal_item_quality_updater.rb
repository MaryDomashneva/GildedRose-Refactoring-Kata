# class for normal items
class NormalItemQualityUpdater
  def update(item)
    item.quality = [item.quality - quality_step(item), 0].max
  end

  private

  def quality_step(item)
    item.sell_in < 0 ? 2 : 1
  end
end
