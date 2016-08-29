require_relative '../../spec_helper'

describe FiguresIntersection::RectangleRectangleComparator do
  describe '.intersect' do
    it 'returns Point when rectangles have one point intersection' do
      expect(
        described_class.intersect(
          first_rectangle: FiguresIntersection::Rectangle.new(x: 0, y: 0, x1: 2, y1: 2),
          second_rectangle: FiguresIntersection::Rectangle.new(x: 2, y: 2, x1: 4, y1: 8)
        )
      ).to eq(FiguresIntersection::Point.new(x: 2, y: 2))
    end

    it 'returns Rectangle when coordinates are placed by diagonal' do
      expect(
        described_class.intersect(
          first_rectangle: FiguresIntersection::Rectangle.new(x: 1, y: 2, x1: 4, y1: 5),
          second_rectangle: FiguresIntersection::Rectangle.new(x: 2, y: 3, x1: 3, y1: 4)
        )
      ).to eq(FiguresIntersection::Rectangle.new(x: 2, y: 4, x1: 3, y1: 3))
    end

    it 'returns Segment when coordinates are not placed by diagonal' do
      expect(
        described_class.intersect(
          first_rectangle: FiguresIntersection::Rectangle.new(x: 1, y: 1, x1: 4, y1: 4),
          second_rectangle: FiguresIntersection::Rectangle.new(x: 1, y: 4, x1: 4, y1: 7)
        )
      ).to eq(FiguresIntersection::Segment.new(x: 1, y: 4, x1: 4, y1: 4))
    end

    it 'returns [] when Rectangles don\'t intersect' do
      expect(
        described_class.intersect(
          first_rectangle: FiguresIntersection::Rectangle.new(x: 1, y: 1, x1: 4, y1: 4),
          second_rectangle: FiguresIntersection::Rectangle.new(x: 5, y: 5, x1: 8, y1: 8)
        )
      ).to eq([])
    end
  end
end
