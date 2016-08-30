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

        def to_s
          "Discrete(#{@array.size})"
        end
      end

    end

  end #Gym

end #OpenAI
