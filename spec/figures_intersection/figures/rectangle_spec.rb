require_relative '../spec_helper'


describe Rectangle do

  context 'when parameters is wrong' do
    it 'raises exception Figure::ValidateError' do
      expect { described_class.new(x: '1', y: '1', x1: 2, y1: 4 )
        }.to raise_error(Figure::ValidateError,
          'Parameters should be numeric for Rectangle and coordinate should be placed by diagonal'
      )

      expect { described_class.new(x: 1, y: 1, x1: 1, y1: 2)
        }.to raise_error(Figure::ValidateError,
          'Parameters should be numeric for Rectangle and coordinate should be placed by diagonal'
      )

      expect { described_class.new(x: 1, y: 1, x1: 2, y1: 1)
        }.to raise_error(Figure::ValidateError,
          'Parameters should be numeric for Rectangle and coordinate should be placed by diagonal'
      )
    end
  end

  describe '#==' do
    it 'returns true when rectangle are equal' do
      expect(described_class.new(x: 2, y: 3, x1: 5, y1: 5))
        .to eq(described_class.new(x: 5, y: 5, x1: 2, y1: 3))
    end

    it 'returns false when rectangle are not equal' do
      expect(described_class.new(x: 2, y: 3, x1: 5, y1: 5))
        .to_not eq(described_class.new(x: 2, y: 3, x1: 5, y1: 8))
    end
  end

  describe 'coords' do
    let(:rectangle) { described_class.new(x: 1, y: 1, x1: 4, y1: 4)}

    it do
      expect(rectangle.top_left).to eq({x: 1, y: 4})
      expect(rectangle.top_right).to eq({x: 4, y: 4})
      expect(rectangle.bottom_left).to eq({x: 1, y: 1})
      expect(rectangle.bottom_right).to eq({x: 4, y: 1})
    end
  end

  describe '#include_point?' do
    let(:rectangle) { described_class.new(x: 1, y: 1, x1: 4, y1: 4)}

    it 'returns true when Point is in rectangle' do
      expect(rectangle.include_point?(Point.new(x: 1, y: 2))).to be_truthy
    end

    it 'returns false when Point isn\'t in rectangle' do
      expect(rectangle.include_point?(Point.new(x: 5, y: 5))).to be_falsey
    end
  end
end