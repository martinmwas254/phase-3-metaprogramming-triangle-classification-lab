class Triangle
  def initialize(adj, opp, hyp)
    @adj = adj
    @opp = opp
    @hyp = hyp
    validate_triangle(adj, opp, hyp)
  end

  def kind
    case
    when @adj == @opp && @opp == @hyp
      :equilateral
    when @adj == @opp || @opp == @hyp || @adj == @hyp
      :isosceles
    else
      :scalene
    end
  end

  private

  def validate_triangle(adj, opp, hyp)
    sides = [adj, opp, hyp]
    if sides.any? { |side| side <= 0 } || (adj + opp <= hyp) || (adj + hyp <= opp) || (opp + hyp <= adj)
      raise TriangleError
    end
  end

  class TriangleError < StandardError
    def message
      "Invalid triangle. Please check the side lengths."
    end
  end
end
