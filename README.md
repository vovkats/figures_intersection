# FiguresIntersection

Purpose of this gem is finding of intersection different figures.

Available Figures
* Point
* Straight Line y = k*x+b
* Vertical line x = a
* Segment (need to set coords of ends)
* Rectangle (given the coordinates of its two diagonally opposite vertices)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'figures_intersection', git: 'git@github.com:vovkats/figures_intersection.git'
```

And then execute:

    $ bundle

then require gem: 

```ruby
require 'figures_intersection'
```

## Usage

### Available figures

```ruby
  FiguresIntersection::Point
```

```ruby
  FiguresIntersection::Rectangle
```

```ruby
  FiguresIntersection::Segment
```

```ruby
  FiguresIntersection::StraightLine
```

```ruby
  FiguresIntersection::VerticalLine
```
    
### Example

####Create new Figure
```ruby
  # Create point (1, 2)
  FiguresIntersection::Point.new(x: 1, y: 2)
  # Create Rectangle. Need to set diagonal coordinates
  FiguresIntersection::Rectangle.new(x: 1, y: 1, x1: 5, y1: 6)
  # Create segment 
  FiguresIntersection::Segment.new(x: 1, y: 2, x1: 5, y1: 6)
  # Create Straight Line y = 2x - 1
  FiguresIntersection::StraightLine.new(k: 2, b: -1)
  # Create vertical Line with a = 2
  FiguresIntersection::VerticalLine.new(a: 2)
```

#### Find Intersection

For finding intersection need to call "intersect" method on figure and pass another figure as parameter 
```ruby
  # Intersection Point with other Point
  FiguresIntersection::Point.new(x: 1, y: 2).intersect(FiguresIntersection::Point.new(x: 1, y: 2))
  # => #<FiguresIntersection::Point:0x00556a51f9b350 @x=1, @y=2>
  
  # When figures have not intersection
  FiguresIntersection::Point.new(x: 1, y: 2).intersect(FiguresIntersection::Point.new(x: 1, y: 1))
  # => []
  
  # Intersection Rectanle with Segment
  FiguresIntersection::Rectangle.new(x: 1, y: 1, x1: 5, y1: 6).intersect(FiguresIntersection::Segment.new(x: 1, y: 1, x1: 3, y1: 3))
  # => #<FiguresIntersection::Segment:0x00556a5200d4a0 @x=1.0, @y=1.0, @x1=3, @y1=3>
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/vovkats/figures_intersection.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

