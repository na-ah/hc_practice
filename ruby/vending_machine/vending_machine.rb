# frozen_string_literal: true

require_relative 'Suica'
require_relative 'Juice'

# 自動販売機
class VendingMachine
  def initialize
    # 在庫
    @stock = {
      'ペプシ' => [
        Juice.new('ペプシ', 150),
        Juice.new('ペプシ', 150),
        Juice.new('ペプシ', 150),
        Juice.new('ペプシ', 150),
        Juice.new('ペプシ', 150)
      ],
      'モンスター' => [
        Juice.new('モンスター', 230),
        Juice.new('モンスター', 230),
        Juice.new('モンスター', 230),
        Juice.new('モンスター', 230),
        Juice.new('モンスター', 230)
      ],
      'いろはす' => [
        Juice.new('いろはす', 120),
        Juice.new('いろはす', 120),
        Juice.new('いろはす', 120),
        Juice.new('いろはす', 120),
        Juice.new('いろはす', 120)
      ]
    }
    # 売上
    @sales = 0
  end

  # ジュースの在庫数を取得
  def juice_stock_count(juice_name)
    @stock[juice_name].count
  end

  # 購入可能なジュースのリストを取得
  def available_juice_list
    @stock.inject([]) do |result, (juice_name, juice_stocks)|
      juice_stocks.count.positive? ? result << juice_name : result
    end
  end

  # ジュースの在庫を補充
  def restock(juice_name, juice)
    @stock[juice_name] << juice
  end

  # ジュースを購入
  def buy(suica, juice_name)
    raise "#{juice_name}の在庫がありません" if juice_stock_count(juice_name).zero?

    juice_price = @stock[juice_name][0].price
    raise 'Suicaの残高が足りません' if suica.deposit < juice_price

    reduce_stock(juice_name)
    increase_sales(juice_price)
    reduce_suica(suica, juice_price)
  end

  # 売上を取得
  def sales
    @sales
  end

  private

  # 在庫を減らす
  def reduce_stock(juice_name)
    @stock[juice_name].shift
  end

  # 売上を増やす
  def increase_sales(value)
    @sales += value
  end

  # Suica残高を減らす
  def reduce_suica(suica, value)
    suica.pay(value)
  end

  # 売上の値を変更する
  def sales=(value)
    @sales = value
  end
end
