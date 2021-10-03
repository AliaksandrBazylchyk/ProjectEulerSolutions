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

  def initialize(cards)
    @cards = cards
    @values = @cards.map(&:value).sort
    @colors = @cards.map(&:color).sort
    @ranking_value = @values.max
    rank
  end

  def isRoyalFlush
    @values == [10, 11, 12, 13, 14] and @colors.count(@colors.first) == 5
  end

  def isStritFlush
    return false if @colors.count(@colors.first) != 5
    @ranking_value = @values.last
    @values.each_cons(2).all? { |x, y| y == x + 1 }
  end

  def isKare
    nil
  end

  def isFullHouse
    nil
  end

  def isFlush
    @ranking_value = @values.max
    @colors.count(@colors.first) == 5
  end

  def isStrit
    @ranking_value = @values.max
    @values.each_cons(2).all? {|x, y| y == x + 1 }
  end

  def isTripl
    nil
  end

  def isTwoPairs
    nil
  end

  def isPair
    nil
  end

  def isHighCard
    nil
  end

  def result
    if isRoyalFlush
      @result = 10
    elsif isStritFlush
      @result = 9
    elsif isKare
      @result = 8
    elsif isFullHouse
      @result = 7
    elsif isFlush
      @result = 6
    elsif isStrit
      @result = 5
    elsif isTripl
      @result = 4
    elsif isTwoPairs
      @result = 3
    elsif isPair
      @result = 2
    elsif isHighCard
      @result = 1
    end
  end



end
