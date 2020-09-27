class AgavoideaeOrdinaris < Plant
  LIFE_SPAN = 5.freeze
  SPECIMEN_NUMBER = 10.freeze
  NEIGHBOUR_TOLERANCE = 1/0.0.freeze
  AIRBOURNE_SEED_NUMBER = 0.freeze
  CHANCE_OF_NEIGHBOURING_SEED = 0.1.freeze

  def age_one_day
    @age += 1
    if @age == LIFE_SPAN
      die!
    end
  end

  def seed_neighbouring_slot?
    a = rand(0.0...1)
    if a < CHANCE_OF_NEIGHBOURING_SEED
      true
    else
      false
    end
  end
end