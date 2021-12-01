from flask import Blueprint, jsonify

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

    d = {}
    for row in cur.fetchall():
        if row[0] not in d:
            d[row[0]] = [{row.keys()[1]: row[1], row.keys()[2]: row[2], row.keys()[3]: row[3], row.keys()[4]: row[4],
                          row.keys()[5]: row[5]}]
        else:
            d[row[0]].append(
                {row.keys()[1]: row[1], row.keys()[2]: row[2], row.keys()[3]: row[3], row.keys()[4]: row[4],
                 row.keys()[5]: row[5]})

    return jsonify(d)


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

    d = {}
    for row in cur.fetchall():
        if row[0] not in d:
            d[row[0]] = [{row.keys()[1]: row[1], row.keys()[2]: row[2], row.keys()[3]: row[3], row.keys()[4]: row[4],
                          row.keys()[5]: row[5]}]
        else:
            d[row[0]].append(
                {row.keys()[1]: row[1], row.keys()[2]: row[2], row.keys()[3]: row[3], row.keys()[4]: row[4],
                 row.keys()[5]: row[5]})

    return jsonify(d)


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

    d = {}
    for row in cur.fetchall():
        if row[0] not in d:
            d[row[0]] = [{row.keys()[1]: row[1], row.keys()[2]: row[2], row.keys()[3]: row[3], row.keys()[4]: row[4],
                          row.keys()[5]: row[5]}]
        else:
            d[row[0]].append(
                {row.keys()[1]: row[1], row.keys()[2]: row[2], row.keys()[3]: row[3], row.keys()[4]: row[4],
                 row.keys()[5]: row[5]})

    return jsonify(d)


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

    d = {}
    for row in cur.fetchall():
        if row[0] not in d:
            d[row[0]] = [{row.keys()[1]: row[1], row.keys()[2]: row[2], row.keys()[3]: row[3], row.keys()[4]: row[4],
                          row.keys()[5]: row[5]}]
        else:
            d[row[0]].append(
                {row.keys()[1]: row[1], row.keys()[2]: row[2], row.keys()[3]: row[3], row.keys()[4]: row[4],
                 row.keys()[5]: row[5]})

    return jsonify(d)
