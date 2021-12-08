from flaskr.query_to_json import sqlite_to_json as qj

from flask import Blueprint

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
    return qj.sqlite_to_json(cur.fetchall())


@bp.route('/pokemon_can_breed_with/<pokemon_name>')
def pokemon_can_breed_with(pokemon_name: str):
    """Lists all Pokemon that a given Pokemon can breed with """
    con = get_db()
    cur = con.cursor()
    cur.execute(f'''
                select distinct PokemonName from Pokemon natural join EggGroups
                where case when "{pokemon_name}" <> 'Ditto' THEN
                    PokemonName = 'Ditto' or GroupName in(
                    select GroupName from Pokemon natural join EggGroups
                    where PokemonName = "{pokemon_name}" )
                ELSE
                    PokemonName <> 'Ditto' and GroupName <> 'Undiscovered'
                END
                order by PokemonName;
                ''')
    return qj.sqlite_to_json(cur.fetchall())
