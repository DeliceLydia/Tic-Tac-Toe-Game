require_relative '../lib/player'

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
