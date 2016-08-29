require_relative '../spec_helper'

describe VerticalLineRectangleComparator do

  describe '.intersect' do

    it 'returns [] when it has not intersection' do
      expect(Rectangle.new(x: 1, y: 1, x1: 4, y1: 7)
           .intersect(VerticalLine.new(a: 5)
         )
      ).to eq([])
    end

    it 'returns [] when it has not intersection' do
      expect(Rectangle.new(x: 1, y: 1, x1: 4, y1: 7)
         .intersect(VerticalLine.new(a: 2)
        )
      ).to eq(Segment.new(x: 2, y: 1, x1: 2, y1: 7))
    end
  end
end