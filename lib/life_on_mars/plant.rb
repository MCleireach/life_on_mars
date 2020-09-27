class Plant
  ALIVE = :alive
  DEAD = :dead

  attr_accessor :status, :age, :x, :y

  def initialize(status = ALIVE)
    @status = status
    @age = 0
  end

  def age_one_day
    raise "Implement on subclass"
  end

  def seed_neighbouring_slot?
    raise "Implement on subclass"
  end

  def place(x, y)
    @x = x
    @y = y
  end

  def alive?
    @status == ALIVE
  end

  def dead?
    @status == DEAD
  end

  def die!
    @status = DEAD
  end

  def live!
    @status = ALIVE
  end
end
