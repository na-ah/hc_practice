# frozen_string_literal: true

# パー数ごとのストローク数からスコアを算出するハッシュ
SCORES = {
  3 => {
    1 => 'ホールインワン',
    2 => 'バーディ',
    3 => 'パー'
  },
  4 => {
    1 => 'ホールインワン',
    2 => 'イーグル',
    3 => 'バーディ',
    4 => 'パー'
  },
  5 => {
    1 => 'コンドル',
    2 => 'アルバトロス',
    3 => 'イーグル',
    4 => 'バーディ',
    5 => 'パー'
  }
}.freeze

def input_test_case
  # テストケースを標準入力から受け付け、_parsと_strokeに値の配列を渡して返す
  _pars, _strokes = readlines(chomp: true).map { |line| line.split(',').map(&:to_i) }
end

def calculate_score(par, stroke)
  if stroke > par
    # ボギーの場合
    stroke - par == 1 ? 'ボギー' : "#{stroke - par}ボギー"
  else
    # ボギー以外の場合
    SCORES[par][stroke]
  end
end

def generate_score_list(pars, strokes)
  # 同じインデックスのparとstrokesのスコアを計算
  (0..pars.count - 1).to_a.inject([]) do |result, index|
    result << calculate_score(pars[index], strokes[index])
  end.join(',')
end

pars, strokes = input_test_case
puts generate_score_list(pars, strokes)
