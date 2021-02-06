from pathlib import Path
import yaml

ROOT_DIR = Path(__file__).resolve().parent.parent

config = {}
with open(f"{ROOT_DIR}/conf/main.yaml", "r") as file:
    config = yaml.load(file, Loader=yaml.FullLoader)
