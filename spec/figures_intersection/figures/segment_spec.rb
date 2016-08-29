require_relative '../../spec_helper'

describe FiguresIntersection::Segment do
  context 'when parameters is wrong' do
    it 'raises exception Figure::ValidateError' do
      expect do
        described_class.new(x: 'wrong', y: 'wrong', x1: 1, y1: 1)
      end.to raise_error(FiguresIntersection::BaseFigure::ValidateError, 'Parameters should be numeric for Segment')

      expect do
        described_class.new(x: 1, y: 'wrong', x1: 2, y1: 1)
      end.to raise_error(FiguresIntersection::BaseFigure::ValidateError, 'Parameters should be numeric for Segment')
    end
  end

  describe '#==' do
    it 'returns true when segment are equal' do
      expect(described_class.new(x: 2, y: 3, x1: 5, y1: 6))
        .to eq(described_class.new(x: 2, y: 3, x1: 5, y1: 6))
    end

    it 'returns false when segment are not equal' do
      expect(described_class.new(x: 2, y: 3, x1: 21, y1: 6))
        .not_to eq(described_class.new(x: 2, y: 3, x1: 5, y1: 6))
    end
  end

  describe 'coords' do
    let(:segment) { described_class.new(x: 2, y: 3, x1: 21, y1: 6) }

    it do
      expect(segment.first_point).to eq(FiguresIntersection::Point.new(x: 2, y: 3))
      expect(segment.second_point).to eq(FiguresIntersection::Point.new(x: 21, y: 6))
    end
  end

  describe '#include_point?' do
    let(:segment) { described_class.new(x: 2, y: 3, x1: 21, y1: 6) }

    it 'returns true when Point is in segment' do
      expect(segment.include_point?(FiguresIntersection::Point.new(x: 2, y: 3))).to be_truthy
    end

    it 'returns false when Point isn\'t in segment' do
      expect(segment.include_point?(FiguresIntersection::Point.new(x: 2, y: -5))).to be_falsey
    end
  end

  describe '#to_straight_line' do
    it 'returns exception Segment::ConvertError when segment is vertical line' do
      expect { described_class.new(x: 2, y: 3, x1: 2, y1: 6).to_straight_line }
        .to raise_error(FiguresIntersection::Segment::ConvertError, 'Can not to convert to straight line')
    end

    it 'returns false when Point isn\'t in segment' do
      expect(described_class.new(x: 1, y: 1, x1: 3, y1: 5).to_straight_line)
        .to eq(FiguresIntersection::StraightLine.new(k: 2, b: -1))
    end
  end
end
