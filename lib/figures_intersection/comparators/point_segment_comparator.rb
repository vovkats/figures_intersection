class PointSegmentComparator
  def self.intersect(point:, segment:)
    return point if segment.x == segment.x1 && segment.include_point?(point)
    return point if segment.y == segment.y1 && segment.include_point?(point)

    if ((point.x - segment.x) / (segment.x1 - segment.x).to_f).round(2) == ((point.y - segment.y) / (segment.y1 - segment.y).to_f).round(2)
      point
    else
      []
    end
  end
end