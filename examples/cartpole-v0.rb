require 'openai_gym'

env = OpenAI::Gym.new("CartPole-v0")

NPTYPE = :float

env.reset(NPTYPE)

loop do
  env.render
  a = [0,1].sample
  observation, reward, done = env.step(a)
  p observation.unpack("D*")
  p done
  if done
    env.reset(NPTYPE)
  end
end
