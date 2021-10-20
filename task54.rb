$result = 0

class Card

  def value
    @value
  end

  def color
    @color
  end

  def initialize(card)
    case card[0]
    when 'T' then @value = 10
    when 'J' then @value = 11
    when 'Q' then @value = 12
    when 'K' then @value = 13
    when 'A' then @value = 14
    else @value = card[0].to_i
    end
    case card[1]
    when 'D' then @color = :diamond
    when 'H' then @color = :heart
    when 'C' then @color = :club
    when 'S' then @color = :spade
    else
      @color = :undefined
    end
  end

end

class Combination

  def ranking_value
    @ranking_value
  end

  def rank
    @rank
  end

  def ranking_pair_value
    @ranking_pair_value
  end

  def initialize(cards)
    @cards = cards
    @values = @cards.map(&:value).sort
    @colors = @cards.map(&:color).sort
    @ranking_value = @values.max
    @ranking_pair_value
    @rank

  end

  def is_royal_flush
    @values == [10, 11, 12, 13, 14] and @colors.count(@colors.first) == 5
  end

  def is_strit_flush
    return false if @colors.count(@colors.first) != 5
    @ranking_value = @values.last
    @values.each_cons(2).all? { |x, y| y == x + 1 }
  end

  def is_kare
    if @values[0] == @values[3]
      @ranking_value = @value[3]
      true
    elsif @values[4] == @values[1]
      @ranking_value = @value[4]
      true
    else
      false
    end
  end

  def is_full_house
    if @values[0] == @values[2] && @values[3] == @values[4]
      @ranking_value == @values[2]
      true
    elsif @values[2] == @values[4] && @values[0] == @values[1]
      @ranking_value == @values[2]
      true
    else
      false
    end
  end

  def is_flush
    @ranking_value = @values.max
    @colors.count(@colors.first) == 5
  end

  def is_strit
    @ranking_value = @values.max
    @values.each_cons(2).all? { |x, y| y == x + 1 }
  end

  def is_tripl
    if @values[0] == @values[2]
      @ranking_value == @values[2]
      true
    elsif @values[2] == @values[4]
      @ranking_value == @values[2]
      true
    elsif @values[1] == @values[3]
      @ranking_value = @values[2]
      true
    else
      false
    end
  end

  def is_two_pairs
    @ranking_pair_value = @values.max
    if @values[0] == @values[1] && @values[3] == @values[4]
      true
    elsif @values[1] == @values[2] && @values[3] == @values[4]
      true
    elsif @values[0] == @values[1] && @values[2] == @values[3]
      true
    else
      false
    end
  end

  def is_pair
    @ranking_pair_value = @values.max
    if @values[0] == @values[1]
      @ranking_value == @values[0]
      true
    elsif @values[1] == @values[2]
      @ranking_value == @values[1]
      true
    elsif @values[2] == @values[3]
      @ranking_value = @values[2]
      true
    elsif @values[3] == @values[4]
      @ranking_value = @values[3]
      true
    else
      false
    end
  end

  def is_high_card
    @ranking_value = @values.max
    true
  end

  def result
    if is_royal_flush
      @rank = 10
    elsif is_strit_flush
      @rank = 9
    elsif is_kare
      @rank = 8
    elsif is_full_house
      @rank = 7
    elsif is_flush
      @rank = 6
    elsif is_strit
      @rank = 5
    elsif is_tripl
      @rank = 4
    elsif is_two_pairs
      @rank = 3
    elsif is_pair
      @rank = 2
    elsif is_high_card
      @rank = 1
    end
  end

  def testcase_rank
    @colors
  end
end

def answer(card1, card2)
  comb1 = Combination.new(card1)
  comb2 = Combination.new(card2)
  comb1.result
  comb2.result
  if comb1.rank > comb2.rank
    $result += 1
  end
  if comb1.rank == comb2.rank && (comb1.rank == 2 || comb1.rank == 3)
    if comb1.ranking_pair_value > comb2.ranking_pair_value
      $result += 1
      return
    end
  end
  if comb1.rank == comb2.rank
    $result += 1 if comb1.ranking_value >= comb2.ranking_value
  end

end

class Parser
  text = File.read('task54.txt')
  text.lines do |i|
    i = i.chomp
    k = i.split(' ')
    @cards1 = []
    @cards2 = []
    5.times do |n|
      @cards1 << Card.new(k[n])
      @cards2 << Card.new(k[n + 5])
    end
    answer @cards1, @cards2
  end
end

print $result