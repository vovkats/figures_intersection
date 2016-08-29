require_relative '../spec_helper'

describe VerticalLineVerticalLineComparator do

  describe '.intersect' do
    it 'returns vertical line when vertical lines have intersection' do
      expect(VerticalLine.new(a: 2)
         .intersect(VerticalLine.new(a: 2)
         )
      ).to eq(VerticalLine.new(a: 2))
    end

    it 'returns [] when vertical lines don\'t have intersection' do
      expect(VerticalLine.new(a: 2)
         .intersect(VerticalLine.new(a: 3)
         )
      ).to eq([])
    end
  end
end