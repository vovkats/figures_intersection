module FiguresIntersection
  class Point < BaseFigure
    include FiguresIntersection::PointIntersector
    attr_reader :x, :y

    def self.uniq(points)
      points.uniq { |p| p.x.to_f && p.y.to_f }
    end

    def initialize(x:, y:)
      @x = x
      @y = y
      super()
    end

    def ==(point)
      x == point.x && y == point.y
    end

    private

    def valid?
      x.is_a?(Numeric) && y.is_a?(Numeric)
    end

    def error_message
      'Parameters should be numeric for Point'
    end
  end
end