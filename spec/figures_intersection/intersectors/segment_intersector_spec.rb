require_relative '../../spec_helper'

describe FiguresIntersection::SegmentIntersector do
  let(:segment) { FiguresIntersection::Segment.new(x: 2, y: 2, x1: 3, y1: 8) }

  it 'involves PointSegmentComparator when second argument is Point' do
    expect(FiguresIntersection::PointSegmentComparator).to receive(:intersect)
    segment.intersect(FiguresIntersection::Point.new(x: 2, y: 2))
  end

  it 'involves SegmentSegmentComparator when second argument is Segment' do
    expect(FiguresIntersection::SegmentSegmentComparator).to receive(:intersect)
    segment.intersect(FiguresIntersection::Segment.new(x: 2, y: 2, x1: 1, y1: 3))
  end

  it 'involves StraightLineSegmentComparator when second argument is StraightLine' do
    expect(FiguresIntersection::StraightLineSegmentComparator).to receive(:intersect)
    segment.intersect(FiguresIntersection::StraightLine.new(k: 2, b: 2))
  end

  it 'involves SegmentRectangleComparator when second argument is Rectangle' do
    expect(FiguresIntersection::SegmentRectangleComparator).to receive(:intersect)
    segment.intersect(FiguresIntersection::Rectangle.new(x: 2, y: 2, x1: 1, y1: 3))
  end

  it 'involves VerticalLineSegmentComparator when second argument is VerticalLine' do
    expect(FiguresIntersection::VerticalLineSegmentComparator).to receive(:intersect)
    segment.intersect(FiguresIntersection::VerticalLine.new(a: 2))
  end
end
