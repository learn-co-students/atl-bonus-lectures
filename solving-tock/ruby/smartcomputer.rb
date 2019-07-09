class SmartComputer
  attr_reader :name, :piece

  def initialize(name="Wintermute", piece="O")
    @name = name
    @piece = piece
  end

  def opponent
    piece == "X" ? "O" : "X"
  end

  def find_risk(board)
    player_indexes = board.indexes_for(piece)
    opponent_indexes = board.indexes_for(opponent)
    risk = board.wins.find do |indexes|
      opponent_overlap = opponent_indexes.to_set & indexes.to_set
      player_overlap = player_indexes.to_set & indexes.to_set
      opponent_overlap.size == 2 && player_overlap.size.zero?
    end
  end

  def almost_dead?(board)
    risk = find_risk(board)
    if risk
      free_set = risk.to_set - board.indexes_for(opponent).to_set
      free_set.to_a.first + 1
    else
      false
    end
  end

  def open_center?(board)
    board.legal_moves.include?(5)
  end

  def open_corners?(board)
    (board.legal_moves.to_set & [1,3,7,9].to_set).size.positive?
  end

  def get_move(board)
    avoid_death = almost_dead?(board)
    if avoid_death
      avoid_death
    elsif open_center?(board)
      5
    elsif open_corners?(board)
      valid_corners = board.legal_moves.to_set & [1,3,7,9].to_set
      valid_corners.sample
    else
      board.legal_moves.sample
    end
  end
end