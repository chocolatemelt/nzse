import os
import yaml

ROOT_DIR = os.path.realpath(os.path.join(__file__, '../..'))

config = {}
with open(f"{ROOT_DIR}/conf/main.yaml", "r") as file:
    config = yaml.load(file, Loader=yaml.FullLoader)
