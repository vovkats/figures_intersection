require_relative '../spec_helper'

describe StraightLineVerticalLineComparator do

  describe '.intersect' do

    it 'returns intersection point' do
      expect(StraightLine.new(k: 2, b: -1)
         .intersect(VerticalLine.new(a: 3)
        )
      ).to eq(Point.new(x: 3, y: 5))
    end
  end
end