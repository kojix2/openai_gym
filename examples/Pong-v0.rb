require 'openai_gym'

env = OpenAI::Gym.new("Pong-v0")

env.reset(:uint8)

loop do
  env.render
  a = [1,2,3].sample
  observation, reward, done = env.step(a)
  #p observation.unpack("C*")[1..10]
  if done
    env.reset(:uint8)
  end
end
