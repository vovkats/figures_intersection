require_relative '../spec_helper'

describe RectangleRectangleComparator do

  describe '.intersect' do

    it 'returns Point when rectangles have one point intersection' do
      expect(
        Rectangle.new(x: 0, y: 0, x1: 2, y1: 2)
          .intersect(Rectangle.new(x: 2, y: 2, x1: 4, y1: 8)
        )
      ).to eq(Point.new(x: 2, y: 2))
    end

    it 'returns Rectangle when coordinates are placed by diagonal' do
      expect(
        Rectangle.new(x: 1, y: 2, x1: 4, y1: 5)
          .intersect(Rectangle.new(x: 2, y: 3, x1: 3, y1: 4)
        )
      ).to eq(Rectangle.new(x: 2, y: 4, x1: 3, y1: 3))
    end

    it 'returns Segment when coordinates are not placed by diagonal' do
      expect(
        Rectangle.new(x: 1, y: 1, x1: 4, y1: 4)
          .intersect(Rectangle.new(x: 1, y: 4, x1: 4, y1: 7)
        )
      ).to eq(Segment.new(x: 1, y: 4, x1: 4, y1: 4))
    end

    it 'returns [] when Rectangles don\'t intersect' do
      expect(
        Rectangle.new(x: 1, y: 1, x1: 4, y1: 4)
          .intersect(Rectangle.new(x: 5, y: 5, x1: 8, y1:8)
        )
      ).to eq([])
    end
  end
end