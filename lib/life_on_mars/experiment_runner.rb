require 'life_on_mars/terrain'
require 'life_on_mars/plant'
require 'life_on_mars/plants/hoppus_major'
require 'life_on_mars/plants/taraxacum_vulgaris'
require 'life_on_mars/plants/solanum_vodkorium'
require 'life_on_mars/plants/laurus_nobilis'
require 'life_on_mars/plants/agavoideae_ordinaris'
require 'life_on_mars'

class ExperimentRunner
  include LifeOnMars

  def initialize(plant_name, iterations, renderer)
    @plants = []
    @plant_name = plant_name
    @iterations = iterations
    @renderer = renderer
  end

  def run
    terrain = Terrain.new(80, 50)

    plant_number.times do
      terrain.random_seed(plant_class.new)
    end

    @iterations.times do |iteration|
      terrain.each_slot do |plant|
        if plant && plant.alive?
          if plant.age > 0
            propogate(plant, terrain)
          end
          iteract_with_neighbors(plant, terrain)
          plant.age_one_day
        end
      end

      @renderer.render terrain, @plant_name, iteration
    end
  end
end
