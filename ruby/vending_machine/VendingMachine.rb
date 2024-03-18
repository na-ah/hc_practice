require_relative 'juice.rb'

class VendingMachine
  def initialize
    @stock = [
        Juice.new('ペプシ', 150),
        Juice.new('ペプシ', 150),
        Juice.new('ペプシ', 150),
        Juice.new('ペプシ', 150),
        Juice.new('ペプシ', 150)
    ]
  end

  def pepsi_stock
    @stock.count
  end
end
