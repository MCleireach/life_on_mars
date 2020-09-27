class SolanumVodkorium < Plant
  LIFE_SPAN = 20.freeze
  SPECIMEN_NUMBER = 15.freeze
  NEIGHBOUR_TOLERANCE = 4.freeze
  AIRBOURNE_SEED_NUMBER = 0.freeze
  CHANCE_OF_NEIGHBOURING_SEED = 0.2.freeze

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