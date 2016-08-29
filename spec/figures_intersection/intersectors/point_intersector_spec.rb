require_relative '../../spec_helper'

describe FiguresIntersection::PointIntersector do
  let(:point) { FiguresIntersection::Point.new(x: 1, y: 1) }

  it 'involves PointPointComparator when second argument is Point' do
    expect(FiguresIntersection::PointPointComparator).to receive(:intersect)
    point.intersect(FiguresIntersection::Point.new(x: 2, y: 2))
  end

  it 'involves PointSegmentComparator when second argument is Segment' do
    expect(FiguresIntersection::PointSegmentComparator).to receive(:intersect)
    point.intersect(FiguresIntersection::Segment.new(x: 2, y: 2, x1: 1, y1: 3))
  end

  it 'involves PointStraightLineComparator when second argument is StraightLine' do
    expect(FiguresIntersection::PointStraightLineComparator).to receive(:intersect)
    point.intersect(FiguresIntersection::StraightLine.new(k: 2, b: 2))
  end

  it 'involves PointRectangleComparator when second argument is Rectangle' do
    expect(FiguresIntersection::PointRectangleComparator).to receive(:intersect)
    point.intersect(FiguresIntersection::Rectangle.new(x: 2, y: 2, x1: 1, y1: 3))
  end

  it 'involves PointVerticalLineComparator when second argument is VerticalLine' do
    expect(FiguresIntersection::PointVerticalLineComparator).to receive(:intersect)
    point.intersect(FiguresIntersection::VerticalLine.new(a: 2))
  end
end
