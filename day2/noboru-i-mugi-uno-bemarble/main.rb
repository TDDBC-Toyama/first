require_relative './lib/life_game'

def output(b)
  for y in 0..4 do
    line = ''
    for x in 0..4 do
      line += b[y][x]
    end
    puts line
  end
end

b = []
for i in 0..4 do
  b << []
  for j in 0..4 do
    b[i] << '□'
  end
end

b[2][1] = '■'
b[2][2] = '■'
b[2][3] = '■'

output(b)

for times in 0..2
  b = LifeGame.next_generation(b)
  puts "#{times}=========="
  output(b)
end
