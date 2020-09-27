class TaraxacumVulgaris < Plant
  LIFE_SPAN = 15.freeze
  SPECIMEN_NUMBER = 10.freeze
  NEIGHBOUR_TOLERANCE = 6

  def age_one_day
    @age += 1
    if @age == LIFE_SPAN
      die!
    end
  end
end