require_relative '../../spec_helper'

describe FiguresIntersection::PointVerticalLineComparator do
  describe '.intersect' do
    let(:first_point) { FiguresIntersection::Point.new(x: 2, y: 3) }
    let(:second_point) { FiguresIntersection::Point.new(x: 3, y: 2) }
    let(:vertical_line) { FiguresIntersection::VerticalLine.new(a: 2) }

    it 'returns Point when intersect with vertical line' do
      expect(described_class.intersect(point: first_point, vertical_line: vertical_line))
        .to eq(first_point)
    end

    it 'returns [] when doesn\'t intersect with vertical line' do
      expect(described_class.intersect(point: second_point, vertical_line: vertical_line))
        .to eq([])
    end
  end
end
