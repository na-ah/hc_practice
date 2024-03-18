require_relative 'pokemon'
require_relative 'player'

pika = Pikachu.new('ピカチュウ', 'でんき', '', 100)
pika.change_name('てきせつ')
pika.change_name('うんこ')
puts pika.get_name
pika.attack

puts pika.get_name
puts

zeni = Zenigame.new('ゼニガメ', 'みず', '', 100)
puts zeni.get_name
zeni.attack
