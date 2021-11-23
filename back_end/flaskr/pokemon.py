import json

from flask import request, Blueprint

from flaskr.db import get_db

bp = Blueprint('pokemon', __name__, url_prefix='/pokemon')


@bp.route('/pokemon_names')
def pokemon_names():
    """Lists all of the pokemon names"""
    con = get_db()
    cur = con.cursor()
    cur.execute('select PokemonName from Pokemon')

    d = {}
    for row in cur.fetchall():
        for col in row.keys():
            if col not in d:
                d[col] = [str(row[col])]
            else:
                d[col].append(str(row[col]))

    return json.dumps(d)


@bp.route('/move_names')
def move_names():
    """Lists all of the move names"""
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


@bp.route('/dex_pokemon_names')
def dex_pokemon_names():
    """Lists all of the pokemon names and their position in the Pokedex"""
    con = get_db()
    cur = con.cursor()
    cur.execute('select Dex, PokemonName from Pokemon')

    d = {}
    for row in cur.fetchall():
        d[row[0]] = row[1]

    return json.dumps(d)


@bp.route('/pokemon_stats/<pokemon_name>')
def pokemon_stats(pokemon_name: str):
    """Lists the stats of a pokemon"""
    con = get_db()
    cur = con.cursor()
    cur.execute(f'''
                select HP, Atk, Def, SpA, SpD, Spe from Pokemon
                where PokemonName = "{pokemon_name}"
                ''')

    d = {}
    for row in cur.fetchall():
        for col in row.keys():
            d[col] = row[col]

    return json.dumps(d)


@bp.route('/pokemon_evolutions/<pokemon_name>')
def pokemon_evolutions(pokemon_name: str):
    """Lists the evolutions of a pokemon"""
    con = get_db()
    cur = con.cursor()
    cur.execute(f'''
                select P2.Dex, P2.PokemonName from Pokemon P1, Pokemon P2
                where P2.EvolvesFrom = P1.Dex and P1.PokemonName = "{pokemon_name}"
                ''')

    d = {}
    for row in cur.fetchall():
        for col in row.keys():
            d[col] = row[col]

    return json.dumps(d)


@bp.route('/pokemon_with_move/<move_name>')
def pokemon_with_move(move_name: str):
    """Lists the evolutions of a pokemon"""
    con = get_db()
    cur = con.cursor()
    cur.execute(f'''
                select PokemonName, Learns.method from Pokemon natural join Learns natural join Move
                where Move.MoveName = "{move_name}"
                union
                select PokemonName from Pokemon natural join LearnsByBreeding natural join Move
                where Move.MoveName = "{move_name}"
                ''')
    # left and right side of unions do not have the same number of columns

    d = {}
    for row in cur.fetchall():
        for col in row.keys():
            d[col] = row[col]

    return json.dumps(d)