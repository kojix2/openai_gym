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
      @nptype = nil
      pyputs env_name
    end

    # Reset the environment
    def reset(nptype)
      @nptype = nptype.to_s
      pyputs "reset " << @nptype
      observation = get_observation
    end

    # Render the environment
    def render
      pyputs "render"
    end

    # Step function
    def step(action)
      case action
      when Fixnum
        pyputs "step discrete"
        pyputs action
        pyputs "END"
      when Array
        pyputs "step box"
        # Todo: Multidimensional Arrays
        pyputs action.pack("D*")
        pyputs "END"
      else
        raise "error #{action.class}"
      end
      observation = get_observation
      reward = readline.chomp.to_f
      done = (readline.chomp == "True")
      info = readline.chomp
      [observation, reward, done, info]
    end

    # action_space
    def action_space
      pyputs "action_space"
      string = readline.chomp
      if string[0..7] == "Discrete"
        num = string[9..-2].to_i
        Spaces::Discrete.new(num)
      else string[0..2] == "Box"
        puts string
        # Todo: Box
        # Todo: Spaces.create(Space) class method
      end
    end

    # observation_space
    def observation_space
      pyputs "observation_space"
      # provisional
      str = readline.chomp
      high = readline.chomp
      low = readline.chomp
      Spaces::Box.new(str, high, low)
    end


    private
    def pyputs(_command)
      @gym_stdin.puts(_command)
    end

    def readline
      @gym_stdout.readline
    end

    def get_observation
      obs_packed = ""
      # to ignore newline characters in binary data
      temp = ""
      until (temp = readline)=="END\n"
        obs_packed << temp
      end
      obs_packed.chomp!
      if Numo::NArray.defined?
        case @nptype
        when "uint8"
          Numo::UInt8.from_string(obs_packed)
        when "float"
          Numo::DFloat.from_string(obs_packed)
        else
          obs_packed
        end
      else
        obs_packed
      end
    end

  end

end #OpenAI
