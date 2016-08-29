require_relative '../spec_helper'


describe Point do

  context 'when parameters is wrong' do
    it 'raises exception Figure::ValidateError' do
      expect { described_class.new(x: 'wrong', y: 'wrong')
        }.to raise_error(Figure::ValidateError, 'Parameters should be numeric for Point')

      expect { described_class.new(x: 1, y: 'wrong')
        }.to raise_error(Figure::ValidateError, 'Parameters should be numeric for Point')

      expect { described_class.new(x: 'wrong', y: 1)
      }.to raise_error(Figure::ValidateError, 'Parameters should be numeric for Point')
    end
  end

  describe '#==' do
    it 'returns true when points are equal' do
      expect(described_class.new(x: 2, y: 3)).to eq(described_class.new(x: 2, y: 3))
    end

    it 'returns false when points are not equal' do
      expect(described_class.new(x: 2, y: 3)).to_not eq(described_class.new(x: 3, y: 2))
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