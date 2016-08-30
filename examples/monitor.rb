require 'openai_gym'

env = OpenAI::Gym.new('CartPole-v0')
env.monitor_start('/tmp/cartpole-experiment-1')

20.times do |i_episode|
  observation = env.reset(:float)
  100.times do |t|
    env.render
    p observation.unpack("D*")
    action = env.action_space.sample
    observation, reward, done, info = env.step(action)
    if done
      puts "Episode finished after #{t+1} timesteps"
      break
    end
  end
end

env.monitor_close

