# API Documentation
This contains the names of all the implemented API methods in the Flask app.

## Search and Drop-downs

|Method Name |Type |Description|
|---|---|---|
| pokemon_names | GET | Lists all of the pokemon names |
| move_names | GET | Lists all of the move names |

## Pokemon Selection

|Method Name |HTTP Method | Parameters | Description|
|---|---|---|---|
| dex_pokemon_names | GET |  | Lists all of the Pokemon names and their position in the Pokedex|
| trainer_data | GET |  | Lists all data from all trainers|
| hatch_times | GET |  | Lists all of the Pokemons' hatch times |
| pokemon_stats | GET | pokemon_name | Lists the stats of a Pokemon |
| pokemon_evolutions | GET | pokemon_name | Lists the evolutions of a Pokemon |
| pokemon_with_move | GET | move_name | Lists the Pokemon with a given move |
| pokemon_from_types_with_highest_stat | GET | stat_name | Lists the Pokemon from each type with the highest value in a given stat |
| pokemon_from_types_with_lowest_stat | GET | stat_name | Lists the Pokemon from each type with the lowest value in a given stat |
| pokemon_with_stat_greater_than | GET | stat_name, min_value | Lists the Pokemon having a minimum value of a given stat |
| pokemon_with_stat_less_than | GET | stat_name, max_value | Lists the Pokemon having a maximum value of a given stat |
| pokemon_can_be_caught_at_location | GET | location_name | Lists the Pokemon that can be caught at a given location |
| pokemon_can_be_caught_at_location_from_encounter | GET | location_name, encounter_name | Lists the Pokemon that can be caught at a given location from a given encounter |
| pokemon_with_supereffective_against_pokemon | GET | pokemon_name | Lists the Pokemon that can learn a move that is supereffective on a given pokemon |
| pokemon_from_location_with_supereffective_against_pokemon | GET | pokemon_name, location_name | Lists the Pokemon that can be caught at a given location that can learn a move that is supereffective on a given pokemon |
| pokemon_that_move_is_supereffective_against | GET | move_name | Lists the Pokemon that a given move is super effective against |
| pokemon_that_move_is_neutral_against | GET | move_name |Lists the Pokemon that a given move is neutral against |
| pokemon_that_move_is_weak_against | GET | move_name | Lists the Pokemon that a given move is weak against |
| pokemon_that_move_is_noteffective_against | GET | move_name | Lists the Pokemon that a given move is not effective against |
| effects_on_pokemon_by_move | GET | move_name | Lists the effects that a given move has on Pokemon |
| pokemon_abilities | GET |  | Lists all abilities that Pokemon have |
| pokemon_with_ability | GET | ability_name | Lists all Pokemon that have a given ability |
| pokemon_of_type_can_learn_other_type | GET | pokemon_type_name, move_type_name | Lists all Pokemon of a given type that can learn moves of a given type |
| pokemon_of_type_can_learn_other_type_from_method | GET | pokemon_type_name, move_type_name | Lists all Pokemon of a given type that can learn moves of a given type and the methods by which they learn those moves |

## Move Selection

|Method Name |HTTP Method | Parameters | Description|
|---|---|---|---|
| moves_learned_by_all_pokemon | GET | | Lists the moves that are learned by all Pokemon |
| moves_learned_by_pokemon_by_method | GET | | Lists the moves that are learned by all Pokemon and the method by which they are learned |
| moves_learned_by_a_pokemon | GET | pokemon_name | Lists the moves that are learned by a given Pokemon |
| moves_learned_by_a_pokemon_by_method | GET | pokemon_name | Lists the moves that are learned by a given Pokemon and the method by which they are learned |
| moves_with_effectiveness_against_type | GET | type_name, quality | Lists the moves that have a given effectiveness against a given type |
| moves_supereffective_against_pokemon | GET | pokemon_name | Lists all of the moves that are super effective against a given pokemon |
| moves_neutral_against_pokemon | GET | pokemon_name | Lists all of the moves that are neutral against a given Pokemon |
| moves_not_very_effective_against_pokemon | GET | pokemon_name | Lists all of the moves that are not very effective against a given pokemon |
| moves_non_effective_against_pokemon | GET | pokemon_name | Lists all of the moves that are not effective against a given pokemon |
| moves_effectiveness_against_pokemon| GET | pokemon_name| Lists the effectiveness of all moves against a given Pokemon |
| status_moves | GET | | Lists all status moves |
| methods_pokemon_can_learn_move | GET | pokemon_name, move_name | Lists all ways a Pokemon learns a given move |
| moves_of_type_that_pokemon_can_learn | GET | pokemon_name, type_name | Lists all moves of a given type that a given Pokemon can learn |
| moves_of_type_that_pokemon_can_learn_by_method | GET | pokemon_name, type_name| Lists all of moves a certain type that a given Pokemon can learn and the method by which they are learned |
| moves_pokemon_learns_with_method | GET | pokemon_name, method_name | Lists all moves a given Pokemon learns with a given breeding method |
| moves_pokemon_learns_by_breeding | GET | pokemon_name | Lists all moves a Pokemon learns through breeding |
| moves_pokemon_learns_by_breeding_with_father | GET | pokemon_name, father_name | Lists all moves that a given Pokemon can learn through breeding with a given father |
| tm_moves | GET |  | Lists all TM moves |
| hm_moves | GET |  | Lists all HM moves |
| tm_moves_all_pokemon | GET |  | Lists all moves all Pokemon learn by TM |
| hm_moves_all_pokemon | GET |  | Lists all moves all Pokemon learn by HM |
| tm_moves_pokemon | GET | pokemon_name | Lists all moves a given Pokemon learns by TM |
| hm_moves_pokemon | GET | pokemon_name| Lists all moves a given Pokemon learns by HM |


## Location Selection

|Method Name |HTTP Method | Parameters | Description|
|---|---|---|---|
| locations_pokemon_can_be_found | GET | pokemon_name | Lists the locations that a Pokemon may be found at |
| locations_pokemon_can_be_found_with_method | GET | pokemon_name, method_name | Lists the locations that a Pokemon may be found at and the method by which they can be found |
| locations_with_pokemon_of_type | GET | type_name | Lists the locations that a Pokemon of a given type can be found |
| locations_with_pokemon_of_dual_type | GET | first_type_name, second-type_name | Lists the locations that a Pokemon with two given types can be found |
| locations_with_trainer | GET | trainer_id | Lists the locations with the given trainer |
| locations_with_trainer_class | GET | trainer_class | Lists the locations with trainers of the given trainer class |
| locations_with_trainer_class_fight | GET | trainer_class | Lists the locations with trainers of the given trainer class that can be fought |
| locations_with_pokemon_of_level | GET | pokemon_name, minimum_level | Lists locations where a given Pokemon of at least a given level can be found |

## Type Selection

|Method Name |HTTP Method | Parameters | Description|
|---|---|---|---|
| number_of_pokemon_per_type | GET | | Lists the number of Pokemon per type |
| types_with_physical_damage | GET | | Lists the types with physical damage type |
| types_with_special_damage | GET | | Lists the types with special damage type |

## Breeding Selection

|Method Name |HTTP Method | Parameters | Description|
|---|---|---|---|
| pokemon_in_egg_group | GET | egg_group_name | Lists all Pokemon in a given egg group |
| pokemon_can_breed_with | GET | pokemon_name | Lists all Pokemon that a given Pokemon can breed with |

## Team Selection

|Method Name |HTTP Method | Parameters | Description|
|---|---|---|---|
| teams_with_trainer | GET | trainer_id | Lists all of the teams of a given trainer | 
| teams_with_pokemon | GET | pokemon_name | Lists all of the teams with a given Pokemon |
| teams_with_minimum_level | GET | minimum_level | Lists all of the teams with a given minimum level |
| teams_with_maximum_level | GET | maximum_level | Lists all of the teams with a given maximum level |

## Table Selection
|Method Name |HTTP Method | Parameters | Description|
|---|---|---|---|
| pokemon |   |   | Lists everything in the Pokemon table  |
| move |   |   | Lists everything in the Move table  |
| trainer |   |   | Lists everything in the Trainer table  |
| type |   |   | Lists everything in the Type table  |
| effectiveness |   |   | Lists everything in the Effectiveness table  |
| team | GET |   | Lists everything in the Team table  |
| tm | GET |   | Lists everything in the TM table  |
| hm | GET |   | Lists everything in the HM table  |
| learns | GET |   | Lists everything in the Learns table  |
| learnsbybreeding | GET |   | Lists everything in the LearnsByBreeding table  |
| egggroups | GET |   | Lists everything in the EggGroups table  |
| abilities |  GET   |   | Lists everything in the Abilities table  |
| locations |  GET   |   | Lists everything in the Locations table  |
| foundat |  GET   |   | Lists everything in the FoughtAt table  |
| foughtat |   GET   |  | Lists everything in the FoughtAt table  |
| hastypes |  GET  |   | Lists everything in the HasTypes table  |
| teammember | GET |   | Lists everything in the TeamMember table  |
