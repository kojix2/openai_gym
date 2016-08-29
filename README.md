# OpenAI::Gym
[![Gem Version](https://badge.fury.io/rb/openai-gym-ruby.svg)](https://badge.fury.io/rb/openai-gym-ruby)

Simple [OpenAI Gym](https://gym.openai.com/) interface for Ruby using pipelines. (for fun, not for serious use)

## Instllation

* Install [OpenAI Gym](https://github.com/openai/gym)
* Install OpenAI::Gym

To install:
```shell
$ gem install openai-gym-ruby
```
To install from source:
```shell
$ git clone git://github.com/kojix2/openai_gym.git
$ cd openai_gym
$ rake build
$ rake install
```

## Usage
You can run a simulation using the following:

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

(But will you be interested in making a serious OpenAI Gym wrapper for Ruby?)

## Machine Learning in Ruby
A list of libraries that may be useful for creating your own AI.

* [Numo::NArray](https://github.com/ruby-numo/narray) - Ruby equivalent of NumPy
* [Numo::Linalg](https://github.com/ruby-numo/linalg) - Linear Algebra library with LAPACK
* [narray](https://github.com/masa16/narray) - Old but stable version of Numo::NArray
* [rb-libsvm](https://github.com/febeling/rb-libsvm) - Ruby language bindings for LIBSVM
* [liblinear-ruby](https://github.com/kei500/liblinear-ruby) - Liblinear-Ruby is Ruby interface of LIBLINEAR using SWIG.
* [iruby](https://github.com/SciRuby/iruby) - Ruby kernel for Jupyter/IPython Notebook
* [daru](https://github.com/v0dro/daru) - Data Analysis in RUby
* [Numo::Gnuplot](https://github.com/ruby-numo/gnuplot) - Gnuplot interface for Ruby
