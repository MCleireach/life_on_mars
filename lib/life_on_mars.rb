module LifeOnMars
  HOPPUS_MAJOR = HoppusMajor
  TARAXACUM_VULGARIS = TaraxacumVulgaris
  SOLANUM_VODKORIUM = SolanumVodkorium

  def plant_number
    Kernel.const_get("LifeOnMars::#{plant_class}::SPECIMEN_NUMBER")
  end

  def neighbour_tolerance
    Kernel.const_get("LifeOnMars::#{plant_class}::NEIGHBOUR_TOLERANCE")
  end

  def plant_class
    Kernel.const_get("LifeOnMars::#{@plant_name.gsub(' ', '_').upcase}")
  end

  def propogate(plant, terrain)
    case @plant_name
    when "Taraxacum Vulgaris"
      taraxacum_propogate(plant, terrain)
    else
      terrain.seed_neighbouring_slots(plant)
    end
  end

  def iteract_with_neighbors(plant, terrain)
    case @plant_name
    when "Taraxacum Vulgaris"
      traxacum_interact(plant, terrain)
    else
      if too_many_neighbours(terrain, plant)
        plant.die!
      end
    end
  end

  private

  def too_many_neighbours(terrain, plant)
    terrain.probe_neighbors(plant.x, plant.y).select{ |plant| plant }.length > neighbour_tolerance
  end

  def taraxacum_propogate(plant, terrain)
    if (plant.age > 0 && plant.age % 2)
      5.times do
        terrain.random_seed(plant.class.new)
      end
    end
  end

  def traxacum_interact(plant, terrain)
    if plant.alive?
      if too_many_neighbours(terrain, plant)
        plant.die!
      end
    else
      if terrain.probe_neighbors(plant.x, plant.y).select{ |plant| plant && plant.alive? }.length > 2
        plant.live!
      end
    end
  end
end
