require 'openai_gym'

env = OpenAI::Gym.new("CartPole-v0")

env.reset(:float)

loop do
  env.render
  a = [0,1].sample
  observation, reward, done = env.step(a)
  p observation.unpack("D*")
  if done
    env.reset(:float)
  end
end
