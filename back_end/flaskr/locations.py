from flaskr.query_to_json import sqlite_to_json as qj

from flask import Blueprint

from flaskr.db import get_db

bp = Blueprint('locations', __name__, url_prefix='/locations')


@bp.route('/locations_pokemon_can_be_found/<pokemon_name>')
def locations_pokemon_can_be_found(pokemon_name: str):
    """Lists the locations that a Pokemon may be found at """
    con = get_db()
    cur = con.cursor()
    cur.execute(f'''
                select LocationName, Encounter from Pokemon natural join FoundAt
                where PokemonName = "{pokemon_name}";
                ''')
    return qj.sqlite_to_json(cur.fetchall())


@bp.route('/locations_pokemon_can_be_found_with_method/<pokemon_name>&<method_name>')
def locations_pokemon_can_be_found_with_method(pokemon_name: str, method_name: str):
    """Lists the locations that a Pokemon may be found at and the method by which they can be found """
    con = get_db()
    cur = con.cursor()
    cur.execute(f'''
                select LocationName, Encounter from Pokemon natural join FoundAt
                where PokemonName = "{pokemon_name}" and Encounter = "{method_name}";
                ''')
    return qj.sqlite_to_json(cur.fetchall())


@bp.route('/locations_with_pokemon_of_type/<type_name>')
def locations_with_pokemon_of_type(type_name: str):
    """Lists the locations that a Pokemon of a given type can be found """
    con = get_db()
    cur = con.cursor()
    cur.execute(f'''
                select PokemonName, LocationName, Encounter from Pokemon natural join HasTypes natural join FoundAt
                where TypeName = "{type_name}";
                ''')
    return qj.sqlite_to_json(cur.fetchall())


@bp.route('/locations_with_pokemon_of_dual_type/<first_type_name>&<second_type_name>')
def locations_with_pokemon_of_dual_type(first_type_name: str, second_type_name: str):
    """Lists the locations that a Pokemon with two given types can be found """
    con = get_db()
    cur = con.cursor()
    cur.execute(f'''
                select PokemonName, LocationName, Encounter from Pokemon natural join HasTypes natural join FoundAt
                where TypeName = "{first_type_name}"
                intersect
                select PokemonName, LocationName, Encounter from Pokemon natural join HasTypes natural join FoundAt
                where TypeName = "{second_type_name}";
                ''')
    return qj.sqlite_to_json(cur.fetchall())


@bp.route('/locations_with_trainer/<trainer_id>')
def locations_with_trainer(trainer_id):
    """Lists the locations with the given trainer """
    con = get_db()
    cur = con.cursor()
    cur.execute(f'''
                select LocationName from FoughtAt natural join Trainer 
                where TID = "{trainer_id}";
                ''')
    return qj.sqlite_to_json(cur.fetchall())


@bp.route('/locations_with_trainer_class/<trainer_class>')
def locations_with_trainer_class(trainer_class: str):
    """Lists the locations with trainers of the given trainer class """
    con = get_db()
    cur = con.cursor()
    cur.execute(f'''
                select LocationName from FoughtAt natural join Trainer 
                where TID = "{trainer_class}";
                ''')
    return qj.sqlite_to_json(cur.fetchall())


@bp.route('/locations_with_trainer_class_fight/<trainer_class>')
def locations_with_trainer_class_fight(trainer_class: str):
    """all locations where a certain Trainer Class can be fought """
    con = get_db()
    cur = con.cursor()
    cur.execute(f'''
                select LocationName, TrainerName, TrainerClass
                from FoughtAt natural join Trainer
                where TrainerClass = "{trainer_class}"
                group by LocationName;
                ''')
    return qj.sqlite_to_json(cur.fetchall())


@bp.route('/locations_with_pokemon_of_level/<pokemon_name>&<minimum_level>')
def locations_with_pokemon_of_level(pokemon_name: str, minimum_level: int):
    """locations where a certain pkmn of at least a certain level can be found """
    con = get_db()
    cur = con.cursor()
    cur.execute(f'''
                select LocationName, Encounter, Min as StartingLevel
                from Pokemon natural join FoundAt
                where PokemonName = "{pokemon_name}" and Min >= "{minimum_level}"
                group by LocationName
                order by LocationName;
                ''')
    return qj.sqlite_to_json(cur.fetchall())
