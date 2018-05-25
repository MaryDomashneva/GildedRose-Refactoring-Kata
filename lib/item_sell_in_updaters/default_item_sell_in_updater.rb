# class responsible for default sell in update
class DefaultSellInItemUpdater
  def update(item)
    item.sell_in -= 1
  end
end
