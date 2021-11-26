<template>
    <div class="INTERACThome">
        <h1>Interact with the Database!</h1>

        <h3 id ="temp">Select which info you're looking for in the drop-down below</h3>
      
    <v-container fluid class="querySelect">
      <v-row align="center">
          <v-autocomplete 
            v-model="selectQuery"
            :items="queries"
            item-text="value"
            item-value="id"
            label="What do you want to know?"
            persistent-hint
            return-object
            single-line
          ></v-autocomplete>
      </v-row>
    </v-container>

      <h3>Select the specific data you're requesting below...</h3>

    <v-container fluid class="selectLocation" v-if="locationVisible">
      <v-row align="center">
        <v-col cols="6">
          <v-autocomplete
            v-model="selectLocation"
            :items="locations"
            item-text="LocationName"
            item-value="LocationName"
            label="Which location are you looking for?"
            persistent-hint
            return-object
            single-line
            filled
          ></v-autocomplete>
        </v-col>
      </v-row>
    </v-container>

    <v-container fluid class="selectAbility" v-if="abilityVisible">
      <v-row align="center">
        <v-col cols="6">
          <v-autocomplete
            v-model="selectAbility"
            :items="abilities"
            item-text="Ability"
            item-value=Dex
            label="Which ability are you looking for?"
            persistent-hint
            return-object
            single-line
            filled
          ></v-autocomplete>
        </v-col>
      </v-row>
    </v-container>

      <v-container fluid class="selectType" v-if="typeVisible">
      <v-row align="center">
        <v-col cols="6">
          <v-autocomplete
            v-model="selectType"
            :items="types"
            item-text="TypeName"
            item-value="Category"
            label="Which type are you looking for?"
            persistent-hint
            return-object
            single-line
            filled
          ></v-autocomplete>
        </v-col>
      </v-row>
    </v-container>

    <v-container fluid class="selectSecondType" v-if="secondTypeVisible">
      <v-row align="center">
        <v-col cols="6">
          <v-autocomplete
            v-model="selectSecondType"
            :items="types"
            item-text="TypeName"
            item-value="Category"
            label="What is the second type are you looking for?"
            persistent-hint
            return-object
            single-line
            filled
          ></v-autocomplete>
        </v-col>
      </v-row>
    </v-container>

     <v-container fluid class="selectTrainerName" v-if="trainerNameVisible">
      <v-row align="center">
        <v-col cols="6">
          <v-autocomplete
            v-model="selectTrainerName"
            :items="trainers"
            item-text=TrainerName
            item-value=TID
            label="Which trainer are you looking for?"
            persistent-hint
            return-object
            single-line
            filled
          ></v-autocomplete>
        </v-col>
      </v-row>
    </v-container>

    <v-container fluid class="selectTrainerClass" v-if="trainerClassVisible">
      <v-row align="center">
        <v-col cols="6">
          <v-autocomplete
            v-model="selectTrainerClass"
            :items="trainers"
            item-text=TrainerClass
            item-value=TID
            label="Which trainer class are you looking for?"
            persistent-hint
            return-object
            single-line
            filled
          ></v-autocomplete>
        </v-col>
      </v-row>
    </v-container>

    <v-container fluid class="selectPokemonName" v-if="pokemonNameVisible">
      <v-row align="center">
        <v-col cols="6">
          <v-autocomplete
            v-model="selectPokemonName"
            :items="pokemon"
            item-text=PokemonName
            item-value=Dex
            label="Which Pokemon are you looking for?"
            persistent-hint
            return-object
            single-line
            filled
          ></v-autocomplete>
        </v-col>
      </v-row>
    </v-container>

    <v-container fluid class="selectEggGroup" v-if="eggGroupVisible">
      <v-row align="center">
        <v-col cols="6">
          <v-autocomplete
            v-model="selectEggGroup"
            :items="egggroups"
            item-text=GroupName
            item-value=Dex
            label="Which Egg Group are you looking for?"
            persistent-hint
            return-object
            single-line
            filled
          ></v-autocomplete>
        </v-col>
      </v-row>
    </v-container>

    <v-container fluid class="selectLevel" v-if="levelSelectVisible">
      <v-row align="center">
        <v-col cols="6">
          <v-autocomplete
            v-model="selectLevel"
            :items="levels"
            item-text=Level
            item-value=Level
            label="Which Level are you looking for?"
            persistent-hint
            return-object
            single-line
            filled
          ></v-autocomplete>
        </v-col>
      </v-row>
    </v-container>


    <!-- temp display of what is currently selected -->
    <label id="query">
      {{updateQuery}}
    </label>

    </div>
</template>

<script> 

 export default {
     data () {
      return {
        //prolly set all to false to begin with??
        locationVisible: false,
        abilityVisible: false,
        typeVisible: false,
        secondTypeVisible:false,
        trainerNameVisible: false,
        trainerClassVisible: false,
        pokemonNameVisible:false,
        eggGroupVisible: false,
        levelSelectVisible: false,
        //add all other params here

        selectQuery: { value: 'query', id: '0' },
        queries: [
          { value: 'What do you want to know?', id: '0' },
          //Breeding File
          { value: 'The Pokemon in a given egg group', id: '1' },
          { value: 'The Pokemon a given Pokemon can breed with', id: '2' },
          //Locations File
          { value: 'The locations a Pokemon may be found at', id: '3' },
          { value: 'The locations a Pokemon may be found and the method which they can be found', id: '4' },
          { value: 'The locations a Pokemon of given type can be found', id: '5' },
          { value: 'The locations that a Pokemon with two given types can be found', id: '6' },
          { value: 'The locations with a given trainer', id: '7' },
          { value: 'The locations with trainers of a given trainer class', id: '8' },
          { value: 'The locations where a certain trainer class can be fought', id: '9' },
          { value: 'The locations where a certain Pokemon of at least a certain level can be found', id: '10' },
          //Moves File
          { value: 'List the moves that are learned by all Pokemon', id: '11' },
          { value: 'Moves that are learned by all Pokemon and the method by which they\'re learned', id: '12' },
          { value: 'Moves that are learned by a given Pokemon', id: '13' },
          { value: 'Moves that are learned by a given Pokemon and the method by which they\'re learned', id: '14' },
          { value: 'Moves that are supereffective against a given Pokemon', id: '15' }, //combine 15-17 into a dropdown for effectiveness??
          { value: 'Moves that are neutral against a given Pokemon', id: '16' },
          { value: 'Moves that are not effective against a given Pokemon', id: '17' },
          { value: '/moves_non_effective_against_pokemon/<pokemon_name>', id: '18' },//idk wtf that one does
          { value: '/moves_effectiveness_against_pokemon/<pokemon_name>', id: '19' },//^
          { value: 'List all status moves', id: '20' },
          { value: 'Ways a Pokemon learns a given move', id: '21' },
          { value: 'Moves of a given type that a Pokemon can learn', id: '22' },
          { value: 'Moves of a given type that a Pokemon can learn and the method by which they\'re learned', id: '23' },
          { value: 'Moves a given Pokemon learns with a given breeding method', id: '24' },
          { value: 'Moves a Pokemon learns through breeding', id: '25' },
          { value: 'Moves a Pokemon can learn through breeding with a given father', id: '26' },
          //Pokemon File
          { value: 'All Pokemon names', id: '27' },
          { value: 'All Move names', id: '28' },
          { value: 'Pokemon and their pokedex position', id: '29' },
          { value: 'All Trainer data', id: '30' },
          { value: 'Stats of a given Pokemon', id: '31' },
          { value: 'Evolutions of a given Pokemon', id: '32' },
          { value: 'Pokemon with a given move', id: '33' },
          { value: 'Pokemon from each type with the highest value in a given stat', id: '34' },
          { value: 'Pokemon from each type with the lowest value in a given stat', id: '35' },
          { value: 'Pokemon having minimum value of a given stat', id: '36' },     
          { value: 'Pokemon having a maximum value of a given stat', id: '37' },  
          { value: 'Pokemon which can be caught at a given location', id: '38' },  
          { value: 'Pokemon which can be caught at a given location from a given encounter', id: '39' },  
          { value: 'Pokemon which can learn a move that is supereffective on a given Pokemon', id: '40' },  
          { value: 'Pokemon that can be caught at a given location that can learn a move that is supereffective one a given Pokemon', id: '41' },    
          { value: 'Pokemon that a given move is supereffective against', id: '42' },  //combine 42-45 with a effectiveness dropdown
          { value: 'Pokemon that a given move is neutral against', id: '43' },  
          { value: 'Pokemon that a given move is weak against', id: '44' },  
          { value: 'Pokemon that a given move is not effective against', id: '45' },  
          { value: 'Effects a given move has on a Pokemon', id: '46' },  
          { value: 'All Abilities Pokemon have', id: '47' },  
          { value: 'Pokemon with a given ability', id: '48' },
          { value: 'Pokemon of a given type that can learn moves of a given type', id: '49' },
          { value: 'Pokemon of a given type that can learn moves of a given type and the methods by which they\'re learned', id: '50' },
          //Teams File
          { value: 'All teams of a given Trainer', id: '51' },
          { value: 'All teams with a given Pokemon', id: '52' },
          { value: 'All teams with minimum level', id: '53' },
          { value: 'All teams with a maximum level', id: '54' },
          //Types File
          { value: 'Number of Pokemon per type', id: '55' },
          { value: 'Types with physical damage type', id: '56' },
          { value: 'Types with special damage type', id: '57' },

        ],

        // Max level is 100
        selectLevel: {},
        levels:[
          {Level: 1},
          {Level: 2},
          {Level: 3},
          {Level: 4},
          {Level: 5},
          {Level: 6},
          {Level: 7},
          {Level: 8},
          {Level: 9},
          {Level: 10},
          {Level: 11},
          {Level: 12},
          {Level: 13},
          {Level: 14},
          {Level: 15},
          {Level: 16},
          {Level: 17},
          {Level: 18},
          {Level: 19},
          {Level: 20},
          {Level: 21},
          {Level: 22},
          {Level: 23},
          {Level: 24},
          {Level: 25},
          {Level: 26},
          {Level: 27},
          {Level: 28},
          {Level: 29},
          {Level: 30},
          {Level: 31},
          {Level: 32},
          {Level: 33},
          {Level: 34},
          {Level: 35},
          {Level: 36},
          {Level: 37},
          {Level: 38},
          {Level: 39},
          {Level: 40},
          {Level: 41},
          {Level: 42},
          {Level: 43},
          {Level: 44},
          {Level: 45},
          {Level: 46},
          {Level: 47},
          {Level: 48},
          {Level: 49},
          {Level: 50},
          {Level: 51},
          {Level: 52},
          {Level: 53},
          {Level: 54},
          {Level: 55},
          {Level: 56},
          {Level: 57},
          {Level: 58},
          {Level: 59},
          {Level: 60},
          {Level: 61},
          {Level: 62},
          {Level: 63},
          {Level: 64},
          {Level: 65},
          {Level: 66},
          {Level: 67},
          {Level: 68},
          {Level: 69},
          {Level: 70},
          {Level: 71},
          {Level: 72},
          {Level: 73},
          {Level: 74},
          {Level: 75},
          {Level: 76},
          {Level: 77},
          {Level: 78},
          {Level: 79},
          {Level: 80},
          {Level: 81},
          {Level: 82},
          {Level: 83},
          {Level: 84},
          {Level: 85},
          {Level: 86},
          {Level: 87},
          {Level: 88},
          {Level: 89},
          {Level: 90},
          {Level: 91},
          {Level: 92},
          {Level: 93},
          {Level: 94},
          {Level: 95},
          {Level: 96},
          {Level: 97},
          {Level: 98},
          {Level: 99},
          {Level: 100},
        ],

        selectLocation: { LocationName: '0'},
        locations: [
          {LocationName: "Abandoned Ship"},
          {LocationName: "Altering Cave"},
          {LocationName: "Ancient Tomb"},
          {LocationName: "Artisan Cave"},
          {LocationName: "Battle Arena"},
          {LocationName: "Battle Dome"},
          {LocationName: "Battle Factory"},
          {LocationName: "Battle Frontier"},
          {LocationName: "Battle Palace"},
          {LocationName: "Battle Pike"},
          {LocationName: "Battle Pyramid"},
          {LocationName: "Battle Tower"},
          {LocationName: "Birth Island"},
          {LocationName: "Cave of Origin"},
          {LocationName: "Cove Lily Motel"},
          {LocationName: "Desert Ruins"},
          {LocationName: "Desert Underpass"},
          {LocationName: "Devon Corporation"},
          {LocationName: "Dewford Town"},
          {LocationName: "Ever Grande City"},
          {LocationName: "Fallarbor Town"},
          {LocationName: "Fiery Path"},
          {LocationName: "Fortree City"},
          {LocationName: "Granite Cave"},
          {LocationName: "Hoenn Route 101"},
          {LocationName: "Hoenn Route 102"},
          {LocationName: "Hoenn Route 103"},
          {LocationName: "Hoenn Route 104"},
          {LocationName: "Hoenn Route 105"},
          {LocationName: "Hoenn Route 106"},
          {LocationName: "Hoenn Route 107"},
          {LocationName: "Hoenn Route 108"},
          {LocationName: "Hoenn Route 109"},
          {LocationName: "Hoenn Route 110"},
          {LocationName: "Hoenn Route 111"},
          {LocationName: "Hoenn Route 112"},
          {LocationName: "Hoenn Route 113"},
          {LocationName: "Hoenn Route 114"},
          {LocationName: "Hoenn Route 115"},
          {LocationName: "Hoenn Route 116"},
          {LocationName: "Hoenn Route 117"},
          {LocationName: "Hoenn Route 118"},
          {LocationName: "Hoenn Route 119"},
          {LocationName: "Hoenn Route 120"},
          {LocationName: "Hoenn Route 121"},
          {LocationName: "Hoenn Route 122"},
          {LocationName: "Hoenn Route 123"},
          {LocationName: "Hoenn Route 124"},
          {LocationName: "Hoenn Route 125"},
          {LocationName: "Hoenn Route 126"},
          {LocationName: "Hoenn Route 127"},
          {LocationName: "Hoenn Route 128"},
          {LocationName: "Hoenn Route 129"},
          {LocationName: "Hoenn Route 130"},
          {LocationName: "Hoenn Route 131"},
          {LocationName: "Hoenn Route 132"},
          {LocationName: "Hoenn Route 133"},
          {LocationName: "Hoenn Route 134"},
          {LocationName: "Hoenn Safari Zone"},
          {LocationName: "Island Cave"},
          {LocationName: "Jagged Pass"},
          {LocationName: "Lavaridge Town"},
          {LocationName: "Lilycove City"},
          {LocationName: "Lilycove Department Store"},
          {LocationName: "Lilycove Museum"},
          {LocationName: "Littleroot Town"},
          {LocationName: "Magma Hideout (Jagged Pass)"},
          {LocationName: "Marine Cave"},
          {LocationName: "Mauville City"},
          {LocationName: "Mauville Game Corner"},
          {LocationName: "Meteor Falls"},
          {LocationName: "Mirage Island (Generation III)"},
          {LocationName: "Mirage Tower"},
          {LocationName: "Mossdeep City"},
          {LocationName: "Mossdeep Space Center"},
          {LocationName: "Mt. Chimney"},
          {LocationName: "Mt. Pyre"},
          {LocationName: "New Mauville"},
          {LocationName: "Oceanic Museum"},
          {LocationName: "Oldale Town"},
          {LocationName: "Pacifidlog Town"},
          {LocationName: "Petalburg City"},
          {LocationName: "Petalburg Woods"},
          {LocationName: "Rustboro City"},
          {LocationName: "Rusturf Tunnel"},
          {LocationName: "Rydels Cycles"},
          {LocationName: "S.S. Tidal"},
          {LocationName: "Scorched Slab"},
          {LocationName: "Seafloor Cavern"},
          {LocationName: "Sealed Chamber"},
          {LocationName: "Seaside Cycling Road"},
          {LocationName: "Shoal Cave"},
          {LocationName: "Sky Pillar"},
          {LocationName: "Slateport City"},
          {LocationName: "Sootopolis City"},
          {LocationName: "Southern Island"},
          {LocationName: "Sterns Shipyard"},
          {LocationName: "Submarine Explorer 1"},
          {LocationName: "Team Aqua Hideout"},
          {LocationName: "Terra Cave"},
          {LocationName: "Trainer Hill"},
          {LocationName: "Trick House"},
          {LocationName: "Underwater"},
          {LocationName: "Verdanturf Town"},
          {LocationName: "Victory Road (Hoenn)"},
          {LocationName: "Weather Institute"}
        ],

        selectAbility: { Ability: '0'},
        abilities: [
        {
            "Ability": "Overgrow"
        },
        {
            "Ability": "Shield Dust"
        },
        {
            "Ability": "Soundproof"
        },
        {
            "Ability": "Static"
        },
        {
            "Ability": "Chlorophyll"
        },
        {
            "Ability": "Lightning Rod"
        },
        {
            "Ability": "Rock Head"
        },
        {
            "Ability": "Limber"
        },
        {
            "Ability": "Reckless"
        },
        {
            "Ability": "Iron Fist"
        },
        {
            "Ability": "Keen Eye"
        },
        {
            "Ability": "Oblivious"
        },
        {
            "Ability": "Own Tempo"
        },
        {
            "Ability": "Levitate"
        },
        {
            "Ability": "Neutralizing Gas"
        },
        {
            "Ability": "Shed Skin"
        },
        {
            "Ability": "Natural Cure"
        },
        {
            "Ability": "Serene Grace"
        },
        {
            "Ability": "Leaf Guard"
        },
        {
            "Ability": "Early Bird"
        },
        {
            "Ability": "Scrappy"
        },
        {
            "Ability": "Sniper"
        },
        {
            "Ability": "Swift Swim"
        },
        {
            "Ability": "Poison Point"
        },
        {
            "Ability": "Water Veil"
        },
        {
            "Ability": "Compound Eyes"
        },
        {
            "Ability": "Illuminate"
        },
        {
            "Ability": "Filter"
        },
        {
            "Ability": "Swarm"
        },
        {
            "Ability": "Technician"
        },
        {
            "Ability": "Forewarn"
        },
        {
            "Ability": "Flame Body"
        },
        {
            "Ability": "Hyper Cutter"
        },
        {
            "Ability": "Mold Breaker"
        },
        {
            "Ability": "Anger Point"
        },
        {
            "Ability": "Intimidate"
        },
        {
            "Ability": "Shell Armor"
        },
        {
            "Ability": "Water Absorb"
        },
        {
            "Ability": "Adaptability"
        },
        {
            "Ability": "Run Away"
        },
        {
            "Ability": "Volt Absorb"
        },
        {
            "Ability": "Flash Fire"
        },
        {
            "Ability": "Download"
        },
        {
            "Ability": "Trace"
        },
        {
            "Ability": "Battle Armor"
        },
        {
            "Ability": "Pressure"
        },
        {
            "Ability": "Immunity"
        },
        {
            "Ability": "Thick Fat"
        },
        {
            "Ability": "Inner Focus"
        },
        {
            "Ability": "Synchronize"
        },
        {
            "Ability": "Blaze"
        },
        {
            "Ability": "Torrent"
        },
        {
            "Ability": "Tangled Feet"
        },
        {
            "Ability": "Insomnia"
        },
        {
            "Ability": "Cute Charm"
        },
        {
            "Ability": "Magic Guard"
        },
        {
            "Ability": "Competitive"
        },
        {
            "Ability": "Hustle"
        },
        {
            "Ability": "Huge Power"
        },
        {
            "Ability": "Sturdy"
        },
        {
            "Ability": "Damp"
        },
        {
            "Ability": "Guts"
        },
        {
            "Ability": "Pickup"
        },
        {
            "Ability": "Solar Power"
        },
        {
            "Ability": "Speed Boost"
        },
        {
            "Ability": "Super Luck"
        },
        {
            "Ability": "Shadow Tag"
        },
        {
            "Ability": "Sand Veil"
        },
        {
            "Ability": "Quick Feet"
        },
        {
            "Ability": "Gluttony"
        },
        {
            "Ability": "Magma Armor"
        },
        {
            "Ability": "Snow Cloak"
        },
        {
            "Ability": "Suction Cups"
        },
        {
            "Ability": "Vital Spirit"
        },
        {
            "Ability": "Frisk"
        },
        {
            "Ability": "Steadfast"
        },
        {
            "Ability": "Sand Stream"
        },
        {
            "Ability": "Rain Dish"
        },
        {
            "Ability": "Hydration"
        },
        {
            "Ability": "Drizzle"
        },
        {
            "ability": "Effect Spore"
        },
        {
            "ability": "Poison Heal"
        },
        {
            "ability": "Truant"
        },
        {
            "ability": "Wonder Guard"
        },
        {
            "ability": "Magnet Pull"
        },
        {
            "ability": "Normalize"
        },
        {
            "ability": "Stall"
        },
        {
            "Ability": "Pure Power"
        },
        {
            "Ability": "Rivalry"
        },
        {
            "Ability": "Plus"
        },
        {
            "Ability": "Minus"
        },
        {
            "Ability": "Tinted Lens"
        },
        {
            "Ability": "Liquid Ooze"
        },
        {
            "Ability": "Sticky Hold"
        },
        {
            "Ability": "Rough Skin"
        },
        {
            "Ability": "Simple"
        },
        {
            "Ability": "Solid Rock"
        },
        {
            "Ability": "Drought"
        },
        {
            "Ability": "White Smoke"
        },
        {
            "Ability": "Arena Trap"
        },
        {
            "Ability": "Anticipation"
        },
        {
            "Ability": "Marvel Scale"
        },
        {
            "Ability": "Forecast"
        },
        {
            "Ability": "Color Change"
        },
        {
            "Ability": "Ice Body"
        },
        {
            "Ability": "Clear Body"
        },
        {
            "Ability": "Air Lock"
        },
        {
            "Ability": "Dry Skin"
        },
        {
            "Ability": "Cloud Nine"
        },
        {
            "Ability": "No Guard"
        },
        {
            "Ability": "Stench"
        },
        {
            "Ability": "Skill Link"
        },
        {
            "Ability": "Cursed Body"
        }
        ],

        selectType: {TypeName: '0', Category: '0'},
        types:[
          {TypeName: "???", Category: ""},
          {TypeName: "Bug", Category: "Physical"},
          {TypeName: "Dark", Category: "Special"},
          {TypeName: "Dragon", Category: "Special"},
          {TypeName: "Electric", Category: "Special"},
          {TypeName: "Fighting", Category: "Physical"},
          {TypeName: "Fire", Category: "Special"},
          {TypeName: "Flying", Category: "Physical"},
          {TypeName: "Ghost", Category: "Physical"},
          {TypeName: "Grass", Category: "Special"},
          {TypeName: "Ground", Category: "Physical"},
          {TypeName: "Ice", Category: "Special"},
          {TypeName: "Normal", Category: "Physical"},
          {TypeName: "Poison", Category: "Physical"},
          {TypeName: "Psychic", Category: "Special"},
          {TypeName: "Rock", Category: "Physical"},
          {TypeName: "Steel", Category: "Physical"},
          {TypeName: "Water", Category: "Special"}
        ],
        
        selectTrainer: {TrainerName: "0", TrainerClass: '0'},
        trainers:[
        {
            TID: "1",
            TrainerName: "Thalia",
            TrainerClass: "Beauty"
        },
        {
            TID: "2",
            TrainerName: "Demetrius",
            TrainerClass: "Youngster"
        },
        {
            TID: "3",
            TrainerName: "Duncan",
            TrainerClass: "Sailor"
        },
        {
            TID: "4",
            TrainerName: "Charlie",
            TrainerClass: "Tuber"
        },
        {
            TID: "5",
            TrainerName: "Garrison",
            TrainerClass: "Ruin Maniac"
        },
        {
            TID: "6",
            TrainerName: "Jani",
            TrainerClass: "Tuber"
        },
        {
            TID: "7",
            TrainerName: "Kira & Dan",
            TrainerClass: "Young Couple"
        },
        {
            TID: "8",
            TrainerName: "Sidney",
            TrainerClass: "Elite Four"
        },
        {
            TID: "9",
            TrainerName: "Phoebe",
            TrainerClass: "Elite Four"
        },
        {
            TID: "10",
            TrainerName: "Glacia",
            TrainerClass: "Elite Four"
        },
        {
            TID: "11",
            TrainerName: "Drake",
            TrainerClass: "Elite Four"
        },
        {
            TID: "12",
            TrainerName: "Wallace",
            TrainerClass: "Champion"
        },
        {
            TID: "13",
            TrainerName: "Calvin",
            TrainerClass: "Youngster"
        },
        {
            TID: "14",
            TrainerName: "Rick",
            TrainerClass: "Bug Catcher"
        },
        {
            TID: "15",
            TrainerName: "Allen",
            TrainerClass: "Youngster"
        },
        {
            TID: "16",
            TrainerName: "Tiana",
            TrainerClass: "Lass"
        },
        {
            TID: "17",
            TrainerName: "Brendan",
            TrainerClass: "Pokemon Trainer"
        },
        {
            TID: "18",
            TrainerName: "May",
            TrainerClass: "Pokemon Trainer"
        },
        {
            TID: "19",
            TrainerName: "Isabelle",
            TrainerClass: "Swimmer"
        },
        {
            TID: "20",
            TrainerName: "Pete",
            TrainerClass: "Swimmer"
        },
        {
            TID: "21",
            TrainerName: "Daisy",
            TrainerClass: "Aroma Lady"
        },
        {
            TID: "22",
            TrainerName: "Amy & Liv",
            TrainerClass: "Twins"
        },
        {
            TID: "23",
            TrainerName: "Miguel",
            TrainerClass: "Pokefan"
        },
        {
            TID: "24",
            TrainerName: "Andrew",
            TrainerClass: "Fisherman"
        },
        {
            TID: "25",
            TrainerName: "Rhett",
            TrainerClass: "Black Belt"
        },
        {
            TID: "26",
            TrainerName: "Marcos",
            TrainerClass: "Guitarist"
        },
        {
            TID: "27",
            TrainerName: "Imani",
            TrainerClass: "Swimmer"
        },
        {
            TID: "28",
            TrainerName: "Dominik",
            TrainerClass: "Swimmer"
        },
        {
            TID: "29",
            TrainerName: "Foster",
            TrainerClass: "Ruin Maniac"
        },
        {
            TID: "30",
            TrainerName: "Beverly",
            TrainerClass: "Swimmer"
        },
        {
            TID: "31",
            TrainerName: "Andres",
            TrainerClass: "Ruin Maniac"
        },
        {
            TID: "32",
            TrainerName: "Josue",
            TrainerClass: "Bird Keeper"
        },
        {
            TID: "33",
            TrainerName: "Luis",
            TrainerClass: "Swimmer"
        },
        {
            TID: "34",
            TrainerName: "Ned",
            TrainerClass: "Fisherman"
        },
        {
            TID: "35",
            TrainerName: "Elliot",
            TrainerClass: "Fisherman"
        },
        {
            TID: "36",
            TrainerName: "Douglas",
            TrainerClass: "Swimmer"
        },
        {
            TID: "37",
            TrainerName: "Kyla",
            TrainerClass: "Swimmer"
        },
        {
            TID: "38",
            TrainerName: "Denise",
            TrainerClass: "Swimmer"
        },
        {
            TID: "39",
            TrainerName: "Tony",
            TrainerClass: "Swimmer"
        },
        {
            TID: "40",
            TrainerName: "Lisa & Ray",
            TrainerClass: "Sis and Bro"
        },
        {
            TID: "41",
            TrainerName: "Darrin",
            TrainerClass: "Swimmer"
        },
        {
            TID: "42",
            TrainerName: "Beth",
            TrainerClass: "Swimmer"
        },
        {
            TID: "43",
            TrainerName: "Camron",
            TrainerClass: "Triathlete"
        },
        {
            TID: "44",
            TrainerName: "Missy",
            TrainerClass: "Swimmer"
        },
        {
            TID: "45",
            TrainerName: "Matthew",
            TrainerClass: "Swimmer"
        },
        {
            TID: "46",
            TrainerName: "Tara",
            TrainerClass: "Swimmer"
        },
        {
            TID: "47",
            TrainerName: "Carolina",
            TrainerClass: "Cooltrainer"
        },
        {
            TID: "48",
            TrainerName: "Cory",
            TrainerClass: "Sailor"
        },
        {
            TID: "49",
            TrainerName: "Jerome",
            TrainerClass: "Swimmer"
        },
        {
            TID: "50",
            TrainerName: "Huey",
            TrainerClass: "Sailor"
        },
        {
            TID: "51",
            TrainerName: "Edmond",
            TrainerClass: "Sailor"
        },
        {
            TID: "52",
            TrainerName: "Hailey",
            TrainerClass: "Tuber"
        },
        {
            TID: "53",
            TrainerName: "Ricky",
            TrainerClass: "Tuber"
        },
        {
            TID: "54",
            TrainerName: "Lola",
            TrainerClass: "Tuber"
        },
        {
            TID: "55",
            TrainerName: "Chandler",
            TrainerClass: "Tuber"
        },
        {
            TID: "56",
            TrainerName: "Simon",
            TrainerClass: "Tuber"
        },
        {
            TID: "57",
            TrainerName: "Johanna",
            TrainerClass: "Beauty"
        },
        {
            TID: "58",
            TrainerName: "Dwayne",
            TrainerClass: "Sailor"
        },
        {
            TID: "59",
            TrainerName: "Austina",
            TrainerClass: "Tuber"
        },
        {
            TID: "60",
            TrainerName: "Gwen",
            TrainerClass: "Tuber"
        },
        {
            TID: "61",
            TrainerName: "David",
            TrainerClass: "Swimmer"
        },
        {
            TID: "62",
            TrainerName: "Alice",
            TrainerClass: "Swimmer"
        },
        {
            TID: "63",
            TrainerName: "Carter",
            TrainerClass: "Fisherman"
        },
        {
            TID: "64",
            TrainerName: "Elijah",
            TrainerClass: "Bird Keeper"
        },
        {
            TID: "65",
            TrainerName: "Mel & Paul",
            TrainerClass: "Young Couple"
        },
        {
            TID: "66",
            TrainerName: "Isabel",
            TrainerClass: "Pokefan"
        },
        {
            TID: "67",
            TrainerName: "Kaleb",
            TrainerClass: "Pokefan"
        },
        {
            TID: "68",
            TrainerName: "Timmy",
            TrainerClass: "Youngster"
        },
        {
            TID: "69",
            TrainerName: "Edwin",
            TrainerClass: "Collector"
        },
        {
            TID: "70",
            TrainerName: "Joseph",
            TrainerClass: "Guitarist"
        },
        {
            TID: "71",
            TrainerName: "Edward",
            TrainerClass: "Psychic"
        },
        {
            TID: "72",
            TrainerName: "Alyssa",
            TrainerClass: "Triathlete"
        },
        {
            TID: "73",
            TrainerName: "Dale",
            TrainerClass: "Fisherman"
        },
        {
            TID: "74",
            TrainerName: "Victor",
            TrainerClass: "Winstrate"
        },
        {
            TID: "75",
            TrainerName: "Victoria",
            TrainerClass: "Winstrate"
        },
        {
            TID: "76",
            TrainerName: "Vivi",
            TrainerClass: "Winstrate"
        },
        {
            TID: "77",
            TrainerName: "Vicky",
            TrainerClass: "Winstrate"
        },
        {
            TID: "78",
            TrainerName: "Tyron",
            TrainerClass: "Camper"
        },
        {
            TID: "79",
            TrainerName: "Celina",
            TrainerClass: "Aroma Lady"
        },
        {
            TID: "80",
            TrainerName: "Bianca",
            TrainerClass: "Picnicker"
        },
        {
            TID: "81",
            TrainerName: "Hayden",
            TrainerClass: "Kindler"
        },
        {
            TID: "82",
            TrainerName: "Gabby and Ty",
            TrainerClass: "Interviewer"
        },
        {
            TID: "83",
            TrainerName: "Irene",
            TrainerClass: "Picnicker"
        },
        {
            TID: "84",
            TrainerName: "Travis",
            TrainerClass: "Camper"
        },
        {
            TID: "85",
            TrainerName: "Heidi",
            TrainerClass: "Picnicker"
        },
        {
            TID: "86",
            TrainerName: "Beau",
            TrainerClass: "Camper"
        },
        {
            TID: "87",
            TrainerName: "Drew",
            TrainerClass: "Camper"
        },
        {
            TID: "88",
            TrainerName: "Becky",
            TrainerClass: "Picnicker"
        },
        {
            TID: "89",
            TrainerName: "Dusty",
            TrainerClass: "Ruin Maniac"
        },
        {
            TID: "90",
            TrainerName: "Celia",
            TrainerClass: "Picnicker"
        },
        {
            TID: "91",
            TrainerName: "Bryan",
            TrainerClass: "Ruin Maniac"
        },
        {
            TID: "92",
            TrainerName: "Branden",
            TrainerClass: "Camper"
        },
        {
            TID: "93",
            TrainerName: "Wilton",
            TrainerClass: "Cooltrainer"
        },
        {
            TID: "94",
            TrainerName: "Brooke",
            TrainerClass: "Cooltrainer"
        },
        {
            TID: "95",
            TrainerName: "Daisuke",
            TrainerClass: "Black Belt"
        },
        {
            TID: "96",
            TrainerName: "Larry",
            TrainerClass: "Camper"
        },
        {
            TID: "97",
            TrainerName: "Carol",
            TrainerClass: "Picnicker"
        },
        {
            TID: "98",
            TrainerName: "Trent",
            TrainerClass: "Hiker"
        },
        {
            TID: "99",
            TrainerName: "Brice",
            TrainerClass: "Hiker"
        },
        {
            TID: "100",
            TrainerName: "Bryant",
            TrainerClass: "Kindler"
        },
        {
            TID: "101",
            TrainerName: "Shayla",
            TrainerClass: "Aroma Lady"
        },
        {
            TID: "102",
            TrainerName: "Jaylen",
            TrainerClass: "Youngster"
        },
        {
            TID: "103",
            TrainerName: "Lawrence",
            TrainerClass: "Camper"
        },
        {
            TID: "104",
            TrainerName: "Lung",
            TrainerClass: "Ninja Boy"
        },
        {
            TID: "105",
            TrainerName: "Wyatt",
            TrainerClass: "PokeManiac"
        },
        {
            TID: "106",
            TrainerName: "Madeline",
            TrainerClass: "Parasol Lady"
        },
        {
            TID: "107",
            TrainerName: "Tori & Tia",
            TrainerClass: "Twins"
        },
        {
            TID: "108",
            TrainerName: "Lao",
            TrainerClass: "Ninja Boy"
        },
        {
            TID: "109",
            TrainerName: "Dillon",
            TrainerClass: "Youngster"
        },
        {
            TID: "110",
            TrainerName: "Sophie",
            TrainerClass: "Picnicker"
        },
        {
            TID: "111",
            TrainerName: "Coby",
            TrainerClass: "Bird Keeper"
        },
        {
            TID: "112",
            TrainerName: "Nolan",
            TrainerClass: "Fisherman"
        },
        {
            TID: "113",
            TrainerName: "Charlotte",
            TrainerClass: "Picnicker"
        },
        {
            TID: "114",
            TrainerName: "Kai",
            TrainerClass: "Fisherman"
        },
        {
            TID: "115",
            TrainerName: "Claude",
            TrainerClass: "Fisherman"
        },
        {
            TID: "116",
            TrainerName: "Nancy",
            TrainerClass: "Picnicker"
        },
        {
            TID: "117",
            TrainerName: "Tyra & Ivy",
            TrainerClass: "Sr. and Jr."
        },
        {
            TID: "118",
            TrainerName: "Shane",
            TrainerClass: "Camper"
        },
        {
            TID: "119",
            TrainerName: "Steve",
            TrainerClass: "PokeManiac"
        },
        {
            TID: "120",
            TrainerName: "Bernie",
            TrainerClass: "Kindler"
        },
        {
            TID: "121",
            TrainerName: "Lucas",
            TrainerClass: "Hiker"
        },
        {
            TID: "122",
            TrainerName: "Angelina",
            TrainerClass: "Picnicker"
        },
        {
            TID: "123",
            TrainerName: "Lenny",
            TrainerClass: "Hiker"
        },
        {
            TID: "124",
            TrainerName: "Nob",
            TrainerClass: "Black Belt"
        },
        {
            TID: "125",
            TrainerName: "Hector",
            TrainerClass: "Collector"
        },
        {
            TID: "126",
            TrainerName: "Marlene",
            TrainerClass: "Psychic"
        },
        {
            TID: "127",
            TrainerName: "Cyndy",
            TrainerClass: "Battle Girl"
        },
        {
            TID: "128",
            TrainerName: "Jaiden",
            TrainerClass: "Ninja Boy"
        },
        {
            TID: "129",
            TrainerName: "Timothy",
            TrainerClass: "Expert"
        },
        {
            TID: "130",
            TrainerName: "Kyra",
            TrainerClass: "Triathlete"
        },
        {
            TID: "131",
            TrainerName: "Koichi",
            TrainerClass: "Black Belt"
        },
        {
            TID: "132",
            TrainerName: "Helene",
            TrainerClass: "Battle Girl"
        },
        {
            TID: "133",
            TrainerName: "Alix",
            TrainerClass: "Psychic"
        },
        {
            TID: "134",
            TrainerName: "Jose",
            TrainerClass: "Bug Catcher"
        },
        {
            TID: "135",
            TrainerName: "Joey",
            TrainerClass: "Youngster"
        },
        {
            TID: "136",
            TrainerName: "Karen",
            TrainerClass: "School Kid"
        },
        {
            TID: "137",
            TrainerName: "Clark",
            TrainerClass: "Hiker"
        },
        {
            TID: "138",
            TrainerName: "Johnson",
            TrainerClass: "Youngster"
        },
        {
            TID: "139",
            TrainerName: "Devan",
            TrainerClass: "Hiker"
        },
        {
            TID: "140",
            TrainerName: "Sarah",
            TrainerClass: "Lady"
        },
        {
            TID: "141",
            TrainerName: "Dawson",
            TrainerClass: "Rich Boy"
        },
        {
            TID: "142",
            TrainerName: "Jerry",
            TrainerClass: "School Kid"
        },
        {
            TID: "143",
            TrainerName: "Janice",
            TrainerClass: "Lass"
        },
        {
            TID: "144",
            TrainerName: "Dylan",
            TrainerClass: "Triathlete"
        },
        {
            TID: "145",
            TrainerName: "Anna & Meg",
            TrainerClass: "Sr. and Jr."
        },
        {
            TID: "146",
            TrainerName: "Isaac",
            TrainerClass: "Pokemon Breeder"
        },
        {
            TID: "147",
            TrainerName: "Maria",
            TrainerClass: "Triathlete"
        },
        {
            TID: "148",
            TrainerName: "Derek",
            TrainerClass: "Bug Maniac"
        },
        {
            TID: "149",
            TrainerName: "Brandi",
            TrainerClass: "Psychic"
        },
        {
            TID: "150",
            TrainerName: "Melina",
            TrainerClass: "Triathlete"
        },
        {
            TID: "151",
            TrainerName: "Aisha",
            TrainerClass: "Battle Girl"
        },
        {
            TID: "152",
            TrainerName: "Lydia",
            TrainerClass: "Pokemon Breeder"
        },
        {
            TID: "153",
            TrainerName: "Rose",
            TrainerClass: "Aroma Lady"
        },
        {
            TID: "154",
            TrainerName: "Deandre",
            TrainerClass: "Youngster"
        },
        {
            TID: "155",
            TrainerName: "Wade",
            TrainerClass: "Fisherman"
        },
        {
            TID: "156",
            TrainerName: "Dalton",
            TrainerClass: "Guitarist"
        },
        {
            TID: "157",
            TrainerName: "Barny",
            TrainerClass: "Fisherman"
        },
        {
            TID: "158",
            TrainerName: "Chester",
            TrainerClass: "Bird Keeper"
        },
        {
            TID: "159",
            TrainerName: "Perry",
            TrainerClass: "Bird Keeper"
        },
        {
            TID: "160",
            TrainerName: "Kent",
            TrainerClass: "Bug Catcher"
        },
        {
            TID: "161",
            TrainerName: "Donald",
            TrainerClass: "Bug Maniac"
        },
        {
            TID: "162",
            TrainerName: "Greg",
            TrainerClass: "Bug Catcher"
        },
        {
            TID: "163",
            TrainerName: "Taylor",
            TrainerClass: "Bug Maniac"
        },
        {
            TID: "164",
            TrainerName: "Doug",
            TrainerClass: "Bug Catcher"
        },
        {
            TID: "165",
            TrainerName: "Brent",
            TrainerClass: "Bug Maniac"
        },
        {
            TID: "166",
            TrainerName: "Chris",
            TrainerClass: "Fisherman"
        },
        {
            TID: "167",
            TrainerName: "Catherine",
            TrainerClass: "Pokemon Ranger"
        },
        {
            TID: "168",
            TrainerName: "Jackson",
            TrainerClass: "Pokemon Ranger"
        },
        {
            TID: "169",
            TrainerName: "Rachel",
            TrainerClass: "Parasol Lady"
        },
        {
            TID: "170",
            TrainerName: "Phil",
            TrainerClass: "Bird Keeper"
        },
        {
            TID: "171",
            TrainerName: "Takashi",
            TrainerClass: "Ninja Boy"
        },
        {
            TID: "172",
            TrainerName: "Dayton",
            TrainerClass: "Kindler"
        },
        {
            TID: "173",
            TrainerName: "Hugh",
            TrainerClass: "Bird Keeper"
        },
        {
            TID: "174",
            TrainerName: "Fabian",
            TrainerClass: "Guitarist"
        },
        {
            TID: "175",
            TrainerName: "Yasu",
            TrainerClass: "Ninja Boy"
        },
        {
            TID: "176",
            TrainerName: "Hideo",
            TrainerClass: "Ninja Boy"
        },
        {
            TID: "177",
            TrainerName: "Clarissa",
            TrainerClass: "Parasol Lady"
        },
        {
            TID: "178",
            TrainerName: "Robert",
            TrainerClass: "Bird Keeper"
        },
        {
            TID: "179",
            TrainerName: "Colin",
            TrainerClass: "Bird Keeper"
        },
        {
            TID: "180",
            TrainerName: "Leonel",
            TrainerClass: "Cooltrainer"
        },
        {
            TID: "181",
            TrainerName: "Angelica",
            TrainerClass: "Parasol Lady"
        },
        {
            TID: "182",
            TrainerName: "Riley",
            TrainerClass: "Ninja Boy"
        },
        {
            TID: "183",
            TrainerName: "Callie",
            TrainerClass: "Battle Girl"
        },
        {
            TID: "184",
            TrainerName: "Jennifer",
            TrainerClass: "Cooltrainer"
        },
        {
            TID: "185",
            TrainerName: "Jenna",
            TrainerClass: "Pokemon Ranger"
        },
        {
            TID: "186",
            TrainerName: "Lorenzo",
            TrainerClass: "Pokemon Ranger"
        },
        {
            TID: "187",
            TrainerName: "Jeffrey",
            TrainerClass: "Bug Maniac"
        },
        {
            TID: "188",
            TrainerName: "Keigo",
            TrainerClass: "Ninja Boy"
        },
        {
            TID: "189",
            TrainerName: "Chip",
            TrainerClass: "Ruin Maniac"
        },
        {
            TID: "190",
            TrainerName: "Cale",
            TrainerClass: "Bug Maniac"
        },
        {
            TID: "191",
            TrainerName: "Tammy",
            TrainerClass: "Hex Maniac"
        },
        {
            TID: "192",
            TrainerName: "Jessica",
            TrainerClass: "Beauty"
        },
        {
            TID: "193",
            TrainerName: "Kate & Joy",
            TrainerClass: "Sr. and Jr."
        },
        {
            TID: "194",
            TrainerName: "Pat",
            TrainerClass: "Pokemon Breeder"
        },
        {
            TID: "195",
            TrainerName: "Myles",
            TrainerClass: "Pokemon Breeder"
        },
        {
            TID: "196",
            TrainerName: "Walter",
            TrainerClass: "Gentleman"
        },
        {
            TID: "197",
            TrainerName: "Vanessa",
            TrainerClass: "Pokefan"
        },
        {
            TID: "198",
            TrainerName: "Marcel",
            TrainerClass: "Cooltrainer"
        },
        {
            TID: "199",
            TrainerName: "Cristin",
            TrainerClass: "Cooltrainer"
        },
        {
            TID: "200",
            TrainerName: "Davis",
            TrainerClass: "Bug Catcher"
        },
        {
            TID: "201",
            TrainerName: "Jazmyn",
            TrainerClass: "Cooltrainer"
        },
        {
            TID: "202",
            TrainerName: "Violet",
            TrainerClass: "Aroma Lady"
        },
        {
            TID: "203",
            TrainerName: "Miu & Yuki",
            TrainerClass: "Twins"
        },
        {
            TID: "204",
            TrainerName: "Kindra",
            TrainerClass: "Hex Maniac"
        },
        {
            TID: "205",
            TrainerName: "Ed",
            TrainerClass: "Collector"
        },
        {
            TID: "206",
            TrainerName: "Wendy",
            TrainerClass: "Cooltrainer"
        },
        {
            TID: "207",
            TrainerName: "Braxton",
            TrainerClass: "Cooltrainer"
        },
        {
            TID: "208",
            TrainerName: "Fernando",
            TrainerClass: "Guitarist"
        },
        {
            TID: "209",
            TrainerName: "Alberto",
            TrainerClass: "Bird Keeper"
        },
        {
            TID: "210",
            TrainerName: "Jacki",
            TrainerClass: "Psychic"
        },
        {
            TID: "211",
            TrainerName: "Fredrick",
            TrainerClass: "Expert"
        },
        {
            TID: "212",
            TrainerName: "Cameron",
            TrainerClass: "Psychic"
        },
        {
            TID: "213",
            TrainerName: "Jonas",
            TrainerClass: "Ninja Boy"
        },
        {
            TID: "214",
            TrainerName: "Kayley",
            TrainerClass: "Parasol Lady"
        },
        {
            TID: "215",
            TrainerName: "Grace",
            TrainerClass: "Swimmer"
        },
        {
            TID: "216",
            TrainerName: "Declan",
            TrainerClass: "Swimmer"
        },
        {
            TID: "217",
            TrainerName: "Lila & Roy",
            TrainerClass: "Sis and Bro"
        },
        {
            TID: "218",
            TrainerName: "Spencer",
            TrainerClass: "Swimmer"
        },
        {
            TID: "219",
            TrainerName: "Jenny",
            TrainerClass: "Swimmer"
        },
        {
            TID: "220",
            TrainerName: "Chad",
            TrainerClass: "Swimmer"
        },
        {
            TID: "221",
            TrainerName: "Isabella",
            TrainerClass: "Triathlete"
        },
        {
            TID: "222",
            TrainerName: "Roland",
            TrainerClass: "Swimmer"
        },
        {
            TID: "223",
            TrainerName: "Ernest",
            TrainerClass: "Sailor"
        },
        {
            TID: "224",
            TrainerName: "Nolen",
            TrainerClass: "Swimmer"
        },
        {
            TID: "225",
            TrainerName: "Sharon",
            TrainerClass: "Swimmer"
        },
        {
            TID: "226",
            TrainerName: "Tanya",
            TrainerClass: "Swimmer"
        },
        {
            TID: "227",
            TrainerName: "Presley",
            TrainerClass: "Bird Keeper"
        },
        {
            TID: "228",
            TrainerName: "Auron",
            TrainerClass: "Expert"
        },
        {
            TID: "229",
            TrainerName: "Stan",
            TrainerClass: "Swimmer"
        },
        {
            TID: "230",
            TrainerName: "Kim & Iris",
            TrainerClass: "Sr. and Jr."
        },
        {
            TID: "231",
            TrainerName: "Leonardo",
            TrainerClass: "Swimmer"
        },
        {
            TID: "232",
            TrainerName: "Isobel",
            TrainerClass: "Triathlete"
        },
        {
            TID: "233",
            TrainerName: "Dean",
            TrainerClass: "Swimmer"
        },
        {
            TID: "234",
            TrainerName: "Nikki",
            TrainerClass: "Swimmer"
        },
        {
            TID: "235",
            TrainerName: "Barry",
            TrainerClass: "Swimmer"
        },
        {
            TID: "236",
            TrainerName: "Sienna",
            TrainerClass: "Swimmer"
        },
        {
            TID: "237",
            TrainerName: "Pablo",
            TrainerClass: "Triathlete"
        },
        {
            TID: "238",
            TrainerName: "Brenda",
            TrainerClass: "Swimmer"
        },
        {
            TID: "239",
            TrainerName: "Aidan",
            TrainerClass: "Bird Keeper"
        },
        {
            TID: "240",
            TrainerName: "Athena",
            TrainerClass: "Cooltrainer"
        },
        {
            TID: "241",
            TrainerName: "Jonah",
            TrainerClass: "Fisherman"
        },
        {
            TID: "242",
            TrainerName: "Roger",
            TrainerClass: "Fisherman"
        },
        {
            TID: "243",
            TrainerName: "Henry",
            TrainerClass: "Fisherman"
        },
        {
            TID: "244",
            TrainerName: "Camden",
            TrainerClass: "Triathlete"
        },
        {
            TID: "245",
            TrainerName: "Koji",
            TrainerClass: "Black Belt"
        },
        {
            TID: "246",
            TrainerName: "Donny",
            TrainerClass: "Triathlete"
        },
        {
            TID: "247",
            TrainerName: "Ruben",
            TrainerClass: "Cooltrainer"
        },
        {
            TID: "248",
            TrainerName: "Alexa",
            TrainerClass: "Cooltrainer"
        },
        {
            TID: "249",
            TrainerName: "Wayne",
            TrainerClass: "Fisherman"
        },
        {
            TID: "250",
            TrainerName: "Isaiah",
            TrainerClass: "Triathlete"
        },
        {
            TID: "251",
            TrainerName: "Katelyn",
            TrainerClass: "Triathlete"
        },
        {
            TID: "252",
            TrainerName: "Carlee",
            TrainerClass: "Swimmer"
        },
        {
            TID: "253",
            TrainerName: "Harrison",
            TrainerClass: "Swimmer"
        },
        {
            TID: "254",
            TrainerName: "Reed",
            TrainerClass: "Swimmer"
        },
        {
            TID: "255",
            TrainerName: "Chase",
            TrainerClass: "Triathlete"
        },
        {
            TID: "256",
            TrainerName: "Allison",
            TrainerClass: "Triathlete"
        },
        {
            TID: "257",
            TrainerName: "Clarence",
            TrainerClass: "Swimmer"
        },
        {
            TID: "258",
            TrainerName: "Tisha",
            TrainerClass: "Swimmer"
        },
        {
            TID: "259",
            TrainerName: "Rodney",
            TrainerClass: "Swimmer"
        },
        {
            TID: "260",
            TrainerName: "Katie",
            TrainerClass: "Swimmer"
        },
        {
            TID: "261",
            TrainerName: "Santiago",
            TrainerClass: "Swimmer"
        },
        {
            TID: "262",
            TrainerName: "Kevin",
            TrainerClass: "Swimmer"
        },
        {
            TID: "263",
            TrainerName: "Taila",
            TrainerClass: "Triathlete"
        },
        {
            TID: "264",
            TrainerName: "Richard",
            TrainerClass: "Swimmer"
        },
        {
            TID: "265",
            TrainerName: "Kara",
            TrainerClass: "Swimmer"
        },
        {
            TID: "266",
            TrainerName: "Herman",
            TrainerClass: "Swimmer"
        },
        {
            TID: "267",
            TrainerName: "Susie",
            TrainerClass: "Swimmer"
        },
        {
            TID: "268",
            TrainerName: "Reli & Ian",
            TrainerClass: "Sis and Bro"
        },
        {
            TID: "269",
            TrainerName: "Gilbert",
            TrainerClass: "Swimmer"
        },
        {
            TID: "270",
            TrainerName: "Dana",
            TrainerClass: "Swimmer"
        },
        {
            TID: "271",
            TrainerName: "Ronald",
            TrainerClass: "Fisherman"
        },
        {
            TID: "272",
            TrainerName: "Kiyo",
            TrainerClass: "Black Belt"
        },
        {
            TID: "273",
            TrainerName: "Paxton",
            TrainerClass: "Expert"
        },
        {
            TID: "274",
            TrainerName: "Darcy",
            TrainerClass: "Cooltrainer"
        },
        {
            TID: "275",
            TrainerName: "Makayla",
            TrainerClass: "Expert"
        },
        {
            TID: "276",
            TrainerName: "Jonathan",
            TrainerClass: "Cooltrainer"
        },
        {
            TID: "277",
            TrainerName: "Linda",
            TrainerClass: "Swimmer"
        },
        {
            TID: "278",
            TrainerName: "Beck",
            TrainerClass: "Bird Keeper"
        },
        {
            TID: "279",
            TrainerName: "Conor",
            TrainerClass: "Expert"
        },
        {
            TID: "280",
            TrainerName: "Mollie",
            TrainerClass: "Expert"
        },
        {
            TID: "281",
            TrainerName: "Warren",
            TrainerClass: "Cool Trainer"
        },
        {
            TID: "282",
            TrainerName: "Debra",
            TrainerClass: "Swimmer"
        },
        {
            TID: "283",
            TrainerName: "Franklin",
            TrainerClass: "Swimmer"
        },
        {
            TID: "284",
            TrainerName: "Laurel",
            TrainerClass: "Swimmer"
        },
        {
            TID: "285",
            TrainerName: "Jack",
            TrainerClass: "Swimmer"
        },
        {
            TID: "286",
            TrainerName: "Hitoshi",
            TrainerClass: "Black Belt"
        },
        {
            TID: "287",
            TrainerName: "Reyna",
            TrainerClass: "Battle Girl"
        },
        {
            TID: "288",
            TrainerName: "Hudson",
            TrainerClass: "Sailor"
        },
        {
            TID: "289",
            TrainerName: "Aaron",
            TrainerClass: "Dragon Tamer"
        },
        {
            TID: "290",
            TrainerName: "Marley",
            TrainerClass: "Cooltrainer"
        },
        {
            TID: "291",
            TrainerName: "Alex",
            TrainerClass: "Bird Keeper"
        },
        {
            TID: "292",
            TrainerName: "Kelvin",
            TrainerClass: "Sailor"
        },
        {
            TID: "293",
            TrainerName: "Eric",
            TrainerClass: "Hiker"
        },
        {
            TID: "294",
            TrainerName: "NULL",
            TrainerClass: "Team Magma Grunt"
        },
        {
            TID: "295",
            TrainerName: "Diana",
            TrainerClass: "Picnicker"
        },
        {
            TID: "296",
            TrainerName: "Autumn",
            TrainerClass: "Picnicker"
        },
        {
            TID: "297",
            TrainerName: "Julio",
            TrainerClass: "Triathlete"
        },
        {
            TID: "298",
            TrainerName: "Ethan",
            TrainerClass: "Camper"
        },
        {
            TID: "299",
            TrainerName: "Tabitha",
            TrainerClass: "Magma Admin"
        },
        {
            TID: "300",
            TrainerName: "Maxie",
            TrainerClass: "Magma Leader"
        },
        {
            TID: "301",
            TrainerName: "Wally",
            TrainerClass: "Pokemon Trainer"
        },
        {
            TID: "302",
            TrainerName: "John and Jay",
            TrainerClass: "Old Couple"
        },
        {
            TID: "303",
            TrainerName: "Nicolas",
            TrainerClass: "Dragon Tamer"
        },
        {
            TID: "304",
            TrainerName: "Steven",
            TrainerClass: "Pokemon Trainer"
        },
        {
            TID: "305",
            TrainerName: "Shirley",
            TrainerClass: "Beauty"
        },
        {
            TID: "306",
            TrainerName: "Sheila",
            TrainerClass: "Beauty"
        },
        {
            TID: "307",
            TrainerName: "Shelby",
            TrainerClass: "Expert"
        },
        {
            TID: "308",
            TrainerName: "Sawyer",
            TrainerClass: "Hiker"
        },
        {
            TID: "309",
            TrainerName: "Melissa",
            TrainerClass: "Beauty"
        },
        {
            TID: "310",
            TrainerName: "Mark",
            TrainerClass: "PokeManiac"
        },
        {
            TID: "311",
            TrainerName: "Leah",
            TrainerClass: "Hex Maniac"
        },
        {
            TID: "312",
            TrainerName: "Zander",
            TrainerClass: "Black Belt"
        },
        {
            TID: "313",
            TrainerName: "Dez & Luke",
            TrainerClass: "Young Couple"
        },
        {
            TID: "314",
            TrainerName: "Kayla",
            TrainerClass: "Psychic"
        },
        {
            TID: "315",
            TrainerName: "Gabrielle",
            TrainerClass: "Pokemon Breeder"
        },
        {
            TID: "316",
            TrainerName: "William",
            TrainerClass: "Psychic"
        },
        {
            TID: "317",
            TrainerName: "Tasha",
            TrainerClass: "Hex Maniac"
        },
        {
            TID: "318",
            TrainerName: "Atsushi",
            TrainerClass: "Black Belt"
        },
        {
            TID: "319",
            TrainerName: "Valerie",
            TrainerClass: "Hex Maniac"
        },
        {
            TID: "320",
            TrainerName: "Cedric",
            TrainerClass: "Psychic"
        },
        {
            TID: "321",
            TrainerName: "NULL",
            TrainerClass: "Team Aqua Grunt"
        },
        {
            TID: "322",
            TrainerName: "Lyle",
            TrainerClass: "Bug Catcher"
        },
        {
            TID: "323",
            TrainerName: "James",
            TrainerClass: "Bug Catcher"
        },
        {
            TID: "326",
            TrainerName: "Mike",
            TrainerClass: "Hiker"
        },
        {
            TID: "327",
            TrainerName: "Lea & Jed",
            TrainerClass: "Young Couple"
        },
        {
            TID: "328",
            TrainerName: "Garret",
            TrainerClass: "Rich Boy"
        },
        {
            TID: "329",
            TrainerName: "Tucker",
            TrainerClass: "Gentleman"
        },
        {
            TID: "330",
            TrainerName: "Colton",
            TrainerClass: "Pokefan"
        },
        {
            TID: "331",
            TrainerName: "Anette",
            TrainerClass: "Lady"
        },
        {
            TID: "332",
            TrainerName: "Thomas",
            TrainerClass: "Gentleman"
        },
        {
            TID: "333",
            TrainerName: "Phillip",
            TrainerClass: "Sailor"
        },
        {
            TID: "334",
            TrainerName: "Leonard",
            TrainerClass: "Sailor"
        },
        {
            TID: "335",
            TrainerName: "Shelly",
            TrainerClass: "Aqua Admin"
        },
        {
            TID: "336",
            TrainerName: "Archie",
            TrainerClass: "Aqua Leader"
        },
        {
            TID: "337",
            TrainerName: "Jaclyn",
            TrainerClass: "Psychic"
        },
        {
            TID: "338",
            TrainerName: "Abigail",
            TrainerClass: "Triathlete"
        },
        {
            TID: "339",
            TrainerName: "Anthony",
            TrainerClass: "Triathlete"
        },
        {
            TID: "340",
            TrainerName: "Benjamin",
            TrainerClass: "Triathlete"
        },
        {
            TID: "341",
            TrainerName: "Jasmine",
            TrainerClass: "Triathlete"
        },
        {
            TID: "342",
            TrainerName: "Jacob",
            TrainerClass: "Triathlete"
        },
        {
            TID: "343",
            TrainerName: "Matt",
            TrainerClass: "Aqua Admin"
        },
        {
            TID: "344",
            TrainerName: "Shigenobu",
            TrainerClass: "Youngster"
        },
        {
            TID: "345",
            TrainerName: "Akari",
            TrainerClass: "Parasol Lady"
        },
        {
            TID: "346",
            TrainerName: "Shigezo",
            TrainerClass: "Ninja Boy"
        },
        {
            TID: "347",
            TrainerName: "Namiko",
            TrainerClass: "Beauty"
        },
        {
            TID: "348",
            TrainerName: "Makie",
            TrainerClass: "Hex Maniac"
        },
        {
            TID: "349",
            TrainerName: "Haruhito",
            TrainerClass: "Camper"
        },
        {
            TID: "350",
            TrainerName: "Meiko",
            TrainerClass: "School Kid"
        },
        {
            TID: "351",
            TrainerName: "Pierre",
            TrainerClass: "Gentleman"
        },
        {
            TID: "352",
            TrainerName: "Alfonso",
            TrainerClass: "Triathlete"
        },
        {
            TID: "353",
            TrainerName: "Alaina",
            TrainerClass: "Hex Maniac"
        },
        {
            TID: "354",
            TrainerName: "Theodore",
            TrainerClass: "Black Belt"
        },
        {
            TID: "355",
            TrainerName: "Jayden",
            TrainerClass: "Pokemon Breeder"
        },
        {
            TID: "356",
            TrainerName: "Salvadore",
            TrainerClass: "Pokemon Breeder"
        },
        {
            TID: "357",
            TrainerName: "Veronica",
            TrainerClass: "Pokemon Breeder"
        },
        {
            TID: "358",
            TrainerName: "Keenan",
            TrainerClass: "Psychic"
        },
        {
            TID: "359",
            TrainerName: "Kristina",
            TrainerClass: "Aroma Lady"
        },
        {
            TID: "360",
            TrainerName: "Terrance",
            TrainerClass: "Gentleman"
        },
        {
            TID: "361",
            TrainerName: "Elizabeth",
            TrainerClass: "Lady"
        },
        {
            TID: "362",
            TrainerName: "Annabell",
            TrainerClass: "Parasol Lady"
        },
        {
            TID: "363",
            TrainerName: "Coleman",
            TrainerClass: "Collector"
        },
        {
            TID: "364",
            TrainerName: "Enrique",
            TrainerClass: "Rich Boy"
        },
        {
            TID: "365",
            TrainerName: "Colleen",
            TrainerClass: "Lady"
        },
        {
            TID: "366",
            TrainerName: "Kimberly",
            TrainerClass: "Pokefan"
        },
        {
            TID: "367",
            TrainerName: "Francisco",
            TrainerClass: "Pokefan"
        },
        {
            TID: "368",
            TrainerName: "Bernard",
            TrainerClass: "Kindler"
        },
        {
            TID: "369",
            TrainerName: "Merdith",
            TrainerClass: "Pokemon Ranger"
        },
        {
            TID: "370",
            TrainerName: "Abraham",
            TrainerClass: "Ruin Maniac"
        },
        {
            TID: "371",
            TrainerName: "Luc",
            TrainerClass: "Tuber"
        },
        {
            TID: "372",
            TrainerName: "Breyden",
            TrainerClass: "Youngster"
        },
        {
            TID: "373",
            TrainerName: "Aniya",
            TrainerClass: "Tuber"
        },
        {
            TID: "374",
            TrainerName: "Dane",
            TrainerClass: "Bird Keeper"
        },
        {
            TID: "375",
            TrainerName: "Stephanie",
            TrainerClass: "Triathlete"
        },
        {
            TID: "376",
            TrainerName: "Alfred",
            TrainerClass: "Cooltrainer"
        },
        {
            TID: "377",
            TrainerName: "Edie",
            TrainerClass: "Psychic"
        },
        {
            TID: "378",
            TrainerName: "Roderick",
            TrainerClass: "Cooltrainer"
        },
        {
            TID: "379",
            TrainerName: "Alicia",
            TrainerClass: "Cooltrainer"
        },
        {
            TID: "380",
            TrainerName: "Terrence",
            TrainerClass: "Expert"
        },
        {
            TID: "381",
            TrainerName: "Carlotta",
            TrainerClass: "Expert"
        },
        {
            TID: "382",
            TrainerName: "Nora",
            TrainerClass: "Pokemon Ranger"
        },
        {
            TID: "383",
            TrainerName: "Gav",
            TrainerClass: "Pokemon Ranger"
        },
        {
            TID: "384",
            TrainerName: "Sally",
            TrainerClass: "Lass"
        },
        {
            TID: "385",
            TrainerName: "Robin",
            TrainerClass: "Lass"
        },
        {
            TID: "386",
            TrainerName: "Eddie",
            TrainerClass: "Youngster"
        },
        {
            TID: "387",
            TrainerName: "Ted",
            TrainerClass: "School Kid"
        },
        {
            TID: "388",
            TrainerName: "Paul",
            TrainerClass: "School Kid"
        },
        {
            TID: "389",
            TrainerName: "Georgia",
            TrainerClass: "School Kid"
        },
        {
            TID: "390",
            TrainerName: "Justin",
            TrainerClass: "Camper"
        },
        {
            TID: "391",
            TrainerName: "Martha",
            TrainerClass: "Picnicker"
        },
        {
            TID: "392",
            TrainerName: "Alan",
            TrainerClass: "Hiker"
        },
        {
            TID: "393",
            TrainerName: "Yuji",
            TrainerClass: "Black Belt"
        },
        {
            TID: "394",
            TrainerName: "Cora",
            TrainerClass: "Battle Girl"
        },
        {
            TID: "395",
            TrainerName: "Jill",
            TrainerClass: "Battle Girl"
        },
        {
            TID: "396",
            TrainerName: "Sophia",
            TrainerClass: "Pokemon Ranger"
        },
        {
            TID: "397",
            TrainerName: "Sebastian",
            TrainerClass: "Pokemon Ranger"
        },
        {
            TID: "398",
            TrainerName: "Benny",
            TrainerClass: "Bird Keeper"
        },
        {
            TID: "399",
            TrainerName: "Joshua",
            TrainerClass: "Psychic"
        },
        {
            TID: "400",
            TrainerName: "Patricia",
            TrainerClass: "Hex Maniac"
        },
        {
            TID: "401",
            TrainerName: "Mariella",
            TrainerClass: "Psychic"
        },
        {
            TID: "402",
            TrainerName: "Everett",
            TrainerClass: "Gentleman"
        },
        {
            TID: "403",
            TrainerName: "Alexis",
            TrainerClass: "Psychic"
        },
        {
            TID: "404",
            TrainerName: "Alvaro",
            TrainerClass: "Psychic"
        },
        {
            TID: "405",
            TrainerName: "Elaine",
            TrainerClass: "Cool Trainer"
        },
        {
            TID: "406",
            TrainerName: "Vincent",
            TrainerClass: "Cool Trainer"
        },
        {
            TID: "407",
            TrainerName: "Leroy",
            TrainerClass: "Cool Trainer"
        },
        {
            TID: "408",
            TrainerName: "Albert",
            TrainerClass: "Cooltrainer"
        },
        {
            TID: "409",
            TrainerName: "Hope",
            TrainerClass: "Cooltrainer"
        },
        {
            TID: "410",
            TrainerName: "Shannon",
            TrainerClass: "Cooltrainer"
        },
        {
            TID: "411",
            TrainerName: "Samuel",
            TrainerClass: "Cooltrainer"
        },
        {
            TID: "412",
            TrainerName: "Julie",
            TrainerClass: "Cooltrainer"
        },
        {
            TID: "413",
            TrainerName: "Owen",
            TrainerClass: "Cooltrainer"
        },
        {
            TID: "414",
            TrainerName: "Dianne",
            TrainerClass: "Cooltrainer"
        },
        {
            TID: "415",
            TrainerName: "Felix",
            TrainerClass: "Cooltrainer"
        },
        {
            TID: "416",
            TrainerName: "Caroline",
            TrainerClass: "Cooltrainer"
        },
        {
            TID: "417",
            TrainerName: "Vito",
            TrainerClass: "Cooltrainer"
        },
        {
            TID: "418",
            TrainerName: "Michelle",
            TrainerClass: "Cooltrainer"
        },
        {
            TID: "419",
            TrainerName: "Mitchell",
            TrainerClass: "Cooltrainer"
        },
        {
            TID: "420",
            TrainerName: "Halle",
            TrainerClass: "Cooltrainer"
        },
        {
            TID: "421",
            TrainerName: "Edgar",
            TrainerClass: "Cooltrainer"
        },
        {
            TID: "422",
            TrainerName: "Katelynn",
            TrainerClass: "Cooltrainer"
        },
        {
            TID: "423",
            TrainerName: "Quincy",
            TrainerClass: "Cooltrainer"
        },
        {
            TID: "424",
            TrainerName: "Josh",
            TrainerClass: "Youngster"
        },
        {
            TID: "425",
            TrainerName: "Tommy",
            TrainerClass: "Youngster"
        },
        {
            TID: "426",
            TrainerName: "Marc",
            TrainerClass: "Hiker"
        },
        {
            TID: "427",
            TrainerName: "Roxanne",
            TrainerClass: "Leader"
        },
        {
            TID: "428",
            TrainerName: "Laura",
            TrainerClass: "Battle Girl"
        },
        {
            TID: "429",
            TrainerName: "Lilith",
            TrainerClass: "Battle Girl"
        },
        {
            TID: "430",
            TrainerName: "Brenden",
            TrainerClass: "Sailor"
        },
        {
            TID: "431",
            TrainerName: "Takao",
            TrainerClass: "Black Belt"
        },
        {
            TID: "432",
            TrainerName: "Christian",
            TrainerClass: "Black Belt"
        },
        {
            TID: "433",
            TrainerName: "Jocelyn",
            TrainerClass: "Battle Girl"
        },
        {
            TID: "434",
            TrainerName: "Brawly",
            TrainerClass: "Leader"
        },
        {
            TID: "435",
            TrainerName: "Vivian",
            TrainerClass: "Battle Girl"
        },
        {
            TID: "436",
            TrainerName: "Kirk",
            TrainerClass: "Guitarist"
        },
        {
            TID: "437",
            TrainerName: "Ben",
            TrainerClass: "Youngster"
        },
        {
            TID: "438",
            TrainerName: "Angelo",
            TrainerClass: "Bug Maniac"
        },
        {
            TID: "439",
            TrainerName: "Shawn",
            TrainerClass: "Guitarist"
        },
        {
            TID: "440",
            TrainerName: "Wattson",
            TrainerClass: "Leader"
        },
        {
            TID: "441",
            TrainerName: "Jeff",
            TrainerClass: "Kindler"
        },
        {
            TID: "442",
            TrainerName: "Jace",
            TrainerClass: "Kindler"
        },
        {
            TID: "443",
            TrainerName: "Eli",
            TrainerClass: "Hiker"
        },
        {
            TID: "444",
            TrainerName: "Cole",
            TrainerClass: "Kindler"
        },
        {
            TID: "445",
            TrainerName: "Gerald",
            TrainerClass: "Cooltrainer"
        },
        {
            TID: "446",
            TrainerName: "Axle",
            TrainerClass: "Kindler"
        },
        {
            TID: "447",
            TrainerName: "Keegan",
            TrainerClass: "Kindler"
        },
        {
            TID: "448",
            TrainerName: "Danielle",
            TrainerClass: "Battle Girl"
        },
        {
            TID: "449",
            TrainerName: "Flannery",
            TrainerClass: "Leader"
        },
        {
            TID: "450",
            TrainerName: "Randall",
            TrainerClass: "Cooltrainer"
        },
        {
            TID: "451",
            TrainerName: "Mary",
            TrainerClass: "Cooltrainer"
        },
        {
            TID: "452",
            TrainerName: "Parker",
            TrainerClass: "Cooltrainer"
        },
        {
            TID: "453",
            TrainerName: "Alexia",
            TrainerClass: "Cooltrainer"
        },
        {
            TID: "454",
            TrainerName: "George",
            TrainerClass: "Cooltrainer"
        },
        {
            TID: "455",
            TrainerName: "Jody",
            TrainerClass: "Cooltrainer"
        },
        {
            TID: "456",
            TrainerName: "Berke",
            TrainerClass: "Cooltrainer"
        },
        {
            TID: "457",
            TrainerName: "Norman",
            TrainerClass: "Leader"
        },
        {
            TID: "458",
            TrainerName: "Humberto",
            TrainerClass: "Bird Keeper"
        },
        {
            TID: "459",
            TrainerName: "Jared",
            TrainerClass: "Bird Keeper"
        },
        {
            TID: "460",
            TrainerName: "Ashley",
            TrainerClass: "Picnicker"
        },
        {
            TID: "461",
            TrainerName: "Flint",
            TrainerClass: "Camper"
        },
        {
            TID: "462",
            TrainerName: "Edwardo",
            TrainerClass: "Bird Keeper"
        },
        {
            TID: "463",
            TrainerName: "Darius",
            TrainerClass: "Bird Keeper"
        },
        {
            TID: "464",
            TrainerName: "Winona",
            TrainerClass: "Leader"
        },
        {
            TID: "465",
            TrainerName: "Preston",
            TrainerClass: "Psychic"
        },
        {
            TID: "466",
            TrainerName: "Maura",
            TrainerClass: "Psychic"
        },
        {
            TID: "467",
            TrainerName: "Samantha",
            TrainerClass: "Psychic"
        },
        {
            TID: "468",
            TrainerName: "Blake",
            TrainerClass: "Psychic"
        },
        {
            TID: "469",
            TrainerName: "Macey",
            TrainerClass: "Psychic"
        },
        {
            TID: "470",
            TrainerName: "Clifford",
            TrainerClass: "Gentleman"
        },
        {
            TID: "471",
            TrainerName: "Kathleen",
            TrainerClass: "Hex Maniac"
        },
        {
            TID: "472",
            TrainerName: "Nicholas",
            TrainerClass: "Psychic"
        },
        {
            TID: "473",
            TrainerName: "Nate",
            TrainerClass: "Gentleman"
        },
        {
            TID: "474",
            TrainerName: "Virgil",
            TrainerClass: "Psychic"
        },
        {
            TID: "475",
            TrainerName: "Sylvia",
            TrainerClass: "Hex Maniac"
        },
        {
            TID: "476",
            TrainerName: "Hannah",
            TrainerClass: "Psychic"
        },
        {
            TID: "477",
            TrainerName: "Tate & Liza",
            TrainerClass: "Leader"
        },
        {
            TID: "478",
            TrainerName: "Connie",
            TrainerClass: "Beauty"
        },
        {
            TID: "479",
            TrainerName: "Andrea",
            TrainerClass: "Lass"
        },
        {
            TID: "480",
            TrainerName: "Daphne",
            TrainerClass: "Lady"
        },
        {
            TID: "481",
            TrainerName: "Annika",
            TrainerClass: "Pokefan"
        },
        {
            TID: "482",
            TrainerName: "Tiffany",
            TrainerClass: "Beauty"
        },
        {
            TID: "483",
            TrainerName: "Crissy",
            TrainerClass: "Lass"
        },
        {
            TID: "484",
            TrainerName: "Bethany",
            TrainerClass: "Pokefan"
        },
        {
            TID: "485",
            TrainerName: "Olivia",
            TrainerClass: "Beauty"
        },
        {
            TID: "486",
            TrainerName: "Brianna",
            TrainerClass: "Lady"
        },
        {
            TID: "487",
            TrainerName: "Bridget",
            TrainerClass: "Beauty"
        },
        {
            TID: "488",
            TrainerName: "Juan",
            TrainerClass: "Leader"
        },
        {
            TID: "489",
            TrainerName: "Billy",
            TrainerClass: "Youngster"
        },
        {
            TID: "490",
            TrainerName: "Darian",
            TrainerClass: "Fisherman"
        },
        {
            TID: "491",
            TrainerName: "Cindy",
            TrainerClass: "Lady"
        },
        {
            TID: "492",
            TrainerName: "Winston",
            TrainerClass: "Rich Boy"
        },
        {
            TID: "493",
            TrainerName: "Haley",
            TrainerClass: "Lass"
        },
        {
            TID: "494",
            TrainerName: "Gina & Mia",
            TrainerClass: "Twins"
        },
        {
            TID: "495",
            TrainerName: "Ivan",
            TrainerClass: "Fisherman"
        }
        ],

        selectPokemon:{PokemonName: '0'},
        pokemon: [
        {
            Dex: "1",
            PokemonName: "Bulbasaur",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "0.7",
            Weight: "6.9",
            ExpYield: "64",
            HP: "45",
            Atk: "49",
            Def: "49",
            SpA: "65",
            SpD: "65",
            Spe: "45",
            LevRate: "Medium Slow",
            HatchTime: "20",
            CatchRate: "45",
            MalePercent: "0.875"
        },
        {
            Dex: "2",
            PokemonName: "Ivysaur",
            EvolvesFrom: "1",
            evoMethod: "Level 16",
            Height: "1.0",
            Weight: "13.0",
            ExpYield: "142",
            HP: "60",
            Atk: "62",
            Def: "63",
            SpA: "80",
            SpD: "80",
            Spe: "60",
            LevRate: "Medium Slow",
            HatchTime: "20",
            CatchRate: "45",
            MalePercent: "0.875"
        },
        {
            Dex: "3",
            PokemonName: "Venusaur",
            EvolvesFrom: "2",
            evoMethod: "Level 32",
            Height: "2.0",
            Weight: "100.0",
            ExpYield: "263",
            HP: "80",
            Atk: "82",
            Def: "83",
            SpA: "100",
            SpD: "100",
            Spe: "80",
            LevRate: "Medium Slow",
            HatchTime: "20",
            CatchRate: "45",
            MalePercent: "0.875"
        },
        {
            Dex: "4",
            PokemonName: "Charmander",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "0.6",
            Weight: "8.5",
            ExpYield: "62",
            HP: "39",
            Atk: "52",
            Def: "43",
            SpA: "60",
            SpD: "50",
            Spe: "65",
            LevRate: "Medium Slow",
            HatchTime: "20",
            CatchRate: "45",
            MalePercent: "0.875"
        },
        {
            Dex: "5",
            PokemonName: "Charmeleon",
            EvolvesFrom: "4",
            evoMethod: "Level 16",
            Height: "1.1",
            Weight: "19.0",
            ExpYield: "142",
            HP: "58",
            Atk: "64",
            Def: "58",
            SpA: "80",
            SpD: "65",
            Spe: "80",
            LevRate: "Medium Slow",
            HatchTime: "20",
            CatchRate: "45",
            MalePercent: "0.875"
        },
        {
            Dex: "6",
            PokemonName: "Charizard",
            EvolvesFrom: "5",
            evoMethod: "Level 36",
            Height: "1.7",
            Weight: "90.5",
            ExpYield: "267",
            HP: "78",
            Atk: "84",
            Def: "78",
            SpA: "109",
            SpD: "85",
            Spe: "100",
            LevRate: "Medium Slow",
            HatchTime: "20",
            CatchRate: "45",
            MalePercent: "0.875"
        },
        {
            Dex: "7",
            PokemonName: "Squirtle",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "0.5",
            Weight: "9.0",
            ExpYield: "63",
            HP: "44",
            Atk: "48",
            Def: "65",
            SpA: "50",
            SpD: "64",
            Spe: "43",
            LevRate: "Medium Slow",
            HatchTime: "20",
            CatchRate: "45",
            MalePercent: "0.875"
        },
        {
            Dex: "8",
            PokemonName: "Wartortle",
            EvolvesFrom: "7",
            evoMethod: "Level 16",
            Height: "1.0",
            Weight: "22.5",
            ExpYield: "142",
            HP: "59",
            Atk: "63",
            Def: "80",
            SpA: "65",
            SpD: "80",
            Spe: "58",
            LevRate: "Medium Slow",
            HatchTime: "20",
            CatchRate: "45",
            MalePercent: "0.875"
        },
        {
            Dex: "9",
            PokemonName: "Blastoise",
            EvolvesFrom: "8",
            evoMethod: "Level 36",
            Height: "1.6",
            Weight: "85.5",
            ExpYield: "265",
            HP: "79",
            Atk: "83",
            Def: "100",
            SpA: "85",
            SpD: "105",
            Spe: "78",
            LevRate: "Medium Slow",
            HatchTime: "20",
            CatchRate: "45",
            MalePercent: "0.875"
        },
        {
            Dex: "10",
            PokemonName: "Caterpie",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "0.3",
            Weight: "2.9",
            ExpYield: "39",
            HP: "45",
            Atk: "30",
            Def: "35",
            SpA: "20",
            SpD: "20",
            Spe: "45",
            LevRate: "Medium Fast",
            HatchTime: "15",
            CatchRate: "255",
            MalePercent: "0.5"
        },
        {
            Dex: "11",
            PokemonName: "Metapod",
            EvolvesFrom: "10",
            evoMethod: "Level 7",
            Height: "0.7",
            Weight: "9.9",
            ExpYield: "72",
            HP: "50",
            Atk: "20",
            Def: "55",
            SpA: "25",
            SpD: "25",
            Spe: "30",
            LevRate: "Medium Fast",
            HatchTime: "15",
            CatchRate: "120",
            MalePercent: "0.5"
        },
        {
            Dex: "12",
            PokemonName: "Butterfree",
            EvolvesFrom: "11",
            evoMethod: "Level 10",
            Height: "1.1",
            Weight: "32.0",
            ExpYield: "198",
            HP: "60",
            Atk: "45",
            Def: "50",
            SpA: "90",
            SpD: "80",
            Spe: "70",
            LevRate: "Medium Fast",
            HatchTime: "15",
            CatchRate: "45",
            MalePercent: "0.5"
        },
        {
            Dex: "13",
            PokemonName: "Weedle",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "0.3",
            Weight: "3.2",
            ExpYield: "39",
            HP: "40",
            Atk: "35",
            Def: "30",
            SpA: "20",
            SpD: "20",
            Spe: "50",
            LevRate: "Medium Fast",
            HatchTime: "15",
            CatchRate: "255",
            MalePercent: "0.5"
        },
        {
            Dex: "14",
            PokemonName: "Kakuna",
            EvolvesFrom: "13",
            evoMethod: "Level 7",
            Height: "0.6",
            Weight: "10.0",
            ExpYield: "72",
            HP: "45",
            Atk: "25",
            Def: "50",
            SpA: "25",
            SpD: "25",
            Spe: "35",
            LevRate: "Medium Fast",
            HatchTime: "15",
            CatchRate: "120",
            MalePercent: "0.5"
        },
        {
            Dex: "15",
            PokemonName: "Beedrill",
            EvolvesFrom: "14",
            evoMethod: "Level 10",
            Height: "1.0",
            Weight: "29.5",
            ExpYield: "198",
            HP: "65",
            Atk: "90",
            Def: "40",
            SpA: "45",
            SpD: "80",
            Spe: "75",
            LevRate: "Medium Fast",
            HatchTime: "15",
            CatchRate: "45",
            MalePercent: "0.5"
        },
        {
            Dex: "16",
            PokemonName: "Pidgey",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "0.3",
            Weight: "1.8",
            ExpYield: "50",
            HP: "40",
            Atk: "45",
            Def: "40",
            SpA: "35",
            SpD: "35",
            Spe: "56",
            LevRate: "Medium Slow",
            HatchTime: "15",
            CatchRate: "255",
            MalePercent: "0.5"
        },
        {
            Dex: "17",
            PokemonName: "Pidgeotto",
            EvolvesFrom: "16",
            evoMethod: "Level 18",
            Height: "1.1",
            Weight: "30.0",
            ExpYield: "122",
            HP: "63",
            Atk: "60",
            Def: "55",
            SpA: "50",
            SpD: "50",
            Spe: "71",
            LevRate: "Medium Slow",
            HatchTime: "15",
            CatchRate: "120",
            MalePercent: "0.5"
        },
        {
            Dex: "18",
            PokemonName: "Pidgeot",
            EvolvesFrom: "17",
            evoMethod: "Level 36",
            Height: "1.5",
            Weight: "39.5",
            ExpYield: "240",
            HP: "83",
            Atk: "80",
            Def: "75",
            SpA: "70",
            SpD: "70",
            Spe: "101",
            LevRate: "Medium Slow",
            HatchTime: "15",
            CatchRate: "45",
            MalePercent: "0.5"
        },
        {
            Dex: "19",
            PokemonName: "Rattata",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "0.3",
            Weight: "3.5",
            ExpYield: "51",
            HP: "30",
            Atk: "56",
            Def: "35",
            SpA: "25",
            SpD: "35",
            Spe: "72",
            LevRate: "Medium Fast",
            HatchTime: "15",
            CatchRate: "255",
            MalePercent: "0.5"
        },
        {
            Dex: "20",
            PokemonName: "Raticate",
            EvolvesFrom: "19",
            evoMethod: "Level 20",
            Height: "0.7",
            Weight: "18.5",
            ExpYield: "145",
            HP: "55",
            Atk: "81",
            Def: "60",
            SpA: "50",
            SpD: "70",
            Spe: "97",
            LevRate: "Medium Fast",
            HatchTime: "15",
            CatchRate: "127",
            MalePercent: "0.5"
        },
        {
            Dex: "21",
            PokemonName: "Spearow",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "0.3",
            Weight: "2.0",
            ExpYield: "52",
            HP: "40",
            Atk: "60",
            Def: "30",
            SpA: "31",
            SpD: "31",
            Spe: "70",
            LevRate: "Medium Fast",
            HatchTime: "15",
            CatchRate: "255",
            MalePercent: "0.5"
        },
        {
            Dex: "22",
            PokemonName: "Fearow",
            EvolvesFrom: "21",
            evoMethod: "Level 20",
            Height: "1.2",
            Weight: "38.0",
            ExpYield: "155",
            HP: "65",
            Atk: "90",
            Def: "65",
            SpA: "61",
            SpD: "61",
            Spe: "100",
            LevRate: "Medium Fast",
            HatchTime: "15",
            CatchRate: "90",
            MalePercent: "0.5"
        },
        {
            Dex: "23",
            PokemonName: "Ekans",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "2.0",
            Weight: "6.9",
            ExpYield: "58",
            HP: "35",
            Atk: "60",
            Def: "44",
            SpA: "40",
            SpD: "54",
            Spe: "55",
            LevRate: "Medium Fast",
            HatchTime: "20",
            CatchRate: "255",
            MalePercent: "0.5"
        },
        {
            Dex: "24",
            PokemonName: "Arbok",
            EvolvesFrom: "23",
            evoMethod: "Level 22",
            Height: "3.5",
            Weight: "65.0",
            ExpYield: "157",
            HP: "60",
            Atk: "95",
            Def: "69",
            SpA: "65",
            SpD: "79",
            Spe: "80",
            LevRate: "Medium Fast",
            HatchTime: "20",
            CatchRate: "90",
            MalePercent: "0.5"
        },
        {
            Dex: "25",
            PokemonName: "Pikachu",
            EvolvesFrom: "172",
            evoMethod: "Friendship",
            Height: "0.4",
            Weight: "6.0",
            ExpYield: "112",
            HP: "35",
            Atk: "55",
            Def: "40",
            SpA: "50",
            SpD: "50",
            Spe: "90",
            LevRate: "Medium Fast",
            HatchTime: "10",
            CatchRate: "190",
            MalePercent: "0.5"
        },
        {
            Dex: "26",
            PokemonName: "Raichu",
            EvolvesFrom: "25",
            evoMethod: "Thunder Stone",
            Height: "0.8",
            Weight: "30.0",
            ExpYield: "243",
            HP: "60",
            Atk: "90",
            Def: "55",
            SpA: "90",
            SpD: "80",
            Spe: "110",
            LevRate: "Medium Fast",
            HatchTime: "10",
            CatchRate: "75",
            MalePercent: "0.5"
        },
        {
            Dex: "27",
            PokemonName: "Sandshrew",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "0.6",
            Weight: "12.0",
            ExpYield: "60",
            HP: "50",
            Atk: "75",
            Def: "85",
            SpA: "20",
            SpD: "30",
            Spe: "40",
            LevRate: "Medium Fast",
            HatchTime: "20",
            CatchRate: "255",
            MalePercent: "0.5"
        },
        {
            Dex: "28",
            PokemonName: "Sandslash",
            EvolvesFrom: "27",
            evoMethod: "Level 22",
            Height: "1.0",
            Weight: "29.5",
            ExpYield: "158",
            HP: "75",
            Atk: "100",
            Def: "110",
            SpA: "45",
            SpD: "55",
            Spe: "65",
            LevRate: "Medium Fast",
            HatchTime: "20",
            CatchRate: "90",
            MalePercent: "0.5"
        },
        {
            Dex: "29",
            PokemonName: "Nidoran-F",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "0.4",
            Weight: "7.0",
            ExpYield: "55",
            HP: "55",
            Atk: "47",
            Def: "52",
            SpA: "40",
            SpD: "40",
            Spe: "41",
            LevRate: "Medium Slow",
            HatchTime: "20",
            CatchRate: "235",
            MalePercent: "0.0"
        },
        {
            Dex: "30",
            PokemonName: "Nidorina",
            EvolvesFrom: "29",
            evoMethod: "Level 16",
            Height: "0.8",
            Weight: "20.0",
            ExpYield: "128",
            HP: "70",
            Atk: "62",
            Def: "67",
            SpA: "55",
            SpD: "55",
            Spe: "56",
            LevRate: "Medium Slow",
            HatchTime: "20",
            CatchRate: "120",
            MalePercent: "0.0"
        },
        {
            Dex: "31",
            PokemonName: "Nidoqueen",
            EvolvesFrom: "30",
            evoMethod: "Moon Stone",
            Height: "1.3",
            Weight: "60.0",
            ExpYield: "253",
            HP: "90",
            Atk: "92",
            Def: "87",
            SpA: "75",
            SpD: "85",
            Spe: "76",
            LevRate: "Medium Slow",
            HatchTime: "20",
            CatchRate: "45",
            MalePercent: "0.0"
        },
        {
            Dex: "32",
            PokemonName: "Nidoran-M",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "0.5",
            Weight: "9.0",
            ExpYield: "55",
            HP: "46",
            Atk: "57",
            Def: "40",
            SpA: "40",
            SpD: "40",
            Spe: "50",
            LevRate: "Medium Slow",
            HatchTime: "20",
            CatchRate: "235",
            MalePercent: "1.0"
        },
        {
            Dex: "33",
            PokemonName: "Nidorino",
            EvolvesFrom: "32",
            evoMethod: "Level 16",
            Height: "0.9",
            Weight: "19.5",
            ExpYield: "128",
            HP: "61",
            Atk: "72",
            Def: "57",
            SpA: "55",
            SpD: "55",
            Spe: "65",
            LevRate: "Medium Slow",
            HatchTime: "20",
            CatchRate: "120",
            MalePercent: "1.0"
        },
        {
            Dex: "34",
            PokemonName: "Nidoking",
            EvolvesFrom: "33",
            evoMethod: "Moon Stone",
            Height: "1.4",
            Weight: "62.0",
            ExpYield: "253",
            HP: "81",
            Atk: "102",
            Def: "77",
            SpA: "85",
            SpD: "75",
            Spe: "85",
            LevRate: "Medium Slow",
            HatchTime: "20",
            CatchRate: "45",
            MalePercent: "1.0"
        },
        {
            Dex: "35",
            PokemonName: "Clefairy",
            EvolvesFrom: "173",
            evoMethod: "Friendship",
            Height: "0.6",
            Weight: "7.5",
            ExpYield: "113",
            HP: "70",
            Atk: "45",
            Def: "48",
            SpA: "60",
            SpD: "65",
            Spe: "35",
            LevRate: "Fast",
            HatchTime: "10",
            CatchRate: "150",
            MalePercent: "0.25"
        },
        {
            Dex: "36",
            PokemonName: "Clefable",
            EvolvesFrom: "35",
            evoMethod: "Moon Stone",
            Height: "1.3",
            Weight: "40.0",
            ExpYield: "242",
            HP: "95",
            Atk: "70",
            Def: "73",
            SpA: "95",
            SpD: "90",
            Spe: "60",
            LevRate: "Fast",
            HatchTime: "10",
            CatchRate: "25",
            MalePercent: "0.25"
        },
        {
            Dex: "37",
            PokemonName: "Vulpix",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "0.6",
            Weight: "9.9",
            ExpYield: "60",
            HP: "38",
            Atk: "41",
            Def: "40",
            SpA: "50",
            SpD: "65",
            Spe: "65",
            LevRate: "Medium Fast",
            HatchTime: "20",
            CatchRate: "190",
            MalePercent: "0.25"
        },
        {
            Dex: "38",
            PokemonName: "Ninetales",
            EvolvesFrom: "37",
            evoMethod: "Fire Stone",
            Height: "1.1",
            Weight: "19.9",
            ExpYield: "177",
            HP: "73",
            Atk: "76",
            Def: "75",
            SpA: "81",
            SpD: "100",
            Spe: "100",
            LevRate: "Medium Fast",
            HatchTime: "20",
            CatchRate: "75",
            MalePercent: "0.25"
        },
        {
            Dex: "39",
            PokemonName: "Jigglypuff",
            EvolvesFrom: "174",
            evoMethod: "Friendship",
            Height: "0.5",
            Weight: "5.5",
            ExpYield: "95",
            HP: "115",
            Atk: "45",
            Def: "20",
            SpA: "45",
            SpD: "25",
            Spe: "20",
            LevRate: "Fast",
            HatchTime: "10",
            CatchRate: "170",
            MalePercent: "0.25"
        },
        {
            Dex: "40",
            PokemonName: "Wigglytuff",
            EvolvesFrom: "39",
            evoMethod: "Moon Stone",
            Height: "1.0",
            Weight: "12.0",
            ExpYield: "218",
            HP: "140",
            Atk: "70",
            Def: "45",
            SpA: "85",
            SpD: "50",
            Spe: "45",
            LevRate: "Fast",
            HatchTime: "10",
            CatchRate: "50",
            MalePercent: "0.25"
        },
        {
            Dex: "41",
            PokemonName: "Zubat",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "0.8",
            Weight: "7.5",
            ExpYield: "49",
            HP: "40",
            Atk: "45",
            Def: "35",
            SpA: "30",
            SpD: "40",
            Spe: "55",
            LevRate: "Medium Fast",
            HatchTime: "15",
            CatchRate: "255",
            MalePercent: "0.5"
        },
        {
            Dex: "42",
            PokemonName: "Golbat",
            EvolvesFrom: "41",
            evoMethod: "Level 22",
            Height: "1.6",
            Weight: "55.0",
            ExpYield: "159",
            HP: "75",
            Atk: "80",
            Def: "70",
            SpA: "65",
            SpD: "75",
            Spe: "90",
            LevRate: "Medium Fast",
            HatchTime: "15",
            CatchRate: "90",
            MalePercent: "0.5"
        },
        {
            Dex: "43",
            PokemonName: "Oddish",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "0.5",
            Weight: "5.4",
            ExpYield: "64",
            HP: "45",
            Atk: "50",
            Def: "55",
            SpA: "75",
            SpD: "65",
            Spe: "30",
            LevRate: "Medium Slow",
            HatchTime: "20",
            CatchRate: "255",
            MalePercent: "0.5"
        },
        {
            Dex: "44",
            PokemonName: "Gloom",
            EvolvesFrom: "43",
            evoMethod: "Level 21",
            Height: "0.8",
            Weight: "8.6",
            ExpYield: "138",
            HP: "60",
            Atk: "65",
            Def: "70",
            SpA: "85",
            SpD: "75",
            Spe: "40",
            LevRate: "Medium Slow",
            HatchTime: "20",
            CatchRate: "120",
            MalePercent: "0.5"
        },
        {
            Dex: "45",
            PokemonName: "Vileplume",
            EvolvesFrom: "44",
            evoMethod: "Leaf Stone",
            Height: "1.2",
            Weight: "18.6",
            ExpYield: "245",
            HP: "75",
            Atk: "80",
            Def: "85",
            SpA: "110",
            SpD: "90",
            Spe: "50",
            LevRate: "Medium Slow",
            HatchTime: "20",
            CatchRate: "45",
            MalePercent: "0.5"
        },
        {
            Dex: "46",
            PokemonName: "Paras",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "0.3",
            Weight: "5.4",
            ExpYield: "57",
            HP: "35",
            Atk: "70",
            Def: "55",
            SpA: "45",
            SpD: "55",
            Spe: "25",
            LevRate: "Medium Fast",
            HatchTime: "20",
            CatchRate: "190",
            MalePercent: "0.5"
        },
        {
            Dex: "47",
            PokemonName: "Parasect",
            EvolvesFrom: "46",
            evoMethod: "Level 24",
            Height: "1.0",
            Weight: "29.5",
            ExpYield: "142",
            HP: "60",
            Atk: "95",
            Def: "80",
            SpA: "60",
            SpD: "80",
            Spe: "30",
            LevRate: "Medium Fast",
            HatchTime: "20",
            CatchRate: "75",
            MalePercent: "0.5"
        },
        {
            Dex: "48",
            PokemonName: "Venonat",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "1.0",
            Weight: "30.0",
            ExpYield: "61",
            HP: "60",
            Atk: "55",
            Def: "50",
            SpA: "40",
            SpD: "55",
            Spe: "45",
            LevRate: "Medium Fast",
            HatchTime: "20",
            CatchRate: "190",
            MalePercent: "0.5"
        },
        {
            Dex: "49",
            PokemonName: "Venomoth",
            EvolvesFrom: "48",
            evoMethod: "Level 31",
            Height: "1.5",
            Weight: "12.5",
            ExpYield: "158",
            HP: "70",
            Atk: "65",
            Def: "60",
            SpA: "90",
            SpD: "75",
            Spe: "90",
            LevRate: "Medium Fast",
            HatchTime: "20",
            CatchRate: "75",
            MalePercent: "0.5"
        },
        {
            Dex: "50",
            PokemonName: "Diglett",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "0.2",
            Weight: "0.8",
            ExpYield: "53",
            HP: "10",
            Atk: "55",
            Def: "25",
            SpA: "35",
            SpD: "45",
            Spe: "95",
            LevRate: "Medium Fast",
            HatchTime: "20",
            CatchRate: "255",
            MalePercent: "0.5"
        },
        {
            Dex: "51",
            PokemonName: "Dugtrio",
            EvolvesFrom: "50",
            evoMethod: "Level 26",
            Height: "0.7",
            Weight: "33.3",
            ExpYield: "149",
            HP: "35",
            Atk: "100",
            Def: "50",
            SpA: "50",
            SpD: "70",
            Spe: "120",
            LevRate: "Medium Fast",
            HatchTime: "20",
            CatchRate: "50",
            MalePercent: "0.5"
        },
        {
            Dex: "52",
            PokemonName: "Meowth",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "0.4",
            Weight: "4.2",
            ExpYield: "58",
            HP: "40",
            Atk: "45",
            Def: "35",
            SpA: "40",
            SpD: "40",
            Spe: "90",
            LevRate: "Medium Fast",
            HatchTime: "20",
            CatchRate: "255",
            MalePercent: "0.5"
        },
        {
            Dex: "53",
            PokemonName: "Persian",
            EvolvesFrom: "52",
            evoMethod: "Level 28",
            Height: "1.0",
            Weight: "32.0",
            ExpYield: "154",
            HP: "65",
            Atk: "70",
            Def: "60",
            SpA: "65",
            SpD: "65",
            Spe: "115",
            LevRate: "Medium Fast",
            HatchTime: "20",
            CatchRate: "90",
            MalePercent: "0.5"
        },
        {
            Dex: "54",
            PokemonName: "Psyduck",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "0.8",
            Weight: "19.6",
            ExpYield: "64",
            HP: "50",
            Atk: "52",
            Def: "48",
            SpA: "65",
            SpD: "50",
            Spe: "55",
            LevRate: "Medium Fast",
            HatchTime: "20",
            CatchRate: "190",
            MalePercent: "0.5"
        },
        {
            Dex: "55",
            PokemonName: "Golduck",
            EvolvesFrom: "54",
            evoMethod: "Level 33",
            Height: "1.7",
            Weight: "76.6",
            ExpYield: "175",
            HP: "80",
            Atk: "82",
            Def: "78",
            SpA: "95",
            SpD: "80",
            Spe: "85",
            LevRate: "Medium Fast",
            HatchTime: "20",
            CatchRate: "75",
            MalePercent: "0.5"
        },
        {
            Dex: "56",
            PokemonName: "Mankey",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "0.5",
            Weight: "28.0",
            ExpYield: "61",
            HP: "40",
            Atk: "80",
            Def: "35",
            SpA: "35",
            SpD: "45",
            Spe: "70",
            LevRate: "Medium Fast",
            HatchTime: "20",
            CatchRate: "190",
            MalePercent: "0.5"
        },
        {
            Dex: "57",
            PokemonName: "Primeape",
            EvolvesFrom: "56",
            evoMethod: "Level 28",
            Height: "1.0",
            Weight: "32.0",
            ExpYield: "159",
            HP: "65",
            Atk: "105",
            Def: "60",
            SpA: "60",
            SpD: "70",
            Spe: "95",
            LevRate: "Medium Fast",
            HatchTime: "20",
            CatchRate: "75",
            MalePercent: "0.5"
        },
        {
            Dex: "58",
            PokemonName: "Growlithe",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "0.7",
            Weight: "19.0",
            ExpYield: "70",
            HP: "55",
            Atk: "70",
            Def: "45",
            SpA: "70",
            SpD: "50",
            Spe: "60",
            LevRate: "Slow",
            HatchTime: "20",
            CatchRate: "190",
            MalePercent: "0.75"
        },
        {
            Dex: "59",
            PokemonName: "Arcanine",
            EvolvesFrom: "58",
            evoMethod: "Fire Stone",
            Height: "1.9",
            Weight: "155.0",
            ExpYield: "194",
            HP: "90",
            Atk: "110",
            Def: "80",
            SpA: "100",
            SpD: "80",
            Spe: "95",
            LevRate: "Slow",
            HatchTime: "20",
            CatchRate: "75",
            MalePercent: "0.75"
        },
        {
            Dex: "60",
            PokemonName: "Poliwag",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "0.6",
            Weight: "12.4",
            ExpYield: "60",
            HP: "40",
            Atk: "50",
            Def: "40",
            SpA: "40",
            SpD: "40",
            Spe: "90",
            LevRate: "Medium Slow",
            HatchTime: "20",
            CatchRate: "255",
            MalePercent: "0.5"
        },
        {
            Dex: "61",
            PokemonName: "Poliwhirl",
            EvolvesFrom: "60",
            evoMethod: "Level 25",
            Height: "1.0",
            Weight: "20.0",
            ExpYield: "135",
            HP: "65",
            Atk: "65",
            Def: "65",
            SpA: "50",
            SpD: "50",
            Spe: "90",
            LevRate: "Medium Slow",
            HatchTime: "20",
            CatchRate: "120",
            MalePercent: "0.5"
        },
        {
            Dex: "62",
            PokemonName: "Poliwrath",
            EvolvesFrom: "61",
            evoMethod: "Water Stone",
            Height: "1.3",
            Weight: "54.0",
            ExpYield: "255",
            HP: "90",
            Atk: "95",
            Def: "95",
            SpA: "70",
            SpD: "90",
            Spe: "70",
            LevRate: "Medium Slow",
            HatchTime: "20",
            CatchRate: "45",
            MalePercent: "0.5"
        },
        {
            Dex: "63",
            PokemonName: "Abra",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "0.9",
            Weight: "19.5",
            ExpYield: "62",
            HP: "25",
            Atk: "20",
            Def: "15",
            SpA: "105",
            SpD: "55",
            Spe: "90",
            LevRate: "Medium Slow",
            HatchTime: "20",
            CatchRate: "200",
            MalePercent: "0.75"
        },
        {
            Dex: "64",
            PokemonName: "Kadabra",
            EvolvesFrom: "63",
            evoMethod: "Level 16",
            Height: "1.3",
            Weight: "56.5",
            ExpYield: "140",
            HP: "40",
            Atk: "35",
            Def: "30",
            SpA: "120",
            SpD: "70",
            Spe: "105",
            LevRate: "Medium Slow",
            HatchTime: "20",
            CatchRate: "100",
            MalePercent: "0.75"
        },
        {
            Dex: "65",
            PokemonName: "Alakazam",
            EvolvesFrom: "64",
            evoMethod: "Trade",
            Height: "1.5",
            Weight: "48.0",
            ExpYield: "250",
            HP: "55",
            Atk: "50",
            Def: "45",
            SpA: "135",
            SpD: "95",
            Spe: "120",
            LevRate: "Medium Slow",
            HatchTime: "20",
            CatchRate: "50",
            MalePercent: "0.75"
        },
        {
            Dex: "66",
            PokemonName: "Machop",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "0.8",
            Weight: "19.5",
            ExpYield: "61",
            HP: "70",
            Atk: "80",
            Def: "50",
            SpA: "35",
            SpD: "35",
            Spe: "35",
            LevRate: "Medium Slow",
            HatchTime: "20",
            CatchRate: "180",
            MalePercent: "0.75"
        },
        {
            Dex: "67",
            PokemonName: "Machoke",
            EvolvesFrom: "66",
            evoMethod: "Level 28",
            Height: "1.5",
            Weight: "70.5",
            ExpYield: "142",
            HP: "80",
            Atk: "100",
            Def: "70",
            SpA: "50",
            SpD: "60",
            Spe: "45",
            LevRate: "Medium Slow",
            HatchTime: "20",
            CatchRate: "90",
            MalePercent: "0.75"
        },
        {
            Dex: "68",
            PokemonName: "Machamp",
            EvolvesFrom: "67",
            evoMethod: "Trade",
            Height: "1.6",
            Weight: "130.0",
            ExpYield: "253",
            HP: "90",
            Atk: "130",
            Def: "80",
            SpA: "65",
            SpD: "85",
            Spe: "55",
            LevRate: "Medium Slow",
            HatchTime: "20",
            CatchRate: "45",
            MalePercent: "0.75"
        },
        {
            Dex: "69",
            PokemonName: "Bellsprout",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "0.7",
            Weight: "4.0",
            ExpYield: "60",
            HP: "50",
            Atk: "75",
            Def: "35",
            SpA: "70",
            SpD: "30",
            Spe: "40",
            LevRate: "Medium Slow",
            HatchTime: "20",
            CatchRate: "255",
            MalePercent: "0.5"
        },
        {
            Dex: "70",
            PokemonName: "Weepinbell",
            EvolvesFrom: "69",
            evoMethod: "Level 21",
            Height: "1.0",
            Weight: "6.4",
            ExpYield: "137",
            HP: "65",
            Atk: "90",
            Def: "50",
            SpA: "85",
            SpD: "45",
            Spe: "55",
            LevRate: "Medium Slow",
            HatchTime: "20",
            CatchRate: "120",
            MalePercent: "0.5"
        },
        {
            Dex: "71",
            PokemonName: "Victreebel",
            EvolvesFrom: "70",
            evoMethod: "Leaf Stone",
            Height: "1.7",
            Weight: "15.5",
            ExpYield: "245",
            HP: "80",
            Atk: "105",
            Def: "65",
            SpA: "100",
            SpD: "70",
            Spe: "70",
            LevRate: "Medium Slow",
            HatchTime: "20",
            CatchRate: "45",
            MalePercent: "0.5"
        },
        {
            Dex: "72",
            PokemonName: "Tentacool",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "0.9",
            Weight: "45.5",
            ExpYield: "67",
            HP: "40",
            Atk: "40",
            Def: "35",
            SpA: "50",
            SpD: "100",
            Spe: "70",
            LevRate: "Slow",
            HatchTime: "20",
            CatchRate: "190",
            MalePercent: "0.5"
        },
        {
            Dex: "73",
            PokemonName: "Tentacruel",
            EvolvesFrom: "72",
            evoMethod: "Level 30",
            Height: "1.6",
            Weight: "55.0",
            ExpYield: "180",
            HP: "80",
            Atk: "70",
            Def: "65",
            SpA: "80",
            SpD: "120",
            Spe: "100",
            LevRate: "Slow",
            HatchTime: "20",
            CatchRate: "60",
            MalePercent: "0.5"
        },
        {
            Dex: "74",
            PokemonName: "Geodude",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "0.4",
            Weight: "20.0",
            ExpYield: "60",
            HP: "40",
            Atk: "80",
            Def: "100",
            SpA: "30",
            SpD: "30",
            Spe: "20",
            LevRate: "Medium Slow",
            HatchTime: "15",
            CatchRate: "255",
            MalePercent: "0.5"
        },
        {
            Dex: "75",
            PokemonName: "Graveler",
            EvolvesFrom: "74",
            evoMethod: "Level 25",
            Height: "1.0",
            Weight: "105.0",
            ExpYield: "137",
            HP: "55",
            Atk: "95",
            Def: "115",
            SpA: "45",
            SpD: "45",
            Spe: "35",
            LevRate: "Medium Slow",
            HatchTime: "15",
            CatchRate: "120",
            MalePercent: "0.5"
        },
        {
            Dex: "76",
            PokemonName: "Golem",
            EvolvesFrom: "75",
            evoMethod: "Trade",
            Height: "1.4",
            Weight: "300.0",
            ExpYield: "248",
            HP: "80",
            Atk: "120",
            Def: "130",
            SpA: "55",
            SpD: "65",
            Spe: "45",
            LevRate: "Medium Slow",
            HatchTime: "15",
            CatchRate: "45",
            MalePercent: "0.5"
        },
        {
            Dex: "77",
            PokemonName: "Ponyta",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "1.0",
            Weight: "30.0",
            ExpYield: "82",
            HP: "50",
            Atk: "85",
            Def: "55",
            SpA: "65",
            SpD: "65",
            Spe: "90",
            LevRate: "Medium Fast",
            HatchTime: "20",
            CatchRate: "190",
            MalePercent: "0.5"
        },
        {
            Dex: "78",
            PokemonName: "Rapidash",
            EvolvesFrom: "77",
            evoMethod: "Level 40",
            Height: "1.7",
            Weight: "95.0",
            ExpYield: "175",
            HP: "65",
            Atk: "100",
            Def: "70",
            SpA: "80",
            SpD: "80",
            Spe: "105",
            LevRate: "Medium Fast",
            HatchTime: "20",
            CatchRate: "60",
            MalePercent: "0.5"
        },
        {
            Dex: "79",
            PokemonName: "Slowpoke",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "1.2",
            Weight: "36.0",
            ExpYield: "63",
            HP: "90",
            Atk: "65",
            Def: "65",
            SpA: "40",
            SpD: "40",
            Spe: "15",
            LevRate: "Medium Fast",
            HatchTime: "20",
            CatchRate: "190",
            MalePercent: "0.5"
        },
        {
            Dex: "80",
            PokemonName: "Slowbro",
            EvolvesFrom: "79",
            evoMethod: "Level 37",
            Height: "1.6",
            Weight: "78.5",
            ExpYield: "172",
            HP: "95",
            Atk: "75",
            Def: "110",
            SpA: "100",
            SpD: "80",
            Spe: "30",
            LevRate: "Medium Fast",
            HatchTime: "20",
            CatchRate: "75",
            MalePercent: "0.5"
        },
        {
            Dex: "81",
            PokemonName: "Magnemite",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "0.3",
            Weight: "6.0",
            ExpYield: "65",
            HP: "25",
            Atk: "35",
            Def: "70",
            SpA: "95",
            SpD: "55",
            Spe: "45",
            LevRate: "Medium Fast",
            HatchTime: "20",
            CatchRate: "190",
            MalePercent: ""
        },
        {
            Dex: "82",
            PokemonName: "Magneton",
            EvolvesFrom: "81",
            evoMethod: "Level 30",
            Height: "1.0",
            Weight: "60.0",
            ExpYield: "163",
            HP: "50",
            Atk: "60",
            Def: "95",
            SpA: "120",
            SpD: "70",
            Spe: "70",
            LevRate: "Medium Fast",
            HatchTime: "20",
            CatchRate: "60",
            MalePercent: ""
        },
        {
            Dex: "83",
            PokemonName: "Farfetchd",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "0.8",
            Weight: "15.0",
            ExpYield: "132",
            HP: "52",
            Atk: "90",
            Def: "55",
            SpA: "58",
            SpD: "62",
            Spe: "60",
            LevRate: "Medium Fast",
            HatchTime: "20",
            CatchRate: "45",
            MalePercent: "0.5"
        },
        {
            Dex: "84",
            PokemonName: "Doduo",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "1.4",
            Weight: "39.2",
            ExpYield: "62",
            HP: "35",
            Atk: "85",
            Def: "45",
            SpA: "35",
            SpD: "35",
            Spe: "75",
            LevRate: "Medium Fast",
            HatchTime: "20",
            CatchRate: "190",
            MalePercent: "0.5"
        },
        {
            Dex: "85",
            PokemonName: "Dodrio",
            EvolvesFrom: "84",
            evoMethod: "Level 31",
            Height: "1.8",
            Weight: "85.2",
            ExpYield: "165",
            HP: "60",
            Atk: "110",
            Def: "70",
            SpA: "60",
            SpD: "60",
            Spe: "110",
            LevRate: "Medium Fast",
            HatchTime: "20",
            CatchRate: "45",
            MalePercent: "0.5"
        },
        {
            Dex: "86",
            PokemonName: "Seel",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "1.1",
            Weight: "90.0",
            ExpYield: "65",
            HP: "65",
            Atk: "45",
            Def: "55",
            SpA: "45",
            SpD: "70",
            Spe: "45",
            LevRate: "Medium Fast",
            HatchTime: "20",
            CatchRate: "190",
            MalePercent: "0.5"
        },
        {
            Dex: "87",
            PokemonName: "Dewgong",
            EvolvesFrom: "86",
            evoMethod: "Level 34",
            Height: "1.7",
            Weight: "120.0",
            ExpYield: "166",
            HP: "90",
            Atk: "70",
            Def: "80",
            SpA: "70",
            SpD: "95",
            Spe: "70",
            LevRate: "Medium Fast",
            HatchTime: "20",
            CatchRate: "75",
            MalePercent: "0.5"
        },
        {
            Dex: "88",
            PokemonName: "Grimer",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "0.9",
            Weight: "30.0",
            ExpYield: "65",
            HP: "80",
            Atk: "80",
            Def: "50",
            SpA: "40",
            SpD: "50",
            Spe: "25",
            LevRate: "Medium Fast",
            HatchTime: "20",
            CatchRate: "190",
            MalePercent: "0.5"
        },
        {
            Dex: "89",
            PokemonName: "Muk",
            EvolvesFrom: "88",
            evoMethod: "Level 38",
            Height: "1.2",
            Weight: "30.0",
            ExpYield: "175",
            HP: "105",
            Atk: "105",
            Def: "75",
            SpA: "65",
            SpD: "100",
            Spe: "50",
            LevRate: "Medium Fast",
            HatchTime: "20",
            CatchRate: "75",
            MalePercent: "0.5"
        },
        {
            Dex: "90",
            PokemonName: "Shellder",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "0.3",
            Weight: "4.0",
            ExpYield: "61",
            HP: "30",
            Atk: "65",
            Def: "100",
            SpA: "45",
            SpD: "25",
            Spe: "40",
            LevRate: "Slow",
            HatchTime: "20",
            CatchRate: "190",
            MalePercent: "0.5"
        },
        {
            Dex: "91",
            PokemonName: "Cloyster",
            EvolvesFrom: "90",
            evoMethod: "Water Stone",
            Height: "1.5",
            Weight: "132.5",
            ExpYield: "184",
            HP: "50",
            Atk: "95",
            Def: "180",
            SpA: "85",
            SpD: "45",
            Spe: "70",
            LevRate: "Slow",
            HatchTime: "20",
            CatchRate: "60",
            MalePercent: "0.5"
        },
        {
            Dex: "92",
            PokemonName: "Gastly",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "1.3",
            Weight: "0.1",
            ExpYield: "62",
            HP: "30",
            Atk: "35",
            Def: "30",
            SpA: "100",
            SpD: "35",
            Spe: "80",
            LevRate: "Medium Slow",
            HatchTime: "20",
            CatchRate: "190",
            MalePercent: "0.5"
        },
        {
            Dex: "93",
            PokemonName: "Haunter",
            EvolvesFrom: "92",
            evoMethod: "Level 25",
            Height: "1.6",
            Weight: "0.1",
            ExpYield: "142",
            HP: "45",
            Atk: "50",
            Def: "45",
            SpA: "115",
            SpD: "55",
            Spe: "95",
            LevRate: "Medium Slow",
            HatchTime: "20",
            CatchRate: "90",
            MalePercent: "0.5"
        },
        {
            Dex: "94",
            PokemonName: "Gengar",
            EvolvesFrom: "93",
            evoMethod: "Trade",
            Height: "1.5",
            Weight: "40.5",
            ExpYield: "250",
            HP: "60",
            Atk: "65",
            Def: "60",
            SpA: "130",
            SpD: "75",
            Spe: "110",
            LevRate: "Medium Slow",
            HatchTime: "20",
            CatchRate: "45",
            MalePercent: "0.5"
        },
        {
            Dex: "95",
            PokemonName: "Onix",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "8.8",
            Weight: "210.0",
            ExpYield: "77",
            HP: "35",
            Atk: "45",
            Def: "160",
            SpA: "30",
            SpD: "45",
            Spe: "70",
            LevRate: "Medium Fast",
            HatchTime: "25",
            CatchRate: "45",
            MalePercent: "0.5"
        },
        {
            Dex: "96",
            PokemonName: "Drowzee",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "1.0",
            Weight: "32.4",
            ExpYield: "66",
            HP: "60",
            Atk: "48",
            Def: "45",
            SpA: "43",
            SpD: "90",
            Spe: "42",
            LevRate: "Medium Fast",
            HatchTime: "20",
            CatchRate: "190",
            MalePercent: "0.5"
        },
        {
            Dex: "97",
            PokemonName: "Hypno",
            EvolvesFrom: "96",
            evoMethod: "Level 26",
            Height: "1.6",
            Weight: "75.6",
            ExpYield: "169",
            HP: "85",
            Atk: "73",
            Def: "70",
            SpA: "73",
            SpD: "115",
            Spe: "67",
            LevRate: "Medium Fast",
            HatchTime: "20",
            CatchRate: "75",
            MalePercent: "0.5"
        },
        {
            Dex: "98",
            PokemonName: "Krabby",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "0.4",
            Weight: "6.5",
            ExpYield: "65",
            HP: "30",
            Atk: "105",
            Def: "90",
            SpA: "25",
            SpD: "25",
            Spe: "50",
            LevRate: "Medium Fast",
            HatchTime: "20",
            CatchRate: "225",
            MalePercent: "0.5"
        },
        {
            Dex: "99",
            PokemonName: "Kingler",
            EvolvesFrom: "98",
            evoMethod: "Level 28",
            Height: "1.3",
            Weight: "60.0",
            ExpYield: "166",
            HP: "55",
            Atk: "130",
            Def: "115",
            SpA: "50",
            SpD: "50",
            Spe: "75",
            LevRate: "Medium Fast",
            HatchTime: "20",
            CatchRate: "60",
            MalePercent: "0.5"
        },
        {
            Dex: "100",
            PokemonName: "Voltorb",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "0.5",
            Weight: "10.4",
            ExpYield: "66",
            HP: "40",
            Atk: "30",
            Def: "50",
            SpA: "55",
            SpD: "55",
            Spe: "100",
            LevRate: "Medium Fast",
            HatchTime: "20",
            CatchRate: "190",
            MalePercent: ""
        },
        {
            Dex: "101",
            PokemonName: "Electrode",
            EvolvesFrom: "100",
            evoMethod: "Level 30",
            Height: "1.2",
            Weight: "66.6",
            ExpYield: "172",
            HP: "60",
            Atk: "50",
            Def: "70",
            SpA: "80",
            SpD: "80",
            Spe: "150",
            LevRate: "Medium Fast",
            HatchTime: "20",
            CatchRate: "60",
            MalePercent: ""
        },
        {
            Dex: "102",
            PokemonName: "Exeggcute",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "0.4",
            Weight: "2.5",
            ExpYield: "65",
            HP: "60",
            Atk: "40",
            Def: "80",
            SpA: "60",
            SpD: "45",
            Spe: "40",
            LevRate: "Slow",
            HatchTime: "20",
            CatchRate: "90",
            MalePercent: "0.5"
        },
        {
            Dex: "103",
            PokemonName: "Exeggutor",
            EvolvesFrom: "102",
            evoMethod: "Leaf Stone",
            Height: "2.0",
            Weight: "120.0",
            ExpYield: "186",
            HP: "95",
            Atk: "95",
            Def: "85",
            SpA: "125",
            SpD: "75",
            Spe: "55",
            LevRate: "Slow",
            HatchTime: "20",
            CatchRate: "45",
            MalePercent: "0.5"
        },
        {
            Dex: "104",
            PokemonName: "Cubone",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "0.4",
            Weight: "6.5",
            ExpYield: "64",
            HP: "50",
            Atk: "50",
            Def: "95",
            SpA: "40",
            SpD: "50",
            Spe: "35",
            LevRate: "Medium Fast",
            HatchTime: "20",
            CatchRate: "190",
            MalePercent: "0.5"
        },
        {
            Dex: "105",
            PokemonName: "Marowak",
            EvolvesFrom: "104",
            evoMethod: "Level 28",
            Height: "1.0",
            Weight: "45.0",
            ExpYield: "149",
            HP: "60",
            Atk: "80",
            Def: "110",
            SpA: "50",
            SpD: "80",
            Spe: "45",
            LevRate: "Medium Fast",
            HatchTime: "20",
            CatchRate: "75",
            MalePercent: "0.5"
        },
        {
            Dex: "106",
            PokemonName: "Hitmonlee",
            EvolvesFrom: "236",
            evoMethod: "Level 20 (Attack > Defense)",
            Height: "1.5",
            Weight: "49.8",
            ExpYield: "159",
            HP: "50",
            Atk: "120",
            Def: "53",
            SpA: "35",
            SpD: "110",
            Spe: "87",
            LevRate: "Medium Fast",
            HatchTime: "25",
            CatchRate: "45",
            MalePercent: "1.0"
        },
        {
            Dex: "107",
            PokemonName: "Hitmonchan",
            EvolvesFrom: "236",
            evoMethod: "Level 20 (Attack < Defense)",
            Height: "1.4",
            Weight: "50.2",
            ExpYield: "159",
            HP: "50",
            Atk: "105",
            Def: "79",
            SpA: "35",
            SpD: "110",
            Spe: "76",
            LevRate: "Medium Fast",
            HatchTime: "25",
            CatchRate: "45",
            MalePercent: "1.0"
        },
        {
            Dex: "108",
            PokemonName: "Lickitung",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "1.2",
            Weight: "65.5",
            ExpYield: "77",
            HP: "90",
            Atk: "55",
            Def: "75",
            SpA: "60",
            SpD: "75",
            Spe: "30",
            LevRate: "Medium Fast",
            HatchTime: "20",
            CatchRate: "45",
            MalePercent: "0.5"
        },
        {
            Dex: "109",
            PokemonName: "Koffing",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "0.6",
            Weight: "1.0",
            ExpYield: "68",
            HP: "40",
            Atk: "65",
            Def: "95",
            SpA: "60",
            SpD: "45",
            Spe: "35",
            LevRate: "Medium Fast",
            HatchTime: "20",
            CatchRate: "190",
            MalePercent: "0.5"
        },
        {
            Dex: "110",
            PokemonName: "Weezing",
            EvolvesFrom: "109",
            evoMethod: "Level 35",
            Height: "1.2",
            Weight: "9.5",
            ExpYield: "172",
            HP: "65",
            Atk: "90",
            Def: "120",
            SpA: "85",
            SpD: "70",
            Spe: "60",
            LevRate: "Medium Fast",
            HatchTime: "20",
            CatchRate: "60",
            MalePercent: "0.5"
        },
        {
            Dex: "111",
            PokemonName: "Rhyhorn",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "1.0",
            Weight: "115.0",
            ExpYield: "69",
            HP: "80",
            Atk: "85",
            Def: "95",
            SpA: "30",
            SpD: "30",
            Spe: "25",
            LevRate: "Slow",
            HatchTime: "20",
            CatchRate: "120",
            MalePercent: "0.5"
        },
        {
            Dex: "112",
            PokemonName: "Rhydon",
            EvolvesFrom: "111",
            evoMethod: "Level 42",
            Height: "1.9",
            Weight: "120.0",
            ExpYield: "170",
            HP: "105",
            Atk: "130",
            Def: "120",
            SpA: "45",
            SpD: "45",
            Spe: "40",
            LevRate: "Slow",
            HatchTime: "20",
            CatchRate: "60",
            MalePercent: "0.5"
        },
        {
            Dex: "113",
            PokemonName: "Chansey",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "1.1",
            Weight: "34.6",
            ExpYield: "395",
            HP: "250",
            Atk: "5",
            Def: "5",
            SpA: "35",
            SpD: "105",
            Spe: "50",
            LevRate: "Fast",
            HatchTime: "40",
            CatchRate: "30",
            MalePercent: "0.0"
        },
        {
            Dex: "114",
            PokemonName: "Tangela",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "1.0",
            Weight: "35.0",
            ExpYield: "87",
            HP: "65",
            Atk: "55",
            Def: "115",
            SpA: "100",
            SpD: "40",
            Spe: "60",
            LevRate: "Medium Fast",
            HatchTime: "20",
            CatchRate: "45",
            MalePercent: "0.5"
        },
        {
            Dex: "115",
            PokemonName: "Kangaskhan",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "2.2",
            Weight: "80.0",
            ExpYield: "172",
            HP: "105",
            Atk: "95",
            Def: "80",
            SpA: "40",
            SpD: "80",
            Spe: "90",
            LevRate: "Medium Fast",
            HatchTime: "20",
            CatchRate: "45",
            MalePercent: "0.0"
        },
        {
            Dex: "116",
            PokemonName: "Horsea",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "0.4",
            Weight: "8.0",
            ExpYield: "59",
            HP: "30",
            Atk: "40",
            Def: "70",
            SpA: "70",
            SpD: "25",
            Spe: "60",
            LevRate: "Medium Fast",
            HatchTime: "20",
            CatchRate: "225",
            MalePercent: "0.5"
        },
        {
            Dex: "117",
            PokemonName: "Seadra",
            EvolvesFrom: "116",
            evoMethod: "Level 32",
            Height: "1.2",
            Weight: "25.0",
            ExpYield: "154",
            HP: "55",
            Atk: "65",
            Def: "95",
            SpA: "95",
            SpD: "45",
            Spe: "85",
            LevRate: "Medium Fast",
            HatchTime: "20",
            CatchRate: "75",
            MalePercent: "0.5"
        },
        {
            Dex: "118",
            PokemonName: "Goldeen",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "0.6",
            Weight: "15.0",
            ExpYield: "64",
            HP: "45",
            Atk: "67",
            Def: "60",
            SpA: "35",
            SpD: "50",
            Spe: "63",
            LevRate: "Medium Fast",
            HatchTime: "20",
            CatchRate: "225",
            MalePercent: "0.5"
        },
        {
            Dex: "119",
            PokemonName: "Seaking",
            EvolvesFrom: "118",
            evoMethod: "Level 33",
            Height: "1.3",
            Weight: "39.0",
            ExpYield: "158",
            HP: "80",
            Atk: "92",
            Def: "65",
            SpA: "65",
            SpD: "80",
            Spe: "68",
            LevRate: "Medium Fast",
            HatchTime: "20",
            CatchRate: "60",
            MalePercent: "0.5"
        },
        {
            Dex: "120",
            PokemonName: "Staryu",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "0.8",
            Weight: "34.5",
            ExpYield: "68",
            HP: "30",
            Atk: "45",
            Def: "55",
            SpA: "70",
            SpD: "55",
            Spe: "85",
            LevRate: "Slow",
            HatchTime: "20",
            CatchRate: "225",
            MalePercent: ""
        },
        {
            Dex: "121",
            PokemonName: "Starmie",
            EvolvesFrom: "120",
            evoMethod: "Water Stone",
            Height: "1.1",
            Weight: "80.0",
            ExpYield: "182",
            HP: "60",
            Atk: "75",
            Def: "85",
            SpA: "100",
            SpD: "85",
            Spe: "115",
            LevRate: "Slow",
            HatchTime: "20",
            CatchRate: "60",
            MalePercent: ""
        },
        {
            Dex: "122",
            PokemonName: "Mr. Mime",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "1.3",
            Weight: "54.5",
            ExpYield: "161",
            HP: "40",
            Atk: "45",
            Def: "65",
            SpA: "100",
            SpD: "120",
            Spe: "90",
            LevRate: "Medium Fast",
            HatchTime: "25",
            CatchRate: "45",
            MalePercent: "0.5"
        },
        {
            Dex: "123",
            PokemonName: "Scyther",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "1.5",
            Weight: "56.0",
            ExpYield: "100",
            HP: "70",
            Atk: "110",
            Def: "80",
            SpA: "55",
            SpD: "80",
            Spe: "105",
            LevRate: "Medium Fast",
            HatchTime: "25",
            CatchRate: "45",
            MalePercent: "0.5"
        },
        {
            Dex: "124",
            PokemonName: "Jynx",
            EvolvesFrom: "238",
            evoMethod: "Level 30",
            Height: "1.4",
            Weight: "40.6",
            ExpYield: "159",
            HP: "65",
            Atk: "50",
            Def: "35",
            SpA: "115",
            SpD: "95",
            Spe: "95",
            LevRate: "Medium Fast",
            HatchTime: "25",
            CatchRate: "45",
            MalePercent: "0.0"
        },
        {
            Dex: "125",
            PokemonName: "Electabuzz",
            EvolvesFrom: "239",
            evoMethod: "Level 30",
            Height: "1.1",
            Weight: "30.0",
            ExpYield: "172",
            HP: "65",
            Atk: "83",
            Def: "57",
            SpA: "95",
            SpD: "85",
            Spe: "105",
            LevRate: "Medium Fast",
            HatchTime: "25",
            CatchRate: "45",
            MalePercent: "0.75"
        },
        {
            Dex: "126",
            PokemonName: "Magmar",
            EvolvesFrom: "240",
            evoMethod: "Level 30",
            Height: "1.3",
            Weight: "44.5",
            ExpYield: "173",
            HP: "65",
            Atk: "95",
            Def: "57",
            SpA: "100",
            SpD: "85",
            Spe: "93",
            LevRate: "Medium Fast",
            HatchTime: "25",
            CatchRate: "45",
            MalePercent: "0.75"
        },
        {
            Dex: "127",
            PokemonName: "Pinsir",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "1.5",
            Weight: "55.0",
            ExpYield: "175",
            HP: "65",
            Atk: "125",
            Def: "100",
            SpA: "55",
            SpD: "70",
            Spe: "85",
            LevRate: "Slow",
            HatchTime: "25",
            CatchRate: "45",
            MalePercent: "0.5"
        },
        {
            Dex: "128",
            PokemonName: "Tauros",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "1.4",
            Weight: "88.4",
            ExpYield: "172",
            HP: "75",
            Atk: "100",
            Def: "95",
            SpA: "40",
            SpD: "70",
            Spe: "110",
            LevRate: "Slow",
            HatchTime: "20",
            CatchRate: "45",
            MalePercent: "1.0"
        },
        {
            Dex: "129",
            PokemonName: "Magikarp",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "0.9",
            Weight: "10.0",
            ExpYield: "40",
            HP: "20",
            Atk: "10",
            Def: "55",
            SpA: "15",
            SpD: "20",
            Spe: "80",
            LevRate: "Slow",
            HatchTime: "5",
            CatchRate: "255",
            MalePercent: "0.5"
        },
        {
            Dex: "130",
            PokemonName: "Gyarados",
            EvolvesFrom: "129",
            evoMethod: "Level 20",
            Height: "6.5",
            Weight: "235.0",
            ExpYield: "189",
            HP: "95",
            Atk: "125",
            Def: "79",
            SpA: "60",
            SpD: "100",
            Spe: "81",
            LevRate: "Slow",
            HatchTime: "5",
            CatchRate: "45",
            MalePercent: "0.5"
        },
        {
            Dex: "131",
            PokemonName: "Lapras",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "2.5",
            Weight: "220.0",
            ExpYield: "187",
            HP: "130",
            Atk: "85",
            Def: "80",
            SpA: "85",
            SpD: "95",
            Spe: "60",
            LevRate: "Slow",
            HatchTime: "40",
            CatchRate: "45",
            MalePercent: "0.5"
        },
        {
            Dex: "132",
            PokemonName: "Ditto",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "0.3",
            Weight: "4.0",
            ExpYield: "101",
            HP: "48",
            Atk: "48",
            Def: "48",
            SpA: "48",
            SpD: "48",
            Spe: "48",
            LevRate: "Medium Fast",
            HatchTime: "20",
            CatchRate: "35",
            MalePercent: ""
        },
        {
            Dex: "133",
            PokemonName: "Eevee",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "0.3",
            Weight: "6.5",
            ExpYield: "65",
            HP: "55",
            Atk: "55",
            Def: "50",
            SpA: "45",
            SpD: "65",
            Spe: "55",
            LevRate: "Medium Fast",
            HatchTime: "35",
            CatchRate: "45",
            MalePercent: "0.875"
        },
        {
            Dex: "134",
            PokemonName: "Vaporeon",
            EvolvesFrom: "133",
            evoMethod: "Water Stone",
            Height: "1.0",
            Weight: "29.0",
            ExpYield: "184",
            HP: "130",
            Atk: "65",
            Def: "60",
            SpA: "110",
            SpD: "95",
            Spe: "65",
            LevRate: "Medium Fast",
            HatchTime: "35",
            CatchRate: "45",
            MalePercent: "0.875"
        },
        {
            Dex: "135",
            PokemonName: "Jolteon",
            EvolvesFrom: "133",
            evoMethod: "Thunder Stone",
            Height: "0.8",
            Weight: "24.5",
            ExpYield: "184",
            HP: "65",
            Atk: "65",
            Def: "60",
            SpA: "110",
            SpD: "95",
            Spe: "130",
            LevRate: "Medium Fast",
            HatchTime: "35",
            CatchRate: "45",
            MalePercent: "0.875"
        },
        {
            Dex: "136",
            PokemonName: "Flareon",
            EvolvesFrom: "133",
            evoMethod: "Fire Stone",
            Height: "0.9",
            Weight: "25.0",
            ExpYield: "184",
            HP: "65",
            Atk: "130",
            Def: "60",
            SpA: "95",
            SpD: "110",
            Spe: "65",
            LevRate: "Medium Fast",
            HatchTime: "35",
            CatchRate: "45",
            MalePercent: "0.875"
        },
        {
            Dex: "137",
            PokemonName: "Porygon",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "0.8",
            Weight: "36.5",
            ExpYield: "79",
            HP: "65",
            Atk: "60",
            Def: "70",
            SpA: "85",
            SpD: "75",
            Spe: "40",
            LevRate: "Medium Fast",
            HatchTime: "20",
            CatchRate: "45",
            MalePercent: ""
        },
        {
            Dex: "138",
            PokemonName: "Omanyte",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "0.4",
            Weight: "7.5",
            ExpYield: "71",
            HP: "35",
            Atk: "40",
            Def: "100",
            SpA: "90",
            SpD: "55",
            Spe: "35",
            LevRate: "Medium Fast",
            HatchTime: "30",
            CatchRate: "45",
            MalePercent: "0.875"
        },
        {
            Dex: "139",
            PokemonName: "Omastar",
            EvolvesFrom: "138",
            evoMethod: "Level 40",
            Height: "1.0",
            Weight: "35.0",
            ExpYield: "173",
            HP: "70",
            Atk: "60",
            Def: "125",
            SpA: "115",
            SpD: "70",
            Spe: "55",
            LevRate: "Medium Fast",
            HatchTime: "30",
            CatchRate: "45",
            MalePercent: "0.875"
        },
        {
            Dex: "140",
            PokemonName: "Kabuto",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "0.5",
            Weight: "11.5",
            ExpYield: "71",
            HP: "30",
            Atk: "80",
            Def: "90",
            SpA: "55",
            SpD: "45",
            Spe: "55",
            LevRate: "Medium Fast",
            HatchTime: "30",
            CatchRate: "45",
            MalePercent: "0.875"
        },
        {
            Dex: "141",
            PokemonName: "Kabutops",
            EvolvesFrom: "140",
            evoMethod: "Level 40",
            Height: "1.3",
            Weight: "40.5",
            ExpYield: "173",
            HP: "60",
            Atk: "115",
            Def: "105",
            SpA: "65",
            SpD: "70",
            Spe: "80",
            LevRate: "Medium Fast",
            HatchTime: "30",
            CatchRate: "45",
            MalePercent: "0.875"
        },
        {
            Dex: "142",
            PokemonName: "Aerodactyl",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "1.8",
            Weight: "59.0",
            ExpYield: "180",
            HP: "80",
            Atk: "105",
            Def: "65",
            SpA: "60",
            SpD: "75",
            Spe: "130",
            LevRate: "Slow",
            HatchTime: "35",
            CatchRate: "45",
            MalePercent: "0.875"
        },
        {
            Dex: "143",
            PokemonName: "Snorlax",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "2.1",
            Weight: "460.0",
            ExpYield: "189",
            HP: "160",
            Atk: "110",
            Def: "65",
            SpA: "65",
            SpD: "110",
            Spe: "30",
            LevRate: "Slow",
            HatchTime: "40",
            CatchRate: "25",
            MalePercent: "0.875"
        },
        {
            Dex: "144",
            PokemonName: "Articuno",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "1.7",
            Weight: "55.4",
            ExpYield: "290",
            HP: "90",
            Atk: "85",
            Def: "100",
            SpA: "95",
            SpD: "125",
            Spe: "85",
            LevRate: "Slow",
            HatchTime: "80",
            CatchRate: "3",
            MalePercent: ""
        },
        {
            Dex: "145",
            PokemonName: "Zapdos",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "1.6",
            Weight: "52.6",
            ExpYield: "290",
            HP: "90",
            Atk: "90",
            Def: "85",
            SpA: "125",
            SpD: "90",
            Spe: "100",
            LevRate: "Slow",
            HatchTime: "80",
            CatchRate: "3",
            MalePercent: ""
        },
        {
            Dex: "146",
            PokemonName: "Moltres",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "2.0",
            Weight: "60.0",
            ExpYield: "290",
            HP: "90",
            Atk: "100",
            Def: "90",
            SpA: "125",
            SpD: "85",
            Spe: "90",
            LevRate: "Slow",
            HatchTime: "80",
            CatchRate: "3",
            MalePercent: ""
        },
        {
            Dex: "147",
            PokemonName: "Dratini",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "1.8",
            Weight: "3.3",
            ExpYield: "60",
            HP: "41",
            Atk: "64",
            Def: "45",
            SpA: "50",
            SpD: "50",
            Spe: "50",
            LevRate: "Slow",
            HatchTime: "40",
            CatchRate: "45",
            MalePercent: "0.5"
        },
        {
            Dex: "148",
            PokemonName: "Dragonair",
            EvolvesFrom: "147",
            evoMethod: "Level 30",
            Height: "4.0",
            Weight: "16.5",
            ExpYield: "147",
            HP: "61",
            Atk: "84",
            Def: "65",
            SpA: "70",
            SpD: "70",
            Spe: "70",
            LevRate: "Slow",
            HatchTime: "40",
            CatchRate: "45",
            MalePercent: "0.5"
        },
        {
            Dex: "149",
            PokemonName: "Dragonite",
            EvolvesFrom: "148",
            evoMethod: "Level 55",
            Height: "2.2",
            Weight: "210.0",
            ExpYield: "300",
            HP: "91",
            Atk: "134",
            Def: "95",
            SpA: "100",
            SpD: "100",
            Spe: "80",
            LevRate: "Slow",
            HatchTime: "40",
            CatchRate: "45",
            MalePercent: "0.5"
        },
        {
            Dex: "150",
            PokemonName: "Mewtwo",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "2.0",
            Weight: "122.0",
            ExpYield: "340",
            HP: "106",
            Atk: "110",
            Def: "90",
            SpA: "154",
            SpD: "90",
            Spe: "130",
            LevRate: "Slow",
            HatchTime: "120",
            CatchRate: "3",
            MalePercent: ""
        },
        {
            Dex: "151",
            PokemonName: "Mew",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "0.4",
            Weight: "4.0",
            ExpYield: "300",
            HP: "100",
            Atk: "100",
            Def: "100",
            SpA: "100",
            SpD: "100",
            Spe: "100",
            LevRate: "Medium Slow",
            HatchTime: "120",
            CatchRate: "45",
            MalePercent: ""
        },
        {
            Dex: "152",
            PokemonName: "Chikorita",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "0.9",
            Weight: "6.4",
            ExpYield: "64",
            HP: "45",
            Atk: "49",
            Def: "65",
            SpA: "49",
            SpD: "65",
            Spe: "45",
            LevRate: "Medium Slow",
            HatchTime: "20",
            CatchRate: "45",
            MalePercent: "0.875"
        },
        {
            Dex: "153",
            PokemonName: "Bayleef",
            EvolvesFrom: "152",
            evoMethod: "Level 16",
            Height: "1.2",
            Weight: "15.8",
            ExpYield: "142",
            HP: "60",
            Atk: "62",
            Def: "80",
            SpA: "63",
            SpD: "80",
            Spe: "60",
            LevRate: "Medium Slow",
            HatchTime: "20",
            CatchRate: "45",
            MalePercent: "0.875"
        },
        {
            Dex: "154",
            PokemonName: "Meganium",
            EvolvesFrom: "153",
            evoMethod: "Level 32",
            Height: "1.8",
            Weight: "100.5",
            ExpYield: "263",
            HP: "80",
            Atk: "82",
            Def: "100",
            SpA: "83",
            SpD: "100",
            Spe: "80",
            LevRate: "Medium Slow",
            HatchTime: "20",
            CatchRate: "45",
            MalePercent: "0.875"
        },
        {
            Dex: "155",
            PokemonName: "Cyndaquil",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "0.5",
            Weight: "7.9",
            ExpYield: "62",
            HP: "39",
            Atk: "52",
            Def: "43",
            SpA: "60",
            SpD: "50",
            Spe: "65",
            LevRate: "Medium Slow",
            HatchTime: "20",
            CatchRate: "45",
            MalePercent: "0.875"
        },
        {
            Dex: "156",
            PokemonName: "Quilava",
            EvolvesFrom: "155",
            evoMethod: "Level 14",
            Height: "0.9",
            Weight: "19.0",
            ExpYield: "142",
            HP: "58",
            Atk: "64",
            Def: "58",
            SpA: "80",
            SpD: "65",
            Spe: "80",
            LevRate: "Medium Slow",
            HatchTime: "20",
            CatchRate: "45",
            MalePercent: "0.875"
        },
        {
            Dex: "157",
            PokemonName: "Typhlosion",
            EvolvesFrom: "156",
            evoMethod: "Level 36",
            Height: "1.7",
            Weight: "79.5",
            ExpYield: "267",
            HP: "78",
            Atk: "84",
            Def: "78",
            SpA: "109",
            SpD: "85",
            Spe: "100",
            LevRate: "Medium Slow",
            HatchTime: "20",
            CatchRate: "45",
            MalePercent: "0.875"
        },
        {
            Dex: "158",
            PokemonName: "Totodile",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "0.6",
            Weight: "9.5",
            ExpYield: "63",
            HP: "50",
            Atk: "65",
            Def: "64",
            SpA: "44",
            SpD: "48",
            Spe: "43",
            LevRate: "Medium Slow",
            HatchTime: "20",
            CatchRate: "45",
            MalePercent: "0.875"
        },
        {
            Dex: "159",
            PokemonName: "Croconaw",
            EvolvesFrom: "158",
            evoMethod: "Level 18",
            Height: "1.1",
            Weight: "25.0",
            ExpYield: "142",
            HP: "65",
            Atk: "80",
            Def: "80",
            SpA: "59",
            SpD: "63",
            Spe: "58",
            LevRate: "Medium Slow",
            HatchTime: "20",
            CatchRate: "45",
            MalePercent: "0.875"
        },
        {
            Dex: "160",
            PokemonName: "Feraligatr",
            EvolvesFrom: "159",
            evoMethod: "Level 30",
            Height: "2.3",
            Weight: "88.8",
            ExpYield: "265",
            HP: "85",
            Atk: "105",
            Def: "100",
            SpA: "79",
            SpD: "83",
            Spe: "78",
            LevRate: "Medium Slow",
            HatchTime: "20",
            CatchRate: "45",
            MalePercent: "0.875"
        },
        {
            Dex: "161",
            PokemonName: "Sentret",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "0.8",
            Weight: "6.0",
            ExpYield: "43",
            HP: "35",
            Atk: "46",
            Def: "34",
            SpA: "35",
            SpD: "45",
            Spe: "20",
            LevRate: "Medium Fast",
            HatchTime: "15",
            CatchRate: "255",
            MalePercent: "0.5"
        },
        {
            Dex: "162",
            PokemonName: "Furret",
            EvolvesFrom: "161",
            evoMethod: "Level 15",
            Height: "1.8",
            Weight: "32.5",
            ExpYield: "145",
            HP: "85",
            Atk: "76",
            Def: "64",
            SpA: "45",
            SpD: "55",
            Spe: "90",
            LevRate: "Medium Fast",
            HatchTime: "15",
            CatchRate: "90",
            MalePercent: "0.5"
        },
        {
            Dex: "163",
            PokemonName: "Hoothoot",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "0.7",
            Weight: "21.2",
            ExpYield: "52",
            HP: "60",
            Atk: "30",
            Def: "30",
            SpA: "36",
            SpD: "56",
            Spe: "50",
            LevRate: "Medium Fast",
            HatchTime: "15",
            CatchRate: "255",
            MalePercent: "0.5"
        },
        {
            Dex: "164",
            PokemonName: "Noctowl",
            EvolvesFrom: "163",
            evoMethod: "Level 20",
            Height: "1.6",
            Weight: "40.8",
            ExpYield: "158",
            HP: "100",
            Atk: "50",
            Def: "50",
            SpA: "86",
            SpD: "96",
            Spe: "70",
            LevRate: "Medium Fast",
            HatchTime: "15",
            CatchRate: "90",
            MalePercent: "0.5"
        },
        {
            Dex: "165",
            PokemonName: "Ledyba",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "1.0",
            Weight: "10.8",
            ExpYield: "53",
            HP: "40",
            Atk: "20",
            Def: "30",
            SpA: "40",
            SpD: "80",
            Spe: "55",
            LevRate: "Fast",
            HatchTime: "15",
            CatchRate: "255",
            MalePercent: "0.5"
        },
        {
            Dex: "166",
            PokemonName: "Ledian",
            EvolvesFrom: "165",
            evoMethod: "Level 18",
            Height: "1.4",
            Weight: "35.6",
            ExpYield: "137",
            HP: "55",
            Atk: "35",
            Def: "50",
            SpA: "55",
            SpD: "110",
            Spe: "85",
            LevRate: "Fast",
            HatchTime: "15",
            CatchRate: "90",
            MalePercent: "0.5"
        },
        {
            Dex: "167",
            PokemonName: "Spinarak",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "0.5",
            Weight: "8.5",
            ExpYield: "50",
            HP: "40",
            Atk: "60",
            Def: "40",
            SpA: "40",
            SpD: "40",
            Spe: "30",
            LevRate: "Fast",
            HatchTime: "15",
            CatchRate: "255",
            MalePercent: "0.5"
        },
        {
            Dex: "168",
            PokemonName: "Ariados",
            EvolvesFrom: "167",
            evoMethod: "Level 22",
            Height: "1.1",
            Weight: "33.5",
            ExpYield: "140",
            HP: "70",
            Atk: "90",
            Def: "70",
            SpA: "60",
            SpD: "70",
            Spe: "40",
            LevRate: "Fast",
            HatchTime: "15",
            CatchRate: "90",
            MalePercent: "0.5"
        },
        {
            Dex: "169",
            PokemonName: "Crobat",
            EvolvesFrom: "42",
            evoMethod: "Friendship",
            Height: "1.8",
            Weight: "75.0",
            ExpYield: "268",
            HP: "85",
            Atk: "90",
            Def: "80",
            SpA: "70",
            SpD: "80",
            Spe: "130",
            LevRate: "Medium Fast",
            HatchTime: "15",
            CatchRate: "90",
            MalePercent: "0.5"
        },
        {
            Dex: "170",
            PokemonName: "Chinchou",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "0.5",
            Weight: "12.0",
            ExpYield: "66",
            HP: "75",
            Atk: "38",
            Def: "38",
            SpA: "56",
            SpD: "56",
            Spe: "67",
            LevRate: "Slow",
            HatchTime: "20",
            CatchRate: "190",
            MalePercent: "0.5"
        },
        {
            Dex: "171",
            PokemonName: "Lanturn",
            EvolvesFrom: "170",
            evoMethod: "Level 27",
            Height: "1.2",
            Weight: "22.5",
            ExpYield: "161",
            HP: "125",
            Atk: "58",
            Def: "58",
            SpA: "76",
            SpD: "76",
            Spe: "67",
            LevRate: "Slow",
            HatchTime: "20",
            CatchRate: "75",
            MalePercent: "0.5"
        },
        {
            Dex: "172",
            PokemonName: "Pichu",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "0.3",
            Weight: "2.0",
            ExpYield: "41",
            HP: "20",
            Atk: "40",
            Def: "15",
            SpA: "35",
            SpD: "35",
            Spe: "60",
            LevRate: "Medium Fast",
            HatchTime: "10",
            CatchRate: "190",
            MalePercent: "0.5"
        },
        {
            Dex: "173",
            PokemonName: "Cleffa",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "0.3",
            Weight: "3.0",
            ExpYield: "44",
            HP: "50",
            Atk: "25",
            Def: "28",
            SpA: "45",
            SpD: "55",
            Spe: "15",
            LevRate: "Fast",
            HatchTime: "10",
            CatchRate: "150",
            MalePercent: "0.25"
        },
        {
            Dex: "174",
            PokemonName: "Igglybuff",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "0.3",
            Weight: "1.0",
            ExpYield: "42",
            HP: "90",
            Atk: "30",
            Def: "15",
            SpA: "40",
            SpD: "20",
            Spe: "15",
            LevRate: "Fast",
            HatchTime: "10",
            CatchRate: "170",
            MalePercent: "0.25"
        },
        {
            Dex: "175",
            PokemonName: "Togepi",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "0.3",
            Weight: "1.5",
            ExpYield: "49",
            HP: "35",
            Atk: "20",
            Def: "65",
            SpA: "40",
            SpD: "65",
            Spe: "20",
            LevRate: "Fast",
            HatchTime: "10",
            CatchRate: "190",
            MalePercent: "0.875"
        },
        {
            Dex: "176",
            PokemonName: "Togetic",
            EvolvesFrom: "175",
            evoMethod: "Friendship",
            Height: "0.6",
            Weight: "3.2",
            ExpYield: "142",
            HP: "55",
            Atk: "40",
            Def: "85",
            SpA: "80",
            SpD: "105",
            Spe: "40",
            LevRate: "Fast",
            HatchTime: "10",
            CatchRate: "75",
            MalePercent: "0.875"
        },
        {
            Dex: "177",
            PokemonName: "Natu",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "0.2",
            Weight: "2.0",
            ExpYield: "64",
            HP: "40",
            Atk: "50",
            Def: "45",
            SpA: "70",
            SpD: "45",
            Spe: "70",
            LevRate: "Medium Fast",
            HatchTime: "20",
            CatchRate: "190",
            MalePercent: "0.5"
        },
        {
            Dex: "178",
            PokemonName: "Xatu",
            EvolvesFrom: "177",
            evoMethod: "Level 25",
            Height: "1.5",
            Weight: "15.0",
            ExpYield: "165",
            HP: "65",
            Atk: "75",
            Def: "70",
            SpA: "95",
            SpD: "70",
            Spe: "95",
            LevRate: "Medium Fast",
            HatchTime: "20",
            CatchRate: "75",
            MalePercent: "0.5"
        },
        {
            Dex: "179",
            PokemonName: "Mareep",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "0.6",
            Weight: "7.8",
            ExpYield: "56",
            HP: "55",
            Atk: "40",
            Def: "40",
            SpA: "65",
            SpD: "45",
            Spe: "35",
            LevRate: "Medium Slow",
            HatchTime: "20",
            CatchRate: "235",
            MalePercent: "0.5"
        },
        {
            Dex: "180",
            PokemonName: "Flaaffy",
            EvolvesFrom: "179",
            evoMethod: "Level 15",
            Height: "0.8",
            Weight: "13.3",
            ExpYield: "128",
            HP: "70",
            Atk: "55",
            Def: "55",
            SpA: "80",
            SpD: "60",
            Spe: "45",
            LevRate: "Medium Slow",
            HatchTime: "20",
            CatchRate: "120",
            MalePercent: "0.5"
        },
        {
            Dex: "181",
            PokemonName: "Ampharos",
            EvolvesFrom: "180",
            evoMethod: "Level 30",
            Height: "1.4",
            Weight: "61.5",
            ExpYield: "255",
            HP: "90",
            Atk: "75",
            Def: "85",
            SpA: "115",
            SpD: "90",
            Spe: "55",
            LevRate: "Medium Slow",
            HatchTime: "20",
            CatchRate: "45",
            MalePercent: "0.5"
        },
        {
            Dex: "182",
            PokemonName: "Bellossom",
            EvolvesFrom: "44",
            evoMethod: "Sun Stone",
            Height: "0.4",
            Weight: "5.8",
            ExpYield: "245",
            HP: "75",
            Atk: "80",
            Def: "95",
            SpA: "90",
            SpD: "100",
            Spe: "50",
            LevRate: "Medium Slow",
            HatchTime: "20",
            CatchRate: "45",
            MalePercent: "0.5"
        },
        {
            Dex: "183",
            PokemonName: "Marill",
            EvolvesFrom: "298",
            evoMethod: "Friendship",
            Height: "0.4",
            Weight: "8.5",
            ExpYield: "88",
            HP: "70",
            Atk: "20",
            Def: "50",
            SpA: "20",
            SpD: "50",
            Spe: "40",
            LevRate: "Fast",
            HatchTime: "10",
            CatchRate: "190",
            MalePercent: "0.5"
        },
        {
            Dex: "184",
            PokemonName: "Azumarill",
            EvolvesFrom: "183",
            evoMethod: "Level 18",
            Height: "0.8",
            Weight: "28.5",
            ExpYield: "210",
            HP: "100",
            Atk: "50",
            Def: "80",
            SpA: "60",
            SpD: "80",
            Spe: "50",
            LevRate: "Fast",
            HatchTime: "10",
            CatchRate: "75",
            MalePercent: "0.5"
        },
        {
            Dex: "185",
            PokemonName: "Sudowoodo",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "1.2",
            Weight: "38.0",
            ExpYield: "144",
            HP: "70",
            Atk: "100",
            Def: "115",
            SpA: "30",
            SpD: "65",
            Spe: "30",
            LevRate: "Medium Fast",
            HatchTime: "20",
            CatchRate: "65",
            MalePercent: "0.5"
        },
        {
            Dex: "186",
            PokemonName: "Politoed",
            EvolvesFrom: "61",
            evoMethod: "Trade holding Kings Rock",
            Height: "1.1",
            Weight: "33.9",
            ExpYield: "250",
            HP: "90",
            Atk: "75",
            Def: "75",
            SpA: "90",
            SpD: "100",
            Spe: "70",
            LevRate: "Medium Slow",
            HatchTime: "20",
            CatchRate: "45",
            MalePercent: "0.5"
        },
        {
            Dex: "187",
            PokemonName: "Hoppip",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "0.4",
            Weight: "0.5",
            ExpYield: "50",
            HP: "35",
            Atk: "35",
            Def: "40",
            SpA: "35",
            SpD: "55",
            Spe: "50",
            LevRate: "Medium Slow",
            HatchTime: "20",
            CatchRate: "255",
            MalePercent: "0.5"
        },
        {
            Dex: "188",
            PokemonName: "Skiploom",
            EvolvesFrom: "187",
            evoMethod: "Level 18",
            Height: "0.6",
            Weight: "1.0",
            ExpYield: "119",
            HP: "55",
            Atk: "45",
            Def: "50",
            SpA: "45",
            SpD: "65",
            Spe: "80",
            LevRate: "Medium Slow",
            HatchTime: "20",
            CatchRate: "120",
            MalePercent: "0.5"
        },
        {
            Dex: "189",
            PokemonName: "Jumpluff",
            EvolvesFrom: "188",
            evoMethod: "Level 27",
            Height: "0.8",
            Weight: "3.0",
            ExpYield: "230",
            HP: "75",
            Atk: "55",
            Def: "70",
            SpA: "55",
            SpD: "95",
            Spe: "110",
            LevRate: "Medium Slow",
            HatchTime: "20",
            CatchRate: "45",
            MalePercent: "0.5"
        },
        {
            Dex: "190",
            PokemonName: "Aipom",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "0.8",
            Weight: "11.5",
            ExpYield: "72",
            HP: "55",
            Atk: "70",
            Def: "55",
            SpA: "40",
            SpD: "55",
            Spe: "85",
            LevRate: "Fast",
            HatchTime: "20",
            CatchRate: "45",
            MalePercent: "0.5"
        },
        {
            Dex: "191",
            PokemonName: "Sunkern",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "0.3",
            Weight: "1.8",
            ExpYield: "36",
            HP: "30",
            Atk: "30",
            Def: "30",
            SpA: "30",
            SpD: "30",
            Spe: "30",
            LevRate: "Medium Slow",
            HatchTime: "20",
            CatchRate: "235",
            MalePercent: "0.5"
        },
        {
            Dex: "192",
            PokemonName: "Sunflora",
            EvolvesFrom: "191",
            evoMethod: "Sun Stone",
            Height: "0.8",
            Weight: "8.5",
            ExpYield: "149",
            HP: "75",
            Atk: "75",
            Def: "55",
            SpA: "105",
            SpD: "85",
            Spe: "30",
            LevRate: "Medium Slow",
            HatchTime: "20",
            CatchRate: "120",
            MalePercent: "0.5"
        },
        {
            Dex: "193",
            PokemonName: "Yanma",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "1.2",
            Weight: "38.0",
            ExpYield: "78",
            HP: "65",
            Atk: "65",
            Def: "45",
            SpA: "75",
            SpD: "45",
            Spe: "95",
            LevRate: "Medium Fast",
            HatchTime: "20",
            CatchRate: "75",
            MalePercent: "0.5"
        },
        {
            Dex: "194",
            PokemonName: "Wooper",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "0.4",
            Weight: "8.5",
            ExpYield: "42",
            HP: "55",
            Atk: "45",
            Def: "45",
            SpA: "25",
            SpD: "25",
            Spe: "15",
            LevRate: "Medium Fast",
            HatchTime: "20",
            CatchRate: "255",
            MalePercent: "0.5"
        },
        {
            Dex: "195",
            PokemonName: "Quagsire",
            EvolvesFrom: "194",
            evoMethod: "Level 20",
            Height: "1.4",
            Weight: "75.0",
            ExpYield: "151",
            HP: "95",
            Atk: "85",
            Def: "85",
            SpA: "65",
            SpD: "65",
            Spe: "35",
            LevRate: "Medium Fast",
            HatchTime: "20",
            CatchRate: "90",
            MalePercent: "0.5"
        },
        {
            Dex: "196",
            PokemonName: "Espeon",
            EvolvesFrom: "133",
            evoMethod: "Friendship (day)",
            Height: "0.9",
            Weight: "26.5",
            ExpYield: "184",
            HP: "65",
            Atk: "65",
            Def: "60",
            SpA: "130",
            SpD: "95",
            Spe: "110",
            LevRate: "Medium Fast",
            HatchTime: "35",
            CatchRate: "45",
            MalePercent: "0.875"
        },
        {
            Dex: "197",
            PokemonName: "Umbreon",
            EvolvesFrom: "133",
            evoMethod: "Friendship (night)",
            Height: "1.0",
            Weight: "27.0",
            ExpYield: "184",
            HP: "95",
            Atk: "65",
            Def: "110",
            SpA: "60",
            SpD: "130",
            Spe: "65",
            LevRate: "Medium Fast",
            HatchTime: "35",
            CatchRate: "45",
            MalePercent: "0.875"
        },
        {
            Dex: "198",
            PokemonName: "Murkrow",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "0.5",
            Weight: "2.1",
            ExpYield: "81",
            HP: "60",
            Atk: "85",
            Def: "42",
            SpA: "85",
            SpD: "42",
            Spe: "91",
            LevRate: "Medium Slow",
            HatchTime: "20",
            CatchRate: "30",
            MalePercent: "0.5"
        },
        {
            Dex: "199",
            PokemonName: "Slowking",
            EvolvesFrom: "79",
            evoMethod: "Trade holding Kings Rock",
            Height: "2.0",
            Weight: "79.5",
            ExpYield: "172",
            HP: "95",
            Atk: "75",
            Def: "80",
            SpA: "100",
            SpD: "110",
            Spe: "30",
            LevRate: "Medium Fast",
            HatchTime: "20",
            CatchRate: "70",
            MalePercent: "0.5"
        },
        {
            Dex: "200",
            PokemonName: "Misdreavus",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "0.7",
            Weight: "1.0",
            ExpYield: "87",
            HP: "60",
            Atk: "60",
            Def: "60",
            SpA: "85",
            SpD: "85",
            Spe: "85",
            LevRate: "Fast",
            HatchTime: "25",
            CatchRate: "45",
            MalePercent: "0.5"
        },
        {
            Dex: "201",
            PokemonName: "Unown",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "0.5",
            Weight: "5.0",
            ExpYield: "118",
            HP: "48",
            Atk: "72",
            Def: "48",
            SpA: "72",
            SpD: "48",
            Spe: "48",
            LevRate: "Medium Fast",
            HatchTime: "40",
            CatchRate: "225",
            MalePercent: ""
        },
        {
            Dex: "202",
            PokemonName: "Wobbuffet",
            EvolvesFrom: "360",
            evoMethod: "Level 15",
            Height: "1.3",
            Weight: "28.5",
            ExpYield: "142",
            HP: "190",
            Atk: "33",
            Def: "58",
            SpA: "33",
            SpD: "58",
            Spe: "33",
            LevRate: "Medium Fast",
            HatchTime: "20",
            CatchRate: "45",
            MalePercent: "0.5"
        },
        {
            Dex: "203",
            PokemonName: "Girafarig",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "1.5",
            Weight: "41.5",
            ExpYield: "159",
            HP: "70",
            Atk: "80",
            Def: "65",
            SpA: "90",
            SpD: "65",
            Spe: "85",
            LevRate: "Medium Fast",
            HatchTime: "20",
            CatchRate: "60",
            MalePercent: "0.5"
        },
        {
            Dex: "204",
            PokemonName: "Pineco",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "0.6",
            Weight: "7.2",
            ExpYield: "58",
            HP: "50",
            Atk: "65",
            Def: "90",
            SpA: "35",
            SpD: "35",
            Spe: "15",
            LevRate: "Medium Fast",
            HatchTime: "20",
            CatchRate: "190",
            MalePercent: "0.5"
        },
        {
            Dex: "205",
            PokemonName: "Forretress",
            EvolvesFrom: "204",
            evoMethod: "Level 31",
            Height: "1.2",
            Weight: "125.8",
            ExpYield: "163",
            HP: "75",
            Atk: "90",
            Def: "140",
            SpA: "60",
            SpD: "60",
            Spe: "40",
            LevRate: "Medium Fast",
            HatchTime: "20",
            CatchRate: "75",
            MalePercent: "0.5"
        },
        {
            Dex: "206",
            PokemonName: "Dunsparce",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "1.5",
            Weight: "14.0",
            ExpYield: "145",
            HP: "100",
            Atk: "70",
            Def: "70",
            SpA: "65",
            SpD: "65",
            Spe: "45",
            LevRate: "Medium Fast",
            HatchTime: "20",
            CatchRate: "190",
            MalePercent: "0.5"
        },
        {
            Dex: "207",
            PokemonName: "Gligar",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "1.1",
            Weight: "64.8",
            ExpYield: "86",
            HP: "65",
            Atk: "75",
            Def: "105",
            SpA: "35",
            SpD: "65",
            Spe: "85",
            LevRate: "Medium Slow",
            HatchTime: "20",
            CatchRate: "60",
            MalePercent: "0.5"
        },
        {
            Dex: "208",
            PokemonName: "Steelix",
            EvolvesFrom: "95",
            evoMethod: "Trade holding Metal Coat",
            Height: "9.2",
            Weight: "400.0",
            ExpYield: "179",
            HP: "75",
            Atk: "85",
            Def: "200",
            SpA: "55",
            SpD: "65",
            Spe: "30",
            LevRate: "Medium Fast",
            HatchTime: "25",
            CatchRate: "25",
            MalePercent: "0.5"
        },
        {
            Dex: "209",
            PokemonName: "Snubbull",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "0.6",
            Weight: "7.8",
            ExpYield: "60",
            HP: "60",
            Atk: "80",
            Def: "50",
            SpA: "40",
            SpD: "40",
            Spe: "30",
            LevRate: "Fast",
            HatchTime: "20",
            CatchRate: "190",
            MalePercent: "0.25"
        },
        {
            Dex: "210",
            PokemonName: "Granbull",
            EvolvesFrom: "209",
            evoMethod: "Level 23",
            Height: "1.4",
            Weight: "48.7",
            ExpYield: "158",
            HP: "90",
            Atk: "120",
            Def: "75",
            SpA: "60",
            SpD: "60",
            Spe: "45",
            LevRate: "Fast",
            HatchTime: "20",
            CatchRate: "75",
            MalePercent: "0.25"
        },
        {
            Dex: "211",
            PokemonName: "Qwilfish",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "0.5",
            Weight: "3.9",
            ExpYield: "88",
            HP: "65",
            Atk: "95",
            Def: "85",
            SpA: "55",
            SpD: "55",
            Spe: "85",
            LevRate: "Medium Fast",
            HatchTime: "20",
            CatchRate: "45",
            MalePercent: "0.5"
        },
        {
            Dex: "212",
            PokemonName: "Scizor",
            EvolvesFrom: "123",
            evoMethod: "Trade holding Metal Coat",
            Height: "1.8",
            Weight: "118.0",
            ExpYield: "175",
            HP: "70",
            Atk: "130",
            Def: "100",
            SpA: "55",
            SpD: "80",
            Spe: "65",
            LevRate: "Medium Fast",
            HatchTime: "25",
            CatchRate: "25",
            MalePercent: "0.5"
        },
        {
            Dex: "213",
            PokemonName: "Shuckle",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "0.6",
            Weight: "20.5",
            ExpYield: "177",
            HP: "20",
            Atk: "10",
            Def: "230",
            SpA: "10",
            SpD: "230",
            Spe: "5",
            LevRate: "Medium Slow",
            HatchTime: "20",
            CatchRate: "190",
            MalePercent: "0.5"
        },
        {
            Dex: "214",
            PokemonName: "Heracross",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "1.5",
            Weight: "54.0",
            ExpYield: "175",
            HP: "80",
            Atk: "125",
            Def: "75",
            SpA: "40",
            SpD: "95",
            Spe: "85",
            LevRate: "Slow",
            HatchTime: "25",
            CatchRate: "45",
            MalePercent: "0.5"
        },
        {
            Dex: "215",
            PokemonName: "Sneasel",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "0.9",
            Weight: "28.0",
            ExpYield: "86",
            HP: "55",
            Atk: "95",
            Def: "55",
            SpA: "35",
            SpD: "75",
            Spe: "115",
            LevRate: "Medium Slow",
            HatchTime: "20",
            CatchRate: "60",
            MalePercent: "0.5"
        },
        {
            Dex: "216",
            PokemonName: "Teddiursa",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "0.6",
            Weight: "8.8",
            ExpYield: "66",
            HP: "60",
            Atk: "80",
            Def: "50",
            SpA: "50",
            SpD: "50",
            Spe: "40",
            LevRate: "Medium Fast",
            HatchTime: "20",
            CatchRate: "120",
            MalePercent: "0.5"
        },
        {
            Dex: "217",
            PokemonName: "Ursaring",
            EvolvesFrom: "216",
            evoMethod: "Level 30",
            Height: "1.8",
            Weight: "125.8",
            ExpYield: "175",
            HP: "90",
            Atk: "130",
            Def: "75",
            SpA: "75",
            SpD: "75",
            Spe: "55",
            LevRate: "Medium Fast",
            HatchTime: "20",
            CatchRate: "60",
            MalePercent: "0.5"
        },
        {
            Dex: "218",
            PokemonName: "Slugma",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "0.7",
            Weight: "35.0",
            ExpYield: "50",
            HP: "40",
            Atk: "40",
            Def: "40",
            SpA: "70",
            SpD: "40",
            Spe: "20",
            LevRate: "Medium Fast",
            HatchTime: "20",
            CatchRate: "190",
            MalePercent: "0.5"
        },
        {
            Dex: "219",
            PokemonName: "Magcargo",
            EvolvesFrom: "218",
            evoMethod: "Level 38",
            Height: "0.8",
            Weight: "55.0",
            ExpYield: "151",
            HP: "60",
            Atk: "50",
            Def: "120",
            SpA: "90",
            SpD: "80",
            Spe: "30",
            LevRate: "Medium Fast",
            HatchTime: "20",
            CatchRate: "75",
            MalePercent: "0.5"
        },
        {
            Dex: "220",
            PokemonName: "Swinub",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "0.4",
            Weight: "6.5",
            ExpYield: "50",
            HP: "50",
            Atk: "50",
            Def: "40",
            SpA: "30",
            SpD: "30",
            Spe: "50",
            LevRate: "Slow",
            HatchTime: "20",
            CatchRate: "225",
            MalePercent: "0.5"
        },
        {
            Dex: "221",
            PokemonName: "Piloswine",
            EvolvesFrom: "220",
            evoMethod: "Level 33",
            Height: "1.1",
            Weight: "55.8",
            ExpYield: "158",
            HP: "100",
            Atk: "100",
            Def: "80",
            SpA: "60",
            SpD: "60",
            Spe: "50",
            LevRate: "Slow",
            HatchTime: "20",
            CatchRate: "75",
            MalePercent: "0.5"
        },
        {
            Dex: "222",
            PokemonName: "Corsola",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "0.6",
            Weight: "5.0",
            ExpYield: "144",
            HP: "65",
            Atk: "55",
            Def: "95",
            SpA: "65",
            SpD: "95",
            Spe: "35",
            LevRate: "Fast",
            HatchTime: "20",
            CatchRate: "60",
            MalePercent: "0.25"
        },
        {
            Dex: "223",
            PokemonName: "Remoraid",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "0.6",
            Weight: "12.0",
            ExpYield: "60",
            HP: "35",
            Atk: "65",
            Def: "35",
            SpA: "65",
            SpD: "35",
            Spe: "65",
            LevRate: "Medium Fast",
            HatchTime: "20",
            CatchRate: "190",
            MalePercent: "0.5"
        },
        {
            Dex: "224",
            PokemonName: "Octillery",
            EvolvesFrom: "223",
            evoMethod: "Level 25",
            Height: "0.9",
            Weight: "28.5",
            ExpYield: "168",
            HP: "75",
            Atk: "105",
            Def: "75",
            SpA: "105",
            SpD: "75",
            Spe: "45",
            LevRate: "Medium Fast",
            HatchTime: "20",
            CatchRate: "75",
            MalePercent: "0.5"
        },
        {
            Dex: "225",
            PokemonName: "Delibird",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "0.9",
            Weight: "16.0",
            ExpYield: "116",
            HP: "45",
            Atk: "55",
            Def: "45",
            SpA: "65",
            SpD: "45",
            Spe: "75",
            LevRate: "Fast",
            HatchTime: "20",
            CatchRate: "45",
            MalePercent: "0.5"
        },
        {
            Dex: "226",
            PokemonName: "Mantine",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "2.1",
            Weight: "220.0",
            ExpYield: "170",
            HP: "85",
            Atk: "40",
            Def: "70",
            SpA: "80",
            SpD: "140",
            Spe: "70",
            LevRate: "Slow",
            HatchTime: "25",
            CatchRate: "25",
            MalePercent: "0.5"
        },
        {
            Dex: "227",
            PokemonName: "Skarmory",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "1.7",
            Weight: "50.5",
            ExpYield: "163",
            HP: "65",
            Atk: "80",
            Def: "140",
            SpA: "40",
            SpD: "70",
            Spe: "70",
            LevRate: "Slow",
            HatchTime: "25",
            CatchRate: "25",
            MalePercent: "0.5"
        },
        {
            Dex: "228",
            PokemonName: "Houndour",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "0.6",
            Weight: "10.8",
            ExpYield: "66",
            HP: "45",
            Atk: "60",
            Def: "30",
            SpA: "80",
            SpD: "50",
            Spe: "65",
            LevRate: "Slow",
            HatchTime: "20",
            CatchRate: "120",
            MalePercent: "0.5"
        },
        {
            Dex: "229",
            PokemonName: "Houndoom",
            EvolvesFrom: "228",
            evoMethod: "Level 24",
            Height: "1.4",
            Weight: "35.0",
            ExpYield: "175",
            HP: "75",
            Atk: "90",
            Def: "50",
            SpA: "110",
            SpD: "80",
            Spe: "95",
            LevRate: "Slow",
            HatchTime: "20",
            CatchRate: "45",
            MalePercent: "0.5"
        },
        {
            Dex: "230",
            PokemonName: "Kingdra",
            EvolvesFrom: "117",
            evoMethod: "Trade holding Dragon Scale",
            Height: "1.8",
            Weight: "152.0",
            ExpYield: "270",
            HP: "75",
            Atk: "95",
            Def: "95",
            SpA: "95",
            SpD: "95",
            Spe: "85",
            LevRate: "Medium Fast",
            HatchTime: "20",
            CatchRate: "45",
            MalePercent: "0.5"
        },
        {
            Dex: "231",
            PokemonName: "Phanpy",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "0.5",
            Weight: "33.5",
            ExpYield: "66",
            HP: "90",
            Atk: "60",
            Def: "60",
            SpA: "40",
            SpD: "40",
            Spe: "40",
            LevRate: "Medium Fast",
            HatchTime: "20",
            CatchRate: "120",
            MalePercent: "0.5"
        },
        {
            Dex: "232",
            PokemonName: "Donphan",
            EvolvesFrom: "231",
            evoMethod: "Level 25",
            Height: "1.1",
            Weight: "120.0",
            ExpYield: "175",
            HP: "90",
            Atk: "120",
            Def: "120",
            SpA: "60",
            SpD: "60",
            Spe: "50",
            LevRate: "Medium Fast",
            HatchTime: "20",
            CatchRate: "60",
            MalePercent: "0.5"
        },
        {
            Dex: "233",
            PokemonName: "Porygon2",
            EvolvesFrom: "137",
            evoMethod: "Trade holding Up-Grade",
            Height: "0.6",
            Weight: "32.5",
            ExpYield: "180",
            HP: "85",
            Atk: "80",
            Def: "90",
            SpA: "105",
            SpD: "95",
            Spe: "60",
            LevRate: "Medium Fast",
            HatchTime: "20",
            CatchRate: "45",
            MalePercent: ""
        },
        {
            Dex: "234",
            PokemonName: "Stantler",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "1.4",
            Weight: "71.2",
            ExpYield: "163",
            HP: "73",
            Atk: "95",
            Def: "62",
            SpA: "85",
            SpD: "65",
            Spe: "85",
            LevRate: "Slow",
            HatchTime: "20",
            CatchRate: "45",
            MalePercent: "0.5"
        },
        {
            Dex: "235",
            PokemonName: "Smeargle",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "1.2",
            Weight: "58.0",
            ExpYield: "88",
            HP: "55",
            Atk: "20",
            Def: "35",
            SpA: "20",
            SpD: "45",
            Spe: "75",
            LevRate: "Fast",
            HatchTime: "20",
            CatchRate: "45",
            MalePercent: "0.5"
        },
        {
            Dex: "236",
            PokemonName: "Tyrogue",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "0.7",
            Weight: "21.0",
            ExpYield: "91",
            HP: "35",
            Atk: "35",
            Def: "35",
            SpA: "35",
            SpD: "35",
            Spe: "35",
            LevRate: "Medium Fast",
            HatchTime: "25",
            CatchRate: "75",
            MalePercent: "1.0"
        },
        {
            Dex: "237",
            PokemonName: "Hitmontop",
            EvolvesFrom: "236",
            evoMethod: "Level 20 (Attack = Defense)",
            Height: "1.4",
            Weight: "48.0",
            ExpYield: "159",
            HP: "50",
            Atk: "95",
            Def: "95",
            SpA: "35",
            SpD: "110",
            Spe: "70",
            LevRate: "Medium Fast",
            HatchTime: "25",
            CatchRate: "45",
            MalePercent: "1.0"
        },
        {
            Dex: "238",
            PokemonName: "Smoochum",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "0.4",
            Weight: "6.0",
            ExpYield: "61",
            HP: "45",
            Atk: "30",
            Def: "15",
            SpA: "85",
            SpD: "65",
            Spe: "65",
            LevRate: "Medium Fast",
            HatchTime: "25",
            CatchRate: "45",
            MalePercent: "0.0"
        },
        {
            Dex: "239",
            PokemonName: "Elekid",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "0.6",
            Weight: "23.5",
            ExpYield: "72",
            HP: "45",
            Atk: "63",
            Def: "37",
            SpA: "65",
            SpD: "55",
            Spe: "95",
            LevRate: "Medium Fast",
            HatchTime: "25",
            CatchRate: "45",
            MalePercent: "0.75"
        },
        {
            Dex: "240",
            PokemonName: "Magby",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "0.7",
            Weight: "21.4",
            ExpYield: "73",
            HP: "45",
            Atk: "75",
            Def: "37",
            SpA: "70",
            SpD: "55",
            Spe: "83",
            LevRate: "Medium Fast",
            HatchTime: "25",
            CatchRate: "45",
            MalePercent: "0.75"
        },
        {
            Dex: "241",
            PokemonName: "Miltank",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "1.2",
            Weight: "75.5",
            ExpYield: "172",
            HP: "95",
            Atk: "80",
            Def: "105",
            SpA: "40",
            SpD: "70",
            Spe: "100",
            LevRate: "Slow",
            HatchTime: "20",
            CatchRate: "45",
            MalePercent: "0.0"
        },
        {
            Dex: "242",
            PokemonName: "Blissey",
            EvolvesFrom: "113",
            evoMethod: "Friendship",
            Height: "1.5",
            Weight: "46.8",
            ExpYield: "635",
            HP: "255",
            Atk: "10",
            Def: "10",
            SpA: "75",
            SpD: "135",
            Spe: "55",
            LevRate: "Fast",
            HatchTime: "40",
            CatchRate: "30",
            MalePercent: "0.0"
        },
        {
            Dex: "243",
            PokemonName: "Raikou",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "1.9",
            Weight: "178.0",
            ExpYield: "290",
            HP: "90",
            Atk: "85",
            Def: "75",
            SpA: "115",
            SpD: "100",
            Spe: "115",
            LevRate: "Slow",
            HatchTime: "80",
            CatchRate: "3",
            MalePercent: ""
        },
        {
            Dex: "244",
            PokemonName: "Entei",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "2.1",
            Weight: "198.0",
            ExpYield: "290",
            HP: "115",
            Atk: "115",
            Def: "85",
            SpA: "90",
            SpD: "75",
            Spe: "100",
            LevRate: "Slow",
            HatchTime: "80",
            CatchRate: "3",
            MalePercent: ""
        },
        {
            Dex: "245",
            PokemonName: "Suicune",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "2.0",
            Weight: "187.0",
            ExpYield: "290",
            HP: "100",
            Atk: "75",
            Def: "115",
            SpA: "90",
            SpD: "115",
            Spe: "85",
            LevRate: "Slow",
            HatchTime: "80",
            CatchRate: "3",
            MalePercent: ""
        },
        {
            Dex: "246",
            PokemonName: "Larvitar",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "0.6",
            Weight: "72.0",
            ExpYield: "60",
            HP: "50",
            Atk: "64",
            Def: "50",
            SpA: "45",
            SpD: "50",
            Spe: "41",
            LevRate: "Slow",
            HatchTime: "40",
            CatchRate: "45",
            MalePercent: "0.5"
        },
        {
            Dex: "247",
            PokemonName: "Pupitar",
            EvolvesFrom: "246",
            evoMethod: "Level 30",
            Height: "1.2",
            Weight: "152.0",
            ExpYield: "144",
            HP: "70",
            Atk: "84",
            Def: "70",
            SpA: "65",
            SpD: "70",
            Spe: "51",
            LevRate: "Slow",
            HatchTime: "40",
            CatchRate: "45",
            MalePercent: "0.5"
        },
        {
            Dex: "248",
            PokemonName: "Tyranitar",
            EvolvesFrom: "247",
            evoMethod: "Level 55",
            Height: "2.0",
            Weight: "202.0",
            ExpYield: "300",
            HP: "100",
            Atk: "134",
            Def: "110",
            SpA: "95",
            SpD: "100",
            Spe: "61",
            LevRate: "Slow",
            HatchTime: "40",
            CatchRate: "45",
            MalePercent: "0.5"
        },
        {
            Dex: "249",
            PokemonName: "Lugia",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "5.2",
            Weight: "216.0",
            ExpYield: "340",
            HP: "106",
            Atk: "90",
            Def: "130",
            SpA: "90",
            SpD: "154",
            Spe: "110",
            LevRate: "Slow",
            HatchTime: "120",
            CatchRate: "3",
            MalePercent: ""
        },
        {
            Dex: "250",
            PokemonName: "Ho-Oh",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "3.8",
            Weight: "199.0",
            ExpYield: "340",
            HP: "106",
            Atk: "130",
            Def: "90",
            SpA: "110",
            SpD: "154",
            Spe: "90",
            LevRate: "Slow",
            HatchTime: "120",
            CatchRate: "3",
            MalePercent: ""
        },
        {
            Dex: "251",
            PokemonName: "Celebi",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "0.6",
            Weight: "5.0",
            ExpYield: "300",
            HP: "100",
            Atk: "100",
            Def: "100",
            SpA: "100",
            SpD: "100",
            Spe: "100",
            LevRate: "Medium Slow",
            HatchTime: "120",
            CatchRate: "45",
            MalePercent: ""
        },
        {
            Dex: "252",
            PokemonName: "Treecko",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "0.5",
            Weight: "5.0",
            ExpYield: "62",
            HP: "40",
            Atk: "45",
            Def: "35",
            SpA: "65",
            SpD: "55",
            Spe: "70",
            LevRate: "Medium Slow",
            HatchTime: "20",
            CatchRate: "45",
            MalePercent: "0.875"
        },
        {
            Dex: "253",
            PokemonName: "Grovyle",
            EvolvesFrom: "252",
            evoMethod: "Level 16",
            Height: "0.9",
            Weight: "21.6",
            ExpYield: "142",
            HP: "50",
            Atk: "65",
            Def: "45",
            SpA: "85",
            SpD: "65",
            Spe: "95",
            LevRate: "Medium Slow",
            HatchTime: "20",
            CatchRate: "45",
            MalePercent: "0.875"
        },
        {
            Dex: "254",
            PokemonName: "Sceptile",
            EvolvesFrom: "253",
            evoMethod: "Level 36",
            Height: "1.7",
            Weight: "52.2",
            ExpYield: "265",
            HP: "70",
            Atk: "85",
            Def: "65",
            SpA: "105",
            SpD: "85",
            Spe: "120",
            LevRate: "Medium Slow",
            HatchTime: "20",
            CatchRate: "45",
            MalePercent: "0.875"
        },
        {
            Dex: "255",
            PokemonName: "Torchic",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "0.4",
            Weight: "2.5",
            ExpYield: "62",
            HP: "45",
            Atk: "60",
            Def: "40",
            SpA: "70",
            SpD: "50",
            Spe: "45",
            LevRate: "Medium Slow",
            HatchTime: "20",
            CatchRate: "45",
            MalePercent: "0.875"
        },
        {
            Dex: "256",
            PokemonName: "Combusken",
            EvolvesFrom: "255",
            evoMethod: "Level 16",
            Height: "0.9",
            Weight: "19.5",
            ExpYield: "142",
            HP: "60",
            Atk: "85",
            Def: "60",
            SpA: "85",
            SpD: "60",
            Spe: "55",
            LevRate: "Medium Slow",
            HatchTime: "20",
            CatchRate: "45",
            MalePercent: "0.875"
        },
        {
            Dex: "257",
            PokemonName: "Blaziken",
            EvolvesFrom: "256",
            evoMethod: "Level 36",
            Height: "1.9",
            Weight: "52.0",
            ExpYield: "265",
            HP: "80",
            Atk: "120",
            Def: "70",
            SpA: "110",
            SpD: "70",
            Spe: "80",
            LevRate: "Medium Slow",
            HatchTime: "20",
            CatchRate: "45",
            MalePercent: "0.875"
        },
        {
            Dex: "258",
            PokemonName: "Mudkip",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "0.4",
            Weight: "7.6",
            ExpYield: "62",
            HP: "50",
            Atk: "70",
            Def: "50",
            SpA: "50",
            SpD: "50",
            Spe: "40",
            LevRate: "Medium Slow",
            HatchTime: "20",
            CatchRate: "45",
            MalePercent: "0.875"
        },
        {
            Dex: "259",
            PokemonName: "Marshtomp",
            EvolvesFrom: "258",
            evoMethod: "Level 16",
            Height: "0.7",
            Weight: "28.0",
            ExpYield: "142",
            HP: "70",
            Atk: "85",
            Def: "70",
            SpA: "60",
            SpD: "70",
            Spe: "50",
            LevRate: "Medium Slow",
            HatchTime: "20",
            CatchRate: "45",
            MalePercent: "0.875"
        },
        {
            Dex: "260",
            PokemonName: "Swampert",
            EvolvesFrom: "259",
            evoMethod: "Level 36",
            Height: "1.5",
            Weight: "81.9",
            ExpYield: "268",
            HP: "100",
            Atk: "110",
            Def: "90",
            SpA: "85",
            SpD: "90",
            Spe: "60",
            LevRate: "Medium Slow",
            HatchTime: "20",
            CatchRate: "45",
            MalePercent: "0.875"
        },
        {
            Dex: "261",
            PokemonName: "Poochyena",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "0.5",
            Weight: "13.6",
            ExpYield: "56",
            HP: "35",
            Atk: "55",
            Def: "35",
            SpA: "30",
            SpD: "30",
            Spe: "35",
            LevRate: "Medium Fast",
            HatchTime: "15",
            CatchRate: "255",
            MalePercent: "0.5"
        },
        {
            Dex: "262",
            PokemonName: "Mightyena",
            EvolvesFrom: "261",
            evoMethod: "Level 18",
            Height: "1.0",
            Weight: "37.0",
            ExpYield: "147",
            HP: "70",
            Atk: "90",
            Def: "70",
            SpA: "60",
            SpD: "60",
            Spe: "70",
            LevRate: "Medium Fast",
            HatchTime: "15",
            CatchRate: "127",
            MalePercent: "0.5"
        },
        {
            Dex: "263",
            PokemonName: "Zigzagoon",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "0.4",
            Weight: "17.5",
            ExpYield: "56",
            HP: "38",
            Atk: "30",
            Def: "41",
            SpA: "30",
            SpD: "41",
            Spe: "60",
            LevRate: "Medium Fast",
            HatchTime: "15",
            CatchRate: "255",
            MalePercent: "0.5"
        },
        {
            Dex: "264",
            PokemonName: "Linoone",
            EvolvesFrom: "263",
            evoMethod: "Level 20",
            Height: "0.5",
            Weight: "32.5",
            ExpYield: "147",
            HP: "78",
            Atk: "70",
            Def: "61",
            SpA: "50",
            SpD: "61",
            Spe: "100",
            LevRate: "Medium Fast",
            HatchTime: "15",
            CatchRate: "90",
            MalePercent: "0.5"
        },
        {
            Dex: "265",
            PokemonName: "Wurmple",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "0.3",
            Weight: "3.6",
            ExpYield: "56",
            HP: "45",
            Atk: "45",
            Def: "35",
            SpA: "20",
            SpD: "30",
            Spe: "20",
            LevRate: "Medium Fast",
            HatchTime: "15",
            CatchRate: "255",
            MalePercent: "0.5"
        },
        {
            Dex: "266",
            PokemonName: "Silcoon",
            EvolvesFrom: "265",
            evoMethod: "Level 7",
            Height: "0.6",
            Weight: "10.0",
            ExpYield: "72",
            HP: "50",
            Atk: "35",
            Def: "55",
            SpA: "25",
            SpD: "25",
            Spe: "15",
            LevRate: "Medium Fast",
            HatchTime: "15",
            CatchRate: "120",
            MalePercent: "0.5"
        },
        {
            Dex: "267",
            PokemonName: "Beautifly",
            EvolvesFrom: "266",
            evoMethod: "Level 10",
            Height: "1.0",
            Weight: "28.4",
            ExpYield: "198",
            HP: "60",
            Atk: "70",
            Def: "50",
            SpA: "100",
            SpD: "50",
            Spe: "65",
            LevRate: "Medium Fast",
            HatchTime: "15",
            CatchRate: "45",
            MalePercent: "0.5"
        },
        {
            Dex: "268",
            PokemonName: "Cascoon",
            EvolvesFrom: "265",
            evoMethod: "Level 7",
            Height: "0.7",
            Weight: "11.5",
            ExpYield: "72",
            HP: "50",
            Atk: "35",
            Def: "55",
            SpA: "25",
            SpD: "25",
            Spe: "15",
            LevRate: "Medium Fast",
            HatchTime: "15",
            CatchRate: "120",
            MalePercent: "0.5"
        },
        {
            Dex: "269",
            PokemonName: "Dustox",
            EvolvesFrom: "268",
            evoMethod: "Level 10",
            Height: "1.2",
            Weight: "31.6",
            ExpYield: "193",
            HP: "60",
            Atk: "50",
            Def: "70",
            SpA: "50",
            SpD: "90",
            Spe: "65",
            LevRate: "Medium Fast",
            HatchTime: "15",
            CatchRate: "45",
            MalePercent: "0.5"
        },
        {
            Dex: "270",
            PokemonName: "Lotad",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "0.5",
            Weight: "2.6",
            ExpYield: "44",
            HP: "40",
            Atk: "30",
            Def: "30",
            SpA: "40",
            SpD: "50",
            Spe: "30",
            LevRate: "Medium Slow",
            HatchTime: "15",
            CatchRate: "255",
            MalePercent: "0.5"
        },
        {
            Dex: "271",
            PokemonName: "Lombre",
            EvolvesFrom: "270",
            evoMethod: "Level 14",
            Height: "1.2",
            Weight: "32.5",
            ExpYield: "119",
            HP: "60",
            Atk: "50",
            Def: "50",
            SpA: "60",
            SpD: "70",
            Spe: "50",
            LevRate: "Medium Slow",
            HatchTime: "15",
            CatchRate: "120",
            MalePercent: "0.5"
        },
        {
            Dex: "272",
            PokemonName: "Ludicolo",
            EvolvesFrom: "271",
            evoMethod: "Water Stone",
            Height: "1.5",
            Weight: "55.0",
            ExpYield: "240",
            HP: "80",
            Atk: "70",
            Def: "70",
            SpA: "90",
            SpD: "100",
            Spe: "70",
            LevRate: "Medium Slow",
            HatchTime: "15",
            CatchRate: "45",
            MalePercent: "0.5"
        },
        {
            Dex: "273",
            PokemonName: "Seedot",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "0.5",
            Weight: "4.0",
            ExpYield: "44",
            HP: "40",
            Atk: "40",
            Def: "50",
            SpA: "30",
            SpD: "30",
            Spe: "30",
            LevRate: "Medium Slow",
            HatchTime: "15",
            CatchRate: "255",
            MalePercent: "0.5"
        },
        {
            Dex: "274",
            PokemonName: "Nuzleaf",
            EvolvesFrom: "273",
            evoMethod: "Level 14",
            Height: "1.0",
            Weight: "28.0",
            ExpYield: "119",
            HP: "70",
            Atk: "70",
            Def: "40",
            SpA: "60",
            SpD: "40",
            Spe: "60",
            LevRate: "Medium Slow",
            HatchTime: "15",
            CatchRate: "120",
            MalePercent: "0.5"
        },
        {
            Dex: "275",
            PokemonName: "Shiftry",
            EvolvesFrom: "274",
            evoMethod: "Leaf Stone",
            Height: "1.3",
            Weight: "59.6",
            ExpYield: "240",
            HP: "90",
            Atk: "100",
            Def: "60",
            SpA: "90",
            SpD: "60",
            Spe: "80",
            LevRate: "Medium Slow",
            HatchTime: "15",
            CatchRate: "45",
            MalePercent: "0.5"
        },
        {
            Dex: "276",
            PokemonName: "Taillow",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "0.3",
            Weight: "2.3",
            ExpYield: "54",
            HP: "40",
            Atk: "55",
            Def: "30",
            SpA: "30",
            SpD: "30",
            Spe: "85",
            LevRate: "Medium Slow",
            HatchTime: "15",
            CatchRate: "200",
            MalePercent: "0.5"
        },
        {
            Dex: "277",
            PokemonName: "Swellow",
            EvolvesFrom: "276",
            evoMethod: "Level 22",
            Height: "0.7",
            Weight: "19.8",
            ExpYield: "159",
            HP: "60",
            Atk: "85",
            Def: "60",
            SpA: "75",
            SpD: "50",
            Spe: "125",
            LevRate: "Medium Slow",
            HatchTime: "15",
            CatchRate: "45",
            MalePercent: "0.5"
        },
        {
            Dex: "278",
            PokemonName: "Wingull",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "0.6",
            Weight: "9.5",
            ExpYield: "54",
            HP: "40",
            Atk: "30",
            Def: "30",
            SpA: "55",
            SpD: "30",
            Spe: "85",
            LevRate: "Medium Fast",
            HatchTime: "20",
            CatchRate: "190",
            MalePercent: "0.5"
        },
        {
            Dex: "279",
            PokemonName: "Pelipper",
            EvolvesFrom: "278",
            evoMethod: "Level 25",
            Height: "1.2",
            Weight: "28.0",
            ExpYield: "154",
            HP: "60",
            Atk: "50",
            Def: "100",
            SpA: "95",
            SpD: "70",
            Spe: "65",
            LevRate: "Medium Fast",
            HatchTime: "20",
            CatchRate: "45",
            MalePercent: "0.5"
        },
        {
            Dex: "280",
            PokemonName: "Ralts",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "0.4",
            Weight: "6.6",
            ExpYield: "40",
            HP: "28",
            Atk: "25",
            Def: "25",
            SpA: "45",
            SpD: "35",
            Spe: "40",
            LevRate: "Slow",
            HatchTime: "20",
            CatchRate: "235",
            MalePercent: "0.5"
        },
        {
            Dex: "281",
            PokemonName: "Kirlia",
            EvolvesFrom: "280",
            evoMethod: "Level 20",
            Height: "0.8",
            Weight: "20.2",
            ExpYield: "97",
            HP: "38",
            Atk: "35",
            Def: "35",
            SpA: "65",
            SpD: "55",
            Spe: "50",
            LevRate: "Slow",
            HatchTime: "20",
            CatchRate: "120",
            MalePercent: "0.5"
        },
        {
            Dex: "282",
            PokemonName: "Gardevoir",
            EvolvesFrom: "281",
            evoMethod: "Level 30",
            Height: "1.6",
            Weight: "48.4",
            ExpYield: "259",
            HP: "68",
            Atk: "65",
            Def: "65",
            SpA: "125",
            SpD: "115",
            Spe: "80",
            LevRate: "Slow",
            HatchTime: "20",
            CatchRate: "45",
            MalePercent: "0.5"
        },
        {
            Dex: "283",
            PokemonName: "Surskit",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "0.5",
            Weight: "1.7",
            ExpYield: "54",
            HP: "40",
            Atk: "30",
            Def: "32",
            SpA: "50",
            SpD: "52",
            Spe: "65",
            LevRate: "Medium Fast",
            HatchTime: "15",
            CatchRate: "200",
            MalePercent: "0.5"
        },
        {
            Dex: "284",
            PokemonName: "Masquerain",
            EvolvesFrom: "283",
            evoMethod: "Level 22",
            Height: "0.8",
            Weight: "3.6",
            ExpYield: "159",
            HP: "70",
            Atk: "60",
            Def: "62",
            SpA: "100",
            SpD: "82",
            Spe: "80",
            LevRate: "Medium Fast",
            HatchTime: "15",
            CatchRate: "75",
            MalePercent: "0.5"
        },
        {
            Dex: "285",
            PokemonName: "Shroomish",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "0.4",
            Weight: "4.5",
            ExpYield: "59",
            HP: "60",
            Atk: "40",
            Def: "60",
            SpA: "40",
            SpD: "60",
            Spe: "35",
            LevRate: "Fluctuating",
            HatchTime: "15",
            CatchRate: "255",
            MalePercent: "0.5"
        },
        {
            Dex: "286",
            PokemonName: "Breloom",
            EvolvesFrom: "285",
            evoMethod: "Level 23",
            Height: "1.2",
            Weight: "39.2",
            ExpYield: "161",
            HP: "60",
            Atk: "130",
            Def: "80",
            SpA: "60",
            SpD: "60",
            Spe: "70",
            LevRate: "Fluctuating",
            HatchTime: "15",
            CatchRate: "90",
            MalePercent: "0.5"
        },
        {
            Dex: "287",
            PokemonName: "Slakoth",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "0.8",
            Weight: "24.0",
            ExpYield: "56",
            HP: "60",
            Atk: "60",
            Def: "60",
            SpA: "35",
            SpD: "35",
            Spe: "30",
            LevRate: "Slow",
            HatchTime: "15",
            CatchRate: "255",
            MalePercent: "0.5"
        },
        {
            Dex: "288",
            PokemonName: "Vigoroth",
            EvolvesFrom: "287",
            evoMethod: "Level 18",
            Height: "1.4",
            Weight: "46.5",
            ExpYield: "154",
            HP: "80",
            Atk: "80",
            Def: "80",
            SpA: "55",
            SpD: "55",
            Spe: "90",
            LevRate: "Slow",
            HatchTime: "15",
            CatchRate: "120",
            MalePercent: "0.5"
        },
        {
            Dex: "289",
            PokemonName: "Slaking",
            EvolvesFrom: "288",
            evoMethod: "Level 36",
            Height: "2.0",
            Weight: "130.5",
            ExpYield: "285",
            HP: "150",
            Atk: "160",
            Def: "100",
            SpA: "95",
            SpD: "65",
            Spe: "100",
            LevRate: "Slow",
            HatchTime: "15",
            CatchRate: "45",
            MalePercent: "0.5"
        },
        {
            Dex: "290",
            PokemonName: "Nincada",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "0.5",
            Weight: "5.5",
            ExpYield: "53",
            HP: "31",
            Atk: "45",
            Def: "90",
            SpA: "30",
            SpD: "30",
            Spe: "40",
            LevRate: "Erratic",
            HatchTime: "15",
            CatchRate: "255",
            MalePercent: "0.5"
        },
        {
            Dex: "291",
            PokemonName: "Ninjask",
            EvolvesFrom: "290",
            evoMethod: "Level 20",
            Height: "0.8",
            Weight: "12.0",
            ExpYield: "160",
            HP: "61",
            Atk: "90",
            Def: "45",
            SpA: "50",
            SpD: "50",
            Spe: "160",
            LevRate: "Erratic",
            HatchTime: "15",
            CatchRate: "120",
            MalePercent: "0.5"
        },
        {
            Dex: "292",
            PokemonName: "Shedinja",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "0.8",
            Weight: "1.2",
            ExpYield: "83",
            HP: "1",
            Atk: "90",
            Def: "45",
            SpA: "30",
            SpD: "30",
            Spe: "40",
            LevRate: "Erratic",
            HatchTime: "15",
            CatchRate: "45",
            MalePercent: ""
        },
        {
            Dex: "293",
            PokemonName: "Whismur",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "0.6",
            Weight: "16.3",
            ExpYield: "48",
            HP: "64",
            Atk: "51",
            Def: "23",
            SpA: "51",
            SpD: "23",
            Spe: "28",
            LevRate: "Medium Slow",
            HatchTime: "20",
            CatchRate: "190",
            MalePercent: "0.5"
        },
        {
            Dex: "294",
            PokemonName: "Loudred",
            EvolvesFrom: "293",
            evoMethod: "Level 20",
            Height: "1.0",
            Weight: "40.5",
            ExpYield: "126",
            HP: "84",
            Atk: "71",
            Def: "43",
            SpA: "71",
            SpD: "43",
            Spe: "48",
            LevRate: "Medium Slow",
            HatchTime: "20",
            CatchRate: "120",
            MalePercent: "0.5"
        },
        {
            Dex: "295",
            PokemonName: "Exploud",
            EvolvesFrom: "294",
            evoMethod: "Level 40",
            Height: "1.5",
            Weight: "84.0",
            ExpYield: "245",
            HP: "104",
            Atk: "91",
            Def: "63",
            SpA: "91",
            SpD: "73",
            Spe: "68",
            LevRate: "Medium Slow",
            HatchTime: "20",
            CatchRate: "45",
            MalePercent: "0.5"
        },
        {
            Dex: "296",
            PokemonName: "Makuhita",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "1.0",
            Weight: "86.4",
            ExpYield: "47",
            HP: "72",
            Atk: "60",
            Def: "30",
            SpA: "20",
            SpD: "30",
            Spe: "25",
            LevRate: "Fluctuating",
            HatchTime: "20",
            CatchRate: "180",
            MalePercent: "0.75"
        },
        {
            Dex: "297",
            PokemonName: "Hariyama",
            EvolvesFrom: "296",
            evoMethod: "Level 24",
            Height: "2.3",
            Weight: "253.8",
            ExpYield: "166",
            HP: "144",
            Atk: "120",
            Def: "60",
            SpA: "40",
            SpD: "60",
            Spe: "50",
            LevRate: "Fluctuating",
            HatchTime: "20",
            CatchRate: "200",
            MalePercent: "0.75"
        },
        {
            Dex: "298",
            PokemonName: "Azurill",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "0.2",
            Weight: "2.0",
            ExpYield: "38",
            HP: "50",
            Atk: "20",
            Def: "40",
            SpA: "20",
            SpD: "40",
            Spe: "20",
            LevRate: "Fast",
            HatchTime: "10",
            CatchRate: "150",
            MalePercent: "0.25"
        },
        {
            Dex: "299",
            PokemonName: "Nosepass",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "1.0",
            Weight: "97.0",
            ExpYield: "75",
            HP: "30",
            Atk: "45",
            Def: "135",
            SpA: "45",
            SpD: "90",
            Spe: "30",
            LevRate: "Medium Fast",
            HatchTime: "20",
            CatchRate: "255",
            MalePercent: "0.5"
        },
        {
            Dex: "300",
            PokemonName: "Skitty",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "0.6",
            Weight: "11.0",
            ExpYield: "52",
            HP: "50",
            Atk: "45",
            Def: "45",
            SpA: "35",
            SpD: "35",
            Spe: "50",
            LevRate: "Fast",
            HatchTime: "15",
            CatchRate: "255",
            MalePercent: "0.25"
        },
        {
            Dex: "301",
            PokemonName: "Delcatty",
            EvolvesFrom: "300",
            evoMethod: "Moon Stone",
            Height: "1.1",
            Weight: "32.6",
            ExpYield: "140",
            HP: "70",
            Atk: "65",
            Def: "65",
            SpA: "55",
            SpD: "55",
            Spe: "90",
            LevRate: "Fast",
            HatchTime: "15",
            CatchRate: "60",
            MalePercent: "0.25"
        },
        {
            Dex: "302",
            PokemonName: "Sableye",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "0.5",
            Weight: "11.0",
            ExpYield: "133",
            HP: "50",
            Atk: "75",
            Def: "75",
            SpA: "65",
            SpD: "65",
            Spe: "50",
            LevRate: "Medium Slow",
            HatchTime: "25",
            CatchRate: "45",
            MalePercent: "0.5"
        },
        {
            Dex: "303",
            PokemonName: "Mawile",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "0.6",
            Weight: "11.5",
            ExpYield: "133",
            HP: "50",
            Atk: "85",
            Def: "85",
            SpA: "55",
            SpD: "55",
            Spe: "50",
            LevRate: "Fast",
            HatchTime: "20",
            CatchRate: "45",
            MalePercent: "0.5"
        },
        {
            Dex: "304",
            PokemonName: "Aron",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "0.4",
            Weight: "60.0",
            ExpYield: "66",
            HP: "50",
            Atk: "70",
            Def: "100",
            SpA: "40",
            SpD: "40",
            Spe: "30",
            LevRate: "Slow",
            HatchTime: "35",
            CatchRate: "180",
            MalePercent: "0.5"
        },
        {
            Dex: "305",
            PokemonName: "Lairon",
            EvolvesFrom: "304",
            evoMethod: "Level 32",
            Height: "0.9",
            Weight: "120.0",
            ExpYield: "151",
            HP: "60",
            Atk: "90",
            Def: "140",
            SpA: "50",
            SpD: "50",
            Spe: "40",
            LevRate: "Slow",
            HatchTime: "35",
            CatchRate: "90",
            MalePercent: "0.5"
        },
        {
            Dex: "306",
            PokemonName: "Aggron",
            EvolvesFrom: "305",
            evoMethod: "Level 42",
            Height: "2.1",
            Weight: "360.0",
            ExpYield: "265",
            HP: "70",
            Atk: "110",
            Def: "180",
            SpA: "60",
            SpD: "60",
            Spe: "50",
            LevRate: "Slow",
            HatchTime: "35",
            CatchRate: "45",
            MalePercent: "0.5"
        },
        {
            Dex: "307",
            PokemonName: "Meditite",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "0.6",
            Weight: "11.2",
            ExpYield: "56",
            HP: "30",
            Atk: "40",
            Def: "55",
            SpA: "40",
            SpD: "55",
            Spe: "60",
            LevRate: "Medium Fast",
            HatchTime: "20",
            CatchRate: "180",
            MalePercent: "0.5"
        },
        {
            Dex: "308",
            PokemonName: "Medicham",
            EvolvesFrom: "307",
            evoMethod: "Level 37",
            Height: "1.3",
            Weight: "31.5",
            ExpYield: "144",
            HP: "60",
            Atk: "60",
            Def: "75",
            SpA: "60",
            SpD: "75",
            Spe: "80",
            LevRate: "Medium Fast",
            HatchTime: "20",
            CatchRate: "90",
            MalePercent: "0.5"
        },
        {
            Dex: "309",
            PokemonName: "Electrike",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "0.6",
            Weight: "15.2",
            ExpYield: "59",
            HP: "40",
            Atk: "45",
            Def: "40",
            SpA: "65",
            SpD: "40",
            Spe: "65",
            LevRate: "Slow",
            HatchTime: "20",
            CatchRate: "120",
            MalePercent: "0.5"
        },
        {
            Dex: "310",
            PokemonName: "Manectric",
            EvolvesFrom: "309",
            evoMethod: "Level 26",
            Height: "1.5",
            Weight: "40.2",
            ExpYield: "166",
            HP: "70",
            Atk: "75",
            Def: "60",
            SpA: "105",
            SpD: "60",
            Spe: "105",
            LevRate: "Slow",
            HatchTime: "20",
            CatchRate: "45",
            MalePercent: "0.5"
        },
        {
            Dex: "311",
            PokemonName: "Plusle",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "0.4",
            Weight: "4.2",
            ExpYield: "142",
            HP: "60",
            Atk: "50",
            Def: "40",
            SpA: "85",
            SpD: "75",
            Spe: "95",
            LevRate: "Medium Fast",
            HatchTime: "20",
            CatchRate: "200",
            MalePercent: "0.5"
        },
        {
            Dex: "312",
            PokemonName: "Minun",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "0.4",
            Weight: "4.2",
            ExpYield: "142",
            HP: "60",
            Atk: "40",
            Def: "50",
            SpA: "75",
            SpD: "85",
            Spe: "95",
            LevRate: "Medium Fast",
            HatchTime: "20",
            CatchRate: "200",
            MalePercent: "0.5"
        },
        {
            Dex: "313",
            PokemonName: "Volbeat",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "0.7",
            Weight: "17.7",
            ExpYield: "151",
            HP: "65",
            Atk: "73",
            Def: "75",
            SpA: "47",
            SpD: "85",
            Spe: "85",
            LevRate: "Erratic",
            HatchTime: "15",
            CatchRate: "150",
            MalePercent: "1.0"
        },
        {
            Dex: "314",
            PokemonName: "Illumise",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "0.6",
            Weight: "17.7",
            ExpYield: "151",
            HP: "65",
            Atk: "47",
            Def: "75",
            SpA: "73",
            SpD: "85",
            Spe: "85",
            LevRate: "Fluctuating",
            HatchTime: "15",
            CatchRate: "150",
            MalePercent: "0.0"
        },
        {
            Dex: "315",
            PokemonName: "Roselia",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "0.3",
            Weight: "2.0",
            ExpYield: "140",
            HP: "50",
            Atk: "60",
            Def: "45",
            SpA: "100",
            SpD: "80",
            Spe: "65",
            LevRate: "Medium Slow",
            HatchTime: "20",
            CatchRate: "150",
            MalePercent: "0.5"
        },
        {
            Dex: "316",
            PokemonName: "Gulpin",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "0.4",
            Weight: "10.3",
            ExpYield: "60",
            HP: "70",
            Atk: "43",
            Def: "53",
            SpA: "43",
            SpD: "53",
            Spe: "40",
            LevRate: "Fluctuating",
            HatchTime: "20",
            CatchRate: "225",
            MalePercent: "0.5"
        },
        {
            Dex: "317",
            PokemonName: "Swalot",
            EvolvesFrom: "316",
            evoMethod: "Level 26",
            Height: "1.7",
            Weight: "80.0",
            ExpYield: "163",
            HP: "100",
            Atk: "73",
            Def: "83",
            SpA: "73",
            SpD: "83",
            Spe: "55",
            LevRate: "Fluctuating",
            HatchTime: "20",
            CatchRate: "75",
            MalePercent: "0.5"
        },
        {
            Dex: "318",
            PokemonName: "Carvanha",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "0.8",
            Weight: "20.8",
            ExpYield: "61",
            HP: "45",
            Atk: "90",
            Def: "20",
            SpA: "65",
            SpD: "20",
            Spe: "65",
            LevRate: "Slow",
            HatchTime: "20",
            CatchRate: "225",
            MalePercent: "0.5"
        },
        {
            Dex: "319",
            PokemonName: "Sharpedo",
            EvolvesFrom: "318",
            evoMethod: "Level 30",
            Height: "1.8",
            Weight: "88.8",
            ExpYield: "161",
            HP: "70",
            Atk: "120",
            Def: "40",
            SpA: "95",
            SpD: "40",
            Spe: "95",
            LevRate: "Slow",
            HatchTime: "20",
            CatchRate: "60",
            MalePercent: "0.5"
        },
        {
            Dex: "320",
            PokemonName: "Wailmer",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "2.0",
            Weight: "130.0",
            ExpYield: "80",
            HP: "130",
            Atk: "70",
            Def: "35",
            SpA: "70",
            SpD: "35",
            Spe: "60",
            LevRate: "Fluctuating",
            HatchTime: "40",
            CatchRate: "125",
            MalePercent: "0.5"
        },
        {
            Dex: "321",
            PokemonName: "Wailord",
            EvolvesFrom: "320",
            evoMethod: "Level 40",
            Height: "14.5",
            Weight: "398.0",
            ExpYield: "175",
            HP: "170",
            Atk: "90",
            Def: "45",
            SpA: "90",
            SpD: "45",
            Spe: "60",
            LevRate: "Fluctuating",
            HatchTime: "40",
            CatchRate: "60",
            MalePercent: "0.5"
        },
        {
            Dex: "322",
            PokemonName: "Numel",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "0.7",
            Weight: "24.0",
            ExpYield: "61",
            HP: "60",
            Atk: "60",
            Def: "40",
            SpA: "65",
            SpD: "45",
            Spe: "35",
            LevRate: "Medium Fast",
            HatchTime: "20",
            CatchRate: "255",
            MalePercent: "0.5"
        },
        {
            Dex: "323",
            PokemonName: "Camerupt",
            EvolvesFrom: "322",
            evoMethod: "Level 33",
            Height: "1.9",
            Weight: "220.0",
            ExpYield: "161",
            HP: "70",
            Atk: "100",
            Def: "70",
            SpA: "105",
            SpD: "75",
            Spe: "40",
            LevRate: "Medium Fast",
            HatchTime: "20",
            CatchRate: "150",
            MalePercent: "0.5"
        },
        {
            Dex: "324",
            PokemonName: "Torkoal",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "0.5",
            Weight: "80.4",
            ExpYield: "165",
            HP: "70",
            Atk: "85",
            Def: "140",
            SpA: "85",
            SpD: "70",
            Spe: "20",
            LevRate: "Medium Fast",
            HatchTime: "20",
            CatchRate: "90",
            MalePercent: "0.5"
        },
        {
            Dex: "325",
            PokemonName: "Spoink",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "0.7",
            Weight: "30.6",
            ExpYield: "66",
            HP: "60",
            Atk: "25",
            Def: "35",
            SpA: "70",
            SpD: "80",
            Spe: "60",
            LevRate: "Fast",
            HatchTime: "20",
            CatchRate: "255",
            MalePercent: "0.5"
        },
        {
            Dex: "326",
            PokemonName: "Grumpig",
            EvolvesFrom: "325",
            evoMethod: "Level 32",
            Height: "0.9",
            Weight: "71.5",
            ExpYield: "165",
            HP: "80",
            Atk: "45",
            Def: "65",
            SpA: "90",
            SpD: "110",
            Spe: "80",
            LevRate: "Fast",
            HatchTime: "20",
            CatchRate: "60",
            MalePercent: "0.5"
        },
        {
            Dex: "327",
            PokemonName: "Spinda",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "1.1",
            Weight: "5.0",
            ExpYield: "126",
            HP: "60",
            Atk: "60",
            Def: "60",
            SpA: "60",
            SpD: "60",
            Spe: "60",
            LevRate: "Fast",
            HatchTime: "15",
            CatchRate: "255",
            MalePercent: "0.5"
        },
        {
            Dex: "328",
            PokemonName: "Trapinch",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "0.7",
            Weight: "15.0",
            ExpYield: "58",
            HP: "45",
            Atk: "100",
            Def: "45",
            SpA: "45",
            SpD: "45",
            Spe: "10",
            LevRate: "Medium Slow",
            HatchTime: "20",
            CatchRate: "255",
            MalePercent: "0.5"
        },
        {
            Dex: "329",
            PokemonName: "Vibrava",
            EvolvesFrom: "328",
            evoMethod: "Level 35",
            Height: "1.1",
            Weight: "15.3",
            ExpYield: "119",
            HP: "50",
            Atk: "70",
            Def: "50",
            SpA: "50",
            SpD: "50",
            Spe: "70",
            LevRate: "Medium Slow",
            HatchTime: "20",
            CatchRate: "120",
            MalePercent: "0.5"
        },
        {
            Dex: "330",
            PokemonName: "Flygon",
            EvolvesFrom: "329",
            evoMethod: "Level 45",
            Height: "2.0",
            Weight: "82.0",
            ExpYield: "260",
            HP: "80",
            Atk: "100",
            Def: "80",
            SpA: "80",
            SpD: "80",
            Spe: "100",
            LevRate: "Medium Slow",
            HatchTime: "20",
            CatchRate: "45",
            MalePercent: "0.5"
        },
        {
            Dex: "331",
            PokemonName: "Cacnea",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "0.4",
            Weight: "51.3",
            ExpYield: "67",
            HP: "50",
            Atk: "85",
            Def: "40",
            SpA: "85",
            SpD: "40",
            Spe: "35",
            LevRate: "Medium Slow",
            HatchTime: "20",
            CatchRate: "190",
            MalePercent: "0.5"
        },
        {
            Dex: "332",
            PokemonName: "Cacturne",
            EvolvesFrom: "331",
            evoMethod: "Level 32",
            Height: "1.3",
            Weight: "77.4",
            ExpYield: "166",
            HP: "70",
            Atk: "115",
            Def: "60",
            SpA: "115",
            SpD: "60",
            Spe: "55",
            LevRate: "Medium Slow",
            HatchTime: "20",
            CatchRate: "60",
            MalePercent: "0.5"
        },
        {
            Dex: "333",
            PokemonName: "Swablu",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "0.4",
            Weight: "1.2",
            ExpYield: "62",
            HP: "45",
            Atk: "40",
            Def: "60",
            SpA: "40",
            SpD: "75",
            Spe: "50",
            LevRate: "Erratic",
            HatchTime: "20",
            CatchRate: "255",
            MalePercent: "0.5"
        },
        {
            Dex: "334",
            PokemonName: "Altaria",
            EvolvesFrom: "333",
            evoMethod: "Level 35",
            Height: "1.1",
            Weight: "20.6",
            ExpYield: "172",
            HP: "75",
            Atk: "70",
            Def: "90",
            SpA: "70",
            SpD: "105",
            Spe: "80",
            LevRate: "Erratic",
            HatchTime: "20",
            CatchRate: "45",
            MalePercent: "0.5"
        },
        {
            Dex: "335",
            PokemonName: "Zangoose",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "1.3",
            Weight: "40.3",
            ExpYield: "160",
            HP: "73",
            Atk: "115",
            Def: "60",
            SpA: "60",
            SpD: "60",
            Spe: "90",
            LevRate: "Erratic",
            HatchTime: "20",
            CatchRate: "90",
            MalePercent: "0.5"
        },
        {
            Dex: "336",
            PokemonName: "Seviper",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "2.7",
            Weight: "52.5",
            ExpYield: "160",
            HP: "73",
            Atk: "100",
            Def: "60",
            SpA: "100",
            SpD: "60",
            Spe: "65",
            LevRate: "Fluctuating",
            HatchTime: "20",
            CatchRate: "90",
            MalePercent: "0.5"
        },
        {
            Dex: "337",
            PokemonName: "Lunatone",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "1.0",
            Weight: "168.0",
            ExpYield: "161",
            HP: "90",
            Atk: "55",
            Def: "65",
            SpA: "95",
            SpD: "85",
            Spe: "70",
            LevRate: "Fast",
            HatchTime: "25",
            CatchRate: "45",
            MalePercent: ""
        },
        {
            Dex: "338",
            PokemonName: "Solrock",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "1.2",
            Weight: "154.0",
            ExpYield: "161",
            HP: "90",
            Atk: "95",
            Def: "85",
            SpA: "55",
            SpD: "65",
            Spe: "70",
            LevRate: "Fast",
            HatchTime: "25",
            CatchRate: "45",
            MalePercent: ""
        },
        {
            Dex: "339",
            PokemonName: "Barboach",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "0.4",
            Weight: "1.9",
            ExpYield: "58",
            HP: "50",
            Atk: "48",
            Def: "43",
            SpA: "46",
            SpD: "41",
            Spe: "60",
            LevRate: "Medium Fast",
            HatchTime: "20",
            CatchRate: "190",
            MalePercent: "0.5"
        },
        {
            Dex: "340",
            PokemonName: "Whiscash",
            EvolvesFrom: "339",
            evoMethod: "Level 30",
            Height: "0.9",
            Weight: "23.6",
            ExpYield: "164",
            HP: "110",
            Atk: "78",
            Def: "73",
            SpA: "76",
            SpD: "71",
            Spe: "60",
            LevRate: "Medium Fast",
            HatchTime: "20",
            CatchRate: "75",
            MalePercent: "0.5"
        },
        {
            Dex: "341",
            PokemonName: "Corphish",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "0.6",
            Weight: "11.5",
            ExpYield: "62",
            HP: "43",
            Atk: "80",
            Def: "65",
            SpA: "50",
            SpD: "35",
            Spe: "35",
            LevRate: "Fluctuating",
            HatchTime: "15",
            CatchRate: "205",
            MalePercent: "0.5"
        },
        {
            Dex: "342",
            PokemonName: "Crawdaunt",
            EvolvesFrom: "341",
            evoMethod: "Level 30",
            Height: "1.1",
            Weight: "32.8",
            ExpYield: "164",
            HP: "63",
            Atk: "120",
            Def: "85",
            SpA: "90",
            SpD: "55",
            Spe: "55",
            LevRate: "Fluctuating",
            HatchTime: "15",
            CatchRate: "155",
            MalePercent: "0.5"
        },
        {
            Dex: "343",
            PokemonName: "Baltoy",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "0.5",
            Weight: "21.5",
            ExpYield: "60",
            HP: "40",
            Atk: "40",
            Def: "55",
            SpA: "40",
            SpD: "70",
            Spe: "55",
            LevRate: "Medium Fast",
            HatchTime: "20",
            CatchRate: "255",
            MalePercent: ""
        },
        {
            Dex: "344",
            PokemonName: "Claydol",
            EvolvesFrom: "343",
            evoMethod: "Level 36",
            Height: "1.5",
            Weight: "108.0",
            ExpYield: "175",
            HP: "60",
            Atk: "70",
            Def: "105",
            SpA: "70",
            SpD: "120",
            Spe: "75",
            LevRate: "Medium Fast",
            HatchTime: "20",
            CatchRate: "90",
            MalePercent: ""
        },
        {
            Dex: "345",
            PokemonName: "Lileep",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "1.0",
            Weight: "23.8",
            ExpYield: "71",
            HP: "66",
            Atk: "41",
            Def: "77",
            SpA: "61",
            SpD: "87",
            Spe: "23",
            LevRate: "Erratic",
            HatchTime: "30",
            CatchRate: "45",
            MalePercent: "0.875"
        },
        {
            Dex: "346",
            PokemonName: "Cradily",
            EvolvesFrom: "345",
            evoMethod: "Level 40",
            Height: "1.5",
            Weight: "60.4",
            ExpYield: "173",
            HP: "86",
            Atk: "81",
            Def: "97",
            SpA: "81",
            SpD: "107",
            Spe: "43",
            LevRate: "Erratic",
            HatchTime: "30",
            CatchRate: "45",
            MalePercent: "0.875"
        },
        {
            Dex: "347",
            PokemonName: "Anorith",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "0.7",
            Weight: "12.5",
            ExpYield: "71",
            HP: "45",
            Atk: "95",
            Def: "50",
            SpA: "40",
            SpD: "50",
            Spe: "75",
            LevRate: "Erratic",
            HatchTime: "30",
            CatchRate: "45",
            MalePercent: "0.875"
        },
        {
            Dex: "348",
            PokemonName: "Armaldo",
            EvolvesFrom: "347",
            evoMethod: "Level 40",
            Height: "1.5",
            Weight: "68.2",
            ExpYield: "173",
            HP: "75",
            Atk: "125",
            Def: "100",
            SpA: "70",
            SpD: "80",
            Spe: "45",
            LevRate: "Erratic",
            HatchTime: "30",
            CatchRate: "45",
            MalePercent: "0.875"
        },
        {
            Dex: "349",
            PokemonName: "Feebas",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "0.6",
            Weight: "7.4",
            ExpYield: "40",
            HP: "20",
            Atk: "15",
            Def: "20",
            SpA: "10",
            SpD: "55",
            Spe: "80",
            LevRate: "Erratic",
            HatchTime: "20",
            CatchRate: "255",
            MalePercent: "0.5"
        },
        {
            Dex: "350",
            PokemonName: "Milotic",
            EvolvesFrom: "349",
            evoMethod: "Level up with maximum Beauty",
            Height: "6.2",
            Weight: "162.0",
            ExpYield: "189",
            HP: "95",
            Atk: "60",
            Def: "79",
            SpA: "100",
            SpD: "125",
            Spe: "81",
            LevRate: "Erratic",
            HatchTime: "20",
            CatchRate: "60",
            MalePercent: "0.5"
        },
        {
            Dex: "351",
            PokemonName: "Castform",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "0.3",
            Weight: "0.8",
            ExpYield: "147",
            HP: "70",
            Atk: "70",
            Def: "70",
            SpA: "70",
            SpD: "70",
            Spe: "70",
            LevRate: "Medium Fast",
            HatchTime: "25",
            CatchRate: "45",
            MalePercent: "0.5"
        },
        {
            Dex: "352",
            PokemonName: "Kecleon",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "1.0",
            Weight: "22.0",
            ExpYield: "154",
            HP: "60",
            Atk: "90",
            Def: "70",
            SpA: "60",
            SpD: "120",
            Spe: "40",
            LevRate: "Medium Slow",
            HatchTime: "20",
            CatchRate: "200",
            MalePercent: "0.5"
        },
        {
            Dex: "353",
            PokemonName: "Shuppet",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "0.6",
            Weight: "2.3",
            ExpYield: "59",
            HP: "44",
            Atk: "75",
            Def: "35",
            SpA: "63",
            SpD: "33",
            Spe: "45",
            LevRate: "Fast",
            HatchTime: "25",
            CatchRate: "225",
            MalePercent: "0.5"
        },
        {
            Dex: "354",
            PokemonName: "Banette",
            EvolvesFrom: "353",
            evoMethod: "Level 37",
            Height: "1.1",
            Weight: "12.5",
            ExpYield: "159",
            HP: "64",
            Atk: "115",
            Def: "65",
            SpA: "83",
            SpD: "63",
            Spe: "65",
            LevRate: "Fast",
            HatchTime: "25",
            CatchRate: "45",
            MalePercent: "0.5"
        },
        {
            Dex: "355",
            PokemonName: "Duskull",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "0.8",
            Weight: "15.0",
            ExpYield: "59",
            HP: "20",
            Atk: "40",
            Def: "90",
            SpA: "30",
            SpD: "90",
            Spe: "25",
            LevRate: "Fast",
            HatchTime: "25",
            CatchRate: "190",
            MalePercent: "0.5"
        },
        {
            Dex: "356",
            PokemonName: "Dusclops",
            EvolvesFrom: "355",
            evoMethod: "Level 37",
            Height: "1.6",
            Weight: "30.6",
            ExpYield: "159",
            HP: "40",
            Atk: "70",
            Def: "130",
            SpA: "60",
            SpD: "130",
            Spe: "25",
            LevRate: "Fast",
            HatchTime: "25",
            CatchRate: "90",
            MalePercent: "0.5"
        },
        {
            Dex: "357",
            PokemonName: "Tropius",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "2.0",
            Weight: "100.0",
            ExpYield: "161",
            HP: "99",
            Atk: "68",
            Def: "83",
            SpA: "72",
            SpD: "87",
            Spe: "51",
            LevRate: "Slow",
            HatchTime: "25",
            CatchRate: "200",
            MalePercent: "0.5"
        },
        {
            Dex: "358",
            PokemonName: "Chimecho",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "0.6",
            Weight: "1.0",
            ExpYield: "159",
            HP: "75",
            Atk: "50",
            Def: "80",
            SpA: "95",
            SpD: "90",
            Spe: "65",
            LevRate: "Fast",
            HatchTime: "25",
            CatchRate: "45",
            MalePercent: "0.5"
        },
        {
            Dex: "359",
            PokemonName: "Absol",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "1.2",
            Weight: "47.0",
            ExpYield: "163",
            HP: "65",
            Atk: "130",
            Def: "60",
            SpA: "75",
            SpD: "60",
            Spe: "75",
            LevRate: "Medium Slow",
            HatchTime: "25",
            CatchRate: "30",
            MalePercent: "0.5"
        },
        {
            Dex: "360",
            PokemonName: "Wynaut",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "0.6",
            Weight: "14.0",
            ExpYield: "52",
            HP: "95",
            Atk: "23",
            Def: "48",
            SpA: "23",
            SpD: "48",
            Spe: "23",
            LevRate: "Medium Fast",
            HatchTime: "20",
            CatchRate: "125",
            MalePercent: "0.5"
        },
        {
            Dex: "361",
            PokemonName: "Snorunt",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "0.7",
            Weight: "16.8",
            ExpYield: "60",
            HP: "50",
            Atk: "50",
            Def: "50",
            SpA: "50",
            SpD: "50",
            Spe: "50",
            LevRate: "Medium Fast",
            HatchTime: "20",
            CatchRate: "190",
            MalePercent: "0.5"
        },
        {
            Dex: "362",
            PokemonName: "Glalie",
            EvolvesFrom: "361",
            evoMethod: "Level 42",
            Height: "1.5",
            Weight: "256.5",
            ExpYield: "168",
            HP: "80",
            Atk: "80",
            Def: "80",
            SpA: "80",
            SpD: "80",
            Spe: "80",
            LevRate: "Medium Fast",
            HatchTime: "20",
            CatchRate: "75",
            MalePercent: "0.5"
        },
        {
            Dex: "363",
            PokemonName: "Spheal",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "0.8",
            Weight: "39.5",
            ExpYield: "58",
            HP: "70",
            Atk: "40",
            Def: "50",
            SpA: "55",
            SpD: "50",
            Spe: "25",
            LevRate: "Medium Slow",
            HatchTime: "20",
            CatchRate: "255",
            MalePercent: "0.5"
        },
        {
            Dex: "364",
            PokemonName: "Sealeo",
            EvolvesFrom: "363",
            evoMethod: "Level 32",
            Height: "1.1",
            Weight: "87.6",
            ExpYield: "144",
            HP: "90",
            Atk: "60",
            Def: "70",
            SpA: "75",
            SpD: "70",
            Spe: "45",
            LevRate: "Medium Slow",
            HatchTime: "20",
            CatchRate: "120",
            MalePercent: "0.5"
        },
        {
            Dex: "365",
            PokemonName: "Walrein",
            EvolvesFrom: "364",
            evoMethod: "Level 44",
            Height: "1.4",
            Weight: "150.6",
            ExpYield: "265",
            HP: "110",
            Atk: "80",
            Def: "90",
            SpA: "95",
            SpD: "90",
            Spe: "65",
            LevRate: "Medium Slow",
            HatchTime: "20",
            CatchRate: "45",
            MalePercent: "0.5"
        },
        {
            Dex: "366",
            PokemonName: "Clamperl",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "0.4",
            Weight: "52.5",
            ExpYield: "69",
            HP: "35",
            Atk: "64",
            Def: "85",
            SpA: "74",
            SpD: "55",
            Spe: "32",
            LevRate: "Erratic",
            HatchTime: "20",
            CatchRate: "255",
            MalePercent: "0.5"
        },
        {
            Dex: "367",
            PokemonName: "Huntail",
            EvolvesFrom: "366",
            evoMethod: "Trade holding Deep Sea Tooth",
            Height: "1.7",
            Weight: "27.0",
            ExpYield: "170",
            HP: "55",
            Atk: "104",
            Def: "105",
            SpA: "94",
            SpD: "75",
            Spe: "52",
            LevRate: "Erratic",
            HatchTime: "20",
            CatchRate: "60",
            MalePercent: "0.5"
        },
        {
            Dex: "368",
            PokemonName: "Gorebyss",
            EvolvesFrom: "366",
            evoMethod: "Trade holding Deep Sea Scale",
            Height: "1.8",
            Weight: "22.6",
            ExpYield: "170",
            HP: "55",
            Atk: "84",
            Def: "105",
            SpA: "114",
            SpD: "75",
            Spe: "52",
            LevRate: "Erratic",
            HatchTime: "20",
            CatchRate: "60",
            MalePercent: "0.5"
        },
        {
            Dex: "369",
            PokemonName: "Relicanth",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "1.0",
            Weight: "23.4",
            ExpYield: "170",
            HP: "100",
            Atk: "90",
            Def: "130",
            SpA: "45",
            SpD: "65",
            Spe: "55",
            LevRate: "Slow",
            HatchTime: "40",
            CatchRate: "25",
            MalePercent: "0.875"
        },
        {
            Dex: "370",
            PokemonName: "Luvdisc",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "0.6",
            Weight: "8.7",
            ExpYield: "116",
            HP: "43",
            Atk: "30",
            Def: "55",
            SpA: "40",
            SpD: "65",
            Spe: "97",
            LevRate: "Fast",
            HatchTime: "20",
            CatchRate: "225",
            MalePercent: "0.25"
        },
        {
            Dex: "371",
            PokemonName: "Bagon",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "0.6",
            Weight: "42.1",
            ExpYield: "60",
            HP: "45",
            Atk: "75",
            Def: "60",
            SpA: "40",
            SpD: "30",
            Spe: "50",
            LevRate: "Slow",
            HatchTime: "40",
            CatchRate: "45",
            MalePercent: "0.5"
        },
        {
            Dex: "372",
            PokemonName: "Shelgon",
            EvolvesFrom: "371",
            evoMethod: "Level 30",
            Height: "1.1",
            Weight: "110.5",
            ExpYield: "147",
            HP: "65",
            Atk: "95",
            Def: "100",
            SpA: "60",
            SpD: "50",
            Spe: "50",
            LevRate: "Slow",
            HatchTime: "40",
            CatchRate: "45",
            MalePercent: "0.5"
        },
        {
            Dex: "373",
            PokemonName: "Salamence",
            EvolvesFrom: "372",
            evoMethod: "Level 50",
            Height: "1.5",
            Weight: "102.6",
            ExpYield: "300",
            HP: "95",
            Atk: "135",
            Def: "80",
            SpA: "110",
            SpD: "80",
            Spe: "100",
            LevRate: "Slow",
            HatchTime: "40",
            CatchRate: "45",
            MalePercent: "0.5"
        },
        {
            Dex: "374",
            PokemonName: "Beldum",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "0.6",
            Weight: "95.2",
            ExpYield: "60",
            HP: "40",
            Atk: "55",
            Def: "80",
            SpA: "35",
            SpD: "60",
            Spe: "30",
            LevRate: "Slow",
            HatchTime: "40",
            CatchRate: "3",
            MalePercent: ""
        },
        {
            Dex: "375",
            PokemonName: "Metang",
            EvolvesFrom: "374",
            evoMethod: "Level 20",
            Height: "1.2",
            Weight: "202.5",
            ExpYield: "147",
            HP: "60",
            Atk: "75",
            Def: "100",
            SpA: "55",
            SpD: "80",
            Spe: "50",
            LevRate: "Slow",
            HatchTime: "40",
            CatchRate: "3",
            MalePercent: ""
        },
        {
            Dex: "376",
            PokemonName: "Metagross",
            EvolvesFrom: "375",
            evoMethod: "Level 45",
            Height: "1.6",
            Weight: "550.0",
            ExpYield: "300",
            HP: "80",
            Atk: "135",
            Def: "130",
            SpA: "95",
            SpD: "90",
            Spe: "70",
            LevRate: "Slow",
            HatchTime: "40",
            CatchRate: "3",
            MalePercent: ""
        },
        {
            Dex: "377",
            PokemonName: "Regirock",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "1.7",
            Weight: "230.0",
            ExpYield: "290",
            HP: "80",
            Atk: "100",
            Def: "200",
            SpA: "50",
            SpD: "100",
            Spe: "50",
            LevRate: "Slow",
            HatchTime: "80",
            CatchRate: "3",
            MalePercent: ""
        },
        {
            Dex: "378",
            PokemonName: "Regice",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "1.8",
            Weight: "175.0",
            ExpYield: "290",
            HP: "80",
            Atk: "50",
            Def: "100",
            SpA: "100",
            SpD: "200",
            Spe: "50",
            LevRate: "Slow",
            HatchTime: "80",
            CatchRate: "3",
            MalePercent: ""
        },
        {
            Dex: "379",
            PokemonName: "Registeel",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "1.9",
            Weight: "205.0",
            ExpYield: "290",
            HP: "80",
            Atk: "75",
            Def: "150",
            SpA: "75",
            SpD: "150",
            Spe: "50",
            LevRate: "Slow",
            HatchTime: "80",
            CatchRate: "3",
            MalePercent: ""
        },
        {
            Dex: "380",
            PokemonName: "Latias",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "1.4",
            Weight: "40.0",
            ExpYield: "300",
            HP: "80",
            Atk: "80",
            Def: "90",
            SpA: "110",
            SpD: "130",
            Spe: "110",
            LevRate: "Slow",
            HatchTime: "120",
            CatchRate: "3",
            MalePercent: "0.0"
        },
        {
            Dex: "381",
            PokemonName: "Latios",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "2.0",
            Weight: "60.0",
            ExpYield: "211",
            HP: "80",
            Atk: "90",
            Def: "80",
            SpA: "130",
            SpD: "110",
            Spe: "100",
            LevRate: "Slow",
            HatchTime: "120",
            CatchRate: "3",
            MalePercent: "1.0"
        },
        {
            Dex: "382",
            PokemonName: "Kyogre",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "4.5",
            Weight: "352.0",
            ExpYield: "335",
            HP: "100",
            Atk: "100",
            Def: "90",
            SpA: "150",
            SpD: "140",
            Spe: "90",
            LevRate: "Slow",
            HatchTime: "120",
            CatchRate: "5",
            MalePercent: ""
        },
        {
            Dex: "383",
            PokemonName: "Groudon",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "3.5",
            Weight: "950.0",
            ExpYield: "335",
            HP: "100",
            Atk: "150",
            Def: "140",
            SpA: "100",
            SpD: "90",
            Spe: "90",
            LevRate: "Slow",
            HatchTime: "120",
            CatchRate: "5",
            MalePercent: ""
        },
        {
            Dex: "384",
            PokemonName: "Rayquaza",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "7.0",
            Weight: "206.5",
            ExpYield: "340",
            HP: "105",
            Atk: "150",
            Def: "90",
            SpA: "150",
            SpD: "90",
            Spe: "95",
            LevRate: "Slow",
            HatchTime: "120",
            CatchRate: "3",
            MalePercent: ""
        },
        {
            Dex: "385",
            PokemonName: "Jirachi",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "0.3",
            Weight: "1.1",
            ExpYield: "300",
            HP: "100",
            Atk: "100",
            Def: "100",
            SpA: "100",
            SpD: "100",
            Spe: "100",
            LevRate: "Slow",
            HatchTime: "120",
            CatchRate: "3",
            MalePercent: ""
        },
        {
            Dex: "386",
            PokemonName: "Deoxys",
            EvolvesFrom: "",
            evoMethod: "",
            Height: "1.7",
            Weight: "60.8",
            ExpYield: "300",
            HP: "50",
            Atk: "150",
            Def: "50",
            SpA: "150",
            SpD: "50",
            Spe: "150",
            LevRate: "Slow",
            HatchTime: "120",
            CatchRate: "3",
            MalePercent: ""
        }
        ],

        selectEggGroups:{},
        egggroups: [
        {
            "GroupName": "Grass"
        },
        {
            "GroupName": "Monster"
        },
        {
            "GroupName": "Bug"
        },
        {
            "GroupName": "Mineral"
        },
        {
            "GroupName": "Human-Like"
        },
        {
            "GroupName": "Amorphous"
        },
        {
            "GroupName": "Field"
        },
        {
            "GroupName": "Fairy"
        },
        {
            "GroupName": "Dragon"
        },
        {
            "GroupName": "Water 1"
        },
        {
            "GroupName": "Water 2"
        },
        {
            "GroupName": "Water 3"
        },
        {
            "GroupName": "Ditto"
        },
        {
            "GroupName": "Flying"
        },
        {
            "GroupName": "Undiscovered"
        }
        ],

        selectMove:{},
        moves: [
        {
            "MoveName": "Absorb",
            "Accuracy": "100",
            "Power": "20",
            "PP": "20",
            "Status": "0",
            "TypeName": "Grass"
        },
        {
            "MoveName": "Acid Armor",
            "Accuracy": "",
            "Power": "0",
            "PP": "40",
            "Status": "1",
            "TypeName": "Poison"
        },
        {
            "MoveName": "Acid",
            "Accuracy": "100",
            "Power": "40",
            "PP": "30",
            "Status": "0",
            "TypeName": "Poison"
        },
        {
            "MoveName": "Aerial Ace",
            "Accuracy": "",
            "Power": "60",
            "PP": "20",
            "Status": "0",
            "TypeName": "Flying"
        },
        {
            "MoveName": "Aeroblast",
            "Accuracy": "95",
            "Power": "100",
            "PP": "5",
            "Status": "0",
            "TypeName": "Flying"
        },
        {
            "MoveName": "Agility",
            "Accuracy": "",
            "Power": "0",
            "PP": "30",
            "Status": "1",
            "TypeName": "Psychic"
        },
        {
            "MoveName": "Air Cutter",
            "Accuracy": "95",
            "Power": "55",
            "PP": "25",
            "Status": "0",
            "TypeName": "Flying"
        },
        {
            "MoveName": "Amnesia",
            "Accuracy": "",
            "Power": "0",
            "PP": "20",
            "Status": "1",
            "TypeName": "Psychic"
        },
        {
            "MoveName": "Ancient Power",
            "Accuracy": "100",
            "Power": "60",
            "PP": "5",
            "Status": "0",
            "TypeName": "Rock"
        },
        {
            "MoveName": "Arm Thrust",
            "Accuracy": "100",
            "Power": "15",
            "PP": "20",
            "Status": "0",
            "TypeName": "Fighting"
        },
        {
            "MoveName": "Aromatherapy",
            "Accuracy": "",
            "Power": "0",
            "PP": "5",
            "Status": "1",
            "TypeName": "Grass"
        },
        {
            "MoveName": "Assist",
            "Accuracy": "",
            "Power": "0",
            "PP": "20",
            "Status": "1",
            "TypeName": "Normal"
        },
        {
            "MoveName": "Astonish",
            "Accuracy": "100",
            "Power": "30",
            "PP": "15",
            "Status": "0",
            "TypeName": "Ghost"
        },
        {
            "MoveName": "Attract",
            "Accuracy": "100",
            "Power": "0",
            "PP": "15",
            "Status": "1",
            "TypeName": "Normal"
        },
        {
            "MoveName": "Aurora Beam",
            "Accuracy": "100",
            "Power": "65",
            "PP": "20",
            "Status": "0",
            "TypeName": "Ice"
        },
        {
            "MoveName": "Barrage",
            "Accuracy": "85",
            "Power": "15",
            "PP": "20",
            "Status": "0",
            "TypeName": "Normal"
        },
        {
            "MoveName": "Barrier",
            "Accuracy": "",
            "Power": "0",
            "PP": "30",
            "Status": "1",
            "TypeName": "Psychic"
        },
        {
            "MoveName": "Baton Pass",
            "Accuracy": "",
            "Power": "0",
            "PP": "40",
            "Status": "1",
            "TypeName": "Normal"
        },
        {
            "MoveName": "Beat Up",
            "Accuracy": "100",
            "Power": "10",
            "PP": "10",
            "Status": "0",
            "TypeName": "Dark"
        },
        {
            "MoveName": "Belly Drum",
            "Accuracy": "",
            "Power": "0",
            "PP": "10",
            "Status": "1",
            "TypeName": "Normal"
        },
        {
            "MoveName": "Bide",
            "Accuracy": "100",
            "Power": "0",
            "PP": "10",
            "Status": "0",
            "TypeName": "Normal"
        },
        {
            "MoveName": "Bind",
            "Accuracy": "75",
            "Power": "15",
            "PP": "20",
            "Status": "0",
            "TypeName": "Normal"
        },
        {
            "MoveName": "Bite",
            "Accuracy": "100",
            "Power": "60",
            "PP": "25",
            "Status": "0",
            "TypeName": "Dark"
        },
        {
            "MoveName": "Blast Burn",
            "Accuracy": "90",
            "Power": "150",
            "PP": "5",
            "Status": "0",
            "TypeName": "Fire"
        },
        {
            "MoveName": "Blaze Kick",
            "Accuracy": "90",
            "Power": "85",
            "PP": "10",
            "Status": "0",
            "TypeName": "Fire"
        },
        {
            "MoveName": "Blizzard",
            "Accuracy": "70",
            "Power": "120",
            "PP": "5",
            "Status": "0",
            "TypeName": "Ice"
        },
        {
            "MoveName": "Block",
            "Accuracy": "",
            "Power": "0",
            "PP": "5",
            "Status": "1",
            "TypeName": "Normal"
        },
        {
            "MoveName": "Body Slam",
            "Accuracy": "100",
            "Power": "85",
            "PP": "15",
            "Status": "0",
            "TypeName": "Normal"
        },
        {
            "MoveName": "Bone Club",
            "Accuracy": "85",
            "Power": "65",
            "PP": "20",
            "Status": "0",
            "TypeName": "Ground"
        },
        {
            "MoveName": "Bone Rush",
            "Accuracy": "80",
            "Power": "25",
            "PP": "10",
            "Status": "0",
            "TypeName": "Ground"
        },
        {
            "MoveName": "Bonemerang",
            "Accuracy": "90",
            "Power": "50",
            "PP": "10",
            "Status": "0",
            "TypeName": "Ground"
        },
        {
            "MoveName": "Bounce",
            "Accuracy": "85",
            "Power": "85",
            "PP": "5",
            "Status": "0",
            "TypeName": "Flying"
        },
        {
            "MoveName": "Brick Break",
            "Accuracy": "100",
            "Power": "75",
            "PP": "15",
            "Status": "0",
            "TypeName": "Fighting"
        },
        {
            "MoveName": "Bubble Beam",
            "Accuracy": "100",
            "Power": "65",
            "PP": "20",
            "Status": "0",
            "TypeName": "Water"
        },
        {
            "MoveName": "Bubble",
            "Accuracy": "100",
            "Power": "20",
            "PP": "30",
            "Status": "0",
            "TypeName": "Water"
        },
        {
            "MoveName": "Bulk Up",
            "Accuracy": "",
            "Power": "0",
            "PP": "20",
            "Status": "1",
            "TypeName": "Fighting"
        },
        {
            "MoveName": "Bullet Seed",
            "Accuracy": "100",
            "Power": "10",
            "PP": "30",
            "Status": "0",
            "TypeName": "Grass"
        },
        {
            "MoveName": "Calm Mind",
            "Accuracy": "",
            "Power": "0",
            "PP": "20",
            "Status": "1",
            "TypeName": "Psychic"
        },
        {
            "MoveName": "Camouflage",
            "Accuracy": "",
            "Power": "0",
            "PP": "20",
            "Status": "1",
            "TypeName": "Normal"
        },
        {
            "MoveName": "Charge",
            "Accuracy": "",
            "Power": "0",
            "PP": "20",
            "Status": "1",
            "TypeName": "Electric"
        },
        {
            "MoveName": "Charm",
            "Accuracy": "100",
            "Power": "0",
            "PP": "20",
            "Status": "1",
            "TypeName": "Normal"
        },
        {
            "MoveName": "Clamp",
            "Accuracy": "75",
            "Power": "35",
            "PP": "10",
            "Status": "0",
            "TypeName": "Water"
        },
        {
            "MoveName": "Comet Punch",
            "Accuracy": "85",
            "Power": "18",
            "PP": "15",
            "Status": "0",
            "TypeName": "Normal"
        },
        {
            "MoveName": "Confuse Ray",
            "Accuracy": "100",
            "Power": "0",
            "PP": "10",
            "Status": "1",
            "TypeName": "Ghost"
        },
        {
            "MoveName": "Confusion",
            "Accuracy": "100",
            "Power": "50",
            "PP": "25",
            "Status": "0",
            "TypeName": "Psychic"
        },
        {
            "MoveName": "Constrict",
            "Accuracy": "100",
            "Power": "10",
            "PP": "35",
            "Status": "0",
            "TypeName": "Normal"
        },
        {
            "MoveName": "Conversion 2",
            "Accuracy": "",
            "Power": "0",
            "PP": "30",
            "Status": "1",
            "TypeName": "Normal"
        },
        {
            "MoveName": "Conversion",
            "Accuracy": "",
            "Power": "0",
            "PP": "30",
            "Status": "1",
            "TypeName": "Normal"
        },
        {
            "MoveName": "Cosmic Power",
            "Accuracy": "",
            "Power": "0",
            "PP": "20",
            "Status": "1",
            "TypeName": "Psychic"
        },
        {
            "MoveName": "Cotton Spore",
            "Accuracy": "85",
            "Power": "0",
            "PP": "40",
            "Status": "1",
            "TypeName": "Grass"
        },
        {
            "MoveName": "Counter",
            "Accuracy": "100",
            "Power": "0",
            "PP": "20",
            "Status": "0",
            "TypeName": "Fighting"
        },
        {
            "MoveName": "Covet",
            "Accuracy": "100",
            "Power": "40",
            "PP": "40",
            "Status": "0",
            "TypeName": "Normal"
        },
        {
            "MoveName": "Crabhammer",
            "Accuracy": "85",
            "Power": "90",
            "PP": "10",
            "Status": "0",
            "TypeName": "Water"
        },
        {
            "MoveName": "Cross Chop",
            "Accuracy": "80",
            "Power": "100",
            "PP": "5",
            "Status": "0",
            "TypeName": "Fighting"
        },
        {
            "MoveName": "Crunch",
            "Accuracy": "100",
            "Power": "80",
            "PP": "15",
            "Status": "0",
            "TypeName": "Dark"
        },
        {
            "MoveName": "Crush Claw",
            "Accuracy": "95",
            "Power": "75",
            "PP": "10",
            "Status": "0",
            "TypeName": "Normal"
        },
        {
            "MoveName": "Curse",
            "Accuracy": "",
            "Power": "0",
            "PP": "10",
            "Status": "1",
            "TypeName": "???"
        },
        {
            "MoveName": "Cut",
            "Accuracy": "95",
            "Power": "50",
            "PP": "30",
            "Status": "0",
            "TypeName": "Normal"
        },
        {
            "MoveName": "Defense Curl",
            "Accuracy": "",
            "Power": "0",
            "PP": "40",
            "Status": "1",
            "TypeName": "Normal"
        },
        {
            "MoveName": "Destiny Bond",
            "Accuracy": "",
            "Power": "0",
            "PP": "5",
            "Status": "1",
            "TypeName": "Ghost"
        },
        {
            "MoveName": "Detect",
            "Accuracy": "",
            "Power": "0",
            "PP": "5",
            "Status": "1",
            "TypeName": "Fighting"
        },
        {
            "MoveName": "Dig",
            "Accuracy": "100",
            "Power": "60",
            "PP": "10",
            "Status": "0",
            "TypeName": "Ground"
        },
        {
            "MoveName": "Disable",
            "Accuracy": "55",
            "Power": "0",
            "PP": "20",
            "Status": "1",
            "TypeName": "Normal"
        },
        {
            "MoveName": "Dive",
            "Accuracy": "100",
            "Power": "60",
            "PP": "10",
            "Status": "0",
            "TypeName": "Water"
        },
        {
            "MoveName": "Dizzy Punch",
            "Accuracy": "100",
            "Power": "70",
            "PP": "10",
            "Status": "0",
            "TypeName": "Normal"
        },
        {
            "MoveName": "Doom Desire",
            "Accuracy": "85",
            "Power": "120",
            "PP": "5",
            "Status": "0",
            "TypeName": "Steel"
        },
        {
            "MoveName": "Double Kick",
            "Accuracy": "100",
            "Power": "30",
            "PP": "30",
            "Status": "0",
            "TypeName": "Fighting"
        },
        {
            "MoveName": "Double Slap",
            "Accuracy": "85",
            "Power": "15",
            "PP": "10",
            "Status": "0",
            "TypeName": "Normal"
        },
        {
            "MoveName": "Double Team",
            "Accuracy": "",
            "Power": "0",
            "PP": "15",
            "Status": "1",
            "TypeName": "Normal"
        },
        {
            "MoveName": "Double-Edge",
            "Accuracy": "100",
            "Power": "120",
            "PP": "15",
            "Status": "0",
            "TypeName": "Normal"
        },
        {
            "MoveName": "Dragon Breath",
            "Accuracy": "100",
            "Power": "60",
            "PP": "20",
            "Status": "0",
            "TypeName": "Dragon"
        },
        {
            "MoveName": "Dragon Claw",
            "Accuracy": "100",
            "Power": "80",
            "PP": "15",
            "Status": "0",
            "TypeName": "Dragon"
        },
        {
            "MoveName": "Dragon Dance",
            "Accuracy": "",
            "Power": "0",
            "PP": "20",
            "Status": "1",
            "TypeName": "Dragon"
        },
        {
            "MoveName": "Dragon Rage",
            "Accuracy": "100",
            "Power": "0",
            "PP": "10",
            "Status": "0",
            "TypeName": "Dragon"
        },
        {
            "MoveName": "Dream Eater",
            "Accuracy": "100",
            "Power": "100",
            "PP": "15",
            "Status": "0",
            "TypeName": "Psychic"
        },
        {
            "MoveName": "Drill Peck",
            "Accuracy": "100",
            "Power": "80",
            "PP": "20",
            "Status": "0",
            "TypeName": "Flying"
        },
        {
            "MoveName": "Dynamic Punch",
            "Accuracy": "50",
            "Power": "100",
            "PP": "5",
            "Status": "0",
            "TypeName": "Fighting"
        },
        {
            "MoveName": "Earthquake",
            "Accuracy": "100",
            "Power": "100",
            "PP": "10",
            "Status": "0",
            "TypeName": "Ground"
        },
        {
            "MoveName": "Egg Bomb",
            "Accuracy": "75",
            "Power": "100",
            "PP": "10",
            "Status": "0",
            "TypeName": "Normal"
        },
        {
            "MoveName": "Ember",
            "Accuracy": "100",
            "Power": "40",
            "PP": "25",
            "Status": "0",
            "TypeName": "Fire"
        },
        {
            "MoveName": "Encore",
            "Accuracy": "100",
            "Power": "0",
            "PP": "5",
            "Status": "1",
            "TypeName": "Normal"
        },
        {
            "MoveName": "Endeavor",
            "Accuracy": "100",
            "Power": "0",
            "PP": "5",
            "Status": "0",
            "TypeName": "Normal"
        },
        {
            "MoveName": "Endure",
            "Accuracy": "",
            "Power": "0",
            "PP": "10",
            "Status": "1",
            "TypeName": "Normal"
        },
        {
            "MoveName": "Eruption",
            "Accuracy": "100",
            "Power": "150",
            "PP": "5",
            "Status": "0",
            "TypeName": "Fire"
        },
        {
            "MoveName": "Explosion",
            "Accuracy": "100",
            "Power": "250",
            "PP": "5",
            "Status": "0",
            "TypeName": "Normal"
        },
        {
            "MoveName": "Extrasensory",
            "Accuracy": "100",
            "Power": "80",
            "PP": "30",
            "Status": "0",
            "TypeName": "Psychic"
        },
        {
            "MoveName": "Extreme Speed",
            "Accuracy": "100",
            "Power": "80",
            "PP": "5",
            "Status": "0",
            "TypeName": "Normal"
        },
        {
            "MoveName": "Facade",
            "Accuracy": "100",
            "Power": "70",
            "PP": "20",
            "Status": "0",
            "TypeName": "Normal"
        },
        {
            "MoveName": "Fake Out",
            "Accuracy": "100",
            "Power": "40",
            "PP": "10",
            "Status": "0",
            "TypeName": "Normal"
        },
        {
            "MoveName": "Fake Tears",
            "Accuracy": "100",
            "Power": "0",
            "PP": "20",
            "Status": "1",
            "TypeName": "Dark"
        },
        {
            "MoveName": "False Swipe",
            "Accuracy": "100",
            "Power": "40",
            "PP": "40",
            "Status": "0",
            "TypeName": "Normal"
        },
        {
            "MoveName": "Feather Dance",
            "Accuracy": "100",
            "Power": "0",
            "PP": "15",
            "Status": "1",
            "TypeName": "Flying"
        },
        {
            "MoveName": "Feint Attack",
            "Accuracy": "",
            "Power": "60",
            "PP": "20",
            "Status": "0",
            "TypeName": "Dark"
        },
        {
            "MoveName": "Fire Blast",
            "Accuracy": "85",
            "Power": "120",
            "PP": "5",
            "Status": "0",
            "TypeName": "Fire"
        },
        {
            "MoveName": "Fire Punch",
            "Accuracy": "100",
            "Power": "75",
            "PP": "15",
            "Status": "0",
            "TypeName": "Fire"
        },
        {
            "MoveName": "Fire Spin",
            "Accuracy": "70",
            "Power": "15",
            "PP": "15",
            "Status": "0",
            "TypeName": "Fire"
        },
        {
            "MoveName": "Fissure",
            "Accuracy": "30",
            "Power": "0",
            "PP": "5",
            "Status": "1",
            "TypeName": "Ground"
        },
        {
            "MoveName": "Flail",
            "Accuracy": "100",
            "Power": "0",
            "PP": "15",
            "Status": "0",
            "TypeName": "Normal"
        },
        {
            "MoveName": "Flame Wheel",
            "Accuracy": "100",
            "Power": "60",
            "PP": "25",
            "Status": "0",
            "TypeName": "Fire"
        },
        {
            "MoveName": "Flamethrower",
            "Accuracy": "100",
            "Power": "95",
            "PP": "15",
            "Status": "0",
            "TypeName": "Fire"
        },
        {
            "MoveName": "Flash",
            "Accuracy": "70",
            "Power": "0",
            "PP": "20",
            "Status": "1",
            "TypeName": "Normal"
        },
        {
            "MoveName": "Flatter",
            "Accuracy": "100",
            "Power": "0",
            "PP": "15",
            "Status": "1",
            "TypeName": "Dark"
        },
        {
            "MoveName": "Fly",
            "Accuracy": "95",
            "Power": "70",
            "PP": "15",
            "Status": "0",
            "TypeName": "Flying"
        },
        {
            "MoveName": "Focus Energy",
            "Accuracy": "",
            "Power": "0",
            "PP": "30",
            "Status": "1",
            "TypeName": "Normal"
        },
        {
            "MoveName": "Focus Punch",
            "Accuracy": "100",
            "Power": "150",
            "PP": "20",
            "Status": "0",
            "TypeName": "Fighting"
        },
        {
            "MoveName": "Follow Me",
            "Accuracy": "",
            "Power": "0",
            "PP": "20",
            "Status": "1",
            "TypeName": "Normal"
        },
        {
            "MoveName": "Foresight",
            "Accuracy": "100",
            "Power": "0",
            "PP": "40",
            "Status": "1",
            "TypeName": "Normal"
        },
        {
            "MoveName": "Frenzy Plant",
            "Accuracy": "90",
            "Power": "150",
            "PP": "5",
            "Status": "0",
            "TypeName": "Grass"
        },
        {
            "MoveName": "Frustration",
            "Accuracy": "100",
            "Power": "0",
            "PP": "20",
            "Status": "0",
            "TypeName": "Normal"
        },
        {
            "MoveName": "Fury Attack",
            "Accuracy": "85",
            "Power": "15",
            "PP": "20",
            "Status": "0",
            "TypeName": "Normal"
        },
        {
            "MoveName": "Fury Cutter",
            "Accuracy": "95",
            "Power": "10",
            "PP": "20",
            "Status": "0",
            "TypeName": "Bug"
        },
        {
            "MoveName": "Fury Swipes",
            "Accuracy": "80",
            "Power": "18",
            "PP": "15",
            "Status": "0",
            "TypeName": "Normal"
        },
        {
            "MoveName": "Future Sight",
            "Accuracy": "90",
            "Power": "80",
            "PP": "15",
            "Status": "0",
            "TypeName": "Psychic"
        },
        {
            "MoveName": "Giga Drain",
            "Accuracy": "100",
            "Power": "60",
            "PP": "5",
            "Status": "0",
            "TypeName": "Grass"
        },
        {
            "MoveName": "Glare",
            "Accuracy": "75",
            "Power": "0",
            "PP": "30",
            "Status": "1",
            "TypeName": "Normal"
        },
        {
            "MoveName": "Grass Whistle",
            "Accuracy": "55",
            "Power": "0",
            "PP": "15",
            "Status": "1",
            "TypeName": "Grass"
        },
        {
            "MoveName": "Growl",
            "Accuracy": "100",
            "Power": "0",
            "PP": "40",
            "Status": "1",
            "TypeName": "Normal"
        },
        {
            "MoveName": "Growth",
            "Accuracy": "",
            "Power": "0",
            "PP": "40",
            "Status": "1",
            "TypeName": "Normal"
        },
        {
            "MoveName": "Grudge",
            "Accuracy": "",
            "Power": "0",
            "PP": "5",
            "Status": "1",
            "TypeName": "Ghost"
        },
        {
            "MoveName": "Guillotine",
            "Accuracy": "30",
            "Power": "0",
            "PP": "5",
            "Status": "1",
            "TypeName": "Normal"
        },
        {
            "MoveName": "Gust",
            "Accuracy": "100",
            "Power": "40",
            "PP": "35",
            "Status": "0",
            "TypeName": "Flying"
        },
        {
            "MoveName": "Hail",
            "Accuracy": "",
            "Power": "0",
            "PP": "10",
            "Status": "1",
            "TypeName": "Ice"
        },
        {
            "MoveName": "Harden",
            "Accuracy": "",
            "Power": "0",
            "PP": "30",
            "Status": "1",
            "TypeName": "Normal"
        },
        {
            "MoveName": "Haze",
            "Accuracy": "",
            "Power": "0",
            "PP": "30",
            "Status": "1",
            "TypeName": "Ice"
        },
        {
            "MoveName": "Headbutt",
            "Accuracy": "100",
            "Power": "70",
            "PP": "15",
            "Status": "0",
            "TypeName": "Normal"
        },
        {
            "MoveName": "Heal Bell",
            "Accuracy": "",
            "Power": "0",
            "PP": "5",
            "Status": "1",
            "TypeName": "Normal"
        },
        {
            "MoveName": "Heat Wave",
            "Accuracy": "90",
            "Power": "100",
            "PP": "10",
            "Status": "0",
            "TypeName": "Fire"
        },
        {
            "MoveName": "Helping Hand",
            "Accuracy": "",
            "Power": "0",
            "PP": "20",
            "Status": "1",
            "TypeName": "Normal"
        },
        {
            "MoveName": "Hidden Power",
            "Accuracy": "100",
            "Power": "0",
            "PP": "15",
            "Status": "1",
            "TypeName": "Normal"
        },
        {
            "MoveName": "High Jump Kick",
            "Accuracy": "90",
            "Power": "85",
            "PP": "20",
            "Status": "0",
            "TypeName": "Fighting"
        },
        {
            "MoveName": "Horn Attack",
            "Accuracy": "100",
            "Power": "65",
            "PP": "25",
            "Status": "0",
            "TypeName": "Normal"
        },
        {
            "MoveName": "Horn Drill",
            "Accuracy": "30",
            "Power": "0",
            "PP": "5",
            "Status": "1",
            "TypeName": "Normal"
        },
        {
            "MoveName": "Howl",
            "Accuracy": "",
            "Power": "0",
            "PP": "40",
            "Status": "1",
            "TypeName": "Normal"
        },
        {
            "MoveName": "Hydro Cannon",
            "Accuracy": "90",
            "Power": "150",
            "PP": "5",
            "Status": "0",
            "TypeName": "Water"
        },
        {
            "MoveName": "Hydro Pump",
            "Accuracy": "80",
            "Power": "120",
            "PP": "5",
            "Status": "0",
            "TypeName": "Water"
        },
        {
            "MoveName": "Hyper Beam",
            "Accuracy": "90",
            "Power": "150",
            "PP": "5",
            "Status": "0",
            "TypeName": "Normal"
        },
        {
            "MoveName": "Hyper Fang",
            "Accuracy": "90",
            "Power": "80",
            "PP": "15",
            "Status": "0",
            "TypeName": "Normal"
        },
        {
            "MoveName": "Hyper Voice",
            "Accuracy": "100",
            "Power": "90",
            "PP": "10",
            "Status": "0",
            "TypeName": "Normal"
        },
        {
            "MoveName": "Hypnosis",
            "Accuracy": "60",
            "Power": "0",
            "PP": "20",
            "Status": "1",
            "TypeName": "Psychic"
        },
        {
            "MoveName": "Ice Ball",
            "Accuracy": "90",
            "Power": "30",
            "PP": "20",
            "Status": "0",
            "TypeName": "Ice"
        },
        {
            "MoveName": "Ice Beam",
            "Accuracy": "100",
            "Power": "95",
            "PP": "10",
            "Status": "0",
            "TypeName": "Ice"
        },
        {
            "MoveName": "Ice Punch",
            "Accuracy": "100",
            "Power": "75",
            "PP": "15",
            "Status": "0",
            "TypeName": "Ice"
        },
        {
            "MoveName": "Icicle Spear",
            "Accuracy": "100",
            "Power": "10",
            "PP": "30",
            "Status": "0",
            "TypeName": "Ice"
        },
        {
            "MoveName": "Icy Wind",
            "Accuracy": "95",
            "Power": "55",
            "PP": "15",
            "Status": "0",
            "TypeName": "Ice"
        },
        {
            "MoveName": "Imprison",
            "Accuracy": "",
            "Power": "0",
            "PP": "10",
            "Status": "1",
            "TypeName": "Psychic"
        },
        {
            "MoveName": "Ingrain",
            "Accuracy": "",
            "Power": "0",
            "PP": "20",
            "Status": "1",
            "TypeName": "Grass"
        },
        {
            "MoveName": "Iron Defense",
            "Accuracy": "",
            "Power": "0",
            "PP": "15",
            "Status": "1",
            "TypeName": "Steel"
        },
        {
            "MoveName": "Iron Tail",
            "Accuracy": "75",
            "Power": "100",
            "PP": "15",
            "Status": "0",
            "TypeName": "Steel"
        },
        {
            "MoveName": "Jump Kick",
            "Accuracy": "95",
            "Power": "70",
            "PP": "25",
            "Status": "0",
            "TypeName": "Fighting"
        },
        {
            "MoveName": "Karate Chop",
            "Accuracy": "100",
            "Power": "50",
            "PP": "25",
            "Status": "0",
            "TypeName": "Fighting"
        },
        {
            "MoveName": "Kinesis",
            "Accuracy": "80",
            "Power": "0",
            "PP": "15",
            "Status": "1",
            "TypeName": "Psychic"
        },
        {
            "MoveName": "Knock Off",
            "Accuracy": "100",
            "Power": "20",
            "PP": "20",
            "Status": "0",
            "TypeName": "Dark"
        },
        {
            "MoveName": "Leaf Blade",
            "Accuracy": "100",
            "Power": "70",
            "PP": "15",
            "Status": "0",
            "TypeName": "Grass"
        },
        {
            "MoveName": "Leech Life",
            "Accuracy": "100",
            "Power": "20",
            "PP": "15",
            "Status": "0",
            "TypeName": "Bug"
        },
        {
            "MoveName": "Leech Seed",
            "Accuracy": "90",
            "Power": "0",
            "PP": "10",
            "Status": "1",
            "TypeName": "Grass"
        },
        {
            "MoveName": "Leer",
            "Accuracy": "100",
            "Power": "0",
            "PP": "30",
            "Status": "1",
            "TypeName": "Normal"
        },
        {
            "MoveName": "Lick",
            "Accuracy": "100",
            "Power": "20",
            "PP": "30",
            "Status": "0",
            "TypeName": "Ghost"
        },
        {
            "MoveName": "Light Screen",
            "Accuracy": "",
            "Power": "0",
            "PP": "30",
            "Status": "1",
            "TypeName": "Psychic"
        },
        {
            "MoveName": "Lock-On",
            "Accuracy": "100",
            "Power": "0",
            "PP": "5",
            "Status": "1",
            "TypeName": "Normal"
        },
        {
            "MoveName": "Lovely Kiss",
            "Accuracy": "75",
            "Power": "0",
            "PP": "10",
            "Status": "1",
            "TypeName": "Normal"
        },
        {
            "MoveName": "Low Kick",
            "Accuracy": "100",
            "Power": "0",
            "PP": "20",
            "Status": "0",
            "TypeName": "Fighting"
        },
        {
            "MoveName": "Luster Purge",
            "Accuracy": "100",
            "Power": "70",
            "PP": "5",
            "Status": "0",
            "TypeName": "Psychic"
        },
        {
            "MoveName": "Mach Punch",
            "Accuracy": "100",
            "Power": "40",
            "PP": "30",
            "Status": "0",
            "TypeName": "Fighting"
        },
        {
            "MoveName": "Magic Coat",
            "Accuracy": "",
            "Power": "0",
            "PP": "15",
            "Status": "1",
            "TypeName": "Psychic"
        },
        {
            "MoveName": "Magical Leaf",
            "Accuracy": "",
            "Power": "60",
            "PP": "20",
            "Status": "0",
            "TypeName": "Grass"
        },
        {
            "MoveName": "Magnitude",
            "Accuracy": "100",
            "Power": "0",
            "PP": "30",
            "Status": "0",
            "TypeName": "Ground"
        },
        {
            "MoveName": "Mean Look",
            "Accuracy": "",
            "Power": "0",
            "PP": "5",
            "Status": "1",
            "TypeName": "Normal"
        },
        {
            "MoveName": "Meditate",
            "Accuracy": "",
            "Power": "0",
            "PP": "40",
            "Status": "1",
            "TypeName": "Psychic"
        },
        {
            "MoveName": "Mega Drain",
            "Accuracy": "100",
            "Power": "40",
            "PP": "10",
            "Status": "0",
            "TypeName": "Grass"
        },
        {
            "MoveName": "Mega Kick",
            "Accuracy": "75",
            "Power": "120",
            "PP": "5",
            "Status": "0",
            "TypeName": "Normal"
        },
        {
            "MoveName": "Mega Punch",
            "Accuracy": "85",
            "Power": "80",
            "PP": "20",
            "Status": "0",
            "TypeName": "Normal"
        },
        {
            "MoveName": "Megahorn",
            "Accuracy": "85",
            "Power": "120",
            "PP": "10",
            "Status": "0",
            "TypeName": "Bug"
        },
        {
            "MoveName": "Memento",
            "Accuracy": "100",
            "Power": "0",
            "PP": "10",
            "Status": "1",
            "TypeName": "Dark"
        },
        {
            "MoveName": "Metal Claw",
            "Accuracy": "95",
            "Power": "50",
            "PP": "35",
            "Status": "0",
            "TypeName": "Steel"
        },
        {
            "MoveName": "Metal Sound",
            "Accuracy": "85",
            "Power": "0",
            "PP": "40",
            "Status": "1",
            "TypeName": "Steel"
        },
        {
            "MoveName": "Meteor Mash",
            "Accuracy": "85",
            "Power": "100",
            "PP": "10",
            "Status": "0",
            "TypeName": "Steel"
        },
        {
            "MoveName": "Metronome",
            "Accuracy": "",
            "Power": "0",
            "PP": "10",
            "Status": "1",
            "TypeName": "Normal"
        },
        {
            "MoveName": "Milk Drink",
            "Accuracy": "",
            "Power": "0",
            "PP": "10",
            "Status": "1",
            "TypeName": "Normal"
        },
        {
            "MoveName": "Mimic",
            "Accuracy": "",
            "Power": "0",
            "PP": "10",
            "Status": "1",
            "TypeName": "Normal"
        },
        {
            "MoveName": "Mind Reader",
            "Accuracy": "100",
            "Power": "0",
            "PP": "5",
            "Status": "1",
            "TypeName": "Normal"
        },
        {
            "MoveName": "Minimize",
            "Accuracy": "",
            "Power": "0",
            "PP": "20",
            "Status": "1",
            "TypeName": "Normal"
        },
        {
            "MoveName": "Mirror Coat",
            "Accuracy": "100",
            "Power": "0",
            "PP": "20",
            "Status": "0",
            "TypeName": "Psychic"
        },
        {
            "MoveName": "Mirror Move",
            "Accuracy": "",
            "Power": "0",
            "PP": "20",
            "Status": "1",
            "TypeName": "Flying"
        },
        {
            "MoveName": "Mist Ball",
            "Accuracy": "100",
            "Power": "70",
            "PP": "5",
            "Status": "0",
            "TypeName": "Psychic"
        },
        {
            "MoveName": "Mist",
            "Accuracy": "",
            "Power": "0",
            "PP": "30",
            "Status": "1",
            "TypeName": "Ice"
        },
        {
            "MoveName": "Moonlight",
            "Accuracy": "",
            "Power": "0",
            "PP": "5",
            "Status": "1",
            "TypeName": "Normal"
        },
        {
            "MoveName": "Morning Sun",
            "Accuracy": "",
            "Power": "0",
            "PP": "5",
            "Status": "1",
            "TypeName": "Normal"
        },
        {
            "MoveName": "Mud Shot",
            "Accuracy": "95",
            "Power": "55",
            "PP": "15",
            "Status": "0",
            "TypeName": "Ground"
        },
        {
            "MoveName": "Mud Sport",
            "Accuracy": "",
            "Power": "0",
            "PP": "15",
            "Status": "1",
            "TypeName": "Ground"
        },
        {
            "MoveName": "Mud-Slap",
            "Accuracy": "100",
            "Power": "20",
            "PP": "10",
            "Status": "0",
            "TypeName": "Ground"
        },
        {
            "MoveName": "Muddy Water",
            "Accuracy": "85",
            "Power": "95",
            "PP": "10",
            "Status": "0",
            "TypeName": "Water"
        },
        {
            "MoveName": "Nature Power",
            "Accuracy": "",
            "Power": "0",
            "PP": "20",
            "Status": "1",
            "TypeName": "Normal"
        },
        {
            "MoveName": "Needle Arm",
            "Accuracy": "100",
            "Power": "60",
            "PP": "15",
            "Status": "0",
            "TypeName": "Grass"
        },
        {
            "MoveName": "Night Shade",
            "Accuracy": "100",
            "Power": "0",
            "PP": "15",
            "Status": "0",
            "TypeName": "Ghost"
        },
        {
            "MoveName": "Nightmare",
            "Accuracy": "100",
            "Power": "0",
            "PP": "15",
            "Status": "1",
            "TypeName": "Ghost"
        },
        {
            "MoveName": "Octazooka",
            "Accuracy": "85",
            "Power": "65",
            "PP": "10",
            "Status": "0",
            "TypeName": "Water"
        },
        {
            "MoveName": "Odor Sleuth",
            "Accuracy": "100",
            "Power": "0",
            "PP": "40",
            "Status": "1",
            "TypeName": "Normal"
        },
        {
            "MoveName": "Outrage",
            "Accuracy": "100",
            "Power": "90",
            "PP": "15",
            "Status": "0",
            "TypeName": "Dragon"
        },
        {
            "MoveName": "Overheat",
            "Accuracy": "90",
            "Power": "140",
            "PP": "5",
            "Status": "0",
            "TypeName": "Fire"
        },
        {
            "MoveName": "Pain Split",
            "Accuracy": "",
            "Power": "0",
            "PP": "20",
            "Status": "1",
            "TypeName": "Normal"
        },
        {
            "MoveName": "Pay Day",
            "Accuracy": "100",
            "Power": "40",
            "PP": "20",
            "Status": "0",
            "TypeName": "Normal"
        },
        {
            "MoveName": "Peck",
            "Accuracy": "100",
            "Power": "35",
            "PP": "35",
            "Status": "0",
            "TypeName": "Flying"
        },
        {
            "MoveName": "Perish Song",
            "Accuracy": "",
            "Power": "0",
            "PP": "5",
            "Status": "1",
            "TypeName": "Normal"
        },
        {
            "MoveName": "Petal Dance",
            "Accuracy": "100",
            "Power": "70",
            "PP": "20",
            "Status": "0",
            "TypeName": "Grass"
        },
        {
            "MoveName": "Pin Missile",
            "Accuracy": "85",
            "Power": "14",
            "PP": "20",
            "Status": "0",
            "TypeName": "Bug"
        },
        {
            "MoveName": "Poison Fang",
            "Accuracy": "100",
            "Power": "50",
            "PP": "15",
            "Status": "0",
            "TypeName": "Poison"
        },
        {
            "MoveName": "Poison Gas",
            "Accuracy": "55",
            "Power": "0",
            "PP": "40",
            "Status": "1",
            "TypeName": "Poison"
        },
        {
            "MoveName": "Poison Powder",
            "Accuracy": "75",
            "Power": "0",
            "PP": "35",
            "Status": "1",
            "TypeName": "Poison"
        },
        {
            "MoveName": "Poison Sting",
            "Accuracy": "100",
            "Power": "15",
            "PP": "35",
            "Status": "0",
            "TypeName": "Poison"
        },
        {
            "MoveName": "Poison Tail",
            "Accuracy": "100",
            "Power": "50",
            "PP": "25",
            "Status": "0",
            "TypeName": "Poison"
        },
        {
            "MoveName": "Pound",
            "Accuracy": "100",
            "Power": "40",
            "PP": "35",
            "Status": "0",
            "TypeName": "Normal"
        },
        {
            "MoveName": "Powder Snow",
            "Accuracy": "100",
            "Power": "40",
            "PP": "25",
            "Status": "0",
            "TypeName": "Ice"
        },
        {
            "MoveName": "Present",
            "Accuracy": "90",
            "Power": "0",
            "PP": "15",
            "Status": "0",
            "TypeName": "Normal"
        },
        {
            "MoveName": "Protect",
            "Accuracy": "",
            "Power": "0",
            "PP": "10",
            "Status": "1",
            "TypeName": "Normal"
        },
        {
            "MoveName": "Psybeam",
            "Accuracy": "100",
            "Power": "65",
            "PP": "20",
            "Status": "0",
            "TypeName": "Psychic"
        },
        {
            "MoveName": "Psych Up",
            "Accuracy": "",
            "Power": "0",
            "PP": "10",
            "Status": "1",
            "TypeName": "Normal"
        },
        {
            "MoveName": "Psychic",
            "Accuracy": "100",
            "Power": "90",
            "PP": "10",
            "Status": "0",
            "TypeName": "Psychic"
        },
        {
            "MoveName": "Psycho Boost",
            "Accuracy": "90",
            "Power": "140",
            "PP": "5",
            "Status": "0",
            "TypeName": "Psychic"
        },
        {
            "MoveName": "Psywave",
            "Accuracy": "80",
            "Power": "0",
            "PP": "15",
            "Status": "0",
            "TypeName": "Psychic"
        },
        {
            "MoveName": "Pursuit",
            "Accuracy": "100",
            "Power": "40",
            "PP": "20",
            "Status": "0",
            "TypeName": "Dark"
        },
        {
            "MoveName": "Quick Attack",
            "Accuracy": "100",
            "Power": "40",
            "PP": "30",
            "Status": "0",
            "TypeName": "Normal"
        },
        {
            "MoveName": "Rage",
            "Accuracy": "100",
            "Power": "20",
            "PP": "20",
            "Status": "0",
            "TypeName": "Normal"
        },
        {
            "MoveName": "Rain Dance",
            "Accuracy": "",
            "Power": "0",
            "PP": "5",
            "Status": "1",
            "TypeName": "Water"
        },
        {
            "MoveName": "Rapid Spin",
            "Accuracy": "100",
            "Power": "20",
            "PP": "40",
            "Status": "0",
            "TypeName": "Normal"
        },
        {
            "MoveName": "Razor Leaf",
            "Accuracy": "95",
            "Power": "55",
            "PP": "25",
            "Status": "0",
            "TypeName": "Grass"
        },
        {
            "MoveName": "Razor Wind",
            "Accuracy": "100",
            "Power": "80",
            "PP": "10",
            "Status": "0",
            "TypeName": "Normal"
        },
        {
            "MoveName": "Recover",
            "Accuracy": "",
            "Power": "0",
            "PP": "20",
            "Status": "1",
            "TypeName": "Normal"
        },
        {
            "MoveName": "Recycle",
            "Accuracy": "",
            "Power": "0",
            "PP": "10",
            "Status": "1",
            "TypeName": "Normal"
        },
        {
            "MoveName": "Reflect",
            "Accuracy": "",
            "Power": "0",
            "PP": "20",
            "Status": "1",
            "TypeName": "Psychic"
        },
        {
            "MoveName": "Refresh",
            "Accuracy": "",
            "Power": "0",
            "PP": "20",
            "Status": "1",
            "TypeName": "Normal"
        },
        {
            "MoveName": "Rest",
            "Accuracy": "",
            "Power": "0",
            "PP": "10",
            "Status": "1",
            "TypeName": "Psychic"
        },
        {
            "MoveName": "Return",
            "Accuracy": "100",
            "Power": "0",
            "PP": "20",
            "Status": "0",
            "TypeName": "Normal"
        },
        {
            "MoveName": "Revenge",
            "Accuracy": "100",
            "Power": "60",
            "PP": "10",
            "Status": "0",
            "TypeName": "Fighting"
        },
        {
            "MoveName": "Reversal",
            "Accuracy": "100",
            "Power": "0",
            "PP": "15",
            "Status": "0",
            "TypeName": "Fighting"
        },
        {
            "MoveName": "Roar",
            "Accuracy": "100",
            "Power": "0",
            "PP": "20",
            "Status": "1",
            "TypeName": "Normal"
        },
        {
            "MoveName": "Rock Blast",
            "Accuracy": "80",
            "Power": "25",
            "PP": "10",
            "Status": "0",
            "TypeName": "Rock"
        },
        {
            "MoveName": "Rock Slide",
            "Accuracy": "90",
            "Power": "75",
            "PP": "10",
            "Status": "0",
            "TypeName": "Rock"
        },
        {
            "MoveName": "Rock Smash",
            "Accuracy": "100",
            "Power": "20",
            "PP": "15",
            "Status": "0",
            "TypeName": "Fighting"
        },
        {
            "MoveName": "Rock Throw",
            "Accuracy": "90",
            "Power": "50",
            "PP": "15",
            "Status": "0",
            "TypeName": "Rock"
        },
        {
            "MoveName": "Rock Tomb",
            "Accuracy": "80",
            "Power": "50",
            "PP": "10",
            "Status": "0",
            "TypeName": "Rock"
        },
        {
            "MoveName": "Role Play",
            "Accuracy": "",
            "Power": "0",
            "PP": "10",
            "Status": "1",
            "TypeName": "Psychic"
        },
        {
            "MoveName": "Rolling Kick",
            "Accuracy": "85",
            "Power": "60",
            "PP": "15",
            "Status": "0",
            "TypeName": "Fighting"
        },
        {
            "MoveName": "Rollout",
            "Accuracy": "90",
            "Power": "30",
            "PP": "20",
            "Status": "0",
            "TypeName": "Rock"
        },
        {
            "MoveName": "Sacred Fire",
            "Accuracy": "95",
            "Power": "100",
            "PP": "5",
            "Status": "0",
            "TypeName": "Fire"
        },
        {
            "MoveName": "Safeguard",
            "Accuracy": "",
            "Power": "0",
            "PP": "25",
            "Status": "1",
            "TypeName": "Normal"
        },
        {
            "MoveName": "Sand Attack",
            "Accuracy": "100",
            "Power": "0",
            "PP": "15",
            "Status": "1",
            "TypeName": "Ground"
        },
        {
            "MoveName": "Sand Tomb",
            "Accuracy": "70",
            "Power": "15",
            "PP": "15",
            "Status": "0",
            "TypeName": "Ground"
        },
        {
            "MoveName": "Sandstorm",
            "Accuracy": "",
            "Power": "0",
            "PP": "10",
            "Status": "1",
            "TypeName": "Rock"
        },
        {
            "MoveName": "Scary Face",
            "Accuracy": "90",
            "Power": "0",
            "PP": "10",
            "Status": "1",
            "TypeName": "Normal"
        },
        {
            "MoveName": "Scratch",
            "Accuracy": "100",
            "Power": "40",
            "PP": "35",
            "Status": "0",
            "TypeName": "Normal"
        },
        {
            "MoveName": "Screech",
            "Accuracy": "85",
            "Power": "0",
            "PP": "40",
            "Status": "1",
            "TypeName": "Normal"
        },
        {
            "MoveName": "Secret Power",
            "Accuracy": "100",
            "Power": "70",
            "PP": "20",
            "Status": "0",
            "TypeName": "Normal"
        },
        {
            "MoveName": "Seismic Toss",
            "Accuracy": "100",
            "Power": "0",
            "PP": "20",
            "Status": "0",
            "TypeName": "Fighting"
        },
        {
            "MoveName": "Self-Destruct",
            "Accuracy": "100",
            "Power": "200",
            "PP": "5",
            "Status": "0",
            "TypeName": "Normal"
        },
        {
            "MoveName": "Shadow Ball",
            "Accuracy": "100",
            "Power": "80",
            "PP": "15",
            "Status": "0",
            "TypeName": "Ghost"
        },
        {
            "MoveName": "Shadow Punch",
            "Accuracy": "",
            "Power": "60",
            "PP": "20",
            "Status": "0",
            "TypeName": "Ghost"
        },
        {
            "MoveName": "Sharpen",
            "Accuracy": "",
            "Power": "0",
            "PP": "30",
            "Status": "1",
            "TypeName": "Normal"
        },
        {
            "MoveName": "Sheer Cold",
            "Accuracy": "30",
            "Power": "0",
            "PP": "5",
            "Status": "1",
            "TypeName": "Ice"
        },
        {
            "MoveName": "Shock Wave",
            "Accuracy": "",
            "Power": "60",
            "PP": "20",
            "Status": "0",
            "TypeName": "Electric"
        },
        {
            "MoveName": "Signal Beam",
            "Accuracy": "100",
            "Power": "75",
            "PP": "15",
            "Status": "0",
            "TypeName": "Bug"
        },
        {
            "MoveName": "Silver Wind",
            "Accuracy": "100",
            "Power": "60",
            "PP": "5",
            "Status": "0",
            "TypeName": "Bug"
        },
        {
            "MoveName": "Sing",
            "Accuracy": "55",
            "Power": "0",
            "PP": "15",
            "Status": "1",
            "TypeName": "Normal"
        },
        {
            "MoveName": "Sketch",
            "Accuracy": "",
            "Power": "0",
            "PP": "1",
            "Status": "1",
            "TypeName": "Normal"
        },
        {
            "MoveName": "Skill Swap",
            "Accuracy": "",
            "Power": "0",
            "PP": "10",
            "Status": "1",
            "TypeName": "Psychic"
        },
        {
            "MoveName": "Skull Bash",
            "Accuracy": "100",
            "Power": "100",
            "PP": "15",
            "Status": "0",
            "TypeName": "Normal"
        },
        {
            "MoveName": "Sky Attack",
            "Accuracy": "90",
            "Power": "140",
            "PP": "5",
            "Status": "0",
            "TypeName": "Flying"
        },
        {
            "MoveName": "Sky Uppercut",
            "Accuracy": "90",
            "Power": "85",
            "PP": "15",
            "Status": "0",
            "TypeName": "Fighting"
        },
        {
            "MoveName": "Slack Off",
            "Accuracy": "",
            "Power": "0",
            "PP": "10",
            "Status": "1",
            "TypeName": "Normal"
        },
        {
            "MoveName": "Slam",
            "Accuracy": "75",
            "Power": "80",
            "PP": "20",
            "Status": "0",
            "TypeName": "Normal"
        },
        {
            "MoveName": "Slash",
            "Accuracy": "100",
            "Power": "70",
            "PP": "20",
            "Status": "0",
            "TypeName": "Normal"
        },
        {
            "MoveName": "Sleep Powder",
            "Accuracy": "75",
            "Power": "0",
            "PP": "15",
            "Status": "1",
            "TypeName": "Grass"
        },
        {
            "MoveName": "Sleep Talk",
            "Accuracy": "",
            "Power": "0",
            "PP": "10",
            "Status": "1",
            "TypeName": "Normal"
        },
        {
            "MoveName": "Sludge Bomb",
            "Accuracy": "100",
            "Power": "90",
            "PP": "10",
            "Status": "0",
            "TypeName": "Poison"
        },
        {
            "MoveName": "Sludge",
            "Accuracy": "100",
            "Power": "65",
            "PP": "20",
            "Status": "0",
            "TypeName": "Poison"
        },
        {
            "MoveName": "Smelling Salts",
            "Accuracy": "100",
            "Power": "60",
            "PP": "10",
            "Status": "0",
            "TypeName": "Normal"
        },
        {
            "MoveName": "Smog",
            "Accuracy": "70",
            "Power": "20",
            "PP": "20",
            "Status": "0",
            "TypeName": "Poison"
        },
        {
            "MoveName": "Smokescreen",
            "Accuracy": "100",
            "Power": "0",
            "PP": "20",
            "Status": "1",
            "TypeName": "Normal"
        },
        {
            "MoveName": "Snatch",
            "Accuracy": "",
            "Power": "0",
            "PP": "10",
            "Status": "1",
            "TypeName": "Dark"
        },
        {
            "MoveName": "Snore",
            "Accuracy": "100",
            "Power": "40",
            "PP": "15",
            "Status": "0",
            "TypeName": "Normal"
        },
        {
            "MoveName": "Soft-Boiled",
            "Accuracy": "",
            "Power": "0",
            "PP": "10",
            "Status": "1",
            "TypeName": "Normal"
        },
        {
            "MoveName": "Solar Beam",
            "Accuracy": "100",
            "Power": "120",
            "PP": "10",
            "Status": "0",
            "TypeName": "Grass"
        },
        {
            "MoveName": "Sonic Boom",
            "Accuracy": "90",
            "Power": "0",
            "PP": "20",
            "Status": "0",
            "TypeName": "Normal"
        },
        {
            "MoveName": "Spark",
            "Accuracy": "100",
            "Power": "65",
            "PP": "20",
            "Status": "0",
            "TypeName": "Electric"
        },
        {
            "MoveName": "Spider Web",
            "Accuracy": "",
            "Power": "0",
            "PP": "10",
            "Status": "1",
            "TypeName": "Bug"
        },
        {
            "MoveName": "Spike Cannon",
            "Accuracy": "100",
            "Power": "20",
            "PP": "15",
            "Status": "0",
            "TypeName": "Normal"
        },
        {
            "MoveName": "Spikes",
            "Accuracy": "",
            "Power": "0",
            "PP": "20",
            "Status": "1",
            "TypeName": "Ground"
        },
        {
            "MoveName": "Spit Up",
            "Accuracy": "100",
            "Power": "0",
            "PP": "10",
            "Status": "0",
            "TypeName": "Normal"
        },
        {
            "MoveName": "Spite",
            "Accuracy": "100",
            "Power": "0",
            "PP": "10",
            "Status": "1",
            "TypeName": "Ghost"
        },
        {
            "MoveName": "Splash",
            "Accuracy": "",
            "Power": "0",
            "PP": "40",
            "Status": "1",
            "TypeName": "Normal"
        },
        {
            "MoveName": "Spore",
            "Accuracy": "100",
            "Power": "0",
            "PP": "15",
            "Status": "1",
            "TypeName": "Grass"
        },
        {
            "MoveName": "Steel Wing",
            "Accuracy": "90",
            "Power": "70",
            "PP": "25",
            "Status": "0",
            "TypeName": "Steel"
        },
        {
            "MoveName": "Stockpile",
            "Accuracy": "",
            "Power": "0",
            "PP": "10",
            "Status": "1",
            "TypeName": "Normal"
        },
        {
            "MoveName": "Stomp",
            "Accuracy": "100",
            "Power": "65",
            "PP": "20",
            "Status": "0",
            "TypeName": "Normal"
        },
        {
            "MoveName": "Strength",
            "Accuracy": "100",
            "Power": "80",
            "PP": "15",
            "Status": "0",
            "TypeName": "Normal"
        },
        {
            "MoveName": "String Shot",
            "Accuracy": "95",
            "Power": "0",
            "PP": "40",
            "Status": "1",
            "TypeName": "Bug"
        },
        {
            "MoveName": "Struggle",
            "Accuracy": "100",
            "Power": "50",
            "PP": "1",
            "Status": "0",
            "TypeName": "Normal"
        },
        {
            "MoveName": "Stun Spore",
            "Accuracy": "75",
            "Power": "0",
            "PP": "30",
            "Status": "1",
            "TypeName": "Grass"
        },
        {
            "MoveName": "Submission",
            "Accuracy": "80",
            "Power": "80",
            "PP": "25",
            "Status": "0",
            "TypeName": "Fighting"
        },
        {
            "MoveName": "Substitute",
            "Accuracy": "",
            "Power": "0",
            "PP": "10",
            "Status": "1",
            "TypeName": "Normal"
        },
        {
            "MoveName": "Sunny Day",
            "Accuracy": "",
            "Power": "0",
            "PP": "5",
            "Status": "1",
            "TypeName": "Fire"
        },
        {
            "MoveName": "Super Fang",
            "Accuracy": "90",
            "Power": "0",
            "PP": "10",
            "Status": "0",
            "TypeName": "Normal"
        },
        {
            "MoveName": "Superpower",
            "Accuracy": "100",
            "Power": "120",
            "PP": "5",
            "Status": "0",
            "TypeName": "Fighting"
        },
        {
            "MoveName": "Supersonic",
            "Accuracy": "55",
            "Power": "0",
            "PP": "20",
            "Status": "1",
            "TypeName": "Normal"
        },
        {
            "MoveName": "Surf",
            "Accuracy": "100",
            "Power": "95",
            "PP": "15",
            "Status": "0",
            "TypeName": "Water"
        },
        {
            "MoveName": "Swagger",
            "Accuracy": "90",
            "Power": "0",
            "PP": "15",
            "Status": "1",
            "TypeName": "Normal"
        },
        {
            "MoveName": "Swallow",
            "Accuracy": "",
            "Power": "0",
            "PP": "10",
            "Status": "1",
            "TypeName": "Normal"
        },
        {
            "MoveName": "Sweet Kiss",
            "Accuracy": "75",
            "Power": "0",
            "PP": "10",
            "Status": "1",
            "TypeName": "Normal"
        },
        {
            "MoveName": "Sweet Scent",
            "Accuracy": "100",
            "Power": "0",
            "PP": "20",
            "Status": "1",
            "TypeName": "Normal"
        },
        {
            "MoveName": "Swift",
            "Accuracy": "",
            "Power": "60",
            "PP": "20",
            "Status": "0",
            "TypeName": "Normal"
        },
        {
            "MoveName": "Swords Dance",
            "Accuracy": "",
            "Power": "0",
            "PP": "30",
            "Status": "1",
            "TypeName": "Normal"
        },
        {
            "MoveName": "Synthesis",
            "Accuracy": "",
            "Power": "0",
            "PP": "5",
            "Status": "1",
            "TypeName": "Grass"
        },
        {
            "MoveName": "Tackle",
            "Accuracy": "95",
            "Power": "35",
            "PP": "35",
            "Status": "0",
            "TypeName": "Normal"
        },
        {
            "MoveName": "Tail Glow",
            "Accuracy": "",
            "Power": "0",
            "PP": "20",
            "Status": "1",
            "TypeName": "Bug"
        },
        {
            "MoveName": "Tail Whip",
            "Accuracy": "100",
            "Power": "0",
            "PP": "30",
            "Status": "1",
            "TypeName": "Normal"
        },
        {
            "MoveName": "Take Down",
            "Accuracy": "85",
            "Power": "90",
            "PP": "20",
            "Status": "0",
            "TypeName": "Normal"
        },
        {
            "MoveName": "Taunt",
            "Accuracy": "100",
            "Power": "0",
            "PP": "20",
            "Status": "1",
            "TypeName": "Dark"
        },
        {
            "MoveName": "Teeter Dance",
            "Accuracy": "100",
            "Power": "0",
            "PP": "20",
            "Status": "1",
            "TypeName": "Normal"
        },
        {
            "MoveName": "Teleport",
            "Accuracy": "",
            "Power": "0",
            "PP": "20",
            "Status": "1",
            "TypeName": "Psychic"
        },
        {
            "MoveName": "Thief",
            "Accuracy": "100",
            "Power": "40",
            "PP": "10",
            "Status": "0",
            "TypeName": "Dark"
        },
        {
            "MoveName": "Thrash",
            "Accuracy": "100",
            "Power": "90",
            "PP": "20",
            "Status": "0",
            "TypeName": "Normal"
        },
        {
            "MoveName": "Thunder Punch",
            "Accuracy": "100",
            "Power": "75",
            "PP": "15",
            "Status": "0",
            "TypeName": "Electric"
        },
        {
            "MoveName": "Thunder Shock",
            "Accuracy": "100",
            "Power": "40",
            "PP": "30",
            "Status": "0",
            "TypeName": "Electric"
        },
        {
            "MoveName": "Thunder Wave",
            "Accuracy": "100",
            "Power": "0",
            "PP": "20",
            "Status": "1",
            "TypeName": "Electric"
        },
        {
            "MoveName": "Thunder",
            "Accuracy": "70",
            "Power": "120",
            "PP": "10",
            "Status": "0",
            "TypeName": "Electric"
        },
        {
            "MoveName": "Thunderbolt",
            "Accuracy": "100",
            "Power": "95",
            "PP": "15",
            "Status": "0",
            "TypeName": "Electric"
        },
        {
            "MoveName": "Tickle",
            "Accuracy": "100",
            "Power": "0",
            "PP": "20",
            "Status": "1",
            "TypeName": "Normal"
        },
        {
            "MoveName": "Torment",
            "Accuracy": "100",
            "Power": "0",
            "PP": "15",
            "Status": "1",
            "TypeName": "Dark"
        },
        {
            "MoveName": "Toxic",
            "Accuracy": "85",
            "Power": "0",
            "PP": "10",
            "Status": "1",
            "TypeName": "Poison"
        },
        {
            "MoveName": "Transform",
            "Accuracy": "",
            "Power": "0",
            "PP": "10",
            "Status": "1",
            "TypeName": "Normal"
        },
        {
            "MoveName": "Tri Attack",
            "Accuracy": "100",
            "Power": "80",
            "PP": "10",
            "Status": "0",
            "TypeName": "Normal"
        },
        {
            "MoveName": "Trick",
            "Accuracy": "100",
            "Power": "0",
            "PP": "10",
            "Status": "1",
            "TypeName": "Psychic"
        },
        {
            "MoveName": "Triple Kick",
            "Accuracy": "90",
            "Power": "10",
            "PP": "10",
            "Status": "0",
            "TypeName": "Fighting"
        },
        {
            "MoveName": "Twineedle",
            "Accuracy": "100",
            "Power": "25",
            "PP": "20",
            "Status": "0",
            "TypeName": "Bug"
        },
        {
            "MoveName": "Twister",
            "Accuracy": "100",
            "Power": "40",
            "PP": "20",
            "Status": "0",
            "TypeName": "Dragon"
        },
        {
            "MoveName": "Uproar",
            "Accuracy": "100",
            "Power": "50",
            "PP": "10",
            "Status": "0",
            "TypeName": "Normal"
        },
        {
            "MoveName": "Vine Whip",
            "Accuracy": "100",
            "Power": "35",
            "PP": "10",
            "Status": "0",
            "TypeName": "Grass"
        },
        {
            "MoveName": "Vise Grip",
            "Accuracy": "100",
            "Power": "55",
            "PP": "30",
            "Status": "0",
            "TypeName": "Normal"
        },
        {
            "MoveName": "Vital Throw",
            "Accuracy": "",
            "Power": "70",
            "PP": "10",
            "Status": "0",
            "TypeName": "Fighting"
        },
        {
            "MoveName": "Volt Tackle",
            "Accuracy": "100",
            "Power": "120",
            "PP": "15",
            "Status": "0",
            "TypeName": "Electric"
        },
        {
            "MoveName": "Water Gun",
            "Accuracy": "100",
            "Power": "40",
            "PP": "25",
            "Status": "0",
            "TypeName": "Water"
        },
        {
            "MoveName": "Water Pulse",
            "Accuracy": "100",
            "Power": "60",
            "PP": "20",
            "Status": "0",
            "TypeName": "Water"
        },
        {
            "MoveName": "Water Sport",
            "Accuracy": "",
            "Power": "0",
            "PP": "15",
            "Status": "1",
            "TypeName": "Water"
        },
        {
            "MoveName": "Water Spout",
            "Accuracy": "100",
            "Power": "150",
            "PP": "5",
            "Status": "0",
            "TypeName": "Water"
        },
        {
            "MoveName": "Waterfall",
            "Accuracy": "100",
            "Power": "80",
            "PP": "15",
            "Status": "0",
            "TypeName": "Water"
        },
        {
            "MoveName": "Weather Ball",
            "Accuracy": "100",
            "Power": "50",
            "PP": "10",
            "Status": "0",
            "TypeName": "Normal"
        },
        {
            "MoveName": "Whirlpool",
            "Accuracy": "70",
            "Power": "15",
            "PP": "15",
            "Status": "0",
            "TypeName": "Water"
        },
        {
            "MoveName": "Whirlwind",
            "Accuracy": "100",
            "Power": "0",
            "PP": "20",
            "Status": "1",
            "TypeName": "Normal"
        },
        {
            "MoveName": "Will-O-Wisp",
            "Accuracy": "75",
            "Power": "0",
            "PP": "15",
            "Status": "1",
            "TypeName": "Fire"
        },
        {
            "MoveName": "Wing Attack",
            "Accuracy": "100",
            "Power": "60",
            "PP": "35",
            "Status": "0",
            "TypeName": "Flying"
        },
        {
            "MoveName": "Wish",
            "Accuracy": "",
            "Power": "0",
            "PP": "10",
            "Status": "1",
            "TypeName": "Normal"
        },
        {
            "MoveName": "Withdraw",
            "Accuracy": "",
            "Power": "0",
            "PP": "40",
            "Status": "1",
            "TypeName": "Water"
        },
        {
            "MoveName": "Wrap",
            "Accuracy": "85",
            "Power": "15",
            "PP": "20",
            "Status": "0",
            "TypeName": "Normal"
        },
        {
            "MoveName": "Yawn",
            "Accuracy": "",
            "Power": "0",
            "PP": "10",
            "Status": "1",
            "TypeName": "Normal"
        },
        {
            "MoveName": "Zap Cannon",
            "Accuracy": "50",
            "Power": "100",
            "PP": "5",
            "Status": "0",
            "TypeName": "Electric"
        }
        ],

        selectBreedingMethod:{},
        breedingMethods:[
        {"MoveName": "Safeguard"},
        {"MoveName": "Light Screen"},
        {"MoveName": "Curse"},
        {"MoveName": "Charm"},
        {"MoveName": "Grass Whistle"},
        {"MoveName": "Petal Dance"},
        {"MoveName": "Magical Leaf"},
        {"MoveName": "Skull Bash"},
        {"MoveName": "Ancient Power"},
        {"MoveName": "Reflect"},
        {"MoveName": "Moonlight"},
        {"MoveName": "Psych Up"},
        {"MoveName": "Synthesis"},
        {"MoveName": "Ingrain"},
        {"MoveName": "Swords Dance"},
        {"MoveName": "Perish Song"},
        {"MoveName": "Belly Drum"},
        {"MoveName": "Rock Slide"},
        {"MoveName": "Screech"},
        {"MoveName": "High Jump Kick"},
        {"MoveName": "Mind Reader"},
        {"MoveName": "Helping Hand"},
        {"MoveName": "Mach Punch"},
        {"MoveName": "Rapid Spin"},
        {"MoveName": "Magnitude"},
        {"MoveName": "Substitute"},
        {"MoveName": "Snore"},
        {"MoveName": "Smelling Salts"},
        {"MoveName": "Sleep Talk"},
        {"MoveName": "Body Slam"},
        {"MoveName": "Pain Split"},
        {"MoveName": "Psybeam"},
        {"MoveName": "Destiny Bond"},
        {"MoveName": "Will-O-Wisp"},
        {"MoveName": "Psywave"},
        {"MoveName": "Counter"},
        {"MoveName": "Reversal"},
        {"MoveName": "Crush Claw"},
        {"MoveName": "Crunch"},
        {"MoveName": "Metronome"},
        {"MoveName": "Present"},
        {"MoveName": "Heal Bell"},
        {"MoveName": "Aromatherapy"},
        {"MoveName": "Confusion"},
        {"MoveName": "Flail"},
        {"MoveName": "Amnesia"},
        {"MoveName": "Nature Power"},
        {"MoveName": "Mega Drain"},
        {"MoveName": "Leech Seed"},
        {"MoveName": "Focus Energy"},
        {"MoveName": "Disable"},
        {"MoveName": "Foresight"},
        {"MoveName": "Stomp"},
        {"MoveName": "Dragon Rage"},
        {"MoveName": "Octazooka"},
        {"MoveName": "Splash"},
        {"MoveName": "Aurora Beam"},
        {"MoveName": "Dragon Breath"},
        {"MoveName": "Haze"},
        {"MoveName": "Hydro Pump"},
        {"MoveName": "Mud Sport"},
        {"MoveName": "Trick"},
        {"MoveName": "Fake Out"},
        {"MoveName": "Hypnosis"},
        {"MoveName": "Mimic"},
        {"MoveName": "Future Sight"},
        {"MoveName": "Endure"},
        {"MoveName": "Silver Wind"},
        {"MoveName": "Baton Pass"},
        {"MoveName": "Ice Punch"},
        {"MoveName": "Meditate"},
        {"MoveName": "Wish"},
        {"MoveName": "Barrier"},
        {"MoveName": "Rolling Kick"},
        {"MoveName": "Fire Punch"},
        {"MoveName": "Cross Chop"},
        {"MoveName": "Karate Chop"},
        {"MoveName": "Mega Punch"},
        {"MoveName": "Thunder Punch"},
        {"MoveName": "Fury Attack"},
        {"MoveName": "False Swipe"},
        {"MoveName": "Feint Attack"},
        {"MoveName": "Horn Drill"},
        {"MoveName": "Tickle"},
        {"MoveName": "Dragon Dance"},
        {"MoveName": "Refresh"},
        {"MoveName": "Slam"},
        {"MoveName": "Supersonic"},
        {"MoveName": "Bubble Beam"},
        {"MoveName": "Spikes"},
        {"MoveName": "Knock Off"},
        {"MoveName": "Confuse Ray"},
        {"MoveName": "Dig"},
        {"MoveName": "Whirlwind"},
        {"MoveName": "Steel Wing"},
        {"MoveName": "Pursuit"},
        {"MoveName": "Lick"},
        {"MoveName": "Double-Edge"},
        {"MoveName": "Mist"},
        {"MoveName": "Vine Whip"},
        {"MoveName": "Covet"},
        {"MoveName": "Howl"},
        {"MoveName": "Thrash"},
        {"MoveName": "Fury Swipes"},
        {"MoveName": "Quick Attack"},
        {"MoveName": "Dragon Claw"},
        {"MoveName": "Water Sport"},
        {"MoveName": "Air Cutter"},
        {"MoveName": "Assist"},
        {"MoveName": "Slash"},
        {"MoveName": "Feather Dance"},
        {"MoveName": "Mirror Move"},
        {"MoveName": "Wing Attack"},
        {"MoveName": "Sky Attack"},
        {"MoveName": "Bide"},
        {"MoveName": "Sonic Boom"},
        {"MoveName": "Signal Beam"},
        {"MoveName": "Gust"},
        {"MoveName": "Double Slap"},
        {"MoveName": "Charge"},
        {"MoveName": "Encore"},
        {"MoveName": "Fake Tears"},
        {"MoveName": "Peck"},
        {"MoveName": "Drill Peck"},
        {"MoveName": "Take Down"},
        {"MoveName": "Odor Sleuth"},
        {"MoveName": "Razor Leaf"},
        {"MoveName": "Sing"},
        {"MoveName": "Self-Destruct"},
        {"MoveName": "Ice Ball"},
        {"MoveName": "Flame Wheel"},
        {"MoveName": "Uproar"},
        {"MoveName": "Swagger"},
        {"MoveName": "Bite"},
        {"MoveName": "Spite"},
        {"MoveName": "Agility"},
        {"MoveName": "Beat Up"},
        {"MoveName": "Leech Life"},
        {"MoveName": "Spit Up"},
        {"MoveName": "Stockpile"},
        {"MoveName": "Swallow"},
        {"MoveName": "Imprison"},
        {"MoveName": "Magic Coat"},
        {"MoveName": "Pin Missile"},
        {"MoveName": "Swift"},
        {"MoveName": "Sand Tomb"},
        {"MoveName": "Headbutt"},
        {"MoveName": "Astonish"},
        {"MoveName": "Razor Wind"},
        {"MoveName": "Metal Claw"},
        {"MoveName": "Block"},
        {"MoveName": "Explosion"},
        {"MoveName": "Scary Face"},
        {"MoveName": "Tri Attack"},
        {"MoveName": "Sweet Scent"},
        {"MoveName": "Harden"},
        {"MoveName": "Yawn"},
        {"MoveName": "Seismic Toss"},
        {"MoveName": "Heat Wave"},
        {"MoveName": "Acid Armor"},
        {"MoveName": "Mud Shot"},
        {"MoveName": "Icicle Spear"},
        {"MoveName": "Thunder Wave"},
        {"MoveName": "Rock Blast"},
        {"MoveName": "Twister"},
        {"MoveName": "Rage"},
        {"MoveName": "Fire Spin"},
        {"MoveName": "Poison Fang"},
        {"MoveName": "Fissure"},
        {"MoveName": "Extrasensory"},
        {"MoveName": "Outrage"},
        {"MoveName": "Endeavor"},
        {"MoveName": "Mirror Coat"},
        {"MoveName": "Leer"},
        {"MoveName": "Water Gun"},
        {"MoveName": "Memento"},
        {"MoveName": "Mean Look"},
        {"MoveName": "Detect"},
        {"MoveName": "Revenge"},
        {"MoveName": "Dynamic Punch"},
        {"MoveName": "Rollout"},
        {"MoveName": "Recover"},
        {"MoveName": "Growth"},
        {"MoveName": "Cotton Spore"},
        {"MoveName": "Smog"},
        {"MoveName": "Dream Eater"},
        {"MoveName": "Defense Curl"},
        {"MoveName": "Eruption"},
        {"MoveName": "Teeter Dance"},
        {"MoveName": "Acid"},
        {"MoveName": "Double Kick"},
        {"MoveName": "Roar"},
        {"MoveName": "Spark"},
        {"MoveName": "Whirlpool"},
        {"MoveName": "Grudge"},
        {"MoveName": "Giga Drain"},
        {"MoveName": "Psychic"},
        {"MoveName": "Shadow Punch"},
        {"MoveName": "Role Play"}
        ],
      }
  },

   methods:{
    setVisibilty(query){ //use this function to make required dropdowns visible for appropriate queries
      this.setAllHidden();
      switch(query){
        case '1':{ this.eggGroupVisible = true; break;}
        case '2':{ this.pokemonNameVisible = true; break;} 
        case '3':{ this.pokemonNameVisible = true; break;} 
        case '4':{ this.pokemonNameVisible = true; break;} 
        case '5':{ this.typeVisible = true; break;}
        case '6':{ this.typeVisible = true; this.secondTypeVisible = true; break;}
        case '7':{ this.trainerNameVisible = true; break;}
        case '8':{ this.trainerClassVisible = true; break;}
        case '9':{ this.trainerClassVisible = true; break;}
        case '10':{ this.levelSelectVisible = true; break;}
        case '11':{ break;} //nothing needed
        case '12':{ break;} //nothing needed
        case '13':{ break;}
        case '14':{ break;}
        case '15':{ break;}
        case '16':{ break;}
        case '17':{ break;}
        case '18':{ break;}
        case '19':{ break;}
        case '20':{ break;}
        case '21':{ break;}
        case '22':{ break;}
        case '23':{ break;}
        case '24':{ break;}
        case '25':{ break;}
        case '26':{ break;}
        case '27':{ break;}
        case '28':{ break;}
        case '29':{ break;}
        case '30':{ break;}
        case '31':{ break;}
        case '32':{ break;}
        case '33':{ break;}
        case '34':{ break;}
        case '35':{ break;}
        case '36':{ break;}
        case '37':{ break;}
        case '38':{ break;}
        case '39':{ break;}
        case '40':{ break;}
        case '41':{ break;}
        case '42':{ break;}
        case '43':{ break;}
        case '44':{ break;}
        case '45':{ break;}
        case '46':{ break;}
        case '47':{ break;}
        case '48':{ break;}
        case '49':{ break;}
        case '50':{ break;}
        case '51':{ break;}
        case '52':{ break;}
        case '53':{ break;}
        case '54':{ break;}
        case '55':{ break;}
        case '56':{ break;}
        case '57':{ break;}
        case '58':{ break;}
        case '59':{ break;}
        case '60':{ break;}
       }
    },

    setAllHidden(){
        //FIGURE OUT HOW TO RESET ALL SELECTED VALUES!!

        //set all Visible tags to false
        this.locationVisible = false;
        this.abilityVisible = false;
        this.typeVisible = false;
        this.secondTypeVisible = false;
        this.trainerNameVisible = false;
        this.trainerClassVisible = false;
        this.pokemonNameVisible = false;
        this.eggGroupVisible = false;
        this.levelSelectVisible = false;
    }
  },

  computed: {
    //make sure all appropriate values are selected for selected query
    vaidateQuery(){
      this.setVisibilty(this.selectQuery.id);
      if(this.selectQuery.id!=0){//make sure to change these tests
        return true;
      } 
      return false;
    },

    //should be triggered by a 'query' button - currently placeholder doesnt do shit
    updateQuery(){
      if(this.vaidateQuery){
        return "use this concept to diplay query results prolly";
      }
      return "";//required for computed property apparently
    },

  },


}

</script>



<style>

  .INTERACThome{
      padding:25px;
  }  

</style>
