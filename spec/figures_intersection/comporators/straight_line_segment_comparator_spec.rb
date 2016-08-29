require_relative '../spec_helper'

describe StraightLineSegmentComparator do

  describe '.intersect' do

    context 'when segment is vertical' do
      it 'returns Point when it has intersection' do
        expect(StraightLine.new(k: 2, b: -1)
             .intersect(Segment.new(x: 3, y: 1, x1: 3, y1: 10)
           )
        ).to eq(Point.new(x: 3, y: 5))
      end

      it 'returns [] when it has not intersection' do
        expect(StraightLine.new(k: 2, b: -1)
             .intersect(Segment.new(x: 3, y: 1, x1: 3, y1: 4)
           )
        ).to eq([])
      end
    end

    context 'when segment is not vertical'do
      it 'returns Point when it has intersection' do
        expect(StraightLine.new(k: 2, b: -1)
             .intersect(Segment.new(x: 2, y: 6, x1: 4, y1: 4)
           )
        ).to eq(Point.new(x: 3, y: 5))
      end

      it 'returns [] when it has not intersection' do
        expect(StraightLine.new(k: 2, b: -1)
             .intersect(Segment.new(x: 2, y: 6, x1: 0, y1: 6)
           )
        ).to eq([])
      end
    end
  end
end