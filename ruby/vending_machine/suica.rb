# frozen_string_literal: true

# Suica
class Suica
  def initialize
    # 残高
    @deposit = 500
  end

  # チャージする
  def charge(value)
    raise '100円未満はチャージできません' unless validated_charge_value?(value)

    @deposit += value
  end

  # 残高を取得
  def deposit
    @deposit
  end

  # 支払う
  def pay(value)
    @deposit -= value
  end

  private

  # 適正なチャージ金額か検証する
  def validated_charge_value?(value)
    value >= 100
  end

  # 残高の値を変更
  def deposit=(value)
    @deposit = value
  end
end
