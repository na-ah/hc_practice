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

  def stock_list
    "ペプシが#{@stock.count}本あります"
  end
end
