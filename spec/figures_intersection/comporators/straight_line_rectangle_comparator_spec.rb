require_relative '../spec_helper'

describe StraightLineRectangleComparator do

  describe '.intersect' do

    it 'returns segment when intersection has common field' do
      expect(StraightLine.new(k: 2, b: -1)
          .intersect(Rectangle.new(x: 1, y: 1, x1: 4, y1: 7)
        )
      ).to eq(Segment.new(x: 1, y: 1, x1: 4, y1: 7))

      expect(StraightLine.new(k: -2, b: 9)
          .intersect(Rectangle.new(x: 1, y: 1, x1: 4, y1: 7)
        )
      ).to eq(Segment.new(x: 1, y: 7, x1: 4, y1: 1))
    end

    it 'returns Point when intersection has one' do
      expect(StraightLine.new(k: 2, b: -1)
          .intersect(Rectangle.new(x: 4, y: 7, x1: 8, y1: 0)
        )
      ).to eq(Point.new(x: 4, y: 7))

      expect(StraightLine.new(k: -2, b: 9)
          .intersect(Rectangle.new(x: -2, y: 1, x1: 1, y1: 7)
        )
      ).to eq(Point.new(x: 1, y: 7))
    end

    it 'returns [] when it is not intersection' do
      expect(StraightLine.new(k: 2, b: -1)
          .intersect(Rectangle.new(x: 5, y: 1, x1: 6, y1: 3)
        )
      ).to eq([])

      expect(StraightLine.new(k: -2, b: 9)
          .intersect(Rectangle.new(x: -2, y: 1, x1: 1, y1: 7)
         )
      ).to eq(Point.new(x: 1, y: 7))
    end
  end
end