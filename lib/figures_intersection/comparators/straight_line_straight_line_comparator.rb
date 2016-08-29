module FiguresIntersection
  class StraightLineStraightLineComparator

    def self.intersect(first_straight_line:, second_straight_line:)
      common_k = first_straight_line.k - second_straight_line.k
      common_b = second_straight_line.b - first_straight_line.b

      return first_straight_line if first_straight_line.k == second_straight_line.k && first_straight_line.b == second_straight_line.b
      return [] if common_k.zero?

      x = common_b / common_k.to_f
      y = second_straight_line.k * x + second_straight_line.b

      Point.new(x: x.round(2), y: y.round(2))
    end
  end
end