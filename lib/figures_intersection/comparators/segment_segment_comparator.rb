class SegmentSegmentComparator

  def self.intersect(first_segment:, second_segment:)
    result =
      if first_segment.vertical? && second_segment.vertical?
        VerticalLineVerticalLineComparator.intersect(
          first_vertical_line: VerticalLine.new(a: first_segment.x),
          second_vertical_line: VerticalLine.new(a: second_segment.x))
      elsif first_segment.vertical? && !second_segment.vertical?
        VerticalLineSegmentComparator.intersect(
          vertical_line: VerticalLine.new(a: first_segment.x),
          segment: second_segment)
      elsif !first_segment.vertical? && second_segment.vertical?
        VerticalLineSegmentComparator.intersect(
          vertical_line: VerticalLine.new(a: second_segment.x),
          segment: first_segment)
      else
        StraightLineStraightLineComparator.intersect(
          first_straight_line: first_segment.to_straight_line,
          second_straight_line: second_segment.to_straight_line)
      end

    if result.is_a?(Point) && first_segment.include_point?(result) && second_segment.include_point?(result)
      result
    elsif result.is_a?(StraightLine)
      first_segment
    elsif result.is_a?(VerticalLine)
      VerticalSegmentVerticalLineComparator.intersect(first_segment: first_segment, second_segment: second_segment)
    else
      []
    end
  end
end