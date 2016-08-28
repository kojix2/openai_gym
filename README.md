# OpenAI::Gym

Simple [OpenAI Gym](https://gym.openai.com/) interface for Ruby using pipelines. (for fun, not for serious use)

## Instllation

* Install [OpenAI Gym](https://github.com/openai/gym)
* Install OpenAI::Gym
```shell
git clone git://github.com/kojix2/openai_gym.git
cd openai_gym
rake build
rake install
```

## Usage
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

## Contributing
Pull Requests are always welcome.
(But will you be interested in making serious OpenAI Gym wrapper for Ruby?)
