import os
import yaml

ROOT_DIR = os.path.realpath(os.path.join(__file__, "../.."))

_CONFIG = {}


def reload_config(key=None):
    global _CONFIG
    with open(f"{ROOT_DIR}/conf/main.yaml", "r") as fn:
        _CONFIG = yaml.load(fn, Loader=yaml.FullLoader)
    if key is not None:
        try:
            with open(f"{ROOT_DIR}/conf/{key}.yaml", "r") as fn:
                _CONFIG.update(yaml.load(fn, Loader=yaml.FullLoader))
        except (OSError, FileNotFoundError):
            pass
    return _CONFIG


def config():
    return _CONFIG


_CONFIG = reload_config(os.environ.get("NZSE_CONFIG_KEY"))
