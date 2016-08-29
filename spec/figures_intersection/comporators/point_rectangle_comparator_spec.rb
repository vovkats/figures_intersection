require_relative '../spec_helper'

describe PointRectangleComparator do

  describe '.intersect' do
    let(:first_point) { Point.new(x: 2, y: 3) }
    let(:second_point) { Point.new(x: 20, y: 3) }
    let(:rectangle) { Rectangle.new(x: 1, y: 1, x1: 5, y1: 5) }

    it 'returns Point when intersect with rectangle' do
      expect(PointRectangleComparator.intersect(point: first_point, rectangle: rectangle))
          .to eq(first_point)
    end

    it 'returns [] when Point doesn\'t intersect with rectangle' do
      expect(PointRectangleComparator.intersect(point: second_point, rectangle: rectangle))
          .to eq([])
    end
  end
end