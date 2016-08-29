require_relative '../spec_helper'


describe VerticalLine do

  context 'when parameters is wrong' do
    it 'raises exception Figure::ValidateError' do
      expect { described_class.new(a: 'wrong')
      }.to raise_error(Figure::ValidateError, 'Parameters should be numeric for VerticalLine')
    end
  end

  describe '#==' do
    it 'returns true when vertical lines are equal' do
      expect(described_class.new(a: 2)).to eq(described_class.new(a: 2))
    end

    it 'returns false when vertical lines are not equal' do
      expect(described_class.new(a: 2)).to_not eq(described_class.new(a: 3))
    end
  end

  describe 'getters' do
    it 'returns parameter a' do
      expect(described_class.new(a: 2).a).to eq(2)
    end
  end
end