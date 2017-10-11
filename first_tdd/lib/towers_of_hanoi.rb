class TowersOfHanoi

  attr_reader :disks

  def initialize(disks = [[1, 2, 3], [], []])
    @disks = disks
  end

  def move(from, to)
    raise "Invalid move" if disks[from].empty?
    raise "Invalid move" if !disks[to].empty? && disks[from].first > disks[to].last
    disks[to] << disks[from].shift
    self
  end

  def won?
    @disks == [[], [1, 2, 3], []] || @disks == [[], [], [1, 2, 3]]
  end

  # def play
  #   until self.won?
  #     play_turn
  #   end
  # end
  #
  # def play_turn
  #   input = get_input
  #   move(input)
  # end
  #
  # def get_input
  #   gets.chomp
  # end
end
