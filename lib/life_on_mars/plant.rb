class Plant
  ALIVE = :alive
  DEAD = :dead

  attr_accessor :status, :age, :x, :y

  def initialize(status = ALIVE)
    @status = status
    @age = 0
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
