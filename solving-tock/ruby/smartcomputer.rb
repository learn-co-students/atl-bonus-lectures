class SmartComputer
  attr_reader :name, :piece

  def initialize(name="Wintermute", piece="O")
    @name = name
    @piece = piece
  end

  def opponent
    piece == "X" ? "O" : "X"
  end

  def almost_dead?(board)
    opponent_indexes = board.indexes_for(opponent)
    counter_move = nil
    danger = board.wins.any? do |indexes|
      shared = opponent_indexes.to_set & indexes.to_set
      if shared.size == 2
        counter_move = indexes.to_set - opponent_indexes.to_set
      end
    end
    danger ? counter_move.to_a.first + 1 : false
  end

  def get_move(board)
    avoid_death = almost_dead?(board)
    if avoid_death
      avoid_death
    elsif board.legal_moves.include?(5)
      5
    else
      board.legal_moves.sample
    end
  end
end