require_relative '../spec_helper'

describe SegmentRectangleComparator do

  describe '.intersect' do

    context 'when segment is vertical line' do

      it 'returns Segment when segment is placed in rectangle' do
        expect(Segment.new(x: 1, y: 1, x1: 1, y1: 5).intersect(
          Rectangle.new(x: 1, y: 1, x1: 3, y1: 5))
        ).to eq(Segment.new(x: 1, y: 1, x1: 1, y1: 5))

        expect(Segment.new(x: 1, y: 1, x1: 1, y1: 2).intersect(
          Rectangle.new(x: 1, y: 1, x1: 3, y1: 5))
        ).to eq(Segment.new(x: 1, y: 1, x1: 1, y1: 2))
      end

      it 'returns new Segment when segment is placed partially in rectangle' do
        expect(Segment.new(x: 1, y: 1, x1: 1, y1: 7).intersect(
          Rectangle.new(x: 1, y: 1, x1: 3, y1: 5))
        ).to eq(Segment.new(x: 1, y: 1, x1: 1, y1: 5))
      end

      it 'returns Point when segment intersect rectangle in one point' do
        expect(Segment.new(x: 1, y: 5, x1: 1, y1: 7).intersect(
          Rectangle.new(x: 1, y: 1, x1: 3, y1: 5))
        ).to eq(Point.new(x: 1, y: 5))
      end

      it 'returns [] when segment doesn\'t intersect rectangle in one point' do
        expect(Segment.new(x: 1, y: 6, x1: 1, y1: 7).intersect(
          Rectangle.new(x: 1, y: 1, x1: 3, y1: 5))
        ).to eq([])

        expect(Segment.new(x: 1, y: 0.5, x1: 1, y1: -7).intersect(
          Rectangle.new(x: 1, y: 1, x1: 3, y1: 5))
        ).to eq([])
      end
    end

    context 'when segment is not vertical line' do
      it 'returns segment when segment intersect rectangle in two points' do
        expect(Segment.new(x: 0, y: 1, x1: 5, y1: 6).intersect(
          Rectangle.new(x: 1, y: 5, x1: 4, y1: 1))
        ).to eq(Segment.new(x: 1, y: 2, x1: 4, y1: 5))

        expect(Segment.new(x: 0, y: 6, x1: 3, y1: 3).intersect(
          Rectangle.new(x: 1, y: 5, x1: 4, y1: 1))
        ).to eq(Segment.new(x: 1, y: 5, x1: 3, y1: 3))
      end

      it 'returns new Segment when segment is placed partially in rectangle' do
        expect(Segment.new(x: 2, y: 2, x1: 3, y1: 3).intersect(
          Rectangle.new(x: 1, y: 1, x1: 4, y1: 5))
        ).to eq(Segment.new(x: 2, y: 2, x1: 3, y1: 3))

        expect(Segment.new(x: 2, y: 2, x1: 3, y1: 4).intersect(
          Rectangle.new(x: 1, y: 1, x1: 4, y1: 5))
        ).to eq(Segment.new(x: 2, y: 2, x1: 3, y1: 4))

        expect(Segment.new(x: 1, y: 1, x1: 3, y1: 3).intersect(
          Rectangle.new(x: 1, y: 1, x1: 4, y1: 5))
        ).to eq(Segment.new(x: 1, y: 1, x1: 3, y1: 3))
      end

      it 'returns point when segment intersect rectangle in one point' do
        expect(Segment.new(x: 2, y: 7, x1: 6, y1: 3).intersect(
            Rectangle.new(x: 1, y: 5, x1: 4, y1: 1))
        ).to eq(Point.new(x: 4, y: 5))

        expect(Segment.new(x: 2, y: -1, x1: 5, y1: 2).intersect(
            Rectangle.new(x: 1, y: 5, x1: 4, y1: 1))
        ).to eq(Point.new(x: 4, y: 1))
      end

      it 'returns [] when segment doesn\'t intersect rectangle' do
        expect(Segment.new(x: 4, y: 1, x1: 8, y1: 7).intersect(
            Rectangle.new(x: 1, y: 1, x1: 3, y1: 5))
        ).to eq([])

        expect(Segment.new(x: 2, y: 6, x1: 5, y1: 7).intersect(
            Rectangle.new(x: 1, y: 1, x1: 3, y1: 5))
        ).to eq([])

        expect(Segment.new(x: -2, y: 6, x1: 3, y1: 6).intersect(
            Rectangle.new(x: 1, y: 1, x1: 3, y1: 5))
        ).to eq([])
      end
    end
  end
end