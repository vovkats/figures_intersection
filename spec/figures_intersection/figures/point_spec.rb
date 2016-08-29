require_relative '../../spec_helper'

describe FiguresIntersection::Point do
  context 'when parameters is wrong' do
    it 'raises exception Figure::ValidateError' do
      expect do
        described_class.new(x: 'wrong', y: 'wrong')
      end.to raise_error(FiguresIntersection::BaseFigure::ValidateError, 'Parameters should be numeric for Point')

      expect do
        described_class.new(x: 1, y: 'wrong')
      end.to raise_error(FiguresIntersection::BaseFigure::ValidateError, 'Parameters should be numeric for Point')

      expect do
        described_class.new(x: 'wrong', y: 1)
      end.to raise_error(FiguresIntersection::BaseFigure::ValidateError, 'Parameters should be numeric for Point')
    end
  end

  describe '#==' do
    it 'returns true when points are equal' do
      expect(described_class.new(x: 2, y: 3)).to eq(described_class.new(x: 2, y: 3))
    end

    it 'returns false when points are not equal' do
      expect(described_class.new(x: 2, y: 3)).not_to eq(described_class.new(x: 3, y: 2))
    end
  end

  describe 'getters' do
    it 'returns coord x' do
      x = 2
      point = described_class.new(x: x, y: 3)
      expect(point.x).to eq(x)
    end

    it 'returns coord y' do
      y = 3
      point = described_class.new(x: 2, y: 3)
      expect(point.y).to eq(y)
    end
  end
end
