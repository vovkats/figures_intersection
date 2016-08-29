describe PointIntersector do
  let(:point) { Point.new(x: 1, y: 1) }

  it 'involves PointPointComparator when second argument is Point' do
    expect(PointPointComparator).to receive(:intersect)
    point.intersect(Point.new(x: 2, y: 2))
  end

  it 'involves PointSegmentComparator when second argument is Segment' do
    expect(PointSegmentComparator).to receive(:intersect)
    point.intersect(Segment.new(x: 2, y: 2, x1: 1, y1: 3))
  end

  it 'involves PointStraightLineComparator when second argument is StraightLine' do
    expect(PointStraightLineComparator).to receive(:intersect)
    point.intersect(StraightLine.new(k: 2, b: 2))
  end

  it 'involves PointRectangleComparator when second argument is Rectangle' do
    expect(PointRectangleComparator).to receive(:intersect)
    point.intersect(Rectangle.new(x: 2, y: 2, x1: 1, y1: 3))
  end

  it 'involves PointVerticalLineComparator when second argument is VerticalLine' do
    expect(PointVerticalLineComparator).to receive(:intersect)
    point.intersect(VerticalLine.new(a: 2))
  end
end