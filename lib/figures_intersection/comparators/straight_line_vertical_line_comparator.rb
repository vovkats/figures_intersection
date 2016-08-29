module FiguresIntersection
  class StraightLineVerticalLineComparator

    def self.intersect(straight_line:, vertical_line:)
      Point.new(x: vertical_line.a, y: straight_line.k * vertical_line.a + straight_line.b)
    end
  end
end