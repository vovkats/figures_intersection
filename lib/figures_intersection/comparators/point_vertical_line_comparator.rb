module FiguresIntersection
  class PointVerticalLineComparator

    def self.intersect(point:, vertical_line:)
      return point if vertical_line.a == point.x
      []
    end
  end
end