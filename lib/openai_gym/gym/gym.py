import gym
import sys

def readline()
  sys.stdin.readline().strip()
end

env_name = readline()

env = gym.make(env_name)

while True
    command = readline()

    if command == "reset":
        env.reset()
    elif command == "render":
        env.render()
    elif command == "step":
        action = readline()
        action = int(action)
        env.step(action)
