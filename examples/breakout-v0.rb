require 'openai_gym'

env = OpenAI::Gym.new("Breakout-v0")

env.reset(:uint8)

loop do
  env.render
  a = [*0..5].sample
  observation, reward, done = env.step(a)
  if done
    env.reset(:uint8)
  end
end
