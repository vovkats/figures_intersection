require_relative '../spec_helper'

describe PointStraightLineComparator do

  describe '.intersect' do
    let(:first_point) { Point.new(x: 2, y: 3) }
    let(:second_point) { Point.new(x: 2, y: 2) }
    let(:straight_line) { StraightLine.new(k: 2, b: -1) }

    it 'returns Point when Point intersect with straight line' do
      expect(PointStraightLineComparator.intersect(point: first_point, straight_line: straight_line))
          .to eq(first_point)
    end

    it 'returns [] when Point doesn\'t intersect with straight line' do
      expect(PointStraightLineComparator.intersect(point: second_point, straight_line: straight_line))
          .to eq([])
    end
  end
end