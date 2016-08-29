require 'openai_gym'

env = OpenAI::Gym.new("Pendulum-v0")

env.reset(:float)
puts env.action_space

loop do
  env.render
  a = [rand]

  observation, reward, done = env.step(a)
  if done
    env.reset(:float)
  end
end
