import json

from flask import request, Blueprint, jsonify

from flaskr.db import get_db

bp = Blueprint('breeding', __name__, url_prefix='/breeding')


@bp.route('/pokemon_in_egg_group/<egg_group_name>')
def pokemon_in_egg_group(egg_group_name: str):
    """Lists all of the Pokemon in a given egg group """
    con = get_db()
    cur = con.cursor()
    cur.execute(f'''
                select PokemonName from Pokemon natural join EggGroups
                where GroupName = "{egg_group_name}";
                ''')

    l = []
    for row in cur.fetchall():
        l.append(row[0])

    return jsonify(l)


@bp.route('/pokemon_can_breed_with/<pokemon_name>')
def pokemon_can_breed_with(pokemon_name: str):
    """Lists all Pokemon that a given Pokemon can breed with """
    con = get_db()
    cur = con.cursor()
    cur.execute(f'''
                select distinct PokemonName from Pokemon natural join EggGroups
                where PokemonName = 'Ditto' or GroupName in(
                    select GroupName from Pokemon natural join EggGroups
                    where PokemonName = "{pokemon_name}"
                )
                order by PokemonName;
                ''')

    l = []
    for row in cur.fetchall():
        l.append(row[0])

    return jsonify(l)
