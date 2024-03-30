class PriceCheck
  def initialize(prices, target_price)
    @prices = prices
    @target_price = target_price
    @combinations = []
  end

  def call
    allocate_prices(prices, target_price)
    combinations
  end

  def self.call(prices, target_price)
    new(prices, target_price).call
  end

  private

  attr_reader :prices, :target_price, :combinations

  def allocate_prices(prices, target_price, allocated = [])
    current_price = allocated.sum
    @combinations <<  allocated if  current_price == target_price

    return if current_price >= target_price

    prices.map.with_index do |p, i|
      remaining_prices = prices[i..-1]
      allocate_prices(remaining_prices, target_price, allocated + [p])
    end
  end
end
