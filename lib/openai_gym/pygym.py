import gym
import sys
import array
import struct
import numpy as np

env_name =  sys.stdin.readline().strip()

env = gym.make(env_name)

npdtype = None

U = array.array("d")

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
        print(observation)
        # to ignore newline characters in binary data
        print("END")

    elif command == "render":
        env.render()

    # "step descrete"
    # "step box"
    # int or double
    elif command[0:4] == "step":
        space_type = command[5:]
        action = sys.stdin.readline()
        if space_type == "discrete":
            action = int(action)
        elif space_type == "box":
            action = U.fromstring(action)

        observation, reward, done, info = env.step(action)
        # info is dismissed
        observation = observation.astype(npdtype).tostring()
        print(observation)
        # to ignore newline characters in binary data
        print("END")
        print(reward)
        print(done)
        print(info)

    elif command == "action_space":
        print(str(env.action_space))

    elif command == "observation_space":
        print(str(env.observation_space))

    else:
        sys.stderr.write(command + " not known\n")
