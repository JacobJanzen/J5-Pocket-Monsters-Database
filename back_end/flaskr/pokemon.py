import json

from flask import request, Blueprint

from flaskr.db import get_db

bp = Blueprint('pokemon', __name__, url_prefix='/pokemon')


@bp.route('/test')
def test():
    con = get_db()
    cur = con.cursor()
    cur.execute('SELECT * FROM Pokemon')  # sample

    d = {}

    for row in cur.fetchall():
        for key in row.keys():
            if key not in d:
                d[key] = [str(row[key])]
            else:
                d[key].append(str(row[key]))

    return json.dumps(d)
