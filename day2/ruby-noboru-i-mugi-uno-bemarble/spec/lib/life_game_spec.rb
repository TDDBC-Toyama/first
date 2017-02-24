require_relative '../../lib/life_game'

describe LifeGame do
  describe 'count_around' do
    it '全てのセルが死んでいたら、0が返る。' do
      before = [%w(□ □ □),
                %w(□ □ □),
                %w(□ □ □)]
      expect(LifeGame.count_around(before, 1, 1)).to eq 0
    end
    it '左上のセルだけが生きていると、1が返る。' do
      before = [%w(■ □ □),
                %w(□ □ □),
                %w(□ □ □)]
      expect(LifeGame.count_around(before, 1, 1)).to eq 1
    end
    it '上のセルだけが生きていると、1が返る。' do
      before = [%w(□ ■ □),
                %w(□ □ □),
                %w(□ □ □)]
      expect(LifeGame.count_around(before, 1, 1)).to eq 1
    end
    it '右上のセルだけが生きていると、1が返る。' do
      before = [%w(□ □ ■),
                %w(□ □ □),
                %w(□ □ □)]
      expect(LifeGame.count_around(before, 1, 1)).to eq 1
    end
    it '左のセルだけが生きていると、1が返る。' do
      before = [%w(□ □ □),
                %w(■ □ □),
                %w(□ □ □)]
      expect(LifeGame.count_around(before, 1, 1)).to eq 1
    end
    it '右のセルだけが生きていると、1が返る。' do
      before = [%w(□ □ □),
                %w(□ □ ■),
                %w(□ □ □)]
      expect(LifeGame.count_around(before, 1, 1)).to eq 1
    end
    it '左下のセルだけが生きていると、1が返る。' do
      before = [%w(□ □ □),
                %w(□ □ □),
                %w(■ □ □)]
      expect(LifeGame.count_around(before, 1, 1)).to eq 1
    end
    it '下のセルだけが生きていると、1が返る。' do
      before = [%w(□ □ □),
                %w(□ □ □),
                %w(□ ■ □)]
      expect(LifeGame.count_around(before, 1, 1)).to eq 1
    end
    it '右下のセルだけが生きていると、1が返る。' do
      before = [%w(□ □ □),
                %w(□ □ □),
                %w(□ □ ■)]
      expect(LifeGame.count_around(before, 1, 1)).to eq 1
    end
  end

  describe 'next_generation_cell' do
    it '死んでいるセルに隣接する生きたセルが2つであれば、次の世代は誕生しない。' do
      before = [%w(■ ■ □),
                %w(□ □ □),
                %w(□ □ □)]

      expect(LifeGame.next_generation_cell(before, 1, 1)).to eq '□'
    end

    it '死んでいるセルに隣接する生きたセルがちょうど3つあれば、次の世代が誕生する。' do
      before = [%w(■ ■ □),
                %w(■ □ □),
                %w(□ □ □)]

      expect(LifeGame.next_generation_cell(before, 1, 1)).to eq '■'
    end

    it '死んでいるセルに隣接する生きたセルが4つであれば、次の世代は誕生しない。' do
      before = [%w(■ ■ ■),
                %w(■ □ □),
                %w(□ □ □)]

      expect(LifeGame.next_generation_cell(before, 1, 1)).to eq '□'
    end

    it '生きているセルの周りのセルの生存が1つならば過疎で死滅する' do
      before = [%w(■ □ □),
                %w(□ ■ □),
                %w(□ □ □)]

      expect(LifeGame.next_generation_cell(before, 1, 1)).to eq '□'
    end

    it '生きているセルの周りのセルの生存が2つならば生存する' do
      before = [%w(■ □ □),
                %w(□ ■ □),
                %w(□ □ ■)]

      expect(LifeGame.next_generation_cell(before, 1, 1)).to eq '■'
    end

    it '生きているセルの周りのセルの生存が3つならば生存する' do
      before = [%w(■ □ □),
                %w(□ ■ □),
                %w(■ □ ■)]

      expect(LifeGame.next_generation_cell(before, 1, 1)).to eq '■'
    end

    it '生きているセルの周りのセルの生存が4つならば過密で死滅する' do
      before = [%w(■ □ ■),
                %w(□ ■ □),
                %w(■ □ ■)]

      expect(LifeGame.next_generation_cell(before, 1, 1)).to eq '□'
    end
  end

  describe 'next_generation' do
    context 'ブリンカー' do
      it '状態0を与えると状態1になる' do
        turn0 = [%w(□ □ □ □ □),
                 %w(□ □ □ □ □),
                 %w(□ ■ ■ ■ □),
                 %w(□ □ □ □ □),
                 %w(□ □ □ □ □)]

        turn1 = [%w(□ □ □ □ □),
                 %w(□ □ ■ □ □),
                 %w(□ □ ■ □ □),
                 %w(□ □ ■ □ □),
                 %w(□ □ □ □ □)]
        expect(LifeGame.next_generation(turn0)).to eq turn1
      end

      it '状態1を与えると状態0になる' do
        turn0 = [%w(□ □ □ □ □),
                 %w(□ □ □ □ □),
                 %w(□ ■ ■ ■ □),
                 %w(□ □ □ □ □),
                 %w(□ □ □ □ □)]

        turn1 = [%w(□ □ □ □ □),
                 %w(□ □ ■ □ □),
                 %w(□ □ ■ □ □),
                 %w(□ □ ■ □ □),
                 %w(□ □ □ □ □)]
        expect(LifeGame.next_generation(turn1)).to eq turn0
      end
    end

    context 'ヒキガエル' do
      it '状態0を与えると状態1になる' do
        turn0 = [%w(□ □ □ □ □),
                 %w(□ ■ □ □ □),
                 %w(□ ■ ■ □ □),
                 %w(□ ■ ■ □ □),
                 %w(□ □ ■ □ □)]

        turn1 = [%w(□ □ □ □ □),
                 %w(□ ■ ■ □ □),
                 %w(■ □ □ □ □),
                 %w(□ □ □ ■ □),
                 %w(□ ■ ■ □ □)]
        expect(LifeGame.next_generation(turn0)).to eq turn1
      end

      it '状態1を与えると状態0になる' do
        turn0 = [%w(□ □ □ □ □),
                 %w(□ ■ □ □ □),
                 %w(□ ■ ■ □ □),
                 %w(□ ■ ■ □ □),
                 %w(□ □ ■ □ □)]

        turn1 = [%w(□ □ □ □ □),
                 %w(□ ■ ■ □ □),
                 %w(■ □ □ □ □),
                 %w(□ □ □ ■ □),
                 %w(□ ■ ■ □ □)]
        expect(LifeGame.next_generation(turn1)).to eq turn0
      end
    end
  end
end
