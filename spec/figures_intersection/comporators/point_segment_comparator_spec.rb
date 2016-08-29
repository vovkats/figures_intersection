require_relative '../spec_helper'

describe PointSegmentComparator do

  describe '.intersect' do
    let(:first_point) { Point.new(x: 2, y: 2) }
    let(:second_point) { Point.new(x: 3, y: 4) }
    let(:segment) { Segment.new(x: 2, y: 2, x1: 3, y1: 6) }
    let(:parallel_segment) { Segment.new(x: 2, y: 2, x1: 6, y1: 2) }
    let(:vertical_segment) { Segment.new(x: 2, y: 2, x1: 2, y1: 6) }

    context 'when segment is not Parallel Ox' do
      it 'returns Point when Point intersect with segment' do
        expect(PointSegmentComparator.intersect(point: first_point, segment: segment))
            .to eq(first_point)
      end

      it 'returns [] when Point doesn\'t intersect with segment' do
        expect(PointSegmentComparator.intersect(point: second_point, segment: segment))
            .to eq([])
      end
    end

    context 'when segment is Parallel Ox' do
      it 'returns Point when Point intersect with segment' do
        expect(PointSegmentComparator.intersect(point: first_point, segment: parallel_segment))
            .to eq(first_point)
      end

      it 'returns [] when Point doesn\'t intersect with segment' do
        expect(PointSegmentComparator.intersect(point: second_point, segment: parallel_segment))
            .to eq([])
      end
    end

    context 'when segment is vertical Ox' do
      it 'returns Point when Point intersect with segment' do
        expect(PointSegmentComparator.intersect(point: first_point, segment: vertical_segment))
            .to eq(first_point)
      end

      it 'returns [] when Point doesn\'t intersect with segment' do
        expect(PointSegmentComparator.intersect(point: second_point, segment: vertical_segment))
            .to eq([])
      end
    end
  end
end