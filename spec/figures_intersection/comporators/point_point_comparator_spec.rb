require_relative '../../spec_helper'

describe FiguresIntersection::PointPointComparator do
  describe '.intersect' do
    let(:first_point) { FiguresIntersection::Point.new(x: 2, y: 3) }
    let(:second_point) { FiguresIntersection::Point.new(x: 2, y: 3) }
    let(:third_point) { FiguresIntersection::Point.new(x: 20, y: 3) }

    it 'returns Point when point is equal' do
      expect(described_class.intersect(first_point: first_point, second_point: second_point))
        .to eq(first_point)
    end

    it 'returns []  when point is not equal' do
      expect(described_class.intersect(first_point: third_point, second_point: second_point))
        .to eq([])
    end
  end
end
