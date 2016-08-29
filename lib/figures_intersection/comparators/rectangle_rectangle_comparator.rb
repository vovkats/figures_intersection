module FiguresIntersection
  class RectangleRectangleComparator

    def self.intersect(first_rectangle:, second_rectangle:)
      x = [first_rectangle.top_left[:x], second_rectangle.top_left[:x]].max
      y = [first_rectangle.top_left[:y], second_rectangle.top_left[:y]].min

      x1 = [first_rectangle.bottom_right[:x], second_rectangle.bottom_right[:x]].min
      y1 = [first_rectangle.bottom_right[:y], second_rectangle.bottom_right[:y]].max

      first_point = Point.new(x: x, y: y)
      second_point = Point.new(x: x1, y: y1)

      if Rectangle.rectangles_contain_points?(first_rectangle, second_rectangle, first_point, second_point)
        if first_point == second_point
          first_point
        elsif x != x1 && y != y1
          Rectangle.new(x: x, y: y, x1: x1, y1: y1)
        else
          Segment.new(x: first_point.x, y: first_point.y, x1: second_point.x, y1: second_point.y)
        end
      else
        []
      end
    end
  end
end