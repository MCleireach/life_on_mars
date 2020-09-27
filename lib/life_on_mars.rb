module LifeOnMars
  HOPPUS_MAJOR = HoppusMajor
  TARAXACUM_VULGARIS = TaraxacumVulgaris
  SOLANUM_VODKORIUM = SolanumVodkorium
  LAURUS_NOBILIS = LaurusNobilis
  AGAVOIDEAE_ORDINARIS = AgavoideaeOrdinaris

  def propogate(plant, terrain)
    case @plant_name
    when "Taraxacum Vulgaris"
      taraxacum_propogate(plant, terrain)
    else
      airbourne_seed(plant, terrain)
      terrain.seed_neighbouring_slots(plant)
    end
  end

  def iteract_with_neighbors(plant, terrain)
    case @plant_name
    when "Taraxacum Vulgaris"
      traxacum_interact(plant, terrain)
    when "Agavoideae Ordinaris"
      agavoideae_interact(plant, terrain)
    else
      if too_many_neighbours(terrain, plant)
        plant.die!
      end
    end
  end

  private

  def plant_number
    Kernel.const_get("LifeOnMars::#{plant_class}::SPECIMEN_NUMBER")
  end

  def airbourne_seed_number
    Kernel.const_get("LifeOnMars::#{plant_class}::AIRBOURNE_SEED_NUMBER")
  end

  def neighbour_tolerance
    Kernel.const_get("LifeOnMars::#{plant_class}::NEIGHBOUR_TOLERANCE")
  end

  def plant_class
    Kernel.const_get("LifeOnMars::#{@plant_name.gsub(' ', '_').upcase}")
  end

  def airbourne_seed(plant, terrain)
    airbourne_seed_number.times do
      terrain.random_seed(plant.class.new)
    end
  end

  def too_many_neighbours(terrain, plant)
    terrain.probe_neighbors(plant.x, plant.y).select{ |plant| plant }.length > neighbour_tolerance
  end

  def taraxacum_propogate(plant, terrain)
    if (plant.age > 0 && plant.age % 2)
      airbourne_seed(plant, terrain)
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

  def agavoideae_interact(plant, terrain)
    if terrain.probe_neighbors(plant.x, plant.y).select{ |plant| plant && plant.alive? }.length > 1
      plant.live!
    end
  end
end
