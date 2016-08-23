require 'openai_gym'

env = OpenAI::Gym.make("Pong-v0")

observation = env.reset

loop do
  a = [2,3].sample
  observation, reward, done, info = env.step(a)

  if done
    env.reset
  end
end
