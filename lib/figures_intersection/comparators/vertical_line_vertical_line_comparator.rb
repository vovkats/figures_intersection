class VerticalLineVerticalLineComparator

  def self.intersect(first_vertical_line:, second_vertical_line:)
    return first_vertical_line if first_vertical_line.a == second_vertical_line.a
    []
  end
end