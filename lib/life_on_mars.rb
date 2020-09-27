module LifeOnMars
  HOPPUS_MAJOR_SPECIMEN_NUMBER = 5.freeze
  HOPPUS_MAJOR = HoppusMajor
  require 'pry'

  def plant_number
    Kernel.const_get("LifeOnMars::#{@plant_name.gsub(' ', '_').upcase}_SPECIMEN_NUMBER")
  end

  def plant_class
    Kernel.const_get("LifeOnMars::#{@plant_name.gsub(' ', '_').upcase}")
  end

  def propogate(plant, terrain)
    case @plant_name
    when "Hoppus Major"
      terrain.seed_neighbouring_slots(plant)
    end
  end

  def iteract_with_neighbors(plant, terrain)
    case @plant_name
    when "Hoppus Major"
      if terrain.probe_neighbors(plant.x, plant.y).select{ |plant| plant }.length > 3
        plant.die!
      end
    end
  end
end
