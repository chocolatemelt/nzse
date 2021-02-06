from sqlalchemy import create_engine


def start_postgres():
    from conf import config

    pg = config()["pg"]
    db_string = f"postgres://{pg['user']}:{pg['password']}@{pg['host']}:{pg['port']}/{pg['database']}"
    db = create_engine(db_string)

    result_set = db.execute("SELECT * from exchanges")
    for r in result_set:
        print(r)
