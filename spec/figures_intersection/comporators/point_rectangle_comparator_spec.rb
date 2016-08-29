require_relative '../../spec_helper'

describe FiguresIntersection::PointRectangleComparator do
  describe '.intersect' do
    let(:first_point) { FiguresIntersection::Point.new(x: 2, y: 3) }
    let(:second_point) { FiguresIntersection::Point.new(x: 20, y: 3) }
    let(:rectangle) { FiguresIntersection::Rectangle.new(x: 1, y: 1, x1: 5, y1: 5) }

    it 'returns Point when intersect with rectangle' do
      expect(described_class.intersect(point: first_point, rectangle: rectangle))
        .to eq(first_point)
    end

    it 'returns [] when Point doesn\'t intersect with rectangle' do
      expect(described_class.intersect(point: second_point, rectangle: rectangle))
        .to eq([])
    end
  end
end
