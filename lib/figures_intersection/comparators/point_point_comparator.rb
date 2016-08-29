module FiguresIntersection
  class PointPointComparator
    def self.intersect(first_point:, second_point:)
      return first_point if first_point == second_point
      []
    end
  end
end