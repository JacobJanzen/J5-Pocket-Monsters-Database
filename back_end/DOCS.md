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
| dex_pokemon_names | GET |  | Lists all of the pokemon names and their position in the Pokedex|
| pokemon_stats | GET | pokemon_name | Lists the stats of a pokemon |
| pokemon_evolutions | GET | pokemon_name | Lists the evolutions of a pokemon |
| pokemon_with_move | GET | move_name | Lists the pokemon with a given move |
| pokemon_from_types_with_highest_stat | GET | stat_name | Lists the pokemon from each type with the highest value in a given stat |
| pokemon_from_types_with_lowest_stat | GET | stat_name | Lists the pokemon from each type with the lowest value in a given stat |
| pokemon_with_stat_greater_than | GET | stat_name, min_value | Lists the pokemon having a minimum value of a given stat |
| pokemon_with_stat_less_than | GET | stat_name, max_value | Lists the pokemon having a maximum value of a given stat |
| pokemon_can_be_caught_at_location | GET | location_name | Lists the pokemon that can be caught at a given location |
| pokemon_can_be_caught_at_location_from_encounter | GET | location_name, encounter_name | Lists the pokemon that can be caught at a given location from a given encounter |


## Move Selection

## Location Selection

## Type Selection