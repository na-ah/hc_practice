require_relative 'pokemon'
require_relative 'player'

pika = Pikachu.new('ピカチュウ', 'でんき', '', 100)
puts pika.get_name
pika.change_name('てきせつ')
puts pika.get_name
pika.change_name('うんこ')
puts pika.get_name
pika.attack
puts

zeni = Zenigame.new('ゼニガメ', 'みず', '', 100)
puts zeni.get_name
zeni.attack

puts
player = Player.new('プレイヤー')
puts player.get_name
player.change_name('うんこ')
player.change_name('サトシ')
puts player.get_name
