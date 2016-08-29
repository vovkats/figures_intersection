require_relative '../spec_helper'


describe StraightLine do

  context 'when parameters is wrong' do
    it 'raises exception Figure::ValidateError' do
      expect { described_class.new(k: 'wrong', b: 'wrong')
      }.to raise_error(Figure::ValidateError, 'Parameters should be numeric for Straight Line')

      expect { described_class.new(k: 1, b: 'wrong')
      }.to raise_error(Figure::ValidateError, 'Parameters should be numeric for Straight Line')

      expect { described_class.new(k: 'wrong', b: 1)
      }.to raise_error(Figure::ValidateError, 'Parameters should be numeric for Straight Line')
    end
  end

  describe '#==' do
    it 'returns true when straight Lines are equal' do
      expect(StraightLine.new(k: 2, b: 3)).to eq(StraightLine.new(k: 2, b: 3))
    end

    it 'returns false when straight Lines are not equal' do
      expect(StraightLine.new(k: 2, b: 3)).to_not eq(StraightLine.new(k: 2, b: -3))
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