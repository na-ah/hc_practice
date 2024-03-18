# frozen_string_literal: true

require_relative 'name_service'

# ポケモンの抽象クラス
class Pokemon
  include NameService
  attr_reader :type1, :type2, :hp, :mp

  def initialize(name, type1, type2, hp)
    @name = name
    @type1 = type1
    @type2 = type2
    @hp = hp
  end

  def attack
    puts "#{get_name}のこうげき！"
  end

  def change_name(new_name)
    if new_name == 'うんこ'
      puts '不適切な名前です'
      return
    end

    @name = new_name
  end

  def get_name
    @name
  end
end

# ピカチュウ
class Pikachu < Pokemon
  def attack
    super
    puts "#{get_name}の10万ボルト!"
  end
end

# ゼニガメ
class Zenigame < Pokemon
  def attack
    super
    puts "#{get_name}のみずでっぽう!"
  end
end
