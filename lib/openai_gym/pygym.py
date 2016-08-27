import gym
import sys
import struct
import numpy as np

env_name =  sys.stdin.readline().strip()

env = gym.make(env_name)

npdtype = None

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

    # "step 2"
    elif command[0:4] == "step":
        action = int(command[5:])
        observation, reward, done, info = env.step(action)
        # info is dismissed
        observation = observation.astype(npdtype).tostring()
        print(observation)
        # to ignore newline characters in binary data
        print("END")
        print(reward)
        print(done)

    elif command == "action_space":
        sys.stderr.write(str(env.action_space) + "\n")

    else:
        sys.stderr.write(command + " not known\n")
