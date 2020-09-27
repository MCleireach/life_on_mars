class Terrain
  attr_reader :width, :height

  def initialize(width, height)
    @height = height
    @width = width
    @storage = {}
  end

  def empty(x, y)
    @storage[[x,y]] = nil
  end

  def seed(x, y, plant)
    @storage[[x,y]] = plant
    plant.place(x, y)
    plant
  end

  def random_seed(plant)
    x = rand(0..width)
    y = rand(0..height)
    seed(x, y, plant)
    plant.place(x, y)
    plant
  end

  def probe(x, y)
    @storage[[x,y]]
  end

  def probe_neighbors(x,y)
    neighbor_slots(x,y).map{ |n| probe(*n) }
  end

  def seed_neighbouring_slots(plant)
    neighbor_slots(plant.x, plant.y).each do |slot|
      if plant.seed_neighbouring_slot?
        seed(slot[0], slot[1], plant.class.new)
      end
    end
  end

  def each_slot
    (0..height).each do |y|
      (0..width).each do |x|
        yield probe(x,y)
      end
    end
  end

  def neighbor_slots(x, y)
    [].tap do |n|
      (-1..1).each do |x_diff|
        (-1..1).each do |y_diff|
          n << [x + x_diff, y + y_diff] unless x_diff == 0 && y_diff == 0
        end
      end
    end
  end
end
