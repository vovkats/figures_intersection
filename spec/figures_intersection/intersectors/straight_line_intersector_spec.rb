require_relative '../../spec_helper'

describe FiguresIntersection::StraightLineIntersector do
  let(:straight_line) { FiguresIntersection::StraightLine.new(k: 2, b: 2) }

  it 'involves PointStraightLineComparator when second argument is Point' do
    expect(FiguresIntersection::PointStraightLineComparator).to receive(:intersect)
    straight_line.intersect(FiguresIntersection::Point.new(x: 2, y: 2))
  end

  it 'involves StraightLineSegmentComparator when second argument is Segment' do
    expect(FiguresIntersection::StraightLineSegmentComparator).to receive(:intersect)
    straight_line.intersect(FiguresIntersection::Segment.new(x: 2, y: 2, x1: 1, y1: 3))
  end

  it 'involves StraightLineStraightLineComparator when second argument is StraightLine' do
    expect(FiguresIntersection::StraightLineStraightLineComparator).to receive(:intersect)
    straight_line.intersect(FiguresIntersection::StraightLine.new(k: 2, b: 2))
  end

  it 'involves StraightLineRectangleComparator when second argument is Rectangle' do
    expect(FiguresIntersection::StraightLineRectangleComparator).to receive(:intersect)
    straight_line.intersect(FiguresIntersection::Rectangle.new(x: 2, y: 2, x1: 1, y1: 3))
  end

  it 'involves StraightLineVerticalLineComparator when second argument is VerticalLine' do
    expect(FiguresIntersection::StraightLineVerticalLineComparator).to receive(:intersect)
    straight_line.intersect(FiguresIntersection::VerticalLine.new(a: 2))
  end
end
