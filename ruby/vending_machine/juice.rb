# frozen_string_literal: true

# ジュース
class Juice
  def initialize(name, price)
    # 名前
    @name = name
    # 値段
    @price = price
  end

  # 名前を取得
  def name
    @name
  end

  # 値段を取得
  def price
    @price
  end

  private

  # 名前を変更
  def name=(name)
    @name = name
  end

  # 値段を変更
  def price=(price)
    @price = price
  end
end
