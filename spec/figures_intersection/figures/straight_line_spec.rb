require_relative '../../spec_helper'

describe FiguresIntersection::StraightLine do
  context 'when parameters is wrong' do
    it 'raises exception Figure::ValidateError' do
      expect do
        described_class.new(k: 'wrong', b: 'wrong')
      end.to raise_error(FiguresIntersection::BaseFigure::ValidateError, 'Parameters should be numeric for Straight Line')

      expect do
        described_class.new(k: 1, b: 'wrong')
      end.to raise_error(FiguresIntersection::BaseFigure::ValidateError, 'Parameters should be numeric for Straight Line')

      expect do
        described_class.new(k: 'wrong', b: 1)
      end.to raise_error(FiguresIntersection::BaseFigure::ValidateError, 'Parameters should be numeric for Straight Line')
    end
  end

  describe '#==' do
    it 'returns true when straight Lines are equal' do
      expect(described_class.new(k: 2, b: 3))
        .to eq(described_class.new(k: 2, b: 3))
    end

    it 'returns false when straight Lines are not equal' do
      expect(described_class.new(k: 2, b: 3))
        .not_to eq(described_class.new(k: 2, b: -3))
    end
  end

  describe 'getters' do
    let(:straight_line) { described_class.new(k: 2, b: 3) }

    it 'returns parameter k' do
      expect(straight_line.k).to eq(2)
    end

    it 'returns parameter b' do
      expect(straight_line.b).to eq(3)
    end
  end
end
