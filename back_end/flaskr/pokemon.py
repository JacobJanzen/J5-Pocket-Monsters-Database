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
    """Lists the pokemon with a given move"""
    con = get_db()
    cur = con.cursor()
    cur.execute(f'''
                select PokemonName from Pokemon natural join Learns natural join Move
                where Move.MoveName = "{move_name}"
                union
                select PokemonName from Pokemon natural join LearnsByBreeding natural join Move 
                 where Move.MoveName = "{move_name}"
                ''')

    d = {}
    for row in cur.fetchall():
        for col in row.keys():
            if col not in d:
                d[col] = [row[col]]
            else:
                d[col].append(row[col])

    return json.dumps(d)


@bp.route('/pokemon_from_types_with_highest_stat/<stat_name>')
def pokemon_from_types_with_highest_stat(stat_name: str):
    """Lists the pokemon from each type with the highest value in a given stat"""
    con = get_db()
    cur = con.cursor()
    cur.execute(f'''
                select TypeName, PokemonName, "{stat_name}" from Pokemon natural join HasTypes
                group by TypeName
                having max("{stat_name}")
                order by "{stat_name}" desc
                ''')

    d = {}
    for row in cur.fetchall():
        d[row[0]] = row[1]

    return json.dumps(d)


@bp.route('/pokemon_from_types_with_lowest_stat/<stat_name>')
def pokemon_from_types_with_lowest_stat(stat_name: str):
    """Lists the pokemon from each type with the lowest value in a given stat"""
    con = get_db()
    cur = con.cursor()
    cur.execute(f'''
                select TypeName, PokemonName, "{stat_name}" from Pokemon natural join HasTypes
                group by TypeName
                having min("{stat_name}")
                order by "{stat_name}" desc
                ''')

    d = {}
    for row in cur.fetchall():
        d[row[0]] = row[1]

    return json.dumps(d)


@bp.route('/pokemon_with_stat_greater_than/<stat_name>&<min_value>')
def pokemon_with_stat_greater_than(stat_name: str, min_value: int):
    """Lists the pokemon having a minimum value of a given stat"""
    con = get_db()
    cur = con.cursor()
    cur.execute(f'''
                select PokemonName, "{stat_name}" from Pokemon
                where "{stat_name}" >= "{min_value}"
                order by "{stat_name}"
                ''')

    d = {}
    for row in cur.fetchall():
        d[row[0]] = row[1]

    return json.dumps(d)


@bp.route('/pokemon_with_stat_less_than/<stat_name>&<max_value>')
def pokemon_with_stat_less_than(stat_name: str, max_value: int):
    """Lists the pokemon having a maximum value of a given stat"""
    con = get_db()
    cur = con.cursor()
    cur.execute(f'''
                select PokemonName, "{stat_name}" from Pokemon
                where "{stat_name}" <= "{max_value}"
                order by "{stat_name}"
                ''')

    d = {}
    for row in cur.fetchall():
        d[row[0]] = row[1]

    return json.dumps(d)


@bp.route('/pokemon_can_be_caught_at_location/<location_name>')
def pokemon_can_be_caught_at_location(location_name: str):
    """Lists the pokemon that can be caught at a given location"""
    con = get_db()
    cur = con.cursor()
    cur.execute(f'''
                select Dex, PokemonName, Encounter from Pokemon natural join FoundAt
                where FoundAt.LocationName = "{location_name}"
                ''')

    d = {}
    for row in cur.fetchall():
        d[row[1]] = {row.keys()[0]: row[0], row.keys()[2]: row[2]}

    return json.dumps(d)


@bp.route('/pokemon_can_be_caught_at_location_from_encounter/<location_name>&<encounter_name>')
def pokemon_can_be_caught_at_location_from_encounter(location_name: str, encounter_name: str):
    """Lists the pokemon that can be caught at a given location from a given encounter"""
    con = get_db()
    cur = con.cursor()
    cur.execute(f'''
                select Dex, PokemonName, Encounter from Pokemon natural join FoundAt
                where FoundAt.LocationName = "{location_name}" and Encounter = "{encounter_name}";   
                ''')

    d = {}
    for row in cur.fetchall():
        d[row[1]] = {row.keys()[0]: row[0], row.keys()[2]: row[2]}

    return json.dumps(d)
