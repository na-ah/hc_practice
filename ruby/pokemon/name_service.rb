# frozen_string_literal: true

# 名前の取得と変更をするためのインターフェース
module NameService
  def change_name(new_name)
    raise NotImplementedError, 'Subclasses must implement change_name'
  end

  def get_name
    raise NotImplementedError, 'Subclasses must implement get_name'
  end
end
