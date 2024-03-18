# frozen_string_literal: true

require_relative 'name_service'

# プレイヤー
class Player
  include NameService

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
