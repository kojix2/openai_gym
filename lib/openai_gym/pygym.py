import gym
import sys
import numpy as np

env_name =  sys.stdin.readline().strip()

env = gym.make(env_name)

npdtype = None

def print_with_end(str):
    print(str)
    print("END")

while True:
    line = sys.stdin.readline()
    command = line.strip()

    if command == "":
        pass

    # "reset np.type"
    elif command[0:5] == "reset":
        nptype = command[6:] 
        npdtype = np.dtype(nptype)
        observation = env.reset()
        observation = observation.astype(npdtype).tostring()
        print_with_end(observation)

    elif command == "render":
        env.render()

    # "step descrete"
    # "step box"
    # int or double
    elif command[0:4] == "step":
        space_type = command[5:]
        flag = None
        action = ""
        while flag == None:
            temp = sys.stdin.readline()
            if temp == "END\n":
                flag = 1
            else:
                action += temp
        action = action.rstrip()

        if space_type == "discrete":
            action = int(action)
        elif space_type == "box":
            action = np.fromstring(action)

        observation, reward, done, info = env.step(action)
        observation = observation.astype(npdtype).tostring()
        print_with_end(observation)
        print_with_end(reward)
        print_with_end(done)
        print_with_end(info)

    elif command == "action_space":
        print_with_end(str(env.action_space))

    elif command == "observation_space":
        obs = env.observation_space
        print_with_end(str(obs))
        print_with_end(str(obs.high))
        print_with_end(str(obs.low))

    elif command == "monitor_start":
        path = sys.stdin.readline().strip()
        env.monitor.start(path)

    elif command == "monitor_close":
        env.monitor.close()

    else:
        sys.stderr.write(command + " not known\n")
