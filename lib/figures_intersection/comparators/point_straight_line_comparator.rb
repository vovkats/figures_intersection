class PointStraightLineComparator

  def self.intersect(point:, straight_line:)
    return point if point.y.round(2) == (straight_line.k * point.x + straight_line.b).round(2)
    []
  end
end