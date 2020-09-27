module LifeOnMars
  HOPPUS_MAJOR = HoppusMajor
  TARAXACUM_VULGARIS = TaraxacumVulgaris

  def plant_number
    Kernel.const_get("LifeOnMars::#{plant_class}::SPECIMEN_NUMBER")
  end

  def plant_class
    Kernel.const_get("LifeOnMars::#{@plant_name.gsub(' ', '_').upcase}")
  end

  def propogate(plant, terrain)
    case @plant_name
    when "Taraxacum Vulgaris"
      taraxacum_propogate(plant, terrain)
    when "Hoppus Major"
      hoppus_major_propogate(plant, terrain)
    end
  end

  def iteract_with_neighbors(plant, terrain)
    case @plant_name
    when "Taraxacum Vulgaris"
      traxacum_interact(plant, terrain)
    when "Hoppus Major"
      hoppus_major_interact(plant, terrain)
    end
  end

  private

  def taraxacum_propogate(plant, terrain)
    if (plant.age > 0 && plant.age % 2)
      5.times do
        terrain.random_seed(plant.class.new)
      end
    end
  end

  def hoppus_major_propogate(plant, terrain)
    terrain.seed_neighbouring_slots(plant)
  end

  def traxacum_interact(plant, terrain)
    if plant.alive?
      if terrain.probe_neighbors(plant.x, plant.y).select{ |plant| plant }.length > 6
        plant.die!
      end
    else
      if terrain.probe_neighbors(plant.x, plant.y).select{ |plant| plant && plant.alive? }.length > 2
        plant.live!
      end
    end
  end

  def hoppus_major_interact(plant, terrain)
    if terrain.probe_neighbors(plant.x, plant.y).select{ |plant| plant }.length > 3
      plant.die!
    end
  end
end
