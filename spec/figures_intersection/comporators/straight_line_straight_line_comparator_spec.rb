require_relative '../../spec_helper'

describe FiguresIntersection::StraightLineStraightLineComparator do
  describe '.intersect' do
    it 'returns line when straight lines are equal' do
      expect(
        described_class.intersect(
          first_straight_line: FiguresIntersection::StraightLine.new(k: 2, b: -1),
          second_straight_line: FiguresIntersection::StraightLine.new(k: 2, b: -1)
        )
      ).to eq(FiguresIntersection::StraightLine.new(k: 2, b: -1))
    end

    it 'returns [] when straight lines are parallel' do
      expect(
        described_class.intersect(
          first_straight_line: FiguresIntersection::StraightLine.new(k: 2, b: -1),
          second_straight_line: FiguresIntersection::StraightLine.new(k: 2, b: -3)
        )
      ).to eq([])
    end

    it 'returns Point when straight lines have intersection' do
      expect(
        described_class.intersect(
          first_straight_line: FiguresIntersection::StraightLine.new(k: 2, b: -1),
          second_straight_line: FiguresIntersection::StraightLine.new(k: 1, b: 1)
        )
      ).to eq(FiguresIntersection::Point.new(x: 2, y: 3))
    end
  end
end
