require_relative '../life_game'
require 'byebug'

describe LifeGame do
  describe '#init' do
    it do
      expect(LifeGame.new.init).to eq(
        [
          ['□', '□', '□', '□', '□'],
          ['□', '□', '□', '□', '□'],
          ['□', '□', '□', '□', '□'],
          ['□', '□', '□', '□', '□'],
          ['□', '□', '□', '□', '□']
        ]
      )
    end
  end

  describe '#next_generation' do
    it do
      expect(
        LifeGame.new.next_generation(
          [
            ['□', '□', '□', '□', '□'],
            ['□', '□', '□', '□', '□'],
            ['□', '■', '■', '■', '□'],
            ['□', '□', '□', '□', '□'],
            ['□', '□', '□', '□', '□']
          ]
        )
      ).to eq(
        [
          ['□', '□', '□', '□', '□'],
          ['□', '□', '■', '□', '□'],
          ['□', '□', '■', '□', '□'],
          ['□', '□', '■', '□', '□'],
          ['□', '□', '□', '□', '□']
        ]
      )
    end
    it do
      expect(
        LifeGame.new.next_generation(
          [
            ['□', '□', '□', '□', '□'],
            ['□', '□', '■', '□', '□'],
            ['□', '□', '■', '□', '□'],
            ['□', '□', '■', '□', '□'],
            ['□', '□', '□', '□', '□']
          ]
        )
      ).to eq(
        [
          ['□', '□', '□', '□', '□'],
          ['□', '□', '□', '□', '□'],
          ['□', '■', '■', '■', '□'],
          ['□', '□', '□', '□', '□'],
          ['□', '□', '□', '□', '□']
        ]
      )
    end
  end

  describe '#around_alive_count' do
    let(:life_game) { LifeGame.new }
    let(:board) {
      [
        ['□', '□', '□'],
        ['□', '□', '□'],
        ['□', '□', '□']
      ]
    }

    it do
      expect(life_game.around_alive_count(board, 1, 1)).to eq 0
    end

    it do
      board[0][0] = '■'
      expect(life_game.around_alive_count(board, 1, 1)).to eq 1
    end

    it do
      black_board = board.map {|row| row.map { '■' } }
      expect(life_game.around_alive_count(black_board, 1, 1)).to eq 8
    end

    it do
      black_board = board.map {|row| row.map { '■' } }
      expect(life_game.around_alive_count(black_board, 2, 0)).to eq 3
    end

    it do
      black_board = board.map {|row| row.map { '■' } }
      expect(life_game.around_alive_count(black_board, 0, 0)).to eq 3
    end

    it do
      black_board = board.map {|row| row.map { '■' } }
      expect(life_game.around_alive_count(black_board, 2, 2)).to eq 3
    end
  end
end
