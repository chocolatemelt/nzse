import argparse

import daemon
import conf

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Run stonks daemon.")
    parser.add_argument(
        "--config",
        type=str,
        help="Configuration file name",
    )
    args = parser.parse_args()
    if args.config:
        conf.reload_config(args.config)
    daemon.start_postgres()
