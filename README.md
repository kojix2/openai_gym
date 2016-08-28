# OpenAI::Gym

Simple [OpenAI Gym](https://gym.openai.com/) interface for Ruby using pipelines.

You can run an simulation using the following:

```ruby
require 'openai_gym'

env = OpenAI::Gym.new("Pong-v0")
env.reset(:uint8)

loop do
  env.render
  a = [1,2,3].sample
  observation, reward, done = env.step(a)
  if done
    env.reset(:uint8)
  end
end
```
