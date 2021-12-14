from flaskr.query_to_json import sqlite_to_json as qj

from flask import Blueprint

from flaskr.db import get_db

bp = Blueprint('bigdump', __name__, url_prefix='/bigdump')


@bp.route('/pokemon')
def pokemon():
    """Lists everything in the Pokemon table """
    con = get_db()
    cur = con.cursor()
    cur.execute(f'''
                select * from Pokemon;
                ''')
    return qj.sqlite_to_json(cur.fetchall())


@bp.route('/move')
def move():
    """Lists everything in the move table """
    con = get_db()
    cur = con.cursor()
    cur.execute(f'''
                select * from Move;
                ''')
    return qj.sqlite_to_json(cur.fetchall())


@bp.route('/trainer')
def trainer():
    """Lists everything in the trainer table """
    con = get_db()
    cur = con.cursor()
    cur.execute(f'''
                select * from Trainer;
                ''')
    return qj.sqlite_to_json(cur.fetchall())


@bp.route('/type')
def type():
    """Lists everything in the Type table """
    con = get_db()
    cur = con.cursor()
    cur.execute(f'''
                select * from Type;
                ''')
    return qj.sqlite_to_json(cur.fetchall())


@bp.route('/effective')
def effective():
    """Lists everything in the Effective table """
    con = get_db()
    cur = con.cursor()
    cur.execute(f'''
                select * from Effective;
                ''')
    return qj.sqlite_to_json(cur.fetchall())




@bp.route('/team')
def team():
    """Lists everything in the team table """
    con = get_db()
    cur = con.cursor()
    cur.execute(f'''
                select * from Team;
                ''')
    return qj.sqlite_to_json(cur.fetchall())


@bp.route('/TM')
def TM():
    """Lists everything in the TM table """
    con = get_db()
    cur = con.cursor()
    cur.execute(f'''
                select * from TM;
                ''')
    return qj.sqlite_to_json(cur.fetchall())


@bp.route('/HM')
def HM():
    """Lists everything in the HM table """
    con = get_db()
    cur = con.cursor()
    cur.execute(f'''
                select * from HM;
                ''')
    return qj.sqlite_to_json(cur.fetchall())


@bp.route('/learns')
def learns():
    """Lists everything in the learns table """
    con = get_db()
    cur = con.cursor()
    cur.execute(f'''
                select * from Learns;
                ''')
    return qj.sqlite_to_json(cur.fetchall())


@bp.route('/learnsbybreeding')
def learnsbybreeding():
    """Lists everything in the LearnsByBreeding table """
    con = get_db()
    cur = con.cursor()
    cur.execute(f'''
                select * from LearnsByBreeding;
                ''')
    return qj.sqlite_to_json(cur.fetchall())


@bp.route('/eggroups')
def egggroups():
    """Lists everything in the egg groups table """
    con = get_db()
    cur = con.cursor()
    cur.execute(f'''
                select * from EggGroups;
                ''')
    return qj.sqlite_to_json(cur.fetchall())


@bp.route('/abilities')
def abilities():
    """Lists everything in the Abilities table """
    con = get_db()
    cur = con.cursor()
    cur.execute(f'''
                select * from Abilities;
                ''')
    return qj.sqlite_to_json(cur.fetchall())


@bp.route('/location')
def location():
    """Lists everything in the locationtable """
    con = get_db()
    cur = con.cursor()
    cur.execute(f'''
                select * from location;
                ''')
    return qj.sqlite_to_json(cur.fetchall())


@bp.route('/foundat')
def foundat():
    """Lists everything in the table """
    con = get_db()
    cur = con.cursor()
    cur.execute(f'''
                select * from FoundAt;
                ''')
    return qj.sqlite_to_json(cur.fetchall())


@bp.route('/foughtat')
def foughtat():
    """Lists everything in the foughtAt table """
    con = get_db()
    cur = con.cursor()
    cur.execute(f'''
                select * from FoughtAt;
                ''')
    return qj.sqlite_to_json(cur.fetchall())


@bp.route('/hastypes')
def hastypes():
    """Lists everything in the HasTypes table """
    con = get_db()
    cur = con.cursor()
    cur.execute(f'''
                select * from HasTypes;
                ''')
    return qj.sqlite_to_json(cur.fetchall())


@bp.route('/teammember')
def teammember():
    """Lists everything in the TeamMember table """
    con = get_db()
    cur = con.cursor()
    cur.execute(f'''
                select * from TeamMember;
                ''')
    return qj.sqlite_to_json(cur.fetchall())

