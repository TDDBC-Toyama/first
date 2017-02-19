class LifeGame
  def init
    5.times.inject([]) {|row|
      row << 5.times.inject([]) {|col|
        col << '□'
      }
    }
  end

  def main
    b = init
    b[2][1] = '■'
    b[2][2] = '■'
    b[2][3] = '■'

    for i in 0..4 do
      line = ''
      for j in 0..4 do
        line += b[i][j]
      end
      puts line
    end

    for times in 0..2
      bb = next_generation(b)
      b = bb
      puts "#{times}=========="
      for i in 0..4 do
        line = ''
        for j in 0..4 do
          line += b[i][j]
        end
        puts line
      end
    end
  end

  def next_generation(b)
    bb = [[],[],[],[],[]]
    5.times do |i|
      5.times do |j|
        if b[i][j] == '□'
          # 誕生の場合
          count = around_alive_count(b, i, j)
          if count >= 3
            bb[i][j] = '■'
          else
            bb[i][j] = '□'
          end
        end
        if b[i][j] == '■'
          # 生存・過疎・過密の場合
          count = around_alive_count(b, i, j)

          if count == 2
            bb[i][j] = '■'
          else
            bb[i][j] = '□'
          end
        end
      end
    end
    bb
  end

  def around_alive_count(b, i, j)
    count = 0
    if b[i-1][j-1] == '■'; count += 1 end
    if b[i-1][j] == '■'; count += 1 end
    if b[i-1][j+1] == '■'; count += 1 end
    if b[i][j-1] == '■'; count += 1 end
    if b[i][j+1] == '■'; count += 1 end
    if i < 4 && b[i+1][j-1] == '■'; count += 1 end
    if i < 4 && b[i+1][j] == '■'; count += 1 end
    if i < 4 && b[i+1][j+1] == '■'; count += 1 end
    count
  end
end
