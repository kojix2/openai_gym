require 'test_helper'

class OpenaiGymTest < Minitest::Test
  def setup
    @env = OpenAI::Gym.new("Pong-v0")
  end

  def test_that_it_has_a_version_number
    refute_nil ::OpenaiGym::VERSION
  end

end
