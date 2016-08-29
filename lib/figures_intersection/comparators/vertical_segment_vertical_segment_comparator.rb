module FiguresIntersection
  class VerticalSegmentVerticalLineComparator

    def self.intersect(first_segment:, second_segment:)
      points = []

      if first_segment.include_point?(second_segment.first_point)
        points << second_segment.first_point
      end

      if first_segment.include_point?(second_segment.second_point)
        points << second_segment.second_point
      end

      if second_segment.include_point?(first_segment.first_point)
        points << first_segment.first_point
      end

      if second_segment.include_point?(first_segment.second_point)
        points << first_segment.second_point
      end

      points = points.uniq { |p| p.y.to_f }

      if points.count > 1
        Segment.new(x: points.first.x, y: points.first.y, x1: points.last.x, y1: points.last.y)
      elsif points.count == 1
        points.first
      else
        []
      end
    end
  end
end