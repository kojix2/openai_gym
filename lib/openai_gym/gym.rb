module  OpenAI

  class Gym

    # kill subprocess
    # when Gym object is to be destroyed by garbage collection
    # to prevent CPU usage 100% (python zombie process)
    def Gym.kill_subprocess(wait_thread)
      proc {
        Process.kill("KILL", wait_thread.pid)
      }
    end

    # Making an environment
    def initialize(env_name)
      gym_py_path = File.expand_path('../pygym.py', __FILE__)
      @gym_stdin, @gym_stdout, wait_thread = Open3.popen2('python', '-u', gym_py_path)
      ObjectSpace.define_finalizer(self, Gym.kill_subprocess(wait_thread))
      pyputs env_name
    end

    # action_space
    def action_space
      pyputs "action_space"
    end

    # Reset the environment
    def reset(nptype)
      pyputs "reset " << nptype.to_s
      observation = get_observation
    end

    # Render the environment
    def render
      pyputs "render"
    end

    # Step function
    # reterns only three value. No info.
    def step(action)
      pyputs "step #{action.to_i}"
      observation = get_observation
      reward = readline.chomp.to_f
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
      # to ignore newline characters in binary data
      temp = ""
      until (temp = readline)=="END\n"
        observation << temp
      end
      observation.chomp
    end
  end

end #OpenAI
