from flaskr.query_to_json import sqlite_to_json as qj

from flask import Blueprint

from flaskr.db import get_db

bp = Blueprint('moves', __name__, url_prefix='/pokemon')


@bp.route('/pokemon_names')
def pokemon_names():
    """Lists all of the pokemon names"""
    con = get_db()
    cur = con.cursor()
    cur.execute('select PokemonName from Pokemon')
    return qj.sqlite_to_json(cur.fetchall())


@bp.route('/move_names')
def move_names():
    """Lists all of the move names"""
    con = get_db()
    cur = con.cursor()
    cur.execute('select MoveName from Move')
    return qj.sqlite_to_json(cur.fetchall())


@bp.route('/hatch_times')
def hatch_times():
    """Lists all of the Pokemons' hatch times """
    con = get_db()
    cur = con.cursor()
    cur.execute('select PokemonName, Dex, HatchTime from Pokemon')
    return qj.sqlite_to_json(cur.fetchall())


@bp.route('/dex_pokemon_names')
def dex_pokemon_names():
    """Lists all of the pokemon names and their position in the Pokedex"""
    con = get_db()
    cur = con.cursor()
    cur.execute('select Dex, PokemonName from Pokemon')
    return qj.sqlite_to_json(cur.fetchall())


@bp.route('/trainer_data')
def trainer_data():
    """Lists all data from all trainers"""
    con = get_db()
    cur = con.cursor()
    cur.execute('select * from Trainer')
    return qj.sqlite_to_json(cur.fetchall())


@bp.route('/pokemon_stats/<pokemon_name>')
def pokemon_stats(pokemon_name: str):
    """Lists the stats of a pokemon"""
    con = get_db()
    cur = con.cursor()
    cur.execute(f'''
                select HP, Atk, Def, SpA, SpD, Spe from Pokemon
                where PokemonName = "{pokemon_name}"
                ''')
    return qj.sqlite_to_json(cur.fetchall())


@bp.route('/pokemon_evolutions/<pokemon_name>')
def pokemon_evolutions(pokemon_name: str):
    """Lists the evolutions of a pokemon"""
    con = get_db()
    cur = con.cursor()
    cur.execute(f'''
                select P2.Dex, P2.PokemonName from Pokemon P1, Pokemon P2
                where P2.EvolvesFrom = P1.Dex and P1.PokemonName = "{pokemon_name}"
                ''')
    return qj.sqlite_to_json(cur.fetchall())


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
    return qj.sqlite_to_json(cur.fetchall())


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
    return qj.sqlite_to_json(cur.fetchall())


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
    return qj.sqlite_to_json(cur.fetchall())


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
    return qj.sqlite_to_json(cur.fetchall())


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
    return qj.sqlite_to_json(cur.fetchall())


@bp.route('/pokemon_can_be_caught_at_location/<location_name>')
def pokemon_can_be_caught_at_location(location_name: str):
    """Lists the pokemon that can be caught at a given location"""
    con = get_db()
    cur = con.cursor()
    cur.execute(f'''
                select Dex, PokemonName, Encounter from Pokemon natural join FoundAt
                where FoundAt.LocationName = "{location_name}"
                ''')
    return qj.sqlite_to_json(cur.fetchall())


@bp.route('/pokemon_can_be_caught_at_location_from_encounter/<location_name>&<encounter_name>')
def pokemon_can_be_caught_at_location_from_encounter(location_name: str, encounter_name: str):
    """Lists the pokemon that can be caught at a given location from a given encounter"""
    con = get_db()
    cur = con.cursor()
    cur.execute(f'''
                select Dex, PokemonName, Encounter from Pokemon natural join FoundAt
                where FoundAt.LocationName = "{location_name}" and Encounter = "{encounter_name}";   
                ''')
    return qj.sqlite_to_json(cur.fetchall())


@bp.route('/pokemon_with_supereffective_against_pokemon/<pokemon_name>')
def pokemon_with_supereffective_against_pokemon(pokemon_name: str):
    """Lists the pokemon that can learn a move that is supereffective on a given pokemon"""
    con = get_db()
    cur = con.cursor()
    cur.execute(f'''
                select PokemonName, MoveName, TypeName, Method
                from Pokemon natural join Learns natural join Move
                where MoveName in(
                    select MoveName from 
                    Move natural join Type TAtt join Effectiveness on TAtt.TypeName = Effectiveness.Attacker
                    join Type TDef on Effectiveness.Defender = TDef.TypeName join HasTypes on TDef.TypeName = HasTypes.TypeName
                    join Pokemon on HasTypes.Dex = Pokemon.Dex
                    where Move.Status = 0 and Pokemon.PokemonName = {pokemon_name}
                    group by MoveName
                    having (sum(Quality)/count(Quality) = 1.5 or sum(Quality)/count(Quality) = 2) and min(Quality) <> 0
                ) 
                union
                select P1.PokemonName, MoveName, TypeName, 'Breeding: ' || P2.PokemonName from Pokemon P1 natural join LearnsByBreeding natural join Move 
                join Pokemon P2 on LearnsByBreeding.Father = P2.Dex
                where MoveName in(
                    select MoveName from 
                    Move natural join Type TAtt join Effectiveness on TAtt.TypeName = Effectiveness.Attacker
                    join Type TDef on Effectiveness.Defender = TDef.TypeName join HasTypes on TDef.TypeName = HasTypes.TypeName
                    join Pokemon on HasTypes.Dex = Pokemon.Dex
                    where Move.Status = 0 and Pokemon.PokemonName = {pokemon_name}
                    group by MoveName
                    having (sum(Quality)/count(Quality) = 1.5 or sum(Quality)/count(Quality) = 2) and min(Quality) <> 0
                ) 
                order by PokemonName;  
                ''')
    return qj.sqlite_to_json(cur.fetchall())


@bp.route('/pokemon_from_location_with_supereffective_against_pokemon/<pokemon_name>&<location_name>')
def pokemon_from_location_with_supereffective_against_pokemon(pokemon_name: str, location_name: str):
    """Lists the pokemon that can be caught at a given location that can learn a move that is supereffective on a
    given pokemon """
    con = get_db()
    cur = con.cursor()
    cur.execute(f'''
                select PokemonName, MoveName, TypeName, Method
                from Pokemon natural join Learns natural join Move natural join FoundAt
                where LocationName = "{location_name}" and MoveName in(
                    select MoveName from 
                    Move natural join Type TAtt join Effectiveness on TAtt.TypeName = Effectiveness.Attacker
                    join Type TDef on Effectiveness.Defender = TDef.TypeName join HasTypes on TDef.TypeName = HasTypes.TypeName
                    join Pokemon on HasTypes.Dex = Pokemon.Dex
                    where Move.Status = 0 and Pokemon.PokemonName = "{pokemon_name}"
                    group by MoveName
                    having (sum(Quality)/count(Quality) = 1.5 or sum(Quality)/count(Quality) = 2) and min(Quality) <> 0
                )
                union
                select P1.PokemonName, MoveName, TypeName, 'Breeding: ' || P2.PokemonName 
                from Pokemon P1 natural join LearnsByBreeding natural join Move 
                join Pokemon P2 on LearnsByBreeding.Father = P2.Dex natural join FoundAt
                where LocationName = "{location_name}" and MoveName in(
                    select MoveName from 
                    Move natural join Type TAtt join Effectiveness on TAtt.TypeName = Effectiveness.Attacker
                    join Type TDef on Effectiveness.Defender = TDef.TypeName join HasTypes on TDef.TypeName = HasTypes.TypeName
                    join Pokemon on HasTypes.Dex = Pokemon.Dex
                    where Move.Status = 0 and Pokemon.PokemonName = "{pokemon_name}"
                    group by MoveName
                    having (sum(Quality)/count(Quality) = 1.5 or sum(Quality)/count(Quality) = 2) and min(Quality) <> 0
                ) 
                order by PokemonName;
                ''')
    return qj.sqlite_to_json(cur.fetchall())


@bp.route('/pokemon_that_move_is_supereffective_against/<move_name>')
def pokemon_that_move_is_supereffective_against(move_name: str):
    """Lists the pokemon that a given move is supereffective against"""
    con = get_db()
    cur = con.cursor()
    cur.execute(f'''
                select PokemonName, CAST((sum(Quality)-count(Quality))*2 as varchar) || 'x' as Effect from 
                Move natural join Type TAtt join Effectiveness on TAtt.TypeName = Effectiveness.Attacker
                join Type TDef on Effectiveness.Defender = TDef.TypeName join HasTypes on TDef.TypeName = HasTypes.TypeName
                join Pokemon on HasTypes.Dex = Pokemon.Dex
                where Move.Status = 0 and Move.MoveName = "{move_name}"
                group by PokemonName
                having (sum(Quality)/count(Quality) = 1.5 or sum(Quality)/count(Quality) = 2) and min(Quality) <> 0
                order by PokemonName;
                ''')
    return qj.sqlite_to_json(cur.fetchall())


@bp.route('/pokemon_that_move_is_neutral_against/<move_name>')
def pokemon_that_move_is_neutral_against(move_name: str):
    """Lists the pokemon that a given move is neutral against"""
    con = get_db()
    cur = con.cursor()
    cur.execute(f'''
                select PokemonName, '1x' as Effect from 
                Move natural join Type TAtt join Effectiveness on TAtt.TypeName = Effectiveness.Attacker
                join Type TDef on Effectiveness.Defender = TDef.TypeName join HasTypes on TDef.TypeName = HasTypes.TypeName
                join Pokemon on HasTypes.Dex = Pokemon.Dex
                where Move.Status = 0 and Move.MoveName = "{move_name}"
                group by PokemonName
                having (sum(Quality)/count(Quality) = 1 or sum(Quality)/count(Quality) = 1.25) and min(Quality) <> 0
                order by PokemonName;
                ''')
    return qj.sqlite_to_json(cur.fetchall())


@bp.route('/pokemon_that_move_is_weak_against/<move_name>')
def pokemon_that_move_is_weak_against(move_name: str):
    """Lists the pokemon that a given move is weak against"""
    con = get_db()
    cur = con.cursor()
    cur.execute(f'''
                select PokemonName, CAST((sum(Quality)/count(Quality)-0.25*(count(Quality)-1)) as varchar) || 'x' as Effect from 
                Move natural join Type TAtt join Effectiveness on TAtt.TypeName = Effectiveness.Attacker
                join Type TDef on Effectiveness.Defender = TDef.TypeName join HasTypes on TDef.TypeName = HasTypes.TypeName
                join Pokemon on HasTypes.Dex = Pokemon.Dex
                where Move.Status = 0 and Move.MoveName = "{move_name}"
                group by PokemonName
                having (sum(Quality)/count(Quality) = 0.75 or sum(Quality)/count(Quality) = 0.5) and min(Quality) <> 0
                order by PokemonName;
                ''')
    return qj.sqlite_to_json(cur.fetchall())


@bp.route('/pokemon_that_move_is_noteffective_against/<move_name>')
def pokemon_that_move_is_noteffective_against(move_name: str):
    """Lists the pokemon that a given move is not effective against"""
    con = get_db()
    cur = con.cursor()
    cur.execute(f'''
                select PokemonName, '0x' as Effect from 
                Move natural join Type TAtt join Effectiveness on TAtt.TypeName = Effectiveness.Attacker
                join Type TDef on Effectiveness.Defender = TDef.TypeName join HasTypes on TDef.TypeName = HasTypes.TypeName
                join Pokemon on HasTypes.Dex = Pokemon.Dex
                where Move.Status = 0 and Move.MoveName = "{move_name}"
                group by PokemonName
                having min(Quality) = 0
                order by PokemonName;
                ''')
    return qj.sqlite_to_json(cur.fetchall())


@bp.route('/effects_on_pokemon_by_move/<move_name>')
def effects_on_pokemon_by_move(move_name: str):
    """Lists the effects that a given move has on pokemon"""
    con = get_db()
    cur = con.cursor()
    cur.execute(f'''
                select PokemonName, CAST((sum(Quality)-count(Quality))*2 as varchar) || 'x' as Effect from 
                Move natural join Type TAtt join Effectiveness on TAtt.TypeName = Effectiveness.Attacker
                join Type TDef on Effectiveness.Defender = TDef.TypeName join HasTypes on TDef.TypeName = HasTypes.TypeName
                join Pokemon on HasTypes.Dex = Pokemon.Dex
                where Move.Status = 0 and Move.MoveName = "{move_name}"
                group by PokemonName
                having (sum(Quality)/count(Quality) = 1.5 or sum(Quality)/count(Quality) = 2) and min(Quality) <> 0
                
                union
                
                select PokemonName, '1x' as Effect from 
                Move natural join Type TAtt join Effectiveness on TAtt.TypeName = Effectiveness.Attacker
                join Type TDef on Effectiveness.Defender = TDef.TypeName join HasTypes on TDef.TypeName = HasTypes.TypeName
                join Pokemon on HasTypes.Dex = Pokemon.Dex
                where Move.Status = 0 and Move.MoveName = "{move_name}"
                group by PokemonName
                having (sum(Quality)/count(Quality) = 1 or sum(Quality)/count(Quality) = 1.25) and min(Quality) <> 0
                
                union
                
                select PokemonName, CAST((sum(Quality)/count(Quality)-0.25*(count(Quality)-1)) as varchar) || 'x' as Effect from 
                Move natural join Type TAtt join Effectiveness on TAtt.TypeName = Effectiveness.Attacker
                join Type TDef on Effectiveness.Defender = TDef.TypeName join HasTypes on TDef.TypeName = HasTypes.TypeName
                join Pokemon on HasTypes.Dex = Pokemon.Dex
                where Move.Status = 0 and Move.MoveName = "{move_name}"
                group by PokemonName
                having (sum(Quality)/count(Quality) = 0.75 or sum(Quality)/count(Quality) = 0.5) and min(Quality) <> 0
                
                union
                
                select PokemonName, '0x' as Effect from 
                Move natural join Type TAtt join Effectiveness on TAtt.TypeName = Effectiveness.Attacker
                join Type TDef on Effectiveness.Defender = TDef.TypeName join HasTypes on TDef.TypeName = HasTypes.TypeName
                join Pokemon on HasTypes.Dex = Pokemon.Dex
                where Move.Status = 0 and Move.MoveName = "{move_name}"
                group by PokemonName
                having min(Quality) = 0
                order by PokemonName;
                ''')
    return qj.sqlite_to_json(cur.fetchall())


@bp.route('/pokemon_abilities')
def pokemon_abilities():
    """Lists all abilities that pokemon have"""
    con = get_db()
    cur = con.cursor()
    cur.execute(f'''
                select PokemonName, Ability from Pokemon natural join Abilities;
                ''')
    return qj.sqlite_to_json(cur.fetchall())


@bp.route('/pokemon_with_ability/<ability_name>')
def pokemon_with_ability(ability_name: str):
    """Lists all pokemon that have a given ablility"""
    con = get_db()
    cur = con.cursor()
    cur.execute(f'''
                select PokemonName, Ability from Pokemon natural join Abilities
                where Ability = "{ability_name}";
                ''')
    return qj.sqlite_to_json(cur.fetchall())


@bp.route('/pokemon_of_type_can_learn_other_type/<pokemon_type_name>&<move_type_name>')
def pokemon_of_type_can_learn_other_type(pokemon_type_name: str, move_type_name: str):
    """Lists all pokemon of a given type that can learn moves of a given type"""
    con = get_db()
    cur = con.cursor()
    cur.execute(f'''
                select PokemonName, MoveName 
                from Pokemon natural join Learns natural join Move join HasTypes on Pokemon.Dex = HasTypes.Dex
                where HasTypes.TypeName = "{pokemon_type_name}" and Move.TypeName = "{move_type_name}"
                union
                select P1.PokemonName, MoveName 
                from Pokemon P1 join HasTypes on P1.Dex = HasTypes.Dex natural join LearnsByBreeding natural join Move 
                join Pokemon P2 on LearnsByBreeding.Father = P2.Dex
                where HasTypes.TypeName = "{pokemon_type_name}" and Move.TypeName = "{move_type_name}";
                ''')
    return qj.sqlite_to_json(cur.fetchall())


@bp.route('/pokemon_of_type_can_learn_other_type_from_method/<pokemon_type_name>&<move_type_name>')
def pokemon_of_type_can_learn_other_type_from_method(pokemon_type_name: str, move_type_name: str):
    """Lists all pokemon of a given type that can learn moves of a given type and the methods by which they learn those moves"""
    con = get_db()
    cur = con.cursor()
    cur.execute(f'''
                select PokemonName, MoveName, Method 
                from Pokemon natural join Learns natural join Move join HasTypes on Pokemon.Dex = HasTypes.Dex
                where HasTypes.TypeName = "{pokemon_type_name}" and Move.TypeName = "{move_type_name}"
                union
                select P1.PokemonName, MoveName, 'Breeding: ' || P2.PokemonName 
                from Pokemon P1 join HasTypes on P1.Dex = HasTypes.Dex natural join LearnsByBreeding natural join Move 
                join Pokemon P2 on LearnsByBreeding.Father = P2.Dex
                where HasTypes.TypeName = "{pokemon_type_name}" and Move.TypeName = "{move_type_name}";
                ''')
    return qj.sqlite_to_json(cur.fetchall())
