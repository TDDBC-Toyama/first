class LifeGame
  class << self
    def next_generation(b)
      b.map.with_index do |row, y|
        row.map.with_index { |_, x| next_generation_cell(b, y, x) }
      end
    end

    def count_around(b, i, j)
      count = 0
      # @TODO リファクタリング
      # [-1, 0, 1].repeated_permutation(2).to_a.each do |hoge|
      #   next if i > b.length
      #   next if hoge[0] == 0 && hoge[1] == 0
      #   count += 1 if b[i + hoge[0]][j + hoge[0]] == '■'
      # end
      count += 1 if b[i - 1][j - 1] == '■'
      count += 1 if b[i - 1][j] == '■'
      count += 1 if b[i - 1][j + 1] == '■'
      count += 1 if b[i][j - 1] == '■'
      count += 1 if b[i][j + 1] == '■'
      count += 1 if i < 4 && b[i + 1][j - 1] == '■'
      count += 1 if i < 4 && b[i + 1][j] == '■'
      count += 1 if i < 4 && b[i + 1][j + 1] == '■'
      count
    end

    def next_generation_cell(b, i, j)
      if b[i][j] == '□'
        # 誕生の場合
        birth(b, i, j)
      else
        # 生存・過疎・過密の場合
        other_birth(b, i, j)
      end
    end

    private

    def birth(b, i, j)
      if count_around(b, i, j) == 3
        '■'
      else
        '□'
      end
    end

    def other_birth(b, i, j)
      count = count_around(b, i, j)
      if count == 2 || count == 3
        '■'
      else
        '□'
      end
    end
  end
end
