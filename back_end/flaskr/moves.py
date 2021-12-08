from flaskr.query_to_json import sqlite_to_json as qj

from flask import Blueprint

from flaskr.db import get_db

bp = Blueprint('pokemon', __name__, url_prefix='/moves')


@bp.route('/moves_learned_by_all_pokemon')
def moves_learned_by_all_pokemon():
    """Lists the moves that are learned by all pokemon"""
    con = get_db()
    cur = con.cursor()
    cur.execute(f'''
                select MoveName, PokemonName from Pokemon natural join Learns natural join Move
                union
                select MoveName, PokemonName from Pokemon natural join LearnsByBreeding natural join Move;
                ''')
    return qj.sqlite_to_json(cur.fetchall())


@bp.route('/moves_learned_by_pokemon_by_method')
def moves_learned_by_pokemon_by_method():
    """Lists the moves that are learned by all pokemon and the method by which they are learned """
    con = get_db()
    cur = con.cursor()
    cur.execute(f'''
                select MoveName, PokemonName, Method from Pokemon natural join Learns natural join Move
                union
                select MoveName, P1.PokemonName, 'Breeding: ' || P2.PokemonName from Pokemon P1 natural join LearnsByBreeding natural join Move 
                join Pokemon P2 on LearnsByBreeding.Father = P2.Dex;
                ''')
    return qj.sqlite_to_json(cur.fetchall())


@bp.route('/moves_learned_by_a_pokemon/<pokemon_name>')
def moves_learned_by_a_pokemon(pokemon_name: str):
    """Lists the moves that are learned by a given Pokemon """
    con = get_db()
    cur = con.cursor()
    cur.execute(f'''
                select MoveName from Pokemon natural join Learns natural join Move
                where Pokemon.PokemonName = "{pokemon_name}"
                union
                select MoveName from Pokemon natural join LearnsByBreeding natural join Move
                where Pokemon.PokemonName = "{pokemon_name}";
                ''')
    return qj.sqlite_to_json(cur.fetchall())


@bp.route('/moves_learned_by_a_pokemon_by_method/<pokemon_name>')
def moves_learned_by_a_pokemon_by_method(pokemon_name: str):
    """Lists the moves that are learned by a given Pokemon and the method by which they are learned """
    con = get_db()
    cur = con.cursor()
    cur.execute(f'''
                select MoveName, Method from Pokemon natural join Learns natural join Move
                where Pokemon.PokemonName = "{pokemon_name}"
                union
                select MoveName, 'Breeding: ' || P2.PokemonName from Pokemon P1 natural join LearnsByBreeding natural join Move 
                join Pokemon P2 on LearnsByBreeding.Father = P2.Dex
                where P1.PokemonName = "{pokemon_name}";
                ''')
    return qj.sqlite_to_json(cur.fetchall())


@bp.route('/moves_with_effectiveness_against_type/<type_name>&<quality>')
def moves_with_effectiveness_against_type(type_name: str, quality):
    """Lists the moves that have a given effectiveness against a given type """
    con = get_db()
    cur = con.cursor()
    cur.execute(f'''
                select MoveName, TAtt.TypeName from Move natural join Type TAtt join Effectiveness on TAtt.TypeName = Effectiveness.Attacker
                join Type TDef on Effectiveness.Defender = TDef.TypeName
                where TDef.TypeName = "{type_name}" and Quality = "{quality}";
                ''')
    return qj.sqlite_to_json(cur.fetchall())


@bp.route('/moves_supereffective_against_pokemon/<pokemon_name>')
def moves_supereffective_against_pokemon(pokemon_name: str):
    """Moves that are supereffective against a given Pokemon (?)"""
    con = get_db()
    cur = con.cursor()
    cur.execute(f'''
                select MoveName, TAtt.TypeName, CAST((sum(Quality)-count(Quality))*2 as varchar) || 'x' as Effect from 
                Move natural join Type TAtt join Effectiveness on TAtt.TypeName = Effectiveness.Attacker
                join Type TDef on Effectiveness.Defender = TDef.TypeName join HasTypes on TDef.TypeName = HasTypes.TypeName
                join Pokemon on HasTypes.Dex = Pokemon.Dex
                where Move.Status = 0 and Pokemon.PokemonName = "{pokemon_name}"
                group by MoveName
                having (sum(Quality)/count(Quality) = 1.5 or sum(Quality)/count(Quality) = 2) and min(Quality) <> 0
                order by MoveName;
                ''')
    return qj.sqlite_to_json(cur.fetchall())


