require_relative '../../spec_helper'

describe FiguresIntersection::VerticalLineIntersector do
  let(:vertical_line) { FiguresIntersection::VerticalLine.new(a: 2) }

  it 'involves PointStraightLineComparator when second argument is Point' do
    expect(FiguresIntersection::PointVerticalLineComparator).to receive(:intersect)
    vertical_line.intersect(FiguresIntersection::Point.new(x: 2, y: 2))
  end

  it 'involves VerticalLineSegmentComparator when second argument is Segment' do
    expect(FiguresIntersection::VerticalLineSegmentComparator).to receive(:intersect)
    vertical_line.intersect(FiguresIntersection::Segment.new(x: 2, y: 2, x1: 1, y1: 3))
  end

  it 'involves StraightLineVerticalLineComparator when second argument is StraightLine' do
    expect(FiguresIntersection::StraightLineVerticalLineComparator).to receive(:intersect)
    vertical_line.intersect(FiguresIntersection::StraightLine.new(k: 2, b: 2))
  end

  it 'involves VerticalLineRectangleComparator when second argument is Rectangle' do
    expect(FiguresIntersection::VerticalLineRectangleComparator).to receive(:intersect)
    vertical_line.intersect(FiguresIntersection::Rectangle.new(x: 2, y: 2, x1: 1, y1: 3))
  end

  it 'involves VerticalLineVerticalLineComparator when second argument is VerticalLine' do
    expect(FiguresIntersection::VerticalLineVerticalLineComparator).to receive(:intersect)
    vertical_line.intersect(FiguresIntersection::VerticalLine.new(a: 2))
  end
end
