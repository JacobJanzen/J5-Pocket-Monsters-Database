from flaskr.query_to_json import sqlite_to_json as qj

from flask import Blueprint

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
    return qj.sqlite_to_json(cur.fetchall())


@bp.route('/types_with_physical_damage')
def types_with_physical_damage():
    """Lists the types with physical damage type """
    con = get_db()
    cur = con.cursor()
    cur.execute(f'''
                select TypeName from Type where Category = 'Physical';
                ''')
    return qj.sqlite_to_json(cur.fetchall())


@bp.route('/types_with_special_damage')
def types_with_special_damage():
    """Lists the types with special damage type """
    con = get_db()
    cur = con.cursor()
    cur.execute(f'''
                select TypeName from Type where Category = 'Special';
                ''')
    return qj.sqlite_to_json(cur.fetchall())
