require_relative '../spec_helper'

describe StraightLineStraightLineComparator do

  describe '.intersect' do

    it 'returns line when straight lines are equal' do
      expect(StraightLine.new(k: 2, b: -1)
         .intersect(StraightLine.new(k: 2, b: -1)
        )
      ).to eq(StraightLine.new(k: 2, b: -1))
    end

    it 'returns [] when straight lines are parallel' do
      expect(StraightLine.new(k: 2, b: -1)
          .intersect(StraightLine.new(k: 2, b: -3)
        )
      ).to eq([])
    end

    it 'returns Point when straight lines have intersection' do
      expect(StraightLine.new(k: 2, b: -1)
          .intersect(StraightLine.new(k: 1, b: 1)
        )
      ).to eq(Point.new(x: 2, y: 3))
    end
  end
end