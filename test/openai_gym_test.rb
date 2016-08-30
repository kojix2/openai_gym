require 'test_helper'

class OpenAIGymTest < Minitest::Test
  def setup
    @env = OpenAI::Gym.new("CartPole-v0")
  end

  def test_that_it_has_a_version_number
    refute_nil ::OpenAI::Gym::VERSION
  end

  def test_action_spaces
    assert_instance_of OpenAI::Gym::Spaces::Discrete, @env.action_space
  end

  def test_reset
    refute_nil @env.reset(:uint8)
  end

  def test_step_discrete
    refute_nil @env.step(1)
  end
end

class OpenAIGymSpacesDiscrete < Minitest::Test
  def setup
    @discrete = OpenAI::Gym::Spaces::Discrete.new(5)
  end

  def test_sample
    refute_nil  @discrete.sample
  end

  def test_to_s
    assert_equal "Discrete(5)", @discrete.to_s
  end
end

class OpenAIGymSpacesBox < Minitest::Test
  def setup
    @box = OpenAI::Gym::Spaces::Box.new("Sleeping cat", "10", "0")
  end

  def test_to_s
    assert_equal "Sleeping cat", @box.to_s
  end

  def test_high
    assert_equal "10", @box.high
  end

  def test_low
    assert_equal "0", @box.low
  end
end

class OpenAIGymSpacesBox2 < Minitest::Test
  def setup
    @env = OpenAI::Gym.new("CartPole-v0")
    @box = @env.observation_space
  end

  def test_to_s
    assert_equal "Box(4,)", @box.to_s
  end

  def test_high
    assert_equal "[  4.80000000e+00   3.40282347e+38   4.18879020e-01   3.40282347e+38]", @box.high
  end

  def test_low
    assert_equal "[ -4.80000000e+00  -3.40282347e+38  -4.18879020e-01  -3.40282347e+38]", @box.low
  end
end
