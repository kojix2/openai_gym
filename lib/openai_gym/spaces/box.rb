module OpenAI
  
  class Gym

    module Spaces

      class Box 

        # Box(-1.0, 1.0, [3,4]) # low and high are scalars, and shape
        # Box(
        def initialize(num, low, high, shape)
          @array = Array.new(num){|i| i}
        end

        def sample
          @array.sample
        end

      end

    end

  end #Gym

end #OpenAI
