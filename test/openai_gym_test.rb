require 'test_helper'

class OpenAIGymTest < Minitest::Test
  def setup
    @env = OpenAI::Gym.new("Pong-v0")
  end

  def test_that_it_has_a_version_number
    refute_nil ::OpenAI::Gym::VERSION
  end

  def test_action_spaces
    assert_instance_of OpenAI::Gym::Spaces::Discrete, @env.action_space
  end
end
