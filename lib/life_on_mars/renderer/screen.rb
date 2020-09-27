module Renderer
  class Screen
    EMPTY = " "
    ALIVE = "O"
    DEAD = "x"

    def initialize(refresh_interval = 1)
      @refresh_interval = refresh_interval
    end

    def render(terrain, plant_name, iteration)
      clear_screen
      print_header plant_name, iteration, terrain.width
      print_terrain terrain
      sleep @refresh_interval
    end

    private

    def print_header(plant_name, iteration, width)
      print "LIFE ON MARS - #{plant_name}, Generation #{iteration + 1} \n"
      width.times { print "=" }
      print "\n"
    end

    def print_terrain(terrain)
      output  = ""
      (0...terrain.height).each do |y|
        (0...terrain.width).each do |x|
          output << render_plant(terrain.probe(x, y))
          output << "\n" if edge?(terrain, x)
        end
      end

      print output
    end

    def render_plant(plant)
      return EMPTY unless plant

      plant.alive? ? ALIVE : DEAD
    end

    def edge?(terrain, x)
      x == terrain.width - 1
    end

    def clear_screen
      print "\e[H\e[2J"
    end
  end
end
