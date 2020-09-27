class TaraxacumVulgaris < Plant
  LIFE_SPAN = 15.freeze
  SPECIMEN_NUMBER = 10.freeze
  NEIGHBOUR_TOLERANCE = 6.freeze
  AIRBOURNE_SEED_NUMBER = 10.freeze
  CHANCE_OF_NEIGHBOURING_SEED = 0.freeze

  def age_one_day
    @age += 1
    if @age == LIFE_SPAN
      die!
    end
  end

  def seed_neighbouring_slot?
    false
  end
end