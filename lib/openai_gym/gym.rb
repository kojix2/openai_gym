module  OpenAI

  class Gym
    def initialize(env_name)
      @gym_stdin, @gym_stdout = Open3.popen2('python', '-u', 'gym.py')
    end

    def reset
      puts("reset")
    end

    def render
      puts("render")
    end

    def step(action)
      puts(action)
      observation = readline
      reward = readline.to_f
      done = (readline == "True")
      info = readline
      [observation, reward, done, info]
    end

    private
    def puts(_command)
      @gym_stdin.puts(_command)
    end

    def readline
      @gym_stdout.readline.chomp
    end
  end

end #OpenAI
