# frozen_string_literal: true

require_relative 'Suica'
require_relative 'Juice'

# 自動販売機
class VendingMachine
  def initialize
    @stock = [
      Juice.new('ペプシ', 150),
      Juice.new('ペプシ', 150),
      Juice.new('ペプシ', 150),
      Juice.new('ペプシ', 150),
      Juice.new('ペプシ', 150)
    ]
    @sales = 0
  end

  def pepsi_stock
    @stock.count
  end

  def can_buy_pepsi?
    @stock.count.positive?
  end

  def buy_pepsi(suica)
    raise 'ペプシの在庫がありません' if pepsi_stock.zero?
    raise 'Suicaの残高が足りません' if suica.deposit < 150

    reduce_stock
    increase_sales(150)
    reduce_suica(suica, 150)
  end

  def sales
    @sales
  end

  private

  def reduce_stock
    @stock.pop
  end

  def increase_sales(value)
    @sales += value
  end

  def reduce_suica(suica, value)
    suica.pay(value)
  end
end
