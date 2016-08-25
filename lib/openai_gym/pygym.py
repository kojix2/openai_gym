import gym
import sys
import struct
import numpy as np

env_name =  sys.stdin.readline().strip()
env = gym.make(env_name)

npdtype = None

while True:

    command = sys.stdin.readline().strip()

    # reset np.type
    if command[0:5] == "reset":
        nptype = command[6:] 
        npdtype = np.dtype(nptype)
        observation = env.reset()
        observation = observation.astype(npdtype).tostring()
        print(observation)
        print("END")

    elif command == "render":
        env.render()

    elif command[0:4] == "step":
        action = int(command[5:])
        observation, reward, done, info = env.step(action)
        observation = observation.astype(npdtype).tostring()
        print(observation)
        print("END")
        print(reward)
        print(done)

    elif command == "action_space":
        sys.stderr.write(str(env.action_space) + "\n")

    else:
        sys.stderr.write(command + " not known\n")
