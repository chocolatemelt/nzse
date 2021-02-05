import yaml

config = {}

with open(r"./conf/main.yaml") as file:
    config = yaml.load(file, Loader=yaml.FullLoader)
