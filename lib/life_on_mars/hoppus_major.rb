class HoppusMajor < Plant
  LIFE_SPAN = 5.freeze
  SPECIMEN_NUMBER = 5.freeze

  def age_one_day
    @age += 1
    if @age == LIFE_SPAN
      die!
    end
  end

  def seed_neighbouring_slot?
    a = rand(0.0...1)
    if a > 0.5
      true
    else
      false
    end
  end
end