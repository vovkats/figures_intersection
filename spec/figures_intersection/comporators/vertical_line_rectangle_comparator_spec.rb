require_relative '../../spec_helper'

describe FiguresIntersection::VerticalLineRectangleComparator do
  describe '.intersect' do
    it 'returns [] when it has not intersection' do
      expect(
        described_class.intersect(
          rectangle: FiguresIntersection::Rectangle.new(x: 1, y: 1, x1: 4, y1: 7),
          vertical_line: FiguresIntersection::VerticalLine.new(a: 5)
        )
      ).to eq([])
    end

    it 'returns Segment when it has intersection' do
      expect(
        described_class.intersect(
          rectangle: FiguresIntersection::Rectangle.new(x: 1, y: 1, x1: 4, y1: 7),
          vertical_line: FiguresIntersection::VerticalLine.new(a: 2)
        )
      ).to eq(FiguresIntersection::Segment.new(x: 2, y: 1, x1: 2, y1: 7))
    end
  end
end
