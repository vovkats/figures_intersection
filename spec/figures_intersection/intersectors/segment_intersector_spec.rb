describe SegmentIntersector do
  let(:segment) { Segment.new(x: 2, y: 2, x1: 3, y1: 8) }

  it 'involves PointSegmentComparator when second argument is Point' do
    expect(PointSegmentComparator).to receive(:intersect)
    segment.intersect(Point.new(x: 2, y: 2))
  end

  it 'involves SegmentSegmentComparator when second argument is Segment' do
    expect(SegmentSegmentComparator).to receive(:intersect)
    segment.intersect(Segment.new(x: 2, y: 2, x1: 1, y1: 3))
  end

  it 'involves StraightLineSegmentComparator when second argument is StraightLine' do
    expect(StraightLineSegmentComparator).to receive(:intersect)
    segment.intersect(StraightLine.new(k: 2, b: 2))
  end

  it 'involves SegmentRectangleComparator when second argument is Rectangle' do
    expect(SegmentRectangleComparator).to receive(:intersect)
    segment.intersect(Rectangle.new(x: 2, y: 2, x1: 1, y1: 3))
  end

  it 'involves VerticalLineSegmentComparator when second argument is VerticalLine' do
    expect(VerticalLineSegmentComparator).to receive(:intersect)
    segment.intersect(VerticalLine.new(a: 2))
  end
end