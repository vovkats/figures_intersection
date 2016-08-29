require_relative '../../spec_helper'

describe FiguresIntersection::RectangleIntersector do
  let(:rectangle) { FiguresIntersection::Rectangle.new(x: 1, y: 1, x1: 3, y1: 6) }

  it 'involves PointRectangleComparator when second argument is Rectangle' do
    expect(FiguresIntersection::PointRectangleComparator).to receive(:intersect)
    rectangle.intersect(FiguresIntersection::Point.new(x: 2, y: 2))
  end

  it 'involves SegmentRectangleComparator when second argument is Segment' do
    expect(FiguresIntersection::SegmentRectangleComparator).to receive(:intersect)
    rectangle.intersect(FiguresIntersection::Segment.new(x: 2, y: 2, x1: 1, y1: 3))
  end

  it 'involves StraightLineRectangleComparator when second argument is StraightLine' do
    expect(FiguresIntersection::StraightLineRectangleComparator).to receive(:intersect)
    rectangle.intersect(FiguresIntersection::StraightLine.new(k: 2, b: 2))
  end

  it 'involves RectangleRectangleComparator when second argument is Rectangle' do
    expect(FiguresIntersection::RectangleRectangleComparator).to receive(:intersect)
    rectangle.intersect(FiguresIntersection::Rectangle.new(x: 2, y: 2, x1: 1, y1: 3))
  end

  it 'involves VerticalLineRectangleComparator when second argument is VerticalLine' do
    expect(FiguresIntersection::VerticalLineRectangleComparator).to receive(:intersect)
    rectangle.intersect(FiguresIntersection::VerticalLine.new(a: 2))
  end
end
