import json

from flask import request, Blueprint

from flaskr.db import get_db

bp = Blueprint('pokemon', __name__, url_prefix='/pokemon')


@bp.route('/test')
def test():
    con = get_db()
    cur = con.cursor()
    cur.execute('SELECT * FROM Pokemon')  # sample

    out = ''

    for row in cur.fetchall():
        for o in row:
            out += str(o)

    return out  # should be converted JSON in prod
