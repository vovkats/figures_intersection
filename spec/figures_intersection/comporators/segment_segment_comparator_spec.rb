require_relative '../spec_helper'

describe SegmentSegmentComparator do

  describe '.intersect' do

    context 'when both segments are vertical lines' do
      it 'returns VerticalLine when segments have common field' do
        expect(Segment.new(x: 1, y: 1, x1: 1, y1: 4)
            .intersect(Segment.new(x: 1, y: 2, x1: 1, y1: 7)
          )
        ).to eq(Segment.new(x: 1, y: 2, x1: 1, y1: 4))
      end

      it 'returns Point when segments have one intersection' do
        expect(
          Segment.new(x: 3, y: 1, x1: 3, y1: 4)
            .intersect(Segment.new(x: 3, y: 4, x1: 3, y1: 7)
          )
        ).to eq(Point.new(x: 3, y: 4))
      end

      it 'returns [] when segments have one intersection' do
        expect(Segment.new(x: 3, y: 1, x1: 3, y1: 3)
            .intersect(Segment.new(x: 3, y: 4, x1: 3, y1: 7)
          )
        ).to eq([])

        expect(Segment.new(x: 3, y: 1, x1: 3, y1: 3)
           .intersect(Segment.new(x: 4, y: 4, x1: 4, y1: 7)
          )
        ).to eq([])
      end
    end

    context 'when first segment is vertical' do
      it 'returns Point when segments have one intersection' do
        expect(Segment.new(x: 1, y: 1, x1: 1, y1: 4)
            .intersect(Segment.new(x: 0, y: 1, x1: 2, y1: 3)
          )
        ).to eq(Point.new(x: 1, y: 2))
      end

      it 'returns [] when segments have not intersection' do
        expect(Segment.new(x: 1, y: 1, x1: 1, y1: 4)
            .intersect(Segment.new(x: 2, y: 3, x1: 4, y1: 5)
          )
        ).to eq([])
      end
    end

    context 'when both segment are not vertical lines' do
      it 'return Point when two segment have intersection' do
        expect(Segment.new(x: 3, y: 1, x1: 5, y1: 3)
            .intersect(Segment.new(x: 2, y: 4, x1: 5, y1: 1)
          )
        ).to eq(Point.new(x: 4, y: 2))

        expect(Segment.new(x: 3, y: 1, x1: 6, y1: 1)
            .intersect(Segment.new(x: 2, y: 4, x1: 5, y1: 1)
          )
        ).to eq(Point.new(x: 5, y: 1))
      end

      it 'return Segment when two segment are equal' do
        expect(Segment.new(x: 3, y: 1, x1: 5, y1: 3)
           .intersect(Segment.new(x: 3, y: 1, x1: 5, y1: 3)
          )
        ).to eq(Segment.new(x: 3, y: 1, x1: 5, y1: 3))
      end

      it 'return [] when two segment have not intersection' do
        expect(Segment.new(x: 1, y: 1, x1: 2, y1: 2)
             .intersect(Segment.new(x: 3, y: 1, x1: 5, y1: 1)
           )
        ).to eq([])
      end
    end
  end
end