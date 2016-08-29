module FiguresIntersection
  class Rectangle < Figure
    include RectangleIntersector

    attr_reader :x, :y, :x1, :y1

    def self.rectangles_contain_points?(first, second, point_first, point_second)
      first.include_point?(point_first) && first.include_point?(point_second) &&
        second.include_point?(point_first) && second.include_point?(point_second)
    end

    def initialize(x:, y:, x1:, y1:)
      @x = x
      @y = y
      @x1 = x1
      @y1 = y1
      super()
    end

    def ==(figure)
      top_left == figure.top_left && bottom_left == figure.bottom_left &&
        top_right == figure.top_right && bottom_right == figure.bottom_right
    end

    def top_left
      @top_left ||= { x: coords_x.min, y: coords_y.max }
    end

    def bottom_left
      @bottom_left ||= { x: coords_x.min, y: coords_y.min }
    end

    def top_right
      @top_right ||= { x: coords_x.max, y: coords_y.max }
    end

    def bottom_right
      @bottom_right ||= { x: coords_x.max, y: coords_y.min }
    end

    def include_point?(point)
      range_x?(point) && range_y?(point)
    end

    private

    def valid?
      x.is_a?(Numeric) && y.is_a?(Numeric) && x1.is_a?(Numeric) && y1.is_a?(Numeric) && x != x1 && y != y1
    end

    def error_message
      'Parameters should be numeric for Rectangle and coordinate should be placed by diagonal'
    end

    def first_point
      { x: x, y: y }
    end

    def second_point
      { x: x1, y: y1 }
    end

    def third_point
      { x: x, y: y1 }
    end

    def fourth_point
      { x: x1, y: y }
    end

    def coords_x
      [first_point[:x], second_point[:x], third_point[:x], fourth_point[:x]]
    end

    def coords_y
      [first_point[:y], second_point[:y], third_point[:y], fourth_point[:y]]
    end

    def range_x?(point)
      coords_x.min <= point.x && coords_x.max >= point.x
    end

    def range_y?(point)
      coords_y.min <= point.y && coords_y.max >= point.y
    end
  end
end