@bp.route('/moves_neutral_against_pokemon/<pokemon_name>')
def moves_neutral_against_pokemon(pokemon_name: str):
    """Moves that are neutral against a given Pokemon (?)"""
    con = get_db()
    cur = con.cursor()
    cur.execute(f'''
                select MoveName, TAtt.TypeName, '1.0x' as Effect from 
                Move natural join Type TAtt join Effectiveness on TAtt.TypeName = Effectiveness.Attacker
                join Type TDef on Effectiveness.Defender = TDef.TypeName join HasTypes on TDef.TypeName = HasTypes.TypeName
                join Pokemon on HasTypes.Dex = Pokemon.Dex
                where Move.Status = 0 and Pokemon.PokemonName = "{pokemon_name}"
                group by MoveName
                having (sum(Quality)/count(Quality) = 1 or sum(Quality)/count(Quality) = 1.25) and min(Quality) <> 0
                order by MoveName;
                ''')
    return qj.sqlite_to_json(cur.fetchall())


@bp.route('/moves_noteffective_against_pokemon/<pokemon_name>')
def moves_not_very_effective_against_pokemon(pokemon_name: str):
    """Moves that are not effective against a given Pokemon (?)"""
    con = get_db()
    cur = con.cursor()
    cur.execute(f'''
                select MoveName, TAtt.TypeName, CAST((sum(Quality)/count(Quality)-0.25*(count(Quality)-1)) as varchar) || 'x' as Effect from 
                Move natural join Type TAtt join Effectiveness on TAtt.TypeName = Effectiveness.Attacker
                join Type TDef on Effectiveness.Defender = TDef.TypeName join HasTypes on TDef.TypeName = HasTypes.TypeName
                join Pokemon on HasTypes.Dex = Pokemon.Dex
                where Move.Status = 0 and Pokemon.PokemonName = "{pokemon_name}"
                group by MoveName
                having (sum(Quality)/count(Quality) = 0.75 or sum(Quality)/count(Quality) = 0.5) and min(Quality) <> 0
                order by MoveName;
                ''')
    return qj.sqlite_to_json(cur.fetchall())


@bp.route('/moves_non_effective_against_pokemon/<pokemon_name>')
def moves_non_effective_against_pokemon(pokemon_name: str):
    con = get_db()
    cur = con.cursor()
    cur.execute(f'''
                select MoveName, TAtt.TypeName, '0.0x' as Effect from 
                Move natural join Type TAtt join Effectiveness on TAtt.TypeName = Effectiveness.Attacker
                join Type TDef on Effectiveness.Defender = TDef.TypeName join HasTypes on TDef.TypeName = HasTypes.TypeName
                join Pokemon on HasTypes.Dex = Pokemon.Dex
                where Move.Status = 0 and Pokemon.PokemonName = "{pokemon_name}"
                group by MoveName
                having min(Quality) = 0
                order by MoveName;
                ''')
    return qj.sqlite_to_json(cur.fetchall())


@bp.route('/moves_effectiveness_against_pokemon/<pokemon_name>')
def moves_effectiveness_against_pokemon(pokemon_name: str):
    con = get_db()
    cur = con.cursor()
    cur.execute(f'''
                select MoveName, TAtt.TypeName, CAST((sum(Quality)-count(Quality))*2 as varchar) || 'x' as Effect from 
                Move natural join Type TAtt join Effectiveness on TAtt.TypeName = Effectiveness.Attacker
                join Type TDef on Effectiveness.Defender = TDef.TypeName join HasTypes on TDef.TypeName = HasTypes.TypeName
                join Pokemon on HasTypes.Dex = Pokemon.Dex
                where Move.Status = 0 and Pokemon.PokemonName = "{pokemon_name}"
                group by MoveName
                having (sum(Quality)/count(Quality) = 1.5 or sum(Quality)/count(Quality) = 2) and min(Quality) <> 0
                
                union
                
                select MoveName, TAtt.TypeName, '1.0x' as Effect from 
                Move natural join Type TAtt join Effectiveness on TAtt.TypeName = Effectiveness.Attacker
                join Type TDef on Effectiveness.Defender = TDef.TypeName join HasTypes on TDef.TypeName = HasTypes.TypeName
                join Pokemon on HasTypes.Dex = Pokemon.Dex
                where Move.Status = 0 and Pokemon.PokemonName = "{pokemon_name}"
                group by MoveName
                having (sum(Quality)/count(Quality) = 1 or sum(Quality)/count(Quality) = 1.25) and min(Quality) <> 0
                
                union
                
                select MoveName, TAtt.TypeName, CAST((sum(Quality)/count(Quality)-0.25*(count(Quality)-1)) as varchar) || 'x' as Effect from 
                Move natural join Type TAtt join Effectiveness on TAtt.TypeName = Effectiveness.Attacker
                join Type TDef on Effectiveness.Defender = TDef.TypeName join HasTypes on TDef.TypeName = HasTypes.TypeName
                join Pokemon on HasTypes.Dex = Pokemon.Dex
                where Move.Status = 0 and Pokemon.PokemonName = "{pokemon_name}"
                group by MoveName
                having (sum(Quality)/count(Quality) = 0.75 or sum(Quality)/count(Quality) = 0.5) and min(Quality) <> 0
                
                union
                
                select MoveName, TAtt.TypeName, '0.0x' as Effect from 
                Move natural join Type TAtt join Effectiveness on TAtt.TypeName = Effectiveness.Attacker
                join Type TDef on Effectiveness.Defender = TDef.TypeName join HasTypes on TDef.TypeName = HasTypes.TypeName
                join Pokemon on HasTypes.Dex = Pokemon.Dex
                where Move.Status = 0 and Pokemon.PokemonName = "{pokemon_name}"
                group by MoveName
                having min(Quality) = 0
                order by MoveName;
                ''')
    return qj.sqlite_to_json(cur.fetchall())


@bp.route('/status_moves/')
def status_moves():
    """Lists all status moves """
    con = get_db()
    cur = con.cursor()
    cur.execute(f'''
                select MoveName from Move where Status = 1;
                ''')
    return qj.sqlite_to_json(cur.fetchall())


@bp.route('/methods_pokemon_can_learn_move/<pokemon_name>&<move_name>')
def methods_pokemon_can_learn_move(pokemon_name: str, move_name: str):
    """Lists all ways a Pokemon learns a given move """
    con = get_db()
    cur = con.cursor()
    cur.execute(f'''
                select MoveName, Method from Pokemon natural join Learns natural join Move
                where Pokemon.PokemonName = "{pokemon_name}" and MoveName = "{move_name}"
                union
                select MoveName, 'Breeding: ' || P2.PokemonName from Pokemon P1 natural join LearnsByBreeding natural join Move 
                join Pokemon P2 on LearnsByBreeding.Father = P2.Dex
                where P1.PokemonName = "{pokemon_name}" and MoveName = "{move_name}";
                ''')
    return qj.sqlite_to_json(cur.fetchall())


@bp.route('/moves_of_type_that_pokemon_can_learn/<pokemon_name>&<type_name>')
def moves_of_type_that_pokemon_can_learn(pokemon_name: str, type_name: str):
    """Lists all moves of a given type that a Pokemon can learn  """
    con = get_db()
    cur = con.cursor()
    cur.execute(f'''
                select MoveName from Pokemon natural join Learns natural join Move
                where Pokemon.PokemonName = "{pokemon_name}" and TypeName = "{type_name}"
                union
                select MoveName from Pokemon natural join LearnsByBreeding natural join Move
                where Pokemon.PokemonName = "{pokemon_name}" and TypeName = "{type_name}";
                ''')
    return qj.sqlite_to_json(cur.fetchall())


@bp.route('/moves_of_type_that_pokemon_can_learn_by_method/<pokemon_name>&<type_name>')
def moves_of_type_that_pokemon_can_learn_by_method(pokemon_name: str, type_name: str):
    """Lists all moves of a given type that a Pokemon can learn and the method by which they are learned """
    con = get_db()
    cur = con.cursor()
    cur.execute(f'''
                select MoveName, Method from Pokemon natural join Learns natural join Move
                where Pokemon.PokemonName = "{pokemon_name}" and TypeName = "{type_name}"
                union
                select MoveName, 'Breeding: ' || P2.PokemonName from Pokemon P1 natural join LearnsByBreeding natural join Move 
                join Pokemon P2 on LearnsByBreeding.Father = P2.Dex
                where P1.PokemonName = "{pokemon_name}" and TypeName = "{type_name}";
                ''')
    return qj.sqlite_to_json(cur.fetchall())


@bp.route('/moves_pokemon_learns_with_method/<pokemon_name>&<method_name>')
def moves_pokemon_learns_with_method(pokemon_name: str, method_name: str):
    """Lists all moves a given Pokemon learns with a given breeding method """
    con = get_db()
    cur = con.cursor()
    cur.execute(f'''
                select MoveName, Method from Pokemon natural join Learns natural join Move
                where Pokemon.PokemonName = "{pokemon_name}" and Method = "{method_name}";
                ''')
    return qj.sqlite_to_json(cur.fetchall())


@bp.route('/moves_pokemon_learns_by_breeding/<pokemon_name>')
def moves_pokemon_learns_by_breeding(pokemon_name: str):
    """Lists all moves a Pokemon learns through breeding """
    con = get_db()
    cur = con.cursor()
    cur.execute(f'''
                select MoveName, 'Father: ' || P2.PokemonName from Pokemon P1 natural join LearnsByBreeding natural join Move 
                join Pokemon P2 on LearnsByBreeding.Father = P2.Dex
                where P1.PokemonName = "{pokemon_name}";
                ''')
    return qj.sqlite_to_json(cur.fetchall())


@bp.route('/moves_pokemon_learns_by_breeding_with_father/<pokemon_name>&<father_name>')
def moves_pokemon_learns_by_breeding_with_father(pokemon_name: str, father_name: str):
    """Lists all moves that a given Pokemon can learn through breeding with a given father """
    con = get_db()
    cur = con.cursor()
    cur.execute(f'''
                select MoveName from Pokemon P1 natural join LearnsByBreeding natural join Move 
                join Pokemon P2 on LearnsByBreeding.Father = P2.Dex
                where P1.PokemonName = "{pokemon_name}" and P2.PokemonName = "{father_name}";
                ''')
    return qj.sqlite_to_json(cur.fetchall())
