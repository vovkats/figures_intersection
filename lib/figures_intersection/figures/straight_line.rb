module FiguresIntersection
  class StraightLine < Figure
    include StraightLineIntersector
    attr_reader :k, :b

    def initialize(k:, b:)
      @k = k
      @b = b
      super()
    end

    def ==(straight_line)
      k == straight_line.k && b == straight_line.b
    end

    private

    def valid?
      k.is_a?(Numeric) && b.is_a?(Numeric)
    end

    def error_message
      'Parameters should be numeric for Straight Line'
    end
  end
end