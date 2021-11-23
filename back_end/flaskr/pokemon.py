import json

from flask import request, Blueprint

from flaskr.db import get_db

bp = Blueprint('pokemon', __name__, url_prefix='/pokemon')


@bp.route('/listPokemonNames')
def list_pokemon_names():
    """Lists all of the pokemon names"""
    con = get_db()
    cur = con.cursor()
    cur.execute('SELECT PokemonName FROM Pokemon')

    d = {}
    for row in cur.fetchall():
        for col in row.keys():
            if col not in d:
                d[col] = [str(row[col])]
            else:
                d[col].append(str(row[col]))

    return json.dumps(d)


@bp.route('/listMoveNames')
def list_move_names():
    """Lists all of the pokemon names"""
    con = get_db()
    cur = con.cursor()
    cur.execute('select MoveName from Move')

    d = {}
    for row in cur.fetchall():
        for col in row.keys():
            if col not in d:
                d[col] = [str(row[col])]
            else:
                d[col].append(str(row[col]))

    return json.dumps(d)
