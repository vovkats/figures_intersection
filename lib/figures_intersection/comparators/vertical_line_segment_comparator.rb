module FiguresIntersection
  class VerticalLineSegmentComparator

    def self.intersect(vertical_line:, segment:)

      if segment.vertical?
        return segment if vertical_line.a == segment.x
        []
      else
        straight_line = segment.to_straight_line

        point = Point.new(x: vertical_line.a, y: straight_line.k * vertical_line.a + straight_line.b)

        return point if point.x == vertical_line.a && segment.include_point?(point)
        []
      end
    end
  end
end