# under development
module OpenAI
  
  class Gym

    module Spaces

      class Box 

        def initialize(str,high,low)
          @str = str
          @high = high
          @low = low
        end

        attr_reader :high, :low

        def to_s
          @str
        end

      end

    end

  end #Gym

end #OpenAI
