module Nulu

  class Body

    attr_reader   :world, :group, :id
    attr_reader   :shape
    attr_accessor :velocity, :mass, :friction
    attr_accessor :frictionless, :gravityless
    attr_accessor :normals

    def initialize(world:, group:, shape:, mass:, friction:, frictionless:, gravityless:)
      @world = world
      @group = group
      @id = world.add_body(self, group)

      @shape = shape
      @mass = Float(mass)
      @friction = Float(friction)
      @velocity = Nulu::Vector.new(0, 0)
      @frictionless = frictionless
      @gravityless = gravityless

      @normals = []
    end

    def width() @shape.width() end  
    def height() @shape.height() end
    def center() @shape.center() end
    def left() @shape.left() end
    def right() @shape.right() end
    def top() @shape.top() end
    def bottom() @shape.bottom() end
    def center=(new_center) @shape.center = new_center end
    def left=(new_left) @shape.left = new_left end
    def right=(new_right) @shape.right = new_right end
    def top=(new_top) @shape.top = new_top end
    def bottom=(new_bottom) @shape.bottom = new_bottom end
    def move(offset) @shape.move(offset) end
    def move_x(offset_x) @shape.move_x(offset_x) end
    def move_y(offset_y) @shape.move_y(offset_y) end

    # Heuristic to find the normal exerted from the floor
    def floor_normal
      floor_normal = Nulu::Point.new(0, 0)
      normals.each do |normal|
        if normal.y > floor_normal.y
          floor_normal = normal 
        end
      end
      return floor_normal
    end

  end
end
