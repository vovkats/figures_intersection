require_relative '../../spec_helper'

describe FiguresIntersection::StraightLineVerticalLineComparator do
  describe '.intersect' do
    it 'returns intersection point' do
      expect(
        described_class.intersect(
          straight_line: FiguresIntersection::StraightLine.new(k: 2, b: -1),
          vertical_line: FiguresIntersection::VerticalLine.new(a: 3)
        )
      ).to eq(FiguresIntersection::Point.new(x: 3, y: 5))
    end
  end
end
