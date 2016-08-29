describe VerticalLineIntersector do
  let(:vertical_line) { VerticalLine.new(a: 2) }

  it 'involves PointStraightLineComparator when second argument is Point' do
    expect(PointVerticalLineComparator).to receive(:intersect)
    vertical_line.intersect(Point.new(x: 2, y: 2))
  end

  it 'involves VerticalLineSegmentComparator when second argument is Segment' do
    expect(VerticalLineSegmentComparator).to receive(:intersect)
    vertical_line.intersect(Segment.new(x: 2, y: 2, x1: 1, y1: 3))
  end

  it 'involves StraightLineVerticalLineComparator when second argument is StraightLine' do
    expect(StraightLineVerticalLineComparator).to receive(:intersect)
    vertical_line.intersect(StraightLine.new(k: 2, b: 2))
  end

  it 'involves VerticalLineRectangleComparator when second argument is Rectangle' do
    expect(VerticalLineRectangleComparator).to receive(:intersect)
    vertical_line.intersect(Rectangle.new(x: 2, y: 2, x1: 1, y1: 3))
  end

  it 'involves VerticalLineVerticalLineComparator when second argument is VerticalLine' do
    expect(VerticalLineVerticalLineComparator).to receive(:intersect)
    vertical_line.intersect(VerticalLine.new(a: 2))
  end
end