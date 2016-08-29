require_relative '../../spec_helper'

describe FiguresIntersection::VerticalLineSegmentComparator do
  describe '.intersect' do
    context 'when segment is vertical' do
      it 'returns segment and lines intersect' do
        expect(
          described_class.intersect(
            segment: FiguresIntersection::Segment.new(x: 2, y: 1, x1: 2, y1: 7),
            vertical_line: FiguresIntersection::VerticalLine.new(a: 2)
          )
        ).to eq(FiguresIntersection::Segment.new(x: 2, y: 1, x1: 2, y1: 7))
      end

      it 'returns [] and lines don\'t intersect' do
        expect(
          described_class.intersect(
            segment: FiguresIntersection::Segment.new(x: 2, y: 1, x1: 2, y1: 7),
            vertical_line: FiguresIntersection::VerticalLine.new(a: 3)
          )
        ).to eq([])
      end
    end

    context 'when segment is not vertical' do
      it 'returns Point and lines intersect' do
        expect(
          described_class.intersect(
            segment: FiguresIntersection::Segment.new(x: 1, y: 1, x1: 4, y1: 7),
            vertical_line: FiguresIntersection::VerticalLine.new(a: 3)
          )
        ).to eq(FiguresIntersection::Point.new(x: 3, y: 5))
      end

      it 'returns [] and lines don\'t intersect' do
        expect(
          described_class.intersect(
            segment: FiguresIntersection::Segment.new(x: 2, y: 1, x1: -1, y1: 7),
            vertical_line: FiguresIntersection::VerticalLine.new(a: 3)
          )
        ).to eq([])
      end
    end
  end
end
