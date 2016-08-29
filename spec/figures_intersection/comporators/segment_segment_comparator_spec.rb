require_relative '../../spec_helper'

describe FiguresIntersection::SegmentSegmentComparator do
  describe '.intersect' do
    context 'when both segments are vertical lines' do
      it 'returns VerticalLine when segments have common field' do
        expect(
          described_class.intersect(
            first_segment: FiguresIntersection::Segment.new(x: 1, y: 1, x1: 1, y1: 4),
            second_segment: FiguresIntersection::Segment.new(x: 1, y: 2, x1: 1, y1: 7)
          )
        ).to eq(FiguresIntersection::Segment.new(x: 1, y: 2, x1: 1, y1: 4))
      end

      it 'returns Point when segments have one intersection' do
        expect(
          described_class.intersect(
            first_segment: FiguresIntersection::Segment.new(x: 3, y: 1, x1: 3, y1: 4),
            second_segment: FiguresIntersection::Segment.new(x: 3, y: 4, x1: 3, y1: 7)
          )
        ).to eq(FiguresIntersection::Point.new(x: 3, y: 4))
      end

      it 'returns [] when segments have one intersection' do
        expect(
          described_class.intersect(
            first_segment: FiguresIntersection::Segment.new(x: 3, y: 1, x1: 3, y1: 3),
            second_segment: FiguresIntersection::Segment.new(x: 3, y: 4, x1: 3, y1: 7)
          )
        ).to eq([])

        expect(
          described_class.intersect(
            first_segment: FiguresIntersection::Segment.new(x: 3, y: 1, x1: 3, y1: 3),
            second_segment: FiguresIntersection::Segment.new(x: 4, y: 4, x1: 4, y1: 7)
          )
        ).to eq([])
      end
    end

    context 'when first segment is vertical' do
      it 'returns Point when segments have one intersection' do
        expect(
          described_class.intersect(
            first_segment: FiguresIntersection::Segment.new(x: 1, y: 1, x1: 1, y1: 4),
            second_segment: FiguresIntersection::Segment.new(x: 0, y: 1, x1: 2, y1: 3)
          )
        ).to eq(FiguresIntersection::Point.new(x: 1, y: 2))
      end

      it 'returns [] when segments have not intersection' do
        expect(
          described_class.intersect(
            first_segment: FiguresIntersection::Segment.new(x: 1, y: 1, x1: 1, y1: 4),
            second_segment: FiguresIntersection::Segment.new(x: 2, y: 3, x1: 4, y1: 5)
          )
        ).to eq([])
      end
    end

    context 'when both segment are not vertical lines' do
      it 'returns Point when two segment have intersection' do
        expect(
          described_class.intersect(
            first_segment: FiguresIntersection::Segment.new(x: 3, y: 1, x1: 5, y1: 3),
            second_segment: FiguresIntersection::Segment.new(x: 2, y: 4, x1: 5, y1: 1)
          )
        ).to eq(FiguresIntersection::Point.new(x: 4, y: 2))

        expect(
          described_class.intersect(
            first_segment: FiguresIntersection::Segment.new(x: 3, y: 1, x1: 6, y1: 1),
            second_segment: FiguresIntersection::Segment.new(x: 2, y: 4, x1: 5, y1: 1)
          )
        ).to eq(FiguresIntersection::Point.new(x: 5, y: 1))
      end

      it 'returns Segment when two segment are equal' do
        expect(
          described_class.intersect(
            first_segment: FiguresIntersection::Segment.new(x: 3, y: 1, x1: 5, y1: 3),
            second_segment: FiguresIntersection::Segment.new(x: 3, y: 1, x1: 5, y1: 3)
          )
        ).to eq(FiguresIntersection::Segment.new(x: 3, y: 1, x1: 5, y1: 3))
      end

      it 'returns [] when two segment have not intersection' do
        expect(
          described_class.intersect(
            first_segment: FiguresIntersection::Segment.new(x: 1, y: 1, x1: 2, y1: 2),
            second_segment: FiguresIntersection::Segment.new(x: 3, y: 1, x1: 5, y1: 1)
          )
        ).to eq([])
      end
    end
  end
end
