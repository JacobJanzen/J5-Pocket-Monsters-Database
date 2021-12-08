from flaskr.query_to_json import sqlite_to_json as qj

from flask import Blueprint

from flaskr.db import get_db

bp = Blueprint('teams', __name__, url_prefix='/teams')


@bp.route('/teams_with_trainer/<trainer_id>')
def teams_with_trainer(trainer_id: str):
    """Lists all of the teams of a given trainer """
    con = get_db()
    cur = con.cursor()
    cur.execute(f'''
                select TrainerName, TrainerClass, TeamID, MemberID, PokemonName, Level
                from Trainer natural join Team natural join TeamMember natural join Pokemon
                where TID = "{trainer_id}"
                order by TeamID, MemberID;
                ''')
    return qj.sqlite_to_json(cur.fetchall())


@bp.route('/teams_with_pokemon/<pokemon_name>')
def teams_with_pokemon(pokemon_name: str):
    """Lists all of the teams with a given Pokemon """
    con = get_db()
    cur = con.cursor()
    cur.execute(f'''
                select TrainerName, TrainerClass, TeamID, MemberID, PokemonName, Level
                from Trainer natural join Team natural join TeamMember natural join Pokemon
                where (TID, TeamID) in(
                    select TID, TeamID
                    from Trainer natural join Team natural join TeamMember natural join Pokemon
                    where PokemonName = "{pokemon_name}"
                )
                order by TrainerName, TrainerClass, TeamID, MemberID;
                ''')
    return qj.sqlite_to_json(cur.fetchall())


@bp.route('/teams_with_minimum_level/<minimum_level>')
def teams_with_minimum_level(minimum_level: int):
    """Lists all of the teams with a minimum level """
    con = get_db()
    cur = con.cursor()
    cur.execute(f'''
                select TrainerName, TrainerClass, TeamID, MemberID, PokemonName, Level
                from Trainer natural join Team natural join TeamMember natural join Pokemon
                where (TID, TeamID) in(
                    select TID, TeamID
                    from Trainer natural join Team natural join TeamMember natural join Pokemon
                    group by TID, TeamID
                    having min(Level) >= {minimum_level}
                )
                order by TrainerName, TrainerClass, TeamID, MemberID;
                ''')
    return qj.sqlite_to_json(cur.fetchall())


@bp.route('/teams_with_maximum_level/<maximum_level>')
def teams_with_maximum_level(maximum_level: int):
    """Lists all of the teams with a minimum level """
    con = get_db()
    cur = con.cursor()
    cur.execute(f'''
                select TrainerName, TrainerClass, TeamID, MemberID, PokemonName, Level
                from Trainer natural join Team natural join TeamMember natural join Pokemon
                where (TID, TeamID) in(
                    select TID, TeamID
                    from Trainer natural join Team natural join TeamMember natural join Pokemon
                    group by TID, TeamID
                    having min(Level) <= {maximum_level}
                )
                order by TrainerName, TrainerClass, TeamID, MemberID;
                ''')
    return qj.sqlite_to_json(cur.fetchall())
