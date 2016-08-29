module OpenAI
  
  class Gym

    module Spaces

      class Discrete

        def initialize(num)
          @array = Array.new(num){|i| i}
        end

        def sample
          @array.sample
        end

      end

    end

  end #Gym

end #OpenAI
