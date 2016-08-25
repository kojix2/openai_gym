module  OpenAI

  class Gym
    def initialize(env_name)
      gym_py_path = File.expand_path('../pygym.py', __FILE__)
      @gym_stdin, @gym_stdout = Open3.popen2('python', '-u', gym_py_path)
      pyputs env_name
    end

    def action_space
      pyputs "action_space"
    end

    def reset(nptype)
      pyputs "reset " << nptype.to_s
      observation = get_observation
    end

    def render
      pyputs "render"
    end

    def step(action)
      pyputs "step #{action.to_i}"
      observation = get_observation
      reward = readline
      done = readline.chomp == "True"
      [observation, reward, done]
    end

    private
    def pyputs(_command)
      @gym_stdin.puts(_command)
    end

    def readline
      @gym_stdout.readline
    end
    
    def get_observation
      observation = ""
      temp = ""
      until (temp = readline)=="END\n"
        observation << temp
      end
      observation.chomp
    end
  end

end #OpenAI
