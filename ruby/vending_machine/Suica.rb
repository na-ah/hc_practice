class Suica
  def initialize()
    @deposit = 500
  end

  def charge(value)
    raise '100円未満はチャージできません' unless validated_charge_value?(value)
    @deposit += value
  end

  def deposit
    @deposit
  end

  def pay(value)
    raise '残高が足りません' if deposit < value
    @deposit -= value
  end

  private

  def validated_charge_value?(value)
    value >= 100
  end
end
