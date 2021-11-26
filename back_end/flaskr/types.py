import json

from flask import request, Blueprint

from flaskr.db import get_db

bp = Blueprint('types', __name__, url_prefix='/types')


@bp.route('/number_of_pokemon_per_type')
def number_of_pokemon_per_type():
    """Lists the number of Pokemon per type"""
    con = get_db()
    cur = con.cursor()
    cur.execute(f'''
                select TypeName, count(Dex) as Num_of_Pokemon
                from HasTypes natural join Pokemon
                group by TypeName;
                ''')

    d = {}
    for row in cur.fetchall():
        d[row[0]] = row[1]

    return json.dumps(d)


@bp.route('/types_with_physical_damage')
def types_with_physical_damage():
    """Lists the types with physical damage type """
    con = get_db()
    cur = con.cursor()
    cur.execute(f'''
                select TypeName from Type where Category = 'Physical';
                ''')

    l = []
    for row in cur.fetchall():
        l.append(row[0])

    return json.dumps(l)


@bp.route('/types_with_special_damage')
def types_with_special_damage():
    """Lists the types with special damage type """
    con = get_db()
    cur = con.cursor()
    cur.execute(f'''
                select TypeName from Type where Category = 'Special';
                ''')

    l = []
    for row in cur.fetchall():
        l.append(row[0])

    return json.dumps(l)
