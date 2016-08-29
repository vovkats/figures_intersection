require_relative '../../spec_helper'

describe FiguresIntersection::VerticalLineVerticalLineComparator do
  describe '.intersect' do
    it 'returns vertical line when vertical lines have intersection' do
      expect(
        described_class.intersect(
          first_vertical_line: FiguresIntersection::VerticalLine.new(a: 2),
          second_vertical_line: FiguresIntersection::VerticalLine.new(a: 2)
        )
      ).to eq(FiguresIntersection::VerticalLine.new(a: 2))
    end

    it 'returns [] when vertical lines don\'t have intersection' do
      expect(
        described_class.intersect(
          first_vertical_line: FiguresIntersection::VerticalLine.new(a: 2),
          second_vertical_line: FiguresIntersection::VerticalLine.new(a: 3)
        )
      ).to eq([])
    end
  end
end
