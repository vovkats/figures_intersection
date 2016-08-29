describe RectangleIntersector do
  let(:rectangle) { Rectangle.new(x: 1, y: 1, x1: 3, y1: 6) }

  it 'involves PointRectangleComparator when second argument is Rectangle' do
    expect(PointRectangleComparator).to receive(:intersect)
    rectangle.intersect(Point.new(x: 2, y: 2))
  end

  it 'involves SegmentRectangleComparator when second argument is Segment' do
    expect(SegmentRectangleComparator).to receive(:intersect)
    rectangle.intersect(Segment.new(x: 2, y: 2, x1: 1, y1: 3))
  end

  it 'involves StraightLineRectangleComparator when second argument is StraightLine' do
    expect(StraightLineRectangleComparator).to receive(:intersect)
    rectangle.intersect(StraightLine.new(k: 2, b: 2))
  end

  it 'involves RectangleRectangleComparator when second argument is Rectangle' do
    expect(RectangleRectangleComparator).to receive(:intersect)
    rectangle.intersect(Rectangle.new(x: 2, y: 2, x1: 1, y1: 3))
  end

  it 'involves VerticalLineRectangleComparator when second argument is VerticalLine' do
    expect(VerticalLineRectangleComparator).to receive(:intersect)
    rectangle.intersect(VerticalLine.new(a: 2))
  end
end