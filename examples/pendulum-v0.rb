require 'openai_gym'

env = OpenAI::Gym.new("Pendulum-v0")

env.reset(:float)
puts env.action_space

loop do
  env.render
  a = [2 * rand - 1.0]
  observation, reward, done = env.step(a)
  p observation.unpack("D*")
  if done
    env.reset(:float)
  end
end
