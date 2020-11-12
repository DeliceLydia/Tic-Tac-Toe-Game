require_relative '../lib/player'
require_relative '../lib/board'

describe Player do
  it 'creates a new Player instance' do
    player = Player.new('John', '●')
    expect(player.name).to eql('John')
    expect(player.symbol).to eql('●')
  end

  describe '#switched_player' do
    let(:player_one) { Player.new('John', '●') }
    let(:player_two) { Player.new('Jane', '■') }
    let(:current_player) { player_one }

    it 'switches player when current_player is self' do
      switched = current_player.switched_player(current_player, player_two)
      expect(switched).to eql(player_two)
    end

    it 'doesn\'t switch when current_player is NOT self' do
      switched = player_two.switched_player(player_two, current_player)
      expect(switched).to eql(current_player)
    end
  end
end

describe Board do
    let(:board_game) { Board.new() }
    let(:combination) {
        [
          [1, 2, 3],[4, 5, 6],[7, 8, 9]
          [1, 4, 7],[2, 5, 8],[3, 6, 9]
          [1, 5, 9],[7, 5, 3]
        ] 
    }
    describe "#initialize" do
    it 'create a new board' do
        expect(board_game.board).to eql([1, 2, 3, 4, 5, 6, 7, 8, 9])
    end
  end
    
  describe "#draw" do
    it 'should return false if all board elements are numeric' do
      expect(board_game.draw?).to be(false)
    end

    it 'should return true when all board elements are not numeric' do
        board_game.board = ['●','■']
        expect(board_game.draw?).to be(true)
    end
end

    describe "#win" do
    it 'should return true if any element has a combination of one symbol' do
        expect(combination.win?).to be(false)
    end
end
end