describe StraightLineIntersector do
  let(:straight_line) { StraightLine.new(k: 2, b: 2) }

  it 'involves PointStraightLineComparator when second argument is Point' do
    expect(PointStraightLineComparator).to receive(:intersect)
    straight_line.intersect(Point.new(x: 2, y: 2))
  end

  it 'involves StraightLineSegmentComparator when second argument is Segment' do
    expect(StraightLineSegmentComparator).to receive(:intersect)
    straight_line.intersect(Segment.new(x: 2, y: 2, x1: 1, y1: 3))
  end

  it 'involves StraightLineStraightLineComparator when second argument is StraightLine' do
    expect(StraightLineStraightLineComparator).to receive(:intersect)
    straight_line.intersect(StraightLine.new(k: 2, b: 2))
  end

  it 'involves StraightLineRectangleComparator when second argument is Rectangle' do
    expect(StraightLineRectangleComparator).to receive(:intersect)
    straight_line.intersect(Rectangle.new(x: 2, y: 2, x1: 1, y1: 3))
  end

  it 'involves StraightLineVerticalLineComparator when second argument is VerticalLine' do
    expect(StraightLineVerticalLineComparator).to receive(:intersect)
    straight_line.intersect(VerticalLine.new(a: 2))
  end
end