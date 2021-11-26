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
          { value: 'The locations that a Pokemon with two given types can be found', id: '6' }, //NEED TO ALLOW MULTIPLE SELECTIONS HERE
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

        //idk what the max level should be
        //http://www.mynikko.com/tools/tool_incrementstr.html
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
          {Level: 101},
          {Level: 102},
          {Level: 103},
          {Level: 104},
          {Level: 105},
          {Level: 106},
          {Level: 107},
          {Level: 108},
          {Level: 109},
          {Level: 110},
          {Level: 111},
          {Level: 112},
          {Level: 113},
          {Level: 114},
          {Level: 115},
          {Level: 116},
          {Level: 117},
          {Level: 118},
          {Level: 119},
          {Level: 120},
          {Level: 121},
          {Level: 122},
          {Level: 123},
          {Level: 124},
          {Level: 125},
          {Level: 126},
          {Level: 127},
          {Level: 128},
          {Level: 129},
          {Level: 130},
          {Level: 131},
          {Level: 132},
          {Level: 133},
          {Level: 134},
          {Level: 135},
          {Level: 136},
          {Level: 137},
          {Level: 138},
          {Level: 139},
          {Level: 140},
          {Level: 141},
          {Level: 142},
          {Level: 143},
          {Level: 144},
          {Level: 145},
          {Level: 146},
          {Level: 147},
          {Level: 148},
          {Level: 149},
          {Level: 150},
          {Level: 151},
          {Level: 152},
          {Level: 153},
          {Level: 154},
          {Level: 155},
          {Level: 156},
          {Level: 157},
          {Level: 158},
          {Level: 159},
          {Level: 160},
          {Level: 161},
          {Level: 162},
          {Level: 163},
          {Level: 164},
          {Level: 165},
          {Level: 166},
          {Level: 167},
          {Level: 168},
          {Level: 169},
          {Level: 170},
          {Level: 171},
          {Level: 172},
          {Level: 173},
          {Level: 174},
          {Level: 175},
          {Level: 176},
          {Level: 177},
          {Level: 178},
          {Level: 179},
          {Level: 180},
          {Level: 181},
          {Level: 182},
          {Level: 183},
          {Level: 184},
          {Level: 185},
          {Level: 186},
          {Level: 187},
          {Level: 188},
          {Level: 189},
          {Level: 190},
          {Level: 191},
          {Level: 192},
          {Level: 193},
          {Level: 194},
          {Level: 195},
          {Level: 196},
          {Level: 197},
          {Level: 198},
          {Level: 199},
          {Level: 200},
          {Level: 201},
          {Level: 202},
          {Level: 203},
          {Level: 204},
          {Level: 205},
          {Level: 206},
          {Level: 207},
          {Level: 208},
          {Level: 209},
          {Level: 210},
          {Level: 211},
          {Level: 212},
          {Level: 213},
          {Level: 214},
          {Level: 215},
          {Level: 216},
          {Level: 217},
          {Level: 218},
          {Level: 219},
          {Level: 220},
          {Level: 221},
          {Level: 222},
          {Level: 223},
          {Level: 224},
          {Level: 225},
          {Level: 226},
          {Level: 227},
          {Level: 228},
          {Level: 229},
          {Level: 230},
          {Level: 231},
          {Level: 232},
          {Level: 233},
          {Level: 234},
          {Level: 235},
          {Level: 236},
          {Level: 237},
          {Level: 238},
          {Level: 239},
          {Level: 240},
          {Level: 241},
          {Level: 242},
          {Level: 243},
          {Level: 244},
          {Level: 245},
          {Level: 246},
          {Level: 247},
          {Level: 248},
          {Level: 249},
          {Level: 250},
          {Level: 251},
          {Level: 252},
          {Level: 253},
          {Level: 254},
          {Level: 255},
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

        selectAbility: {Dex: '0', Ability: '0'},
        abilities: [
          {Dex: "1", Ability: "Overgrow"},
          {Dex: "10", Ability: "Shield Dust"},
          {Dex: "100", Ability: "Soundproof"},
          {Dex: "100", Ability: "Static"},
          {Dex: "101", Ability: "Soundproof"},
          {Dex: "101", Ability: "Static"},
          {Dex: "102", Ability: "Chlorophyll"},
          {Dex: "103", Ability: "Chlorophyll"},
          {Dex: "104", Ability: "Lightning Rod"},
          {Dex: "104", Ability: "Rock Head"},
          {Dex: "105", Ability: "Lightning Rod"},
          {Dex: "105", Ability: "Rock Head"},
          {Dex: "106", Ability: "Limber"},
          {Dex: "106", Ability: "Reckless"},
          {Dex: "107", Ability: "Iron Fist"},
          {Dex: "107", Ability: "Keen Eye"},
          {Dex: "108", Ability: "Oblivious"},
          {Dex: "108", Ability: "Own Tempo"},
          {Dex: "109", Ability: "Levitate"},
          {Dex: "109", Ability: "Neutralizing Gas"},
          {Dex: "11", Ability: "Shed Skin"},
          {Dex: "110", Ability: "Levitate"},
          {Dex: "110", Ability: "Neutralizing Gas"},
          {Dex: "111", Ability: "Lightning Rod"},
          {Dex: "111", Ability: "Rock Head"},
          {Dex: "112", Ability: "Lightning Rod"},
          {Dex: "112", Ability: "Rock Head"},
          {Dex: "113", Ability: "Natural Cure"},
          {Dex: "113", Ability: "Serene Grace"},
          {Dex: "114", Ability: "Chlorophyll"},
          {Dex: "114", Ability: "Leaf Guard"},
          {Dex: "115", Ability: "Early Bird"},
          {Dex: "115", Ability: "Scrappy"},
          {Dex: "116", Ability: "Sniper"},
          {Dex: "116", Ability: "Swift Swim"},
          {Dex: "117", Ability: "Poison Point"},
          {Dex: "117", Ability: "Sniper"},
          {Dex: "118", Ability: "Swift Swim"},
          {Dex: "118", Ability: "Water Veil"},
          {Dex: "119", Ability: "Swift Swim"},
          {Dex: "119", Ability: "Water Veil"},
          {Dex: "12", Ability: "Compound Eyes"},
          {Dex: "120", Ability: "Illuminate"},
          {Dex: "120", Ability: "Natural Cure"},
          {Dex: "121", Ability: "Illuminate"},
          {Dex: "121", Ability: "Natural Cure"},
          {Dex: "122", Ability: "Filter"},
          {Dex: "122", Ability: "Soundproof"},
          {Dex: "123", Ability: "Swarm"},
          {Dex: "123", Ability: "Technician"},
          {Dex: "124", Ability: "Forewarn"},
          {Dex: "124", Ability: "Oblivious"},
          {Dex: "125", Ability: "Static"},
          {Dex: "126", Ability: "Flame Body"},
          {Dex: "127", Ability: "Hyper Cutter"},
          {Dex: "127", Ability: "Mold Breaker"},
          {Dex: "128", Ability: "Anger Point"},
          {Dex: "128", Ability: "Intimidate"},
          {Dex: "129", Ability: "Swift Swim"},
          {Dex: "13", Ability: "Shield Dust"},
          {Dex: "130", Ability: "Intimidate"},
          {Dex: "131", Ability: "Shell Armor"},
          {Dex: "131", Ability: "Water Absorb"},
          {Dex: "132", Ability: "Limber"},
          {Dex: "133", Ability: "Adaptability"},
          {Dex: "133", Ability: "Run Away"},
          {Dex: "134", Ability: "Water Absorb"},
          {Dex: "135", Ability: "Volt Absorb"},
          {Dex: "136", Ability: "Flash Fire"},
          {Dex: "137", Ability: "Download"},
          {Dex: "137", Ability: "Trace"},
          {Dex: "138", Ability: "Shell Armor"},
          {Dex: "138", Ability: "Swift Swim"},
          {Dex: "139", Ability: "Shell Armor"},
          {Dex: "139", Ability: "Swift Swim"},
          {Dex: "14", Ability: "Shed Skin"},
          {Dex: "140", Ability: "Battle Armor"},
          {Dex: "140", Ability: "Swift Swim"},
          {Dex: "141", Ability: "Battle Armor"},
          {Dex: "141", Ability: "Swift Swim"},
          {Dex: "142", Ability: "Pressure"},
          {Dex: "142", Ability: "Rock Head"},
          {Dex: "143", Ability: "Immunity"},
          {Dex: "143", Ability: "Thick Fat"},
          {Dex: "144", Ability: "Pressure"},
          {Dex: "145", Ability: "Pressure"},
          {Dex: "146", Ability: "Pressure"},
          {Dex: "147", Ability: "Shed Skin"},
          {Dex: "148", Ability: "Shed Skin"},
          {Dex: "149", Ability: "Inner Focus"},
          {Dex: "15", Ability: "Swarm"},
          {Dex: "150", Ability: "Pressure"},
          {Dex: "151", Ability: "Synchronize"},
          {Dex: "152", Ability: "Overgrow"},
          {Dex: "153", Ability: "Overgrow"},
          {Dex: "154", Ability: "Overgrow"},
          {Dex: "155", Ability: "Blaze"},
          {Dex: "156", Ability: "Blaze"},
          {Dex: "157", Ability: "Blaze"},
          {Dex: "158", Ability: "Torrent"},
          {Dex: "159", Ability: "Torrent"},
          {Dex: "16", Ability: "Keen Eye"},
          {Dex: "16", Ability: "Tangled Feet"},
          {Dex: "160", Ability: "Torrent"},
          {Dex: "161", Ability: "Keen Eye"},
          {Dex: "161", Ability: "Run Away"},
          {Dex: "162", Ability: "Keen Eye"},
          {Dex: "162", Ability: "Run Away"},
          {Dex: "163", Ability: "Insomnia"},
          {Dex: "163", Ability: "Keen Eye"},
          {Dex: "164", Ability: "Insomnia"},
          {Dex: "164", Ability: "Keen Eye"},
          {Dex: "165", Ability: "Early Bird"},
          {Dex: "165", Ability: "Swarm"},
          {Dex: "166", Ability: "Early Bird"},
          {Dex: "166", Ability: "Swarm"},
          {Dex: "167", Ability: "Insomnia"},
          {Dex: "167", Ability: "Swarm"},
          {Dex: "168", Ability: "Insomnia"},
          {Dex: "168", Ability: "Swarm"},
          {Dex: "169", Ability: "Inner Focus"},
          {Dex: "17", Ability: "Keen Eye"},
          {Dex: "17", Ability: "Tangled Feet"},
          {Dex: "170", Ability: "Illuminate"},
          {Dex: "170", Ability: "Volt Absorb"},
          {Dex: "171", Ability: "Illuminate"},
          {Dex: "171", Ability: "Volt Absorb"},
          {Dex: "172", Ability: "Static"},
          {Dex: "173", Ability: "Cute Charm"},
          {Dex: "173", Ability: "Magic Guard"},
          {Dex: "174", Ability: "Competitive"},
          {Dex: "174", Ability: "Cute Charm"},
          {Dex: "175", Ability: "Hustle"},
          {Dex: "175", Ability: "Serene Grace"},
          {Dex: "176", Ability: "Hustle"},
          {Dex: "176", Ability: "Serene Grace"},
          {Dex: "177", Ability: "Early Bird"},
          {Dex: "177", Ability: "Synchronize"},
          {Dex: "178", Ability: "Early Bird"},
          {Dex: "178", Ability: "Synchronize"},
          {Dex: "179", Ability: "Static"},
          {Dex: "18", Ability: "Keen Eye"},
          {Dex: "18", Ability: "Tangled Feet"},
          {Dex: "180", Ability: "Static"},
          {Dex: "181", Ability: "Static"},
          {Dex: "182", Ability: "Chlorophyll"},
          {Dex: "183", Ability: "Huge Power"},
          {Dex: "183", Ability: "Thick Fat"},
          {Dex: "184", Ability: "Huge Power"},
          {Dex: "184", Ability: "Thick Fat"},
          {Dex: "185", Ability: "Rock Head"},
          {Dex: "185", Ability: "Sturdy"},
          {Dex: "186", Ability: "Damp"},
          {Dex: "186", Ability: "Water Absorb"},
          {Dex: "187", Ability: "Chlorophyll"},
          {Dex: "187", Ability: "Leaf Guard"},
          {Dex: "188", Ability: "Chlorophyll"},
          {Dex: "188", Ability: "Leaf Guard"},
          {Dex: "189", Ability: "Chlorophyll"},
          {Dex: "189", Ability: "Leaf Guard"},
          {Dex: "19", Ability: "Guts"},
          {Dex: "19", Ability: "Run Away"},
          {Dex: "190", Ability: "Pickup"},
          {Dex: "190", Ability: "Run Away"},
          {Dex: "191", Ability: "Chlorophyll"},
          {Dex: "191", Ability: "Solar Power"},
          {Dex: "192", Ability: "Chlorophyll"},
          {Dex: "192", Ability: "Solar Power"},
          {Dex: "193", Ability: "Compound Eyes"},
          {Dex: "193", Ability: "Speed Boost"},
          {Dex: "194", Ability: "Damp"},
          {Dex: "194", Ability: "Water Absorb"},
          {Dex: "195", Ability: "Damp"},
          {Dex: "195", Ability: "Water Absorb"},
          {Dex: "196", Ability: "Synchronize"},
          {Dex: "197", Ability: "Synchronize"},
          {Dex: "198", Ability: "Insomnia"},
          {Dex: "198", Ability: "Super Luck"},
          {Dex: "199", Ability: "Oblivious"},
          {Dex: "199", Ability: "Own Tempo"},
          {Dex: "2", Ability: "Overgrow"},
          {Dex: "20", Ability: "Guts"},
          {Dex: "20", Ability: "Run Away"},
          {Dex: "200", Ability: "Levitate"},
          {Dex: "201", Ability: "Levitate"},
          {Dex: "202", Ability: "Shadow Tag"},
          {Dex: "203", Ability: "Early Bird"},
          {Dex: "203", Ability: "Inner Focus"},
          {Dex: "204", Ability: "Sturdy"},
          {Dex: "205", Ability: "Sturdy"},
          {Dex: "206", Ability: "Run Away"},
          {Dex: "206", Ability: "Serene Grace"},
          {Dex: "207", Ability: "Hyper Cutter"},
          {Dex: "207", Ability: "Sand Veil"},
          {Dex: "208", Ability: "Rock Head"},
          {Dex: "208", Ability: "Sturdy"},
          {Dex: "209", Ability: "Intimidate"},
          {Dex: "209", Ability: "Run Away"},
          {Dex: "21", Ability: "Keen Eye"},
          {Dex: "210", Ability: "Intimidate"},
          {Dex: "210", Ability: "Quick Feet"},
          {Dex: "211", Ability: "Poison Point"},
          {Dex: "211", Ability: "Swift Swim"},
          {Dex: "212", Ability: "Swarm"},
          {Dex: "212", Ability: "Technician"},
          {Dex: "213", Ability: "Gluttony"},
          {Dex: "213", Ability: "Sturdy"},
          {Dex: "214", Ability: "Guts"},
          {Dex: "214", Ability: "Swarm"},
          {Dex: "215", Ability: "Inner Focus"},
          {Dex: "215", Ability: "Keen Eye"},
          {Dex: "216", Ability: "Pickup"},
          {Dex: "216", Ability: "Quick Feet"},
          {Dex: "217", Ability: "Guts"},
          {Dex: "217", Ability: "Quick Feet"},
          {Dex: "218", Ability: "Flame Body"},
          {Dex: "218", Ability: "Magma Armor"},
          {Dex: "219", Ability: "Flame Body"},
          {Dex: "219", Ability: "Magma Armor"},
          {Dex: "22", Ability: "Keen Eye"},
          {Dex: "220", Ability: "Oblivious"},
          {Dex: "220", Ability: "Snow Cloak"},
          {Dex: "221", Ability: "Oblivious"},
          {Dex: "221", Ability: "Snow Cloak"},
          {Dex: "222", Ability: "Hustle"},
          {Dex: "222", Ability: "Natural Cure"},
          {Dex: "223", Ability: "Hustle"},
          {Dex: "223", Ability: "Sniper"},
          {Dex: "224", Ability: "Sniper"},
          {Dex: "224", Ability: "Suction Cups"},
          {Dex: "225", Ability: "Hustle"},
          {Dex: "225", Ability: "Vital Spirit"},
          {Dex: "226", Ability: "Swift Swim"},
          {Dex: "226", Ability: "Water Absorb"},
          {Dex: "227", Ability: "Keen Eye"},
          {Dex: "227", Ability: "Sturdy"},
          {Dex: "228", Ability: "Early Bird"},
          {Dex: "228", Ability: "Flash Fire"},
          {Dex: "229", Ability: "Early Bird"},
          {Dex: "229", Ability: "Flash Fire"},
          {Dex: "23", Ability: "Intimidate"},
          {Dex: "23", Ability: "Shed Skin"},
          {Dex: "230", Ability: "Sniper"},
          {Dex: "230", Ability: "Swift Swim"},
          {Dex: "231", Ability: "Pickup"},
          {Dex: "232", Ability: "Sturdy"},
          {Dex: "233", Ability: "Download"},
          {Dex: "233", Ability: "Trace"},
          {Dex: "234", Ability: "Frisk"},
          {Dex: "234", Ability: "Intimidate"},
          {Dex: "235", Ability: "Own Tempo"},
          {Dex: "235", Ability: "Technician"},
          {Dex: "236", Ability: "Guts"},
          {Dex: "236", Ability: "Steadfast"},
          {Dex: "237", Ability: "Intimidate"},
          {Dex: "237", Ability: "Technician"},
          {Dex: "238", Ability: "Forewarn"},
          {Dex: "238", Ability: "Oblivious"},
          {Dex: "239", Ability: "Static"},
          {Dex: "24", Ability: "Intimidate"},
          {Dex: "24", Ability: "Shed Skin"},
          {Dex: "240", Ability: "Flame Body"},
          {Dex: "241", Ability: "Scrappy"},
          {Dex: "241", Ability: "Thick Fat"},
          {Dex: "242", Ability: "Natural Cure"},
          {Dex: "242", Ability: "Serene Grace"},
          {Dex: "243", Ability: "Pressure"},
          {Dex: "244", Ability: "Pressure"},
          {Dex: "245", Ability: "Pressure"},
          {Dex: "246", Ability: "Guts"},
          {Dex: "247", Ability: "Shed Skin"},
          {Dex: "248", Ability: "Sand Stream"},
          {Dex: "249", Ability: "Pressure"},
          {Dex: "25", Ability: "Static"},
          {Dex: "250", Ability: "Pressure"},
          {Dex: "251", Ability: "Natural Cure"},
          {Dex: "252", Ability: "Overgrow"},
          {Dex: "253", Ability: "Overgrow"},
          {Dex: "254", Ability: "Overgrow"},
          {Dex: "255", Ability: "Blaze"},
          {Dex: "256", Ability: "Blaze"},
          {Dex: "257", Ability: "Blaze"},
          {Dex: "258", Ability: "Torrent"},
          {Dex: "259", Ability: "Torrent"},
          {Dex: "26", Ability: "Static"},
          {Dex: "260", Ability: "Torrent"},
          {Dex: "261", Ability: "Quick Feet"},
          {Dex: "261", Ability: "Run Away"},
          {Dex: "262", Ability: "Intimidate"},
          {Dex: "262", Ability: "Quick Feet"},
          {Dex: "263", Ability: "Gluttony"},
          {Dex: "263", Ability: "Pickup"},
          {Dex: "264", Ability: "Gluttony"},
          {Dex: "264", Ability: "Pickup"},
          {Dex: "265", Ability: "Shield Dust"},
          {Dex: "266", Ability: "Shed Skin"},
          {Dex: "267", Ability: "Swarm"},
          {Dex: "268", Ability: "Shed Skin"},
          {Dex: "269", Ability: "Shield Dust"},
          {Dex: "27", Ability: "Sand Veil"},
          {Dex: "270", Ability: "Rain Dish"},
          {Dex: "270", Ability: "Swift Swim"},
          {Dex: "271", Ability: "Rain Dish"},
          {Dex: "271", Ability: "Swift Swim"},
          {Dex: "272", Ability: "Rain Dish"},
          {Dex: "272", Ability: "Swift Swim"},
          {Dex: "273", Ability: "Chlorophyll"},
          {Dex: "273", Ability: "Early Bird"},
          {Dex: "274", Ability: "Chlorophyll"},
          {Dex: "274", Ability: "Early Bird"},
          {Dex: "275", Ability: "Chlorophyll"},
          {Dex: "275", Ability: "Early Bird"},
          {Dex: "276", Ability: "Guts"},
          {Dex: "277", Ability: "Guts"},
          {Dex: "278", Ability: "Hydration"},
          {Dex: "278", Ability: "Keen Eye"},
          {Dex: "279", Ability: "Drizzle"},
          {Dex: "279", Ability: "Keen Eye"},
          {Dex: "28", Ability: "Sand Veil"},
          {Dex: "280", Ability: "Synchronize"},
          {Dex: "280", Ability: "Trace"},
          {Dex: "281", Ability: "Synchronize"},
          {Dex: "281", Ability: "Trace"},
          {Dex: "282", Ability: "Synchronize"},
          {Dex: "282", Ability: "Trace"},
          {Dex: "283", Ability: "Swift Swim"},
          {Dex: "284", Ability: "Intimidate"},
          {Dex: "285", Ability: "Effect Spore"},
          {Dex: "285", Ability: "Poison Heal"},
          {Dex: "286", Ability: "Effect Spore"},
          {Dex: "286", Ability: "Poison Heal"},
          {Dex: "287", Ability: "Truant"},
          {Dex: "288", Ability: "Vital Spirit"},
          {Dex: "289", Ability: "Truant"},
          {Dex: "29", Ability: "Poison Point"},
          {Dex: "29", Ability: "Rivalry"},
          {Dex: "290", Ability: "Compound Eyes"},
          {Dex: "291", Ability: "Speed Boost"},
          {Dex: "292", Ability: "Wonder Guard"},
          {Dex: "293", Ability: "Soundproof"},
          {Dex: "294", Ability: "Soundproof"},
          {Dex: "295", Ability: "Soundproof"},
          {Dex: "296", Ability: "Guts"},
          {Dex: "296", Ability: "Thick Fat"},
          {Dex: "297", Ability: "Guts"},
          {Dex: "297", Ability: "Thick Fat"},
          {Dex: "298", Ability: "Huge Power"},
          {Dex: "298", Ability: "Thick Fat"},
          {Dex: "299", Ability: "Magnet Pull"},
          {Dex: "299", Ability: "Sturdy"},
          {Dex: "3", Ability: "Overgrow"},
          {Dex: "30", Ability: "Poison Point"},
          {Dex: "30", Ability: "Rivalry"},
          {Dex: "300", Ability: "Cute Charm"},
          {Dex: "300", Ability: "Normalize"},
          {Dex: "301", Ability: "Cute Charm"},
          {Dex: "301", Ability: "Normalize"},
          {Dex: "302", Ability: "Keen Eye"},
          {Dex: "302", Ability: "Stall"},
          {Dex: "303", Ability: "Hyper Cutter"},
          {Dex: "303", Ability: "Intimidate"},
          {Dex: "304", Ability: "Rock Head"},
          {Dex: "304", Ability: "Sturdy"},
          {Dex: "305", Ability: "Rock Head"},
          {Dex: "305", Ability: "Sturdy"},
          {Dex: "306", Ability: "Rock Head"},
          {Dex: "306", Ability: "Sturdy"},
          {Dex: "307", Ability: "Pure Power"},
          {Dex: "308", Ability: "Pure Power"},
          {Dex: "309", Ability: "Lightning Rod"},
          {Dex: "309", Ability: "Static"},
          {Dex: "31", Ability: "Poison Point"},
          {Dex: "31", Ability: "Rivalry"},
          {Dex: "310", Ability: "Lightning Rod"},
          {Dex: "310", Ability: "Static"},
          {Dex: "311", Ability: "Plus"},
          {Dex: "312", Ability: "Minus"},
          {Dex: "313", Ability: "Illuminate"},
          {Dex: "313", Ability: "Swarm"},
          {Dex: "314", Ability: "Oblivious"},
          {Dex: "314", Ability: "Tinted Lens"},
          {Dex: "315", Ability: "Natural Cure"},
          {Dex: "315", Ability: "Poison Point"},
          {Dex: "316", Ability: "Liquid Ooze"},
          {Dex: "316", Ability: "Sticky Hold"},
          {Dex: "317", Ability: "Liquid Ooze"},
          {Dex: "317", Ability: "Sticky Hold"},
          {Dex: "318", Ability: "Rough Skin"},
          {Dex: "319", Ability: "Rough Skin"},
          {Dex: "32", Ability: "Poison Point"},
          {Dex: "32", Ability: "Rivalry"},
          {Dex: "320", Ability: "Oblivious"},
          {Dex: "320", Ability: "Water Veil"},
          {Dex: "321", Ability: "Oblivious"},
          {Dex: "321", Ability: "Water Veil"},
          {Dex: "322", Ability: "Oblivious"},
          {Dex: "322", Ability: "Simple"},
          {Dex: "323", Ability: "Magma Armor"},
          {Dex: "323", Ability: "Solid Rock"},
          {Dex: "324", Ability: "Drought"},
          {Dex: "324", Ability: "White Smoke"},
          {Dex: "325", Ability: "Own Tempo"},
          {Dex: "325", Ability: "Thick Fat"},
          {Dex: "326", Ability: "Own Tempo"},
          {Dex: "326", Ability: "Thick Fat"},
          {Dex: "327", Ability: "Own Tempo"},
          {Dex: "327", Ability: "Tangled Feet"},
          {Dex: "328", Ability: "Arena Trap"},
          {Dex: "328", Ability: "Hyper Cutter"},
          {Dex: "329", Ability: "Levitate"},
          {Dex: "33", Ability: "Poison Point"},
          {Dex: "33", Ability: "Rivalry"},
          {Dex: "330", Ability: "Levitate"},
          {Dex: "331", Ability: "Sand Veil"},
          {Dex: "332", Ability: "Sand Veil"},
          {Dex: "333", Ability: "Natural Cure"},
          {Dex: "334", Ability: "Natural Cure"},
          {Dex: "335", Ability: "Immunity"},
          {Dex: "336", Ability: "Shed Skin"},
          {Dex: "337", Ability: "Levitate"},
          {Dex: "338", Ability: "Levitate"},
          {Dex: "339", Ability: "Anticipation"},
          {Dex: "339", Ability: "Oblivious"},
          {Dex: "34", Ability: "Poison Point"},
          {Dex: "34", Ability: "Rivalry"},
          {Dex: "340", Ability: "Anticipation"},
          {Dex: "340", Ability: "Oblivious"},
          {Dex: "341", Ability: "Hyper Cutter"},
          {Dex: "341", Ability: "Shell Armor"},
          {Dex: "342", Ability: "Hyper Cutter"},
          {Dex: "342", Ability: "Shell Armor"},
          {Dex: "343", Ability: "Levitate"},
          {Dex: "344", Ability: "Levitate"},
          {Dex: "345", Ability: "Suction Cups"},
          {Dex: "346", Ability: "Suction Cups"},
          {Dex: "347", Ability: "Battle Armor"},
          {Dex: "348", Ability: "Battle Armor"},
          {Dex: "349", Ability: "Oblivious"},
          {Dex: "349", Ability: "Swift Swim"},
          {Dex: "35", Ability: "Cute Charm"},
          {Dex: "35", Ability: "Magic Guard"},
          {Dex: "350", Ability: "Competitive"},
          {Dex: "350", Ability: "Marvel Scale"},
          {Dex: "351", Ability: "Forecast"},
          {Dex: "352", Ability: "Color Change"},
          {Dex: "353", Ability: "Frisk"},
          {Dex: "353", Ability: "Insomnia"},
          {Dex: "354", Ability: "Frisk"},
          {Dex: "354", Ability: "Insomnia"},
          {Dex: "355", Ability: "Levitate"},
          {Dex: "356", Ability: "Pressure"},
          {Dex: "357", Ability: "Chlorophyll"},
          {Dex: "357", Ability: "Solar Power"},
          {Dex: "358", Ability: "Levitate"},
          {Dex: "359", Ability: "Pressure"},
          {Dex: "359", Ability: "Super Luck"},
          {Dex: "36", Ability: "Cute Charm"},
          {Dex: "36", Ability: "Magic Guard"},
          {Dex: "360", Ability: "Shadow Tag"},
          {Dex: "361", Ability: "Ice Body"},
          {Dex: "361", Ability: "Inner Focus"},
          {Dex: "362", Ability: "Ice Body"},
          {Dex: "362", Ability: "Inner Focus"},
          {Dex: "363", Ability: "Ice Body"},
          {Dex: "363", Ability: "Thick Fat"},
          {Dex: "364", Ability: "Ice Body"},
          {Dex: "364", Ability: "Thick Fat"},
          {Dex: "365", Ability: "Ice Body"},
          {Dex: "365", Ability: "Thick Fat"},
          {Dex: "366", Ability: "Shell Armor"},
          {Dex: "367", Ability: "Swift Swim"},
          {Dex: "368", Ability: "Swift Swim"},
          {Dex: "369", Ability: "Rock Head"},
          {Dex: "369", Ability: "Swift Swim"},
          {Dex: "37", Ability: "Flash Fire"},
          {Dex: "370", Ability: "Swift Swim"},
          {Dex: "371", Ability: "Rock Head"},
          {Dex: "372", Ability: "Rock Head"},
          {Dex: "373", Ability: "Intimidate"},
          {Dex: "374", Ability: "Clear Body"},
          {Dex: "375", Ability: "Clear Body"},
          {Dex: "376", Ability: "Clear Body"},
          {Dex: "377", Ability: "Clear Body"},
          {Dex: "378", Ability: "Clear Body"},
          {Dex: "379", Ability: "Clear Body"},
          {Dex: "38", Ability: "Flash Fire"},
          {Dex: "380", Ability: "Levitate"},
          {Dex: "381", Ability: "Levitate"},
          {Dex: "382", Ability: "Drizzle"},
          {Dex: "383", Ability: "Drought"},
          {Dex: "384", Ability: "Air Lock"},
          {Dex: "385", Ability: "Serene Grace"},
          {Dex: "386", Ability: "Pressure"},
          {Dex: "39", Ability: "Competitive"},
          {Dex: "39", Ability: "Cute Charm"},
          {Dex: "4", Ability: "Blaze"},
          {Dex: "40", Ability: "Competitive"},
          {Dex: "40", Ability: "Cute Charm"},
          {Dex: "41", Ability: "Inner Focus"},
          {Dex: "42", Ability: "Inner Focus"},
          {Dex: "43", Ability: "Chlorophyll"},
          {Dex: "44", Ability: "Chlorophyll"},
          {Dex: "45", Ability: "Chlorophyll"},
          {Dex: "46", Ability: "Dry Skin"},
          {Dex: "46", Ability: "Effect Spore"},
          {Dex: "47", Ability: "Dry Skin"},
          {Dex: "47", Ability: "Effect Spore"},
          {Dex: "48", Ability: "Compound Eyes"},
          {Dex: "48", Ability: "Tinted Lens"},
          {Dex: "49", Ability: "Shield Dust"},
          {Dex: "49", Ability: "Tinted Lens"},
          {Dex: "5", Ability: "Blaze"},
          {Dex: "50", Ability: "Arena Trap"},
          {Dex: "50", Ability: "Sand Veil"},
          {Dex: "51", Ability: "Arena Trap"},
          {Dex: "51", Ability: "Sand Veil"},
          {Dex: "52", Ability: "Pickup"},
          {Dex: "52", Ability: "Technician"},
          {Dex: "53", Ability: "Limber"},
          {Dex: "53", Ability: "Technician"},
          {Dex: "54", Ability: "Cloud Nine"},
          {Dex: "54", Ability: "Damp"},
          {Dex: "55", Ability: "Cloud Nine"},
          {Dex: "55", Ability: "Damp"},
          {Dex: "56", Ability: "Anger Point"},
          {Dex: "56", Ability: "Vital Spirit"},
          {Dex: "57", Ability: "Anger Point"},
          {Dex: "57", Ability: "Vital Spirit"},
          {Dex: "58", Ability: "Flash Fire"},
          {Dex: "58", Ability: "Intimidate"},
          {Dex: "59", Ability: "Flash Fire"},
          {Dex: "59", Ability: "Intimidate"},
          {Dex: "6", Ability: "Blaze"},
          {Dex: "60", Ability: "Damp"},
          {Dex: "60", Ability: "Water Absorb"},
          {Dex: "61", Ability: "Damp"},
          {Dex: "61", Ability: "Water Absorb"},
          {Dex: "62", Ability: "Damp"},
          {Dex: "62", Ability: "Water Absorb"},
          {Dex: "63", Ability: "Inner Focus"},
          {Dex: "63", Ability: "Synchronize"},
          {Dex: "64", Ability: "Inner Focus"},
          {Dex: "64", Ability: "Synchronize"},
          {Dex: "65", Ability: "Inner Focus"},
          {Dex: "65", Ability: "Synchronize"},
          {Dex: "66", Ability: "Guts"},
          {Dex: "66", Ability: "No Guard"},
          {Dex: "67", Ability: "Guts"},
          {Dex: "67", Ability: "No Guard"},
          {Dex: "68", Ability: "Guts"},
          {Dex: "68", Ability: "No Guard"},
          {Dex: "69", Ability: "Chlorophyll"},
          {Dex: "7", Ability: "Torrent"},
          {Dex: "70", Ability: "Chlorophyll"},
          {Dex: "71", Ability: "Chlorophyll"},
          {Dex: "72", Ability: "Clear Body"},
          {Dex: "72", Ability: "Liquid Ooze"},
          {Dex: "73", Ability: "Clear Body"},
          {Dex: "73", Ability: "Liquid Ooze"},
          {Dex: "74", Ability: "Rock Head"},
          {Dex: "74", Ability: "Sturdy"},
          {Dex: "75", Ability: "Rock Head"},
          {Dex: "75", Ability: "Sturdy"},
          {Dex: "76", Ability: "Rock Head"},
          {Dex: "76", Ability: "Sturdy"},
          {Dex: "77", Ability: "Flash Fire"},
          {Dex: "77", Ability: "Run Away"},
          {Dex: "78", Ability: "Flash Fire"},
          {Dex: "78", Ability: "Run Away"},
          {Dex: "79", Ability: "Oblivious"},
          {Dex: "79", Ability: "Own Tempo"},
          {Dex: "8", Ability: "Torrent"},
          {Dex: "80", Ability: "Oblivious"},
          {Dex: "80", Ability: "Own Tempo"},
          {Dex: "81", Ability: "Magnet Pull"},
          {Dex: "81", Ability: "Sturdy"},
          {Dex: "82", Ability: "Magnet Pull"},
          {Dex: "82", Ability: "Sturdy"},
          {Dex: "83", Ability: "Inner Focus"},
          {Dex: "83", Ability: "Keen Eye"},
          {Dex: "84", Ability: "Early Bird"},
          {Dex: "84", Ability: "Run Away"},
          {Dex: "85", Ability: "Early Bird"},
          {Dex: "85", Ability: "Run Away"},
          {Dex: "86", Ability: "Hydration"},
          {Dex: "86", Ability: "Thick Fat"},
          {Dex: "87", Ability: "Hydration"},
          {Dex: "87", Ability: "Thick Fat"},
          {Dex: "88", Ability: "Stench"},
          {Dex: "88", Ability: "Sticky Hold"},
          {Dex: "89", Ability: "Stench"},
          {Dex: "89", Ability: "Sticky Hold"},
          {Dex: "9", Ability: "Torrent"},
          {Dex: "90", Ability: "Shell Armor"},
          {Dex: "90", Ability: "Skill Link"},
          {Dex: "91", Ability: "Shell Armor"},
          {Dex: "91", Ability: "Skill Link"},
          {Dex: "92", Ability: "Levitate"},
          {Dex: "93", Ability: "Levitate"},
          {Dex: "94", Ability: "Cursed Body"},
          {Dex: "95", Ability: "Rock Head"},
          {Dex: "95", Ability: "Sturdy"},
          {Dex: "96", Ability: "Forewarn"},
          {Dex: "96", Ability: "Insomnia"},
          {Dex: "97", Ability: "Forewarn"},
          {Dex: "97", Ability: "Insomnia"},
          {Dex: "98", Ability: "Hyper Cutter"},
          {Dex: "98", Ability: "Shell Armor"},
          {Dex: "99", Ability: "Hyper Cutter"},
          {Dex: "99", Ability: "Shell Armor"}
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

        //dunno y 3 values
        selectEffectiveness:{},
        effectiveness: [
        {
            "Attacker": "???",
            "Defender": "???",
            "Quality": "1.0"
        },
        {
            "Attacker": "???",
            "Defender": "Bug",
            "Quality": "1.0"
        },
        {
            "Attacker": "???",
            "Defender": "Dark",
            "Quality": "1.0"
        },
        {
            "Attacker": "???",
            "Defender": "Dragon",
            "Quality": "1.0"
        },
        {
            "Attacker": "???",
            "Defender": "Electric",
            "Quality": "1.0"
        },
        {
            "Attacker": "???",
            "Defender": "Fighting",
            "Quality": "1.0"
        },
        {
            "Attacker": "???",
            "Defender": "Fire",
            "Quality": "1.0"
        },
        {
            "Attacker": "???",
            "Defender": "Flying",
            "Quality": "1.0"
        },
        {
            "Attacker": "???",
            "Defender": "Ghost",
            "Quality": "1.0"
        },
        {
            "Attacker": "???",
            "Defender": "Grass",
            "Quality": "1.0"
        },
        {
            "Attacker": "???",
            "Defender": "Ground",
            "Quality": "1.0"
        },
        {
            "Attacker": "???",
            "Defender": "Ice",
            "Quality": "1.0"
        },
        {
            "Attacker": "???",
            "Defender": "Normal",
            "Quality": "1.0"
        },
        {
            "Attacker": "???",
            "Defender": "Poison",
            "Quality": "1.0"
        },
        {
            "Attacker": "???",
            "Defender": "Psychic",
            "Quality": "1.0"
        },
        {
            "Attacker": "???",
            "Defender": "Rock",
            "Quality": "1.0"
        },
        {
            "Attacker": "???",
            "Defender": "Steel",
            "Quality": "1.0"
        },
        {
            "Attacker": "???",
            "Defender": "Water",
            "Quality": "1.0"
        },
        {
            "Attacker": "Bug",
            "Defender": "???",
            "Quality": "1.0"
        },
        {
            "Attacker": "Bug",
            "Defender": "Bug",
            "Quality": "1.0"
        },
        {
            "Attacker": "Bug",
            "Defender": "Dark",
            "Quality": "2.0"
        },
        {
            "Attacker": "Bug",
            "Defender": "Dragon",
            "Quality": "1.0"
        },
        {
            "Attacker": "Bug",
            "Defender": "Electric",
            "Quality": "1.0"
        },
        {
            "Attacker": "Bug",
            "Defender": "Fighting",
            "Quality": "0.5"
        },
        {
            "Attacker": "Bug",
            "Defender": "Fire",
            "Quality": "0.5"
        },
        {
            "Attacker": "Bug",
            "Defender": "Flying",
            "Quality": "0.5"
        },
        {
            "Attacker": "Bug",
            "Defender": "Ghost",
            "Quality": "0.5"
        },
        {
            "Attacker": "Bug",
            "Defender": "Grass",
            "Quality": "2.0"
        },
        {
            "Attacker": "Bug",
            "Defender": "Ground",
            "Quality": "1.0"
        },
        {
            "Attacker": "Bug",
            "Defender": "Ice",
            "Quality": "1.0"
        },
        {
            "Attacker": "Bug",
            "Defender": "Normal",
            "Quality": "1.0"
        },
        {
            "Attacker": "Bug",
            "Defender": "Poison",
            "Quality": "0.5"
        },
        {
            "Attacker": "Bug",
            "Defender": "Psychic",
            "Quality": "2.0"
        },
        {
            "Attacker": "Bug",
            "Defender": "Rock",
            "Quality": "1.0"
        },
        {
            "Attacker": "Bug",
            "Defender": "Steel",
            "Quality": "0.5"
        },
        {
            "Attacker": "Bug",
            "Defender": "Water",
            "Quality": "1.0"
        },
        {
            "Attacker": "Dark",
            "Defender": "???",
            "Quality": "1.0"
        },
        {
            "Attacker": "Dark",
            "Defender": "Bug",
            "Quality": "1.0"
        },
        {
            "Attacker": "Dark",
            "Defender": "Dark",
            "Quality": "0.5"
        },
        {
            "Attacker": "Dark",
            "Defender": "Dragon",
            "Quality": "1.0"
        },
        {
            "Attacker": "Dark",
            "Defender": "Electric",
            "Quality": "1.0"
        },
        {
            "Attacker": "Dark",
            "Defender": "Fighting",
            "Quality": "0.5"
        },
        {
            "Attacker": "Dark",
            "Defender": "Fire",
            "Quality": "1.0"
        },
        {
            "Attacker": "Dark",
            "Defender": "Flying",
            "Quality": "1.0"
        },
        {
            "Attacker": "Dark",
            "Defender": "Ghost",
            "Quality": "2.0"
        },
        {
            "Attacker": "Dark",
            "Defender": "Grass",
            "Quality": "1.0"
        },
        {
            "Attacker": "Dark",
            "Defender": "Ground",
            "Quality": "1.0"
        },
        {
            "Attacker": "Dark",
            "Defender": "Ice",
            "Quality": "1.0"
        },
        {
            "Attacker": "Dark",
            "Defender": "Normal",
            "Quality": "1.0"
        },
        {
            "Attacker": "Dark",
            "Defender": "Poison",
            "Quality": "1.0"
        },
        {
            "Attacker": "Dark",
            "Defender": "Psychic",
            "Quality": "2.0"
        },
        {
            "Attacker": "Dark",
            "Defender": "Rock",
            "Quality": "1.0"
        },
        {
            "Attacker": "Dark",
            "Defender": "Steel",
            "Quality": "1.0"
        },
        {
            "Attacker": "Dark",
            "Defender": "Water",
            "Quality": "1.0"
        },
        {
            "Attacker": "Dragon",
            "Defender": "???",
            "Quality": "1.0"
        },
        {
            "Attacker": "Dragon",
            "Defender": "Bug",
            "Quality": "1.0"
        },
        {
            "Attacker": "Dragon",
            "Defender": "Dark",
            "Quality": "1.0"
        },
        {
            "Attacker": "Dragon",
            "Defender": "Dragon",
            "Quality": "2.0"
        },
        {
            "Attacker": "Dragon",
            "Defender": "Electric",
            "Quality": "1.0"
        },
        {
            "Attacker": "Dragon",
            "Defender": "Fighting",
            "Quality": "1.0"
        },
        {
            "Attacker": "Dragon",
            "Defender": "Fire",
            "Quality": "1.0"
        },
        {
            "Attacker": "Dragon",
            "Defender": "Flying",
            "Quality": "1.0"
        },
        {
            "Attacker": "Dragon",
            "Defender": "Ghost",
            "Quality": "1.0"
        },
        {
            "Attacker": "Dragon",
            "Defender": "Grass",
            "Quality": "1.0"
        },
        {
            "Attacker": "Dragon",
            "Defender": "Ground",
            "Quality": "1.0"
        },
        {
            "Attacker": "Dragon",
            "Defender": "Ice",
            "Quality": "1.0"
        },
        {
            "Attacker": "Dragon",
            "Defender": "Normal",
            "Quality": "1.0"
        },
        {
            "Attacker": "Dragon",
            "Defender": "Poison",
            "Quality": "1.0"
        },
        {
            "Attacker": "Dragon",
            "Defender": "Psychic",
            "Quality": "1.0"
        },
        {
            "Attacker": "Dragon",
            "Defender": "Rock",
            "Quality": "1.0"
        },
        {
            "Attacker": "Dragon",
            "Defender": "Steel",
            "Quality": "0.5"
        },
        {
            "Attacker": "Dragon",
            "Defender": "Water",
            "Quality": "1.0"
        },
        {
            "Attacker": "Electric",
            "Defender": "???",
            "Quality": "1.0"
        },
        {
            "Attacker": "Electric",
            "Defender": "Bug",
            "Quality": "1.0"
        },
        {
            "Attacker": "Electric",
            "Defender": "Dark",
            "Quality": "1.0"
        },
        {
            "Attacker": "Electric",
            "Defender": "Dragon",
            "Quality": "0.5"
        },
        {
            "Attacker": "Electric",
            "Defender": "Electric",
            "Quality": "0.5"
        },
        {
            "Attacker": "Electric",
            "Defender": "Fighting",
            "Quality": "1.0"
        },
        {
            "Attacker": "Electric",
            "Defender": "Fire",
            "Quality": "1.0"
        },
        {
            "Attacker": "Electric",
            "Defender": "Flying",
            "Quality": "2.0"
        },
        {
            "Attacker": "Electric",
            "Defender": "Ghost",
            "Quality": "1.0"
        },
        {
            "Attacker": "Electric",
            "Defender": "Grass",
            "Quality": "0.5"
        },
        {
            "Attacker": "Electric",
            "Defender": "Ground",
            "Quality": "0.0"
        },
        {
            "Attacker": "Electric",
            "Defender": "Ice",
            "Quality": "1.0"
        },
        {
            "Attacker": "Electric",
            "Defender": "Normal",
            "Quality": "1.0"
        },
        {
            "Attacker": "Electric",
            "Defender": "Poison",
            "Quality": "1.0"
        },
        {
            "Attacker": "Electric",
            "Defender": "Psychic",
            "Quality": "1.0"
        },
        {
            "Attacker": "Electric",
            "Defender": "Rock",
            "Quality": "1.0"
        },
        {
            "Attacker": "Electric",
            "Defender": "Steel",
            "Quality": "1.0"
        },
        {
            "Attacker": "Electric",
            "Defender": "Water",
            "Quality": "2.0"
        },
        {
            "Attacker": "Fighting",
            "Defender": "???",
            "Quality": "1.0"
        },
        {
            "Attacker": "Fighting",
            "Defender": "Bug",
            "Quality": "0.5"
        },
        {
            "Attacker": "Fighting",
            "Defender": "Dark",
            "Quality": "2.0"
        },
        {
            "Attacker": "Fighting",
            "Defender": "Dragon",
            "Quality": "1.0"
        },
        {
            "Attacker": "Fighting",
            "Defender": "Electric",
            "Quality": "1.0"
        },
        {
            "Attacker": "Fighting",
            "Defender": "Fighting",
            "Quality": "1.0"
        },
        {
            "Attacker": "Fighting",
            "Defender": "Fire",
            "Quality": "1.0"
        },
        {
            "Attacker": "Fighting",
            "Defender": "Flying",
            "Quality": "0.5"
        },
        {
            "Attacker": "Fighting",
            "Defender": "Ghost",
            "Quality": "0.0"
        },
        {
            "Attacker": "Fighting",
            "Defender": "Grass",
            "Quality": "1.0"
        },
        {
            "Attacker": "Fighting",
            "Defender": "Ground",
            "Quality": "1.0"
        },
        {
            "Attacker": "Fighting",
            "Defender": "Ice",
            "Quality": "2.0"
        },
        {
            "Attacker": "Fighting",
            "Defender": "Normal",
            "Quality": "2.0"
        },
        {
            "Attacker": "Fighting",
            "Defender": "Poison",
            "Quality": "0.5"
        },
        {
            "Attacker": "Fighting",
            "Defender": "Psychic",
            "Quality": "0.5"
        },
        {
            "Attacker": "Fighting",
            "Defender": "Rock",
            "Quality": "2.0"
        },
        {
            "Attacker": "Fighting",
            "Defender": "Steel",
            "Quality": "2.0"
        },
        {
            "Attacker": "Fighting",
            "Defender": "Water",
            "Quality": "1.0"
        },
        {
            "Attacker": "Fire",
            "Defender": "???",
            "Quality": "1.0"
        },
        {
            "Attacker": "Fire",
            "Defender": "Bug",
            "Quality": "2.0"
        },
        {
            "Attacker": "Fire",
            "Defender": "Dark",
            "Quality": "1.0"
        },
        {
            "Attacker": "Fire",
            "Defender": "Dragon",
            "Quality": "0.5"
        },
        {
            "Attacker": "Fire",
            "Defender": "Electric",
            "Quality": "1.0"
        },
        {
            "Attacker": "Fire",
            "Defender": "Fighting",
            "Quality": "1.0"
        },
        {
            "Attacker": "Fire",
            "Defender": "Fire",
            "Quality": "0.5"
        },
        {
            "Attacker": "Fire",
            "Defender": "Flying",
            "Quality": "1.0"
        },
        {
            "Attacker": "Fire",
            "Defender": "Ghost",
            "Quality": "1.0"
        },
        {
            "Attacker": "Fire",
            "Defender": "Grass",
            "Quality": "2.0"
        },
        {
            "Attacker": "Fire",
            "Defender": "Ground",
            "Quality": "1.0"
        },
        {
            "Attacker": "Fire",
            "Defender": "Ice",
            "Quality": "2.0"
        },
        {
            "Attacker": "Fire",
            "Defender": "Normal",
            "Quality": "1.0"
        },
        {
            "Attacker": "Fire",
            "Defender": "Poison",
            "Quality": "1.0"
        },
        {
            "Attacker": "Fire",
            "Defender": "Psychic",
            "Quality": "1.0"
        },
        {
            "Attacker": "Fire",
            "Defender": "Rock",
            "Quality": "0.5"
        },
        {
            "Attacker": "Fire",
            "Defender": "Steel",
            "Quality": "2.0"
        },
        {
            "Attacker": "Fire",
            "Defender": "Water",
            "Quality": "0.5"
        },
        {
            "Attacker": "Flying",
            "Defender": "???",
            "Quality": "1.0"
        },
        {
            "Attacker": "Flying",
            "Defender": "Bug",
            "Quality": "2.0"
        },
        {
            "Attacker": "Flying",
            "Defender": "Dark",
            "Quality": "1.0"
        },
        {
            "Attacker": "Flying",
            "Defender": "Dragon",
            "Quality": "1.0"
        },
        {
            "Attacker": "Flying",
            "Defender": "Electric",
            "Quality": "0.5"
        },
        {
            "Attacker": "Flying",
            "Defender": "Fighting",
            "Quality": "2.0"
        },
        {
            "Attacker": "Flying",
            "Defender": "Fire",
            "Quality": "1.0"
        },
        {
            "Attacker": "Flying",
            "Defender": "Flying",
            "Quality": "1.0"
        },
        {
            "Attacker": "Flying",
            "Defender": "Ghost",
            "Quality": "1.0"
        },
        {
            "Attacker": "Flying",
            "Defender": "Grass",
            "Quality": "2.0"
        },
        {
            "Attacker": "Flying",
            "Defender": "Ground",
            "Quality": "1.0"
        },
        {
            "Attacker": "Flying",
            "Defender": "Ice",
            "Quality": "1.0"
        },
        {
            "Attacker": "Flying",
            "Defender": "Normal",
            "Quality": "1.0"
        },
        {
            "Attacker": "Flying",
            "Defender": "Poison",
            "Quality": "1.0"
        },
        {
            "Attacker": "Flying",
            "Defender": "Psychic",
            "Quality": "1.0"
        },
        {
            "Attacker": "Flying",
            "Defender": "Rock",
            "Quality": "0.5"
        },
        {
            "Attacker": "Flying",
            "Defender": "Steel",
            "Quality": "0.5"
        },
        {
            "Attacker": "Flying",
            "Defender": "Water",
            "Quality": "1.0"
        },
        {
            "Attacker": "Ghost",
            "Defender": "???",
            "Quality": "1.0"
        },
        {
            "Attacker": "Ghost",
            "Defender": "Bug",
            "Quality": "1.0"
        },
        {
            "Attacker": "Ghost",
            "Defender": "Dark",
            "Quality": "0.5"
        },
        {
            "Attacker": "Ghost",
            "Defender": "Dragon",
            "Quality": "1.0"
        },
        {
            "Attacker": "Ghost",
            "Defender": "Electric",
            "Quality": "1.0"
        },
        {
            "Attacker": "Ghost",
            "Defender": "Fighting",
            "Quality": "1.0"
        },
        {
            "Attacker": "Ghost",
            "Defender": "Fire",
            "Quality": "1.0"
        },
        {
            "Attacker": "Ghost",
            "Defender": "Flying",
            "Quality": "1.0"
        },
        {
            "Attacker": "Ghost",
            "Defender": "Ghost",
            "Quality": "2.0"
        },
        {
            "Attacker": "Ghost",
            "Defender": "Grass",
            "Quality": "1.0"
        },
        {
            "Attacker": "Ghost",
            "Defender": "Ground",
            "Quality": "1.0"
        },
        {
            "Attacker": "Ghost",
            "Defender": "Ice",
            "Quality": "1.0"
        },
        {
            "Attacker": "Ghost",
            "Defender": "Normal",
            "Quality": "0.0"
        },
        {
            "Attacker": "Ghost",
            "Defender": "Poison",
            "Quality": "1.0"
        },
        {
            "Attacker": "Ghost",
            "Defender": "Psychic",
            "Quality": "2.0"
        },
        {
            "Attacker": "Ghost",
            "Defender": "Rock",
            "Quality": "1.0"
        },
        {
            "Attacker": "Ghost",
            "Defender": "Steel",
            "Quality": "1.0"
        },
        {
            "Attacker": "Ghost",
            "Defender": "Water",
            "Quality": "1.0"
        },
        {
            "Attacker": "Grass",
            "Defender": "???",
            "Quality": "1.0"
        },
        {
            "Attacker": "Grass",
            "Defender": "Bug",
            "Quality": "0.5"
        },
        {
            "Attacker": "Grass",
            "Defender": "Dark",
            "Quality": "1.0"
        },
        {
            "Attacker": "Grass",
            "Defender": "Dragon",
            "Quality": "0.5"
        },
        {
            "Attacker": "Grass",
            "Defender": "Electric",
            "Quality": "1.0"
        },
        {
            "Attacker": "Grass",
            "Defender": "Fighting",
            "Quality": "1.0"
        },
        {
            "Attacker": "Grass",
            "Defender": "Fire",
            "Quality": "0.5"
        },
        {
            "Attacker": "Grass",
            "Defender": "Flying",
            "Quality": "0.5"
        },
        {
            "Attacker": "Grass",
            "Defender": "Ghost",
            "Quality": "1.0"
        },
        {
            "Attacker": "Grass",
            "Defender": "Grass",
            "Quality": "0.5"
        },
        {
            "Attacker": "Grass",
            "Defender": "Ground",
            "Quality": "2.0"
        },
        {
            "Attacker": "Grass",
            "Defender": "Ice",
            "Quality": "1.0"
        },
        {
            "Attacker": "Grass",
            "Defender": "Normal",
            "Quality": "1.0"
        },
        {
            "Attacker": "Grass",
            "Defender": "Poison",
            "Quality": "0.5"
        },
        {
            "Attacker": "Grass",
            "Defender": "Psychic",
            "Quality": "1.0"
        },
        {
            "Attacker": "Grass",
            "Defender": "Rock",
            "Quality": "2.0"
        },
        {
            "Attacker": "Grass",
            "Defender": "Steel",
            "Quality": "0.5"
        },
        {
            "Attacker": "Grass",
            "Defender": "Water",
            "Quality": "2.0"
        },
        {
            "Attacker": "Ground",
            "Defender": "???",
            "Quality": "1.0"
        },
        {
            "Attacker": "Ground",
            "Defender": "Bug",
            "Quality": "0.5"
        },
        {
            "Attacker": "Ground",
            "Defender": "Dark",
            "Quality": "1.0"
        },
        {
            "Attacker": "Ground",
            "Defender": "Dragon",
            "Quality": "1.0"
        },
        {
            "Attacker": "Ground",
            "Defender": "Electric",
            "Quality": "2.0"
        },
        {
            "Attacker": "Ground",
            "Defender": "Fighting",
            "Quality": "1.0"
        },
        {
            "Attacker": "Ground",
            "Defender": "Fire",
            "Quality": "2.0"
        },
        {
            "Attacker": "Ground",
            "Defender": "Flying",
            "Quality": "0.0"
        },
        {
            "Attacker": "Ground",
            "Defender": "Ghost",
            "Quality": "1.0"
        },
        {
            "Attacker": "Ground",
            "Defender": "Grass",
            "Quality": "0.5"
        },
        {
            "Attacker": "Ground",
            "Defender": "Ground",
            "Quality": "1.0"
        },
        {
            "Attacker": "Ground",
            "Defender": "Ice",
            "Quality": "1.0"
        },
        {
            "Attacker": "Ground",
            "Defender": "Normal",
            "Quality": "1.0"
        },
        {
            "Attacker": "Ground",
            "Defender": "Poison",
            "Quality": "2.0"
        },
        {
            "Attacker": "Ground",
            "Defender": "Psychic",
            "Quality": "1.0"
        },
        {
            "Attacker": "Ground",
            "Defender": "Rock",
            "Quality": "2.0"
        },
        {
            "Attacker": "Ground",
            "Defender": "Steel",
            "Quality": "2.0"
        },
        {
            "Attacker": "Ground",
            "Defender": "Water",
            "Quality": "1.0"
        },
        {
            "Attacker": "Ice",
            "Defender": "???",
            "Quality": "1.0"
        },
        {
            "Attacker": "Ice",
            "Defender": "Bug",
            "Quality": "1.0"
        },
        {
            "Attacker": "Ice",
            "Defender": "Dark",
            "Quality": "1.0"
        },
        {
            "Attacker": "Ice",
            "Defender": "Dragon",
            "Quality": "2.0"
        },
        {
            "Attacker": "Ice",
            "Defender": "Electric",
            "Quality": "1.0"
        },
        {
            "Attacker": "Ice",
            "Defender": "Fighting",
            "Quality": "1.0"
        },
        {
            "Attacker": "Ice",
            "Defender": "Fire",
            "Quality": "0.5"
        },
        {
            "Attacker": "Ice",
            "Defender": "Flying",
            "Quality": "2.0"
        },
        {
            "Attacker": "Ice",
            "Defender": "Ghost",
            "Quality": "1.0"
        },
        {
            "Attacker": "Ice",
            "Defender": "Grass",
            "Quality": "2.0"
        },
        {
            "Attacker": "Ice",
            "Defender": "Ground",
            "Quality": "2.0"
        },
        {
            "Attacker": "Ice",
            "Defender": "Ice",
            "Quality": "0.5"
        },
        {
            "Attacker": "Ice",
            "Defender": "Normal",
            "Quality": "1.0"
        },
        {
            "Attacker": "Ice",
            "Defender": "Poison",
            "Quality": "1.0"
        },
        {
            "Attacker": "Ice",
            "Defender": "Psychic",
            "Quality": "1.0"
        },
        {
            "Attacker": "Ice",
            "Defender": "Rock",
            "Quality": "1.0"
        },
        {
            "Attacker": "Ice",
            "Defender": "Steel",
            "Quality": "0.5"
        },
        {
            "Attacker": "Ice",
            "Defender": "Water",
            "Quality": "0.5"
        },
        {
            "Attacker": "Normal",
            "Defender": "???",
            "Quality": "1.0"
        },
        {
            "Attacker": "Normal",
            "Defender": "Bug",
            "Quality": "1.0"
        },
        {
            "Attacker": "Normal",
            "Defender": "Dark",
            "Quality": "1.0"
        },
        {
            "Attacker": "Normal",
            "Defender": "Dragon",
            "Quality": "1.0"
        },
        {
            "Attacker": "Normal",
            "Defender": "Electric",
            "Quality": "1.0"
        },
        {
            "Attacker": "Normal",
            "Defender": "Fighting",
            "Quality": "1.0"
        },
        {
            "Attacker": "Normal",
            "Defender": "Fire",
            "Quality": "1.0"
        },
        {
            "Attacker": "Normal",
            "Defender": "Flying",
            "Quality": "1.0"
        },
        {
            "Attacker": "Normal",
            "Defender": "Ghost",
            "Quality": "0.0"
        },
        {
            "Attacker": "Normal",
            "Defender": "Grass",
            "Quality": "1.0"
        },
        {
            "Attacker": "Normal",
            "Defender": "Ground",
            "Quality": "1.0"
        },
        {
            "Attacker": "Normal",
            "Defender": "Ice",
            "Quality": "1.0"
        },
        {
            "Attacker": "Normal",
            "Defender": "Normal",
            "Quality": "1.0"
        },
        {
            "Attacker": "Normal",
            "Defender": "Poison",
            "Quality": "1.0"
        },
        {
            "Attacker": "Normal",
            "Defender": "Psychic",
            "Quality": "1.0"
        },
        {
            "Attacker": "Normal",
            "Defender": "Rock",
            "Quality": "0.5"
        },
        {
            "Attacker": "Normal",
            "Defender": "Steel",
            "Quality": "0.5"
        },
        {
            "Attacker": "Normal",
            "Defender": "Water",
            "Quality": "1.0"
        },
        {
            "Attacker": "Poison",
            "Defender": "???",
            "Quality": "1.0"
        },
        {
            "Attacker": "Poison",
            "Defender": "Bug",
            "Quality": "1.0"
        },
        {
            "Attacker": "Poison",
            "Defender": "Dark",
            "Quality": "1.0"
        },
        {
            "Attacker": "Poison",
            "Defender": "Dragon",
            "Quality": "1.0"
        },
        {
            "Attacker": "Poison",
            "Defender": "Electric",
            "Quality": "1.0"
        },
        {
            "Attacker": "Poison",
            "Defender": "Fighting",
            "Quality": "1.0"
        },
        {
            "Attacker": "Poison",
            "Defender": "Fire",
            "Quality": "1.0"
        },
        {
            "Attacker": "Poison",
            "Defender": "Flying",
            "Quality": "1.0"
        },
        {
            "Attacker": "Poison",
            "Defender": "Ghost",
            "Quality": "0.5"
        },
        {
            "Attacker": "Poison",
            "Defender": "Grass",
            "Quality": "2.0"
        },
        {
            "Attacker": "Poison",
            "Defender": "Ground",
            "Quality": "0.5"
        },
        {
            "Attacker": "Poison",
            "Defender": "Ice",
            "Quality": "1.0"
        },
        {
            "Attacker": "Poison",
            "Defender": "Normal",
            "Quality": "1.0"
        },
        {
            "Attacker": "Poison",
            "Defender": "Poison",
            "Quality": "0.5"
        },
        {
            "Attacker": "Poison",
            "Defender": "Psychic",
            "Quality": "1.0"
        },
        {
            "Attacker": "Poison",
            "Defender": "Rock",
            "Quality": "0.5"
        },
        {
            "Attacker": "Poison",
            "Defender": "Steel",
            "Quality": "0.0"
        },
        {
            "Attacker": "Poison",
            "Defender": "Water",
            "Quality": "1.0"
        },
        {
            "Attacker": "Psychic",
            "Defender": "???",
            "Quality": "1.0"
        },
        {
            "Attacker": "Psychic",
            "Defender": "Bug",
            "Quality": "1.0"
        },
        {
            "Attacker": "Psychic",
            "Defender": "Dark",
            "Quality": "0.0"
        },
        {
            "Attacker": "Psychic",
            "Defender": "Dragon",
            "Quality": "1.0"
        },
        {
            "Attacker": "Psychic",
            "Defender": "Electric",
            "Quality": "1.0"
        },
        {
            "Attacker": "Psychic",
            "Defender": "Fighting",
            "Quality": "2.0"
        },
        {
            "Attacker": "Psychic",
            "Defender": "Fire",
            "Quality": "1.0"
        },
        {
            "Attacker": "Psychic",
            "Defender": "Flying",
            "Quality": "1.0"
        },
        {
            "Attacker": "Psychic",
            "Defender": "Ghost",
            "Quality": "1.0"
        },
        {
            "Attacker": "Psychic",
            "Defender": "Grass",
            "Quality": "1.0"
        },
        {
            "Attacker": "Psychic",
            "Defender": "Ground",
            "Quality": "1.0"
        },
        {
            "Attacker": "Psychic",
            "Defender": "Ice",
            "Quality": "1.0"
        },
        {
            "Attacker": "Psychic",
            "Defender": "Normal",
            "Quality": "1.0"
        },
        {
            "Attacker": "Psychic",
            "Defender": "Poison",
            "Quality": "2.0"
        },
        {
            "Attacker": "Psychic",
            "Defender": "Psychic",
            "Quality": "0.5"
        },
        {
            "Attacker": "Psychic",
            "Defender": "Rock",
            "Quality": "1.0"
        },
        {
            "Attacker": "Psychic",
            "Defender": "Steel",
            "Quality": "0.5"
        },
        {
            "Attacker": "Psychic",
            "Defender": "Water",
            "Quality": "1.0"
        },
        {
            "Attacker": "Rock",
            "Defender": "???",
            "Quality": "1.0"
        },
        {
            "Attacker": "Rock",
            "Defender": "Bug",
            "Quality": "2.0"
        },
        {
            "Attacker": "Rock",
            "Defender": "Dark",
            "Quality": "1.0"
        },
        {
            "Attacker": "Rock",
            "Defender": "Dragon",
            "Quality": "1.0"
        },
        {
            "Attacker": "Rock",
            "Defender": "Electric",
            "Quality": "1.0"
        },
        {
            "Attacker": "Rock",
            "Defender": "Fighting",
            "Quality": "0.5"
        },
        {
            "Attacker": "Rock",
            "Defender": "Fire",
            "Quality": "2.0"
        },
        {
            "Attacker": "Rock",
            "Defender": "Flying",
            "Quality": "2.0"
        },
        {
            "Attacker": "Rock",
            "Defender": "Ghost",
            "Quality": "1.0"
        },
        {
            "Attacker": "Rock",
            "Defender": "Grass",
            "Quality": "1.0"
        },
        {
            "Attacker": "Rock",
            "Defender": "Ground",
            "Quality": "0.5"
        },
        {
            "Attacker": "Rock",
            "Defender": "Ice",
            "Quality": "2.0"
        },
        {
            "Attacker": "Rock",
            "Defender": "Normal",
            "Quality": "1.0"
        },
        {
            "Attacker": "Rock",
            "Defender": "Poison",
            "Quality": "1.0"
        },
        {
            "Attacker": "Rock",
            "Defender": "Psychic",
            "Quality": "1.0"
        },
        {
            "Attacker": "Rock",
            "Defender": "Rock",
            "Quality": "1.0"
        },
        {
            "Attacker": "Rock",
            "Defender": "Steel",
            "Quality": "0.5"
        },
        {
            "Attacker": "Rock",
            "Defender": "Water",
            "Quality": "1.0"
        },
        {
            "Attacker": "Steel",
            "Defender": "???",
            "Quality": "1.0"
        },
        {
            "Attacker": "Steel",
            "Defender": "Bug",
            "Quality": "1.0"
        },
        {
            "Attacker": "Steel",
            "Defender": "Dark",
            "Quality": "1.0"
        },
        {
            "Attacker": "Steel",
            "Defender": "Dragon",
            "Quality": "1.0"
        },
        {
            "Attacker": "Steel",
            "Defender": "Electric",
            "Quality": "0.5"
        },
        {
            "Attacker": "Steel",
            "Defender": "Fighting",
            "Quality": "1.0"
        },
        {
            "Attacker": "Steel",
            "Defender": "Fire",
            "Quality": "0.5"
        },
        {
            "Attacker": "Steel",
            "Defender": "Flying",
            "Quality": "1.0"
        },
        {
            "Attacker": "Steel",
            "Defender": "Ghost",
            "Quality": "1.0"
        },
        {
            "Attacker": "Steel",
            "Defender": "Grass",
            "Quality": "1.0"
        },
        {
            "Attacker": "Steel",
            "Defender": "Ground",
            "Quality": "1.0"
        },
        {
            "Attacker": "Steel",
            "Defender": "Ice",
            "Quality": "2.0"
        },
        {
            "Attacker": "Steel",
            "Defender": "Normal",
            "Quality": "1.0"
        },
        {
            "Attacker": "Steel",
            "Defender": "Poison",
            "Quality": "1.0"
        },
        {
            "Attacker": "Steel",
            "Defender": "Psychic",
            "Quality": "1.0"
        },
        {
            "Attacker": "Steel",
            "Defender": "Rock",
            "Quality": "2.0"
        },
        {
            "Attacker": "Steel",
            "Defender": "Steel",
            "Quality": "0.5"
        },
        {
            "Attacker": "Steel",
            "Defender": "Water",
            "Quality": "0.5"
        },
        {
            "Attacker": "Water",
            "Defender": "???",
            "Quality": "1.0"
        },
        {
            "Attacker": "Water",
            "Defender": "Bug",
            "Quality": "1.0"
        },
        {
            "Attacker": "Water",
            "Defender": "Dark",
            "Quality": "1.0"
        },
        {
            "Attacker": "Water",
            "Defender": "Dragon",
            "Quality": "0.5"
        },
        {
            "Attacker": "Water",
            "Defender": "Electric",
            "Quality": "1.0"
        },
        {
            "Attacker": "Water",
            "Defender": "Fighting",
            "Quality": "1.0"
        },
        {
            "Attacker": "Water",
            "Defender": "Fire",
            "Quality": "2.0"
        },
        {
            "Attacker": "Water",
            "Defender": "Flying",
            "Quality": "1.0"
        },
        {
            "Attacker": "Water",
            "Defender": "Ghost",
            "Quality": "1.0"
        },
        {
            "Attacker": "Water",
            "Defender": "Grass",
            "Quality": "0.5"
        },
        {
            "Attacker": "Water",
            "Defender": "Ground",
            "Quality": "2.0"
        },
        {
            "Attacker": "Water",
            "Defender": "Ice",
            "Quality": "1.0"
        },
        {
            "Attacker": "Water",
            "Defender": "Normal",
            "Quality": "1.0"
        },
        {
            "Attacker": "Water",
            "Defender": "Poison",
            "Quality": "1.0"
        },
        {
            "Attacker": "Water",
            "Defender": "Psychic",
            "Quality": "1.0"
        },
        {
            "Attacker": "Water",
            "Defender": "Rock",
            "Quality": "2.0"
        },
        {
            "Attacker": "Water",
            "Defender": "Steel",
            "Quality": "1.0"
        },
        {
            "Attacker": "Water",
            "Defender": "Water",
            "Quality": "0.5"
        }
        ],

        selectEggGroups:{},
        egggroups: [
        {
            "Dex": "1",
            "GroupName": "Grass"
        },
        {
            "Dex": "1",
            "GroupName": "Monster"
        },
        {
            "Dex": "10",
            "GroupName": "Bug"
        },
        {
            "Dex": "100",
            "GroupName": "Mineral"
        },
        {
            "Dex": "101",
            "GroupName": "Mineral"
        },
        {
            "Dex": "102",
            "GroupName": "Grass"
        },
        {
            "Dex": "103",
            "GroupName": "Grass"
        },
        {
            "Dex": "104",
            "GroupName": "Monster"
        },
        {
            "Dex": "105",
            "GroupName": "Monster"
        },
        {
            "Dex": "106",
            "GroupName": "Human-Like"
        },
        {
            "Dex": "107",
            "GroupName": "Human-Like"
        },
        {
            "Dex": "108",
            "GroupName": "Monster"
        },
        {
            "Dex": "109",
            "GroupName": "Amorphous"
        },
        {
            "Dex": "11",
            "GroupName": "Bug"
        },
        {
            "Dex": "110",
            "GroupName": "Amorphous"
        },
        {
            "Dex": "111",
            "GroupName": "Field"
        },
        {
            "Dex": "111",
            "GroupName": "Monster"
        },
        {
            "Dex": "112",
            "GroupName": "Field"
        },
        {
            "Dex": "112",
            "GroupName": "Monster"
        },
        {
            "Dex": "113",
            "GroupName": "Fairy"
        },
        {
            "Dex": "114",
            "GroupName": "Grass"
        },
        {
            "Dex": "115",
            "GroupName": "Monster"
        },
        {
            "Dex": "116",
            "GroupName": "Dragon"
        },
        {
            "Dex": "116",
            "GroupName": "Water 1"
        },
        {
            "Dex": "117",
            "GroupName": "Dragon"
        },
        {
            "Dex": "117",
            "GroupName": "Water 1"
        },
        {
            "Dex": "118",
            "GroupName": "Water 2"
        },
        {
            "Dex": "119",
            "GroupName": "Water 2"
        },
        {
            "Dex": "12",
            "GroupName": "Bug"
        },
        {
            "Dex": "120",
            "GroupName": "Water 3"
        },
        {
            "Dex": "121",
            "GroupName": "Water 3"
        },
        {
            "Dex": "122",
            "GroupName": "Human-Like"
        },
        {
            "Dex": "123",
            "GroupName": "Bug"
        },
        {
            "Dex": "124",
            "GroupName": "Human-Like"
        },
        {
            "Dex": "125",
            "GroupName": "Human-Like"
        },
        {
            "Dex": "126",
            "GroupName": "Human-Like"
        },
        {
            "Dex": "127",
            "GroupName": "Bug"
        },
        {
            "Dex": "128",
            "GroupName": "Field"
        },
        {
            "Dex": "129",
            "GroupName": "Dragon"
        },
        {
            "Dex": "129",
            "GroupName": "Water 2"
        },
        {
            "Dex": "13",
            "GroupName": "Bug"
        },
        {
            "Dex": "130",
            "GroupName": "Dragon"
        },
        {
            "Dex": "130",
            "GroupName": "Water 2"
        },
        {
            "Dex": "131",
            "GroupName": "Monster"
        },
        {
            "Dex": "131",
            "GroupName": "Water 1"
        },
        {
            "Dex": "132",
            "GroupName": "Ditto"
        },
        {
            "Dex": "133",
            "GroupName": "Field"
        },
        {
            "Dex": "134",
            "GroupName": "Field"
        },
        {
            "Dex": "135",
            "GroupName": "Field"
        },
        {
            "Dex": "136",
            "GroupName": "Field"
        },
        {
            "Dex": "137",
            "GroupName": "Mineral"
        },
        {
            "Dex": "138",
            "GroupName": "Water 1"
        },
        {
            "Dex": "138",
            "GroupName": "Water 3"
        },
        {
            "Dex": "139",
            "GroupName": "Water 1"
        },
        {
            "Dex": "139",
            "GroupName": "Water 3"
        },
        {
            "Dex": "14",
            "GroupName": "Bug"
        },
        {
            "Dex": "140",
            "GroupName": "Water 1"
        },
        {
            "Dex": "140",
            "GroupName": "Water 3"
        },
        {
            "Dex": "141",
            "GroupName": "Water 1"
        },
        {
            "Dex": "141",
            "GroupName": "Water 3"
        },
        {
            "Dex": "142",
            "GroupName": "Flying"
        },
        {
            "Dex": "143",
            "GroupName": "Monster"
        },
        {
            "Dex": "144",
            "GroupName": "Undiscovered"
        },
        {
            "Dex": "145",
            "GroupName": "Undiscovered"
        },
        {
            "Dex": "146",
            "GroupName": "Undiscovered"
        },
        {
            "Dex": "147",
            "GroupName": "Dragon"
        },
        {
            "Dex": "147",
            "GroupName": "Water 1"
        },
        {
            "Dex": "148",
            "GroupName": "Dragon"
        },
        {
            "Dex": "148",
            "GroupName": "Water 1"
        },
        {
            "Dex": "149",
            "GroupName": "Dragon"
        },
        {
            "Dex": "149",
            "GroupName": "Water 1"
        },
        {
            "Dex": "15",
            "GroupName": "Bug"
        },
        {
            "Dex": "150",
            "GroupName": "Undiscovered"
        },
        {
            "Dex": "151",
            "GroupName": "Undiscovered"
        },
        {
            "Dex": "152",
            "GroupName": "Grass"
        },
        {
            "Dex": "152",
            "GroupName": "Monster"
        },
        {
            "Dex": "153",
            "GroupName": "Grass"
        },
        {
            "Dex": "153",
            "GroupName": "Monster"
        },
        {
            "Dex": "154",
            "GroupName": "Grass"
        },
        {
            "Dex": "154",
            "GroupName": "Monster"
        },
        {
            "Dex": "155",
            "GroupName": "Field"
        },
        {
            "Dex": "156",
            "GroupName": "Field"
        },
        {
            "Dex": "157",
            "GroupName": "Field"
        },
        {
            "Dex": "158",
            "GroupName": "Monster"
        },
        {
            "Dex": "158",
            "GroupName": "Water 1"
        },
        {
            "Dex": "159",
            "GroupName": "Monster"
        },
        {
            "Dex": "159",
            "GroupName": "Water 1"
        },
        {
            "Dex": "16",
            "GroupName": "Flying"
        },
        {
            "Dex": "160",
            "GroupName": "Monster"
        },
        {
            "Dex": "160",
            "GroupName": "Water 1"
        },
        {
            "Dex": "161",
            "GroupName": "Field"
        },
        {
            "Dex": "162",
            "GroupName": "Field"
        },
        {
            "Dex": "163",
            "GroupName": "Flying"
        },
        {
            "Dex": "164",
            "GroupName": "Flying"
        },
        {
            "Dex": "165",
            "GroupName": "Bug"
        },
        {
            "Dex": "166",
            "GroupName": "Bug"
        },
        {
            "Dex": "167",
            "GroupName": "Bug"
        },
        {
            "Dex": "168",
            "GroupName": "Bug"
        },
        {
            "Dex": "169",
            "GroupName": "Flying"
        },
        {
            "Dex": "17",
            "GroupName": "Flying"
        },
        {
            "Dex": "170",
            "GroupName": "Water 2"
        },
        {
            "Dex": "171",
            "GroupName": "Water 2"
        },
        {
            "Dex": "172",
            "GroupName": "Undiscovered"
        },
        {
            "Dex": "173",
            "GroupName": "Undiscovered"
        },
        {
            "Dex": "174",
            "GroupName": "Undiscovered"
        },
        {
            "Dex": "175",
            "GroupName": "Undiscovered"
        },
        {
            "Dex": "176",
            "GroupName": "Fairy"
        },
        {
            "Dex": "176",
            "GroupName": "Flying"
        },
        {
            "Dex": "177",
            "GroupName": "Flying"
        },
        {
            "Dex": "178",
            "GroupName": "Flying"
        },
        {
            "Dex": "179",
            "GroupName": "Field"
        },
        {
            "Dex": "179",
            "GroupName": "Monster"
        },
        {
            "Dex": "18",
            "GroupName": "Flying"
        },
        {
            "Dex": "180",
            "GroupName": "Field"
        },
        {
            "Dex": "180",
            "GroupName": "Monster"
        },
        {
            "Dex": "181",
            "GroupName": "Field"
        },
        {
            "Dex": "181",
            "GroupName": "Monster"
        },
        {
            "Dex": "182",
            "GroupName": "Grass"
        },
        {
            "Dex": "183",
            "GroupName": "Fairy"
        },
        {
            "Dex": "183",
            "GroupName": "Water 1"
        },
        {
            "Dex": "184",
            "GroupName": "Fairy"
        },
        {
            "Dex": "184",
            "GroupName": "Water 1"
        },
        {
            "Dex": "185",
            "GroupName": "Mineral"
        },
        {
            "Dex": "186",
            "GroupName": "Water 1"
        },
        {
            "Dex": "187",
            "GroupName": "Fairy"
        },
        {
            "Dex": "187",
            "GroupName": "Grass"
        },
        {
            "Dex": "188",
            "GroupName": "Fairy"
        },
        {
            "Dex": "188",
            "GroupName": "Grass"
        },
        {
            "Dex": "189",
            "GroupName": "Fairy"
        },
        {
            "Dex": "189",
            "GroupName": "Grass"
        },
        {
            "Dex": "19",
            "GroupName": "Field"
        },
        {
            "Dex": "190",
            "GroupName": "Field"
        },
        {
            "Dex": "191",
            "GroupName": "Grass"
        },
        {
            "Dex": "192",
            "GroupName": "Grass"
        },
        {
            "Dex": "193",
            "GroupName": "Bug"
        },
        {
            "Dex": "194",
            "GroupName": "Field"
        },
        {
            "Dex": "194",
            "GroupName": "Water 1"
        },
        {
            "Dex": "195",
            "GroupName": "Field"
        },
        {
            "Dex": "195",
            "GroupName": "Water 1"
        },
        {
            "Dex": "196",
            "GroupName": "Field"
        },
        {
            "Dex": "197",
            "GroupName": "Field"
        },
        {
            "Dex": "198",
            "GroupName": "Flying"
        },
        {
            "Dex": "199",
            "GroupName": "Monster"
        },
        {
            "Dex": "199",
            "GroupName": "Water 1"
        },
        {
            "Dex": "2",
            "GroupName": "Grass"
        },
        {
            "Dex": "2",
            "GroupName": "Monster"
        },
        {
            "Dex": "20",
            "GroupName": "Field"
        },
        {
            "Dex": "200",
            "GroupName": "Amorphous"
        },
        {
            "Dex": "201",
            "GroupName": "Undiscovered"
        },
        {
            "Dex": "202",
            "GroupName": "Amorphous"
        },
        {
            "Dex": "203",
            "GroupName": "Field"
        },
        {
            "Dex": "204",
            "GroupName": "Bug"
        },
        {
            "Dex": "205",
            "GroupName": "Bug"
        },
        {
            "Dex": "206",
            "GroupName": "Field"
        },
        {
            "Dex": "207",
            "GroupName": "Bug"
        },
        {
            "Dex": "208",
            "GroupName": "Mineral"
        },
        {
            "Dex": "209",
            "GroupName": "Fairy"
        },
        {
            "Dex": "209",
            "GroupName": "Field"
        },
        {
            "Dex": "21",
            "GroupName": "Flying"
        },
        {
            "Dex": "210",
            "GroupName": "Fairy"
        },
        {
            "Dex": "210",
            "GroupName": "Field"
        },
        {
            "Dex": "211",
            "GroupName": "Water 2"
        },
        {
            "Dex": "212",
            "GroupName": "Bug"
        },
        {
            "Dex": "213",
            "GroupName": "Bug"
        },
        {
            "Dex": "214",
            "GroupName": "Bug"
        },
        {
            "Dex": "215",
            "GroupName": "Field"
        },
        {
            "Dex": "216",
            "GroupName": "Field"
        },
        {
            "Dex": "217",
            "GroupName": "Field"
        },
        {
            "Dex": "218",
            "GroupName": "Amorphous"
        },
        {
            "Dex": "219",
            "GroupName": "Amorphous"
        },
        {
            "Dex": "22",
            "GroupName": "Flying"
        },
        {
            "Dex": "220",
            "GroupName": "Field"
        },
        {
            "Dex": "221",
            "GroupName": "Field"
        },
        {
            "Dex": "222",
            "GroupName": "Water 1"
        },
        {
            "Dex": "222",
            "GroupName": "Water 3"
        },
        {
            "Dex": "223",
            "GroupName": "Water 1"
        },
        {
            "Dex": "223",
            "GroupName": "Water 2"
        },
        {
            "Dex": "224",
            "GroupName": "Water 1"
        },
        {
            "Dex": "224",
            "GroupName": "Water 2"
        },
        {
            "Dex": "225",
            "GroupName": "Field"
        },
        {
            "Dex": "225",
            "GroupName": "Water 1"
        },
        {
            "Dex": "226",
            "GroupName": "Water 1"
        },
        {
            "Dex": "227",
            "GroupName": "Flying"
        },
        {
            "Dex": "228",
            "GroupName": "Field"
        },
        {
            "Dex": "229",
            "GroupName": "Field"
        },
        {
            "Dex": "23",
            "GroupName": "Dragon"
        },
        {
            "Dex": "23",
            "GroupName": "Field"
        },
        {
            "Dex": "230",
            "GroupName": "Dragon"
        },
        {
            "Dex": "230",
            "GroupName": "Water 1"
        },
        {
            "Dex": "231",
            "GroupName": "Field"
        },
        {
            "Dex": "232",
            "GroupName": "Field"
        },
        {
            "Dex": "233",
            "GroupName": "Mineral"
        },
        {
            "Dex": "234",
            "GroupName": "Field"
        },
        {
            "Dex": "235",
            "GroupName": "Field"
        },
        {
            "Dex": "236",
            "GroupName": "Undiscovered"
        },
        {
            "Dex": "237",
            "GroupName": "Human-Like"
        },
        {
            "Dex": "238",
            "GroupName": "Undiscovered"
        },
        {
            "Dex": "239",
            "GroupName": "Undiscovered"
        },
        {
            "Dex": "24",
            "GroupName": "Dragon"
        },
        {
            "Dex": "24",
            "GroupName": "Field"
        },
        {
            "Dex": "240",
            "GroupName": "Undiscovered"
        },
        {
            "Dex": "241",
            "GroupName": "Field"
        },
        {
            "Dex": "242",
            "GroupName": "Fairy"
        },
        {
            "Dex": "243",
            "GroupName": "Undiscovered"
        },
        {
            "Dex": "244",
            "GroupName": "Undiscovered"
        },
        {
            "Dex": "245",
            "GroupName": "Undiscovered"
        },
        {
            "Dex": "246",
            "GroupName": "Monster"
        },
        {
            "Dex": "247",
            "GroupName": "Monster"
        },
        {
            "Dex": "248",
            "GroupName": "Monster"
        },
        {
            "Dex": "249",
            "GroupName": "Undiscovered"
        },
        {
            "Dex": "25",
            "GroupName": "Fairy"
        },
        {
            "Dex": "25",
            "GroupName": "Field"
        },
        {
            "Dex": "250",
            "GroupName": "Undiscovered"
        },
        {
            "Dex": "251",
            "GroupName": "Undiscovered"
        },
        {
            "Dex": "252",
            "GroupName": "Dragon"
        },
        {
            "Dex": "252",
            "GroupName": "Monster"
        },
        {
            "Dex": "253",
            "GroupName": "Dragon"
        },
        {
            "Dex": "253",
            "GroupName": "Monster"
        },
        {
            "Dex": "254",
            "GroupName": "Dragon"
        },
        {
            "Dex": "254",
            "GroupName": "Monster"
        },
        {
            "Dex": "255",
            "GroupName": "Field"
        },
        {
            "Dex": "256",
            "GroupName": "Field"
        },
        {
            "Dex": "257",
            "GroupName": "Field"
        },
        {
            "Dex": "258",
            "GroupName": "Monster"
        },
        {
            "Dex": "258",
            "GroupName": "Water 1"
        },
        {
            "Dex": "259",
            "GroupName": "Monster"
        },
        {
            "Dex": "259",
            "GroupName": "Water 1"
        },
        {
            "Dex": "26",
            "GroupName": "Fairy"
        },
        {
            "Dex": "26",
            "GroupName": "Field"
        },
        {
            "Dex": "260",
            "GroupName": "Monster"
        },
        {
            "Dex": "260",
            "GroupName": "Water 1"
        },
        {
            "Dex": "261",
            "GroupName": "Field"
        },
        {
            "Dex": "262",
            "GroupName": "Field"
        },
        {
            "Dex": "263",
            "GroupName": "Field"
        },
        {
            "Dex": "264",
            "GroupName": "Field"
        },
        {
            "Dex": "265",
            "GroupName": "Bug"
        },
        {
            "Dex": "266",
            "GroupName": "Bug"
        },
        {
            "Dex": "267",
            "GroupName": "Bug"
        },
        {
            "Dex": "268",
            "GroupName": "Bug"
        },
        {
            "Dex": "269",
            "GroupName": "Bug"
        },
        {
            "Dex": "27",
            "GroupName": "Field"
        },
        {
            "Dex": "270",
            "GroupName": "Grass"
        },
        {
            "Dex": "270",
            "GroupName": "Water 1"
        },
        {
            "Dex": "271",
            "GroupName": "Grass"
        },
        {
            "Dex": "271",
            "GroupName": "Water 1"
        },
        {
            "Dex": "272",
            "GroupName": "Grass"
        },
        {
            "Dex": "272",
            "GroupName": "Water 1"
        },
        {
            "Dex": "273",
            "GroupName": "Field"
        },
        {
            "Dex": "273",
            "GroupName": "Grass"
        },
        {
            "Dex": "274",
            "GroupName": "Field"
        },
        {
            "Dex": "274",
            "GroupName": "Grass"
        },
        {
            "Dex": "275",
            "GroupName": "Field"
        },
        {
            "Dex": "275",
            "GroupName": "Grass"
        },
        {
            "Dex": "276",
            "GroupName": "Flying"
        },
        {
            "Dex": "277",
            "GroupName": "Flying"
        },
        {
            "Dex": "278",
            "GroupName": "Flying"
        },
        {
            "Dex": "278",
            "GroupName": "Water 1"
        },
        {
            "Dex": "279",
            "GroupName": "Flying"
        },
        {
            "Dex": "279",
            "GroupName": "Water 1"
        },
        {
            "Dex": "28",
            "GroupName": "Field"
        },
        {
            "Dex": "280",
            "GroupName": "Amorphous"
        },
        {
            "Dex": "280",
            "GroupName": "Human-Like"
        },
        {
            "Dex": "281",
            "GroupName": "Amorphous"
        },
        {
            "Dex": "281",
            "GroupName": "Human-Like"
        },
        {
            "Dex": "282",
            "GroupName": "Amorphous"
        },
        {
            "Dex": "282",
            "GroupName": "Human-Like"
        },
        {
            "Dex": "283",
            "GroupName": "Bug"
        },
        {
            "Dex": "283",
            "GroupName": "Water 1"
        },
        {
            "Dex": "284",
            "GroupName": "Bug"
        },
        {
            "Dex": "284",
            "GroupName": "Water 1"
        },
        {
            "Dex": "285",
            "GroupName": "Fairy"
        },
        {
            "Dex": "285",
            "GroupName": "Grass"
        },
        {
            "Dex": "286",
            "GroupName": "Fairy"
        },
        {
            "Dex": "286",
            "GroupName": "Grass"
        },
        {
            "Dex": "287",
            "GroupName": "Field"
        },
        {
            "Dex": "288",
            "GroupName": "Field"
        },
        {
            "Dex": "289",
            "GroupName": "Field"
        },
        {
            "Dex": "29",
            "GroupName": "Field"
        },
        {
            "Dex": "29",
            "GroupName": "Monster"
        },
        {
            "Dex": "290",
            "GroupName": "Bug"
        },
        {
            "Dex": "291",
            "GroupName": "Bug"
        },
        {
            "Dex": "292",
            "GroupName": "Mineral"
        },
        {
            "Dex": "293",
            "GroupName": "Field"
        },
        {
            "Dex": "293",
            "GroupName": "Monster"
        },
        {
            "Dex": "294",
            "GroupName": "Field"
        },
        {
            "Dex": "294",
            "GroupName": "Monster"
        },
        {
            "Dex": "295",
            "GroupName": "Field"
        },
        {
            "Dex": "295",
            "GroupName": "Monster"
        },
        {
            "Dex": "296",
            "GroupName": "Human-Like"
        },
        {
            "Dex": "297",
            "GroupName": "Human-Like"
        },
        {
            "Dex": "298",
            "GroupName": "Undiscovered"
        },
        {
            "Dex": "299",
            "GroupName": "Mineral"
        },
        {
            "Dex": "3",
            "GroupName": "Grass"
        },
        {
            "Dex": "3",
            "GroupName": "Monster"
        },
        {
            "Dex": "30",
            "GroupName": "Undiscovered"
        },
        {
            "Dex": "300",
            "GroupName": "Fairy"
        },
        {
            "Dex": "300",
            "GroupName": "Field"
        },
        {
            "Dex": "301",
            "GroupName": "Fairy"
        },
        {
            "Dex": "301",
            "GroupName": "Field"
        },
        {
            "Dex": "302",
            "GroupName": "Human-Like"
        },
        {
            "Dex": "303",
            "GroupName": "Fairy"
        },
        {
            "Dex": "303",
            "GroupName": "Field"
        },
        {
            "Dex": "304",
            "GroupName": "Monster"
        },
        {
            "Dex": "305",
            "GroupName": "Monster"
        },
        {
            "Dex": "306",
            "GroupName": "Monster"
        },
        {
            "Dex": "307",
            "GroupName": "Human-Like"
        },
        {
            "Dex": "308",
            "GroupName": "Human-Like"
        },
        {
            "Dex": "309",
            "GroupName": "Field"
        },
        {
            "Dex": "31",
            "GroupName": "Undiscovered"
        },
        {
            "Dex": "310",
            "GroupName": "Field"
        },
        {
            "Dex": "311",
            "GroupName": "Fairy"
        },
        {
            "Dex": "312",
            "GroupName": "Fairy"
        },
        {
            "Dex": "313",
            "GroupName": "Bug"
        },
        {
            "Dex": "313",
            "GroupName": "Human-Like"
        },
        {
            "Dex": "314",
            "GroupName": "Bug"
        },
        {
            "Dex": "314",
            "GroupName": "Human-Like"
        },
        {
            "Dex": "315",
            "GroupName": "Fairy"
        },
        {
            "Dex": "315",
            "GroupName": "Grass"
        },
        {
            "Dex": "316",
            "GroupName": "Amorphous"
        },
        {
            "Dex": "317",
            "GroupName": "Amorphous"
        },
        {
            "Dex": "318",
            "GroupName": "Water 2"
        },
        {
            "Dex": "319",
            "GroupName": "Water 2"
        },
        {
            "Dex": "32",
            "GroupName": "Field"
        },
        {
            "Dex": "32",
            "GroupName": "Monster"
        },
        {
            "Dex": "320",
            "GroupName": "Field"
        },
        {
            "Dex": "320",
            "GroupName": "Water 2"
        },
        {
            "Dex": "321",
            "GroupName": "Field"
        },
        {
            "Dex": "321",
            "GroupName": "Water 2"
        },
        {
            "Dex": "322",
            "GroupName": "Field"
        },
        {
            "Dex": "323",
            "GroupName": "Field"
        },
        {
            "Dex": "324",
            "GroupName": "Field"
        },
        {
            "Dex": "325",
            "GroupName": "Field"
        },
        {
            "Dex": "326",
            "GroupName": "Field"
        },
        {
            "Dex": "327",
            "GroupName": "Field"
        },
        {
            "Dex": "327",
            "GroupName": "Human-Like"
        },
        {
            "Dex": "328",
            "GroupName": "Bug"
        },
        {
            "Dex": "328",
            "GroupName": "Dragon"
        },
        {
            "Dex": "329",
            "GroupName": "Bug"
        },
        {
            "Dex": "329",
            "GroupName": "Dragon"
        },
        {
            "Dex": "33",
            "GroupName": "Field"
        },
        {
            "Dex": "33",
            "GroupName": "Monster"
        },
        {
            "Dex": "330",
            "GroupName": "Bug"
        },
        {
            "Dex": "330",
            "GroupName": "Dragon"
        },
        {
            "Dex": "331",
            "GroupName": "Grass"
        },
        {
            "Dex": "331",
            "GroupName": "Human-Like"
        },
        {
            "Dex": "332",
            "GroupName": "Grass"
        },
        {
            "Dex": "332",
            "GroupName": "Human-Like"
        },
        {
            "Dex": "333",
            "GroupName": "Dragon"
        },
        {
            "Dex": "333",
            "GroupName": "Flying"
        },
        {
            "Dex": "334",
            "GroupName": "Dragon"
        },
        {
            "Dex": "334",
            "GroupName": "Flying"
        },
        {
            "Dex": "335",
            "GroupName": "Field"
        },
        {
            "Dex": "336",
            "GroupName": "Dragon"
        },
        {
            "Dex": "336",
            "GroupName": "Field"
        },
        {
            "Dex": "337",
            "GroupName": "Mineral"
        },
        {
            "Dex": "338",
            "GroupName": "Mineral"
        },
        {
            "Dex": "339",
            "GroupName": "Water 2"
        },
        {
            "Dex": "34",
            "GroupName": "Field"
        },
        {
            "Dex": "34",
            "GroupName": "Monster"
        },
        {
            "Dex": "340",
            "GroupName": "Water 2"
        },
        {
            "Dex": "341",
            "GroupName": "Water 1"
        },
        {
            "Dex": "341",
            "GroupName": "Water 3"
        },
        {
            "Dex": "342",
            "GroupName": "Water 1"
        },
        {
            "Dex": "342",
            "GroupName": "Water 3"
        },
        {
            "Dex": "343",
            "GroupName": "Mineral"
        },
        {
            "Dex": "344",
            "GroupName": "Mineral"
        },
        {
            "Dex": "345",
            "GroupName": "Water 3"
        },
        {
            "Dex": "346",
            "GroupName": "Water 3"
        },
        {
            "Dex": "347",
            "GroupName": "Water 3"
        },
        {
            "Dex": "348",
            "GroupName": "Water 3"
        },
        {
            "Dex": "349",
            "GroupName": "Dragon"
        },
        {
            "Dex": "349",
            "GroupName": "Water 1"
        },
        {
            "Dex": "35",
            "GroupName": "Fairy"
        },
        {
            "Dex": "350",
            "GroupName": "Dragon"
        },
        {
            "Dex": "350",
            "GroupName": "Water 1"
        },
        {
            "Dex": "351",
            "GroupName": "Amorphous"
        },
        {
            "Dex": "351",
            "GroupName": "Fairy"
        },
        {
            "Dex": "352",
            "GroupName": "Field"
        },
        {
            "Dex": "353",
            "GroupName": "Amorphous"
        },
        {
            "Dex": "354",
            "GroupName": "Amorphous"
        },
        {
            "Dex": "355",
            "GroupName": "Amorphous"
        },
        {
            "Dex": "356",
            "GroupName": "Amorphous"
        },
        {
            "Dex": "357",
            "GroupName": "Grass"
        },
        {
            "Dex": "357",
            "GroupName": "Monster"
        },
        {
            "Dex": "358",
            "GroupName": "Amorphous"
        },
        {
            "Dex": "359",
            "GroupName": "Field"
        },
        {
            "Dex": "36",
            "GroupName": "Fairy"
        },
        {
            "Dex": "360",
            "GroupName": "Undiscovered"
        },
        {
            "Dex": "361",
            "GroupName": "Fairy"
        },
        {
            "Dex": "361",
            "GroupName": "Mineral"
        },
        {
            "Dex": "362",
            "GroupName": "Fairy"
        },
        {
            "Dex": "362",
            "GroupName": "Mineral"
        },
        {
            "Dex": "363",
            "GroupName": "Field"
        },
        {
            "Dex": "363",
            "GroupName": "Water 1"
        },
        {
            "Dex": "364",
            "GroupName": "Field"
        },
        {
            "Dex": "364",
            "GroupName": "Water 1"
        },
        {
            "Dex": "365",
            "GroupName": "Field"
        },
        {
            "Dex": "365",
            "GroupName": "Water 1"
        },
        {
            "Dex": "366",
            "GroupName": "Water 1"
        },
        {
            "Dex": "367",
            "GroupName": "Water 1"
        },
        {
            "Dex": "368",
            "GroupName": "Water 1"
        },
        {
            "Dex": "369",
            "GroupName": "Water 1"
        },
        {
            "Dex": "369",
            "GroupName": "Water 2"
        },
        {
            "Dex": "37",
            "GroupName": "Field"
        },
        {
            "Dex": "370",
            "GroupName": "Water 2"
        },
        {
            "Dex": "371",
            "GroupName": "Dragon"
        },
        {
            "Dex": "372",
            "GroupName": "Dragon"
        },
        {
            "Dex": "373",
            "GroupName": "Dragon"
        },
        {
            "Dex": "374",
            "GroupName": "Mineral"
        },
        {
            "Dex": "375",
            "GroupName": "Mineral"
        },
        {
            "Dex": "376",
            "GroupName": "Mineral"
        },
        {
            "Dex": "377",
            "GroupName": "Undiscovered"
        },
        {
            "Dex": "378",
            "GroupName": "Undiscovered"
        },
        {
            "Dex": "379",
            "GroupName": "Undiscovered"
        },
        {
            "Dex": "38",
            "GroupName": "Field"
        },
        {
            "Dex": "380",
            "GroupName": "Undiscovered"
        },
        {
            "Dex": "381",
            "GroupName": "Undiscovered"
        },
        {
            "Dex": "382",
            "GroupName": "Undiscovered"
        },
        {
            "Dex": "383",
            "GroupName": "Undiscovered"
        },
        {
            "Dex": "384",
            "GroupName": "Undiscovered"
        },
        {
            "Dex": "385",
            "GroupName": "Undiscovered"
        },
        {
            "Dex": "386",
            "GroupName": "Undiscovered"
        },
        {
            "Dex": "39",
            "GroupName": "Fairy"
        },
        {
            "Dex": "4",
            "GroupName": "Dragon"
        },
        {
            "Dex": "4",
            "GroupName": "Monster"
        },
        {
            "Dex": "40",
            "GroupName": "Fairy"
        },
        {
            "Dex": "41",
            "GroupName": "Flying"
        },
        {
            "Dex": "42",
            "GroupName": "Flying"
        },
        {
            "Dex": "43",
            "GroupName": "Grass"
        },
        {
            "Dex": "44",
            "GroupName": "Grass"
        },
        {
            "Dex": "45",
            "GroupName": "Grass"
        },
        {
            "Dex": "46",
            "GroupName": "Bug"
        },
        {
            "Dex": "46",
            "GroupName": "Grass"
        },
        {
            "Dex": "47",
            "GroupName": "Bug"
        },
        {
            "Dex": "47",
            "GroupName": "Grass"
        },
        {
            "Dex": "48",
            "GroupName": "Bug"
        },
        {
            "Dex": "49",
            "GroupName": "Bug"
        },
        {
            "Dex": "5",
            "GroupName": "Dragon"
        },
        {
            "Dex": "5",
            "GroupName": "Monster"
        },
        {
            "Dex": "50",
            "GroupName": "Field"
        },
        {
            "Dex": "51",
            "GroupName": "Field"
        },
        {
            "Dex": "52",
            "GroupName": "Field"
        },
        {
            "Dex": "53",
            "GroupName": "Field"
        },
        {
            "Dex": "54",
            "GroupName": "Field"
        },
        {
            "Dex": "54",
            "GroupName": "Water 1"
        },
        {
            "Dex": "55",
            "GroupName": "Field"
        },
        {
            "Dex": "55",
            "GroupName": "Water 1"
        },
        {
            "Dex": "56",
            "GroupName": "Field"
        },
        {
            "Dex": "57",
            "GroupName": "Field"
        },
        {
            "Dex": "58",
            "GroupName": "Field"
        },
        {
            "Dex": "59",
            "GroupName": "Field"
        },
        {
            "Dex": "6",
            "GroupName": "Dragon"
        },
        {
            "Dex": "6",
            "GroupName": "Monster"
        },
        {
            "Dex": "60",
            "GroupName": "Water 1"
        },
        {
            "Dex": "61",
            "GroupName": "Water 1"
        },
        {
            "Dex": "62",
            "GroupName": "Water 1"
        },
        {
            "Dex": "63",
            "GroupName": "Human-Like"
        },
        {
            "Dex": "64",
            "GroupName": "Human-Like"
        },
        {
            "Dex": "65",
            "GroupName": "Human-Like"
        },
        {
            "Dex": "66",
            "GroupName": "Human-Like"
        },
        {
            "Dex": "67",
            "GroupName": "Human-Like"
        },
        {
            "Dex": "68",
            "GroupName": "Human-Like"
        },
        {
            "Dex": "69",
            "GroupName": "Grass"
        },
        {
            "Dex": "7",
            "GroupName": "Monster"
        },
        {
            "Dex": "7",
            "GroupName": "Water 1"
        },
        {
            "Dex": "70",
            "GroupName": "Grass"
        },
        {
            "Dex": "71",
            "GroupName": "Grass"
        },
        {
            "Dex": "72",
            "GroupName": "Water 3"
        },
        {
            "Dex": "73",
            "GroupName": "Water 3"
        },
        {
            "Dex": "74",
            "GroupName": "Mineral"
        },
        {
            "Dex": "75",
            "GroupName": "Mineral"
        },
        {
            "Dex": "76",
            "GroupName": "Mineral"
        },
        {
            "Dex": "77",
            "GroupName": "Field"
        },
        {
            "Dex": "78",
            "GroupName": "Field"
        },
        {
            "Dex": "79",
            "GroupName": "Monster"
        },
        {
            "Dex": "79",
            "GroupName": "Water 1"
        },
        {
            "Dex": "8",
            "GroupName": "Monster"
        },
        {
            "Dex": "8",
            "GroupName": "Water 1"
        },
        {
            "Dex": "80",
            "GroupName": "Monster"
        },
        {
            "Dex": "80",
            "GroupName": "Water 1"
        },
        {
            "Dex": "81",
            "GroupName": "Mineral"
        },
        {
            "Dex": "82",
            "GroupName": "Mineral"
        },
        {
            "Dex": "83",
            "GroupName": "Field"
        },
        {
            "Dex": "83",
            "GroupName": "Flying"
        },
        {
            "Dex": "84",
            "GroupName": "Flying"
        },
        {
            "Dex": "85",
            "GroupName": "Flying"
        },
        {
            "Dex": "86",
            "GroupName": "Field"
        },
        {
            "Dex": "86",
            "GroupName": "Water 1"
        },
        {
            "Dex": "87",
            "GroupName": "Field"
        },
        {
            "Dex": "87",
            "GroupName": "Water 1"
        },
        {
            "Dex": "88",
            "GroupName": "Amorphous"
        },
        {
            "Dex": "89",
            "GroupName": "Amorphous"
        },
        {
            "Dex": "9",
            "GroupName": "Monster"
        },
        {
            "Dex": "9",
            "GroupName": "Water 1"
        },
        {
            "Dex": "90",
            "GroupName": "Water 3"
        },
        {
            "Dex": "91",
            "GroupName": "Water 3"
        },
        {
            "Dex": "92",
            "GroupName": "Amorphous"
        },
        {
            "Dex": "93",
            "GroupName": "Amorphous"
        },
        {
            "Dex": "94",
            "GroupName": "Amorphous"
        },
        {
            "Dex": "95",
            "GroupName": "Mineral"
        },
        {
            "Dex": "96",
            "GroupName": "Human-Like"
        },
        {
            "Dex": "97",
            "GroupName": "Human-Like"
        },
        {
            "Dex": "98",
            "GroupName": "Water 3"
        },
        {
            "Dex": "99",
            "GroupName": "Water 3"
        }
        ],

        //dunno if used?
        selectFoughtAt:{},
        foughtat: [
        {
            "TID": "1",
            "LocationName": "Abandoned Ship"
        },
        {
            "TID": "10",
            "LocationName": "Ever Grande City"
        },
        {
            "TID": "100",
            "LocationName": "Hoenn Route 112"
        },
        {
            "TID": "101",
            "LocationName": "Hoenn Route 112"
        },
        {
            "TID": "102",
            "LocationName": "Hoenn Route 113"
        },
        {
            "TID": "103",
            "LocationName": "Hoenn Route 113"
        },
        {
            "TID": "104",
            "LocationName": "Hoenn Route 113"
        },
        {
            "TID": "105",
            "LocationName": "Hoenn Route 113"
        },
        {
            "TID": "106",
            "LocationName": "Hoenn Route 113"
        },
        {
            "TID": "107",
            "LocationName": "Hoenn Route 113"
        },
        {
            "TID": "108",
            "LocationName": "Hoenn Route 113"
        },
        {
            "TID": "109",
            "LocationName": "Hoenn Route 113"
        },
        {
            "TID": "11",
            "LocationName": "Ever Grande City"
        },
        {
            "TID": "110",
            "LocationName": "Hoenn Route 113"
        },
        {
            "TID": "111",
            "LocationName": "Hoenn Route 113"
        },
        {
            "TID": "112",
            "LocationName": "Hoenn Route 114"
        },
        {
            "TID": "113",
            "LocationName": "Hoenn Route 114"
        },
        {
            "TID": "114",
            "LocationName": "Hoenn Route 114"
        },
        {
            "TID": "115",
            "LocationName": "Hoenn Route 114"
        },
        {
            "TID": "116",
            "LocationName": "Hoenn Route 114"
        },
        {
            "TID": "117",
            "LocationName": "Hoenn Route 114"
        },
        {
            "TID": "118",
            "LocationName": "Hoenn Route 114"
        },
        {
            "TID": "119",
            "LocationName": "Hoenn Route 114"
        },
        {
            "TID": "12",
            "LocationName": "Ever Grande City"
        },
        {
            "TID": "120",
            "LocationName": "Hoenn Route 114"
        },
        {
            "TID": "121",
            "LocationName": "Hoenn Route 114"
        },
        {
            "TID": "122",
            "LocationName": "Hoenn Route 114"
        },
        {
            "TID": "123",
            "LocationName": "Hoenn Route 114"
        },
        {
            "TID": "124",
            "LocationName": "Hoenn Route 115"
        },
        {
            "TID": "125",
            "LocationName": "Hoenn Route 115"
        },
        {
            "TID": "126",
            "LocationName": "Hoenn Route 115"
        },
        {
            "TID": "127",
            "LocationName": "Hoenn Route 115"
        },
        {
            "TID": "128",
            "LocationName": "Hoenn Route 115"
        },
        {
            "TID": "129",
            "LocationName": "Hoenn Route 115"
        },
        {
            "TID": "13",
            "LocationName": "Hoenn Route 102"
        },
        {
            "TID": "130",
            "LocationName": "Hoenn Route 115"
        },
        {
            "TID": "131",
            "LocationName": "Hoenn Route 115"
        },
        {
            "TID": "132",
            "LocationName": "Hoenn Route 115"
        },
        {
            "TID": "133",
            "LocationName": "Hoenn Route 115"
        },
        {
            "TID": "134",
            "LocationName": "Hoenn Route 116"
        },
        {
            "TID": "135",
            "LocationName": "Hoenn Route 116"
        },
        {
            "TID": "136",
            "LocationName": "Hoenn Route 116"
        },
        {
            "TID": "137",
            "LocationName": "Hoenn Route 116"
        },
        {
            "TID": "138",
            "LocationName": "Hoenn Route 116"
        },
        {
            "TID": "139",
            "LocationName": "Hoenn Route 116"
        },
        {
            "TID": "14",
            "LocationName": "Hoenn Route 102"
        },
        {
            "TID": "140",
            "LocationName": "Hoenn Route 116"
        },
        {
            "TID": "141",
            "LocationName": "Hoenn Route 116"
        },
        {
            "TID": "142",
            "LocationName": "Hoenn Route 116"
        },
        {
            "TID": "143",
            "LocationName": "Hoenn Route 116"
        },
        {
            "TID": "144",
            "LocationName": "Hoenn Route 117"
        },
        {
            "TID": "145",
            "LocationName": "Hoenn Route 117"
        },
        {
            "TID": "146",
            "LocationName": "Hoenn Route 117"
        },
        {
            "TID": "147",
            "LocationName": "Hoenn Route 117"
        },
        {
            "TID": "148",
            "LocationName": "Hoenn Route 117"
        },
        {
            "TID": "149",
            "LocationName": "Hoenn Route 117"
        },
        {
            "TID": "15",
            "LocationName": "Hoenn Route 102"
        },
        {
            "TID": "150",
            "LocationName": "Hoenn Route 117"
        },
        {
            "TID": "151",
            "LocationName": "Hoenn Route 117"
        },
        {
            "TID": "152",
            "LocationName": "Hoenn Route 117"
        },
        {
            "TID": "153",
            "LocationName": "Hoenn Route 118"
        },
        {
            "TID": "154",
            "LocationName": "Hoenn Route 118"
        },
        {
            "TID": "155",
            "LocationName": "Hoenn Route 118"
        },
        {
            "TID": "156",
            "LocationName": "Hoenn Route 118"
        },
        {
            "TID": "157",
            "LocationName": "Hoenn Route 118"
        },
        {
            "TID": "158",
            "LocationName": "Hoenn Route 118"
        },
        {
            "TID": "159",
            "LocationName": "Hoenn Route 118"
        },
        {
            "TID": "16",
            "LocationName": "Hoenn Route 102"
        },
        {
            "TID": "160",
            "LocationName": "Hoenn Route 119"
        },
        {
            "TID": "161",
            "LocationName": "Hoenn Route 119"
        },
        {
            "TID": "162",
            "LocationName": "Hoenn Route 119"
        },
        {
            "TID": "163",
            "LocationName": "Hoenn Route 119"
        },
        {
            "TID": "164",
            "LocationName": "Hoenn Route 119"
        },
        {
            "TID": "165",
            "LocationName": "Hoenn Route 119"
        },
        {
            "TID": "166",
            "LocationName": "Hoenn Route 119"
        },
        {
            "TID": "167",
            "LocationName": "Hoenn Route 119"
        },
        {
            "TID": "168",
            "LocationName": "Hoenn Route 119"
        },
        {
            "TID": "169",
            "LocationName": "Hoenn Route 119"
        },
        {
            "TID": "17",
            "LocationName": "Hoenn Route 103"
        },
        {
            "TID": "17",
            "LocationName": "Hoenn Route 110"
        },
        {
            "TID": "17",
            "LocationName": "Hoenn Route 119"
        },
        {
            "TID": "17",
            "LocationName": "Lilycove City"
        },
        {
            "TID": "17",
            "LocationName": "Rustboro City"
        },
        {
            "TID": "170",
            "LocationName": "Hoenn Route 119"
        },
        {
            "TID": "171",
            "LocationName": "Hoenn Route 119"
        },
        {
            "TID": "172",
            "LocationName": "Hoenn Route 119"
        },
        {
            "TID": "173",
            "LocationName": "Hoenn Route 119"
        },
        {
            "TID": "174",
            "LocationName": "Hoenn Route 119"
        },
        {
            "TID": "175",
            "LocationName": "Hoenn Route 119"
        },
        {
            "TID": "176",
            "LocationName": "Hoenn Route 119"
        },
        {
            "TID": "177",
            "LocationName": "Hoenn Route 120"
        },
        {
            "TID": "178",
            "LocationName": "Hoenn Route 120"
        },
        {
            "TID": "179",
            "LocationName": "Hoenn Route 120"
        },
        {
            "TID": "18",
            "LocationName": "Hoenn Route 103"
        },
        {
            "TID": "18",
            "LocationName": "Hoenn Route 110"
        },
        {
            "TID": "18",
            "LocationName": "Hoenn Route 119"
        },
        {
            "TID": "18",
            "LocationName": "Lilycove City"
        },
        {
            "TID": "18",
            "LocationName": "Rustboro City"
        },
        {
            "TID": "180",
            "LocationName": "Hoenn Route 120"
        },
        {
            "TID": "181",
            "LocationName": "Hoenn Route 120"
        },
        {
            "TID": "182",
            "LocationName": "Hoenn Route 120"
        },
        {
            "TID": "183",
            "LocationName": "Hoenn Route 120"
        },
        {
            "TID": "184",
            "LocationName": "Hoenn Route 120"
        },
        {
            "TID": "185",
            "LocationName": "Hoenn Route 120"
        },
        {
            "TID": "186",
            "LocationName": "Hoenn Route 120"
        },
        {
            "TID": "187",
            "LocationName": "Hoenn Route 120"
        },
        {
            "TID": "188",
            "LocationName": "Hoenn Route 120"
        },
        {
            "TID": "189",
            "LocationName": "Hoenn Route 120"
        },
        {
            "TID": "19",
            "LocationName": "Hoenn Route 103"
        },
        {
            "TID": "190",
            "LocationName": "Hoenn Route 121"
        },
        {
            "TID": "191",
            "LocationName": "Hoenn Route 121"
        },
        {
            "TID": "192",
            "LocationName": "Hoenn Route 121"
        },
        {
            "TID": "193",
            "LocationName": "Hoenn Route 121"
        },
        {
            "TID": "194",
            "LocationName": "Hoenn Route 121"
        },
        {
            "TID": "195",
            "LocationName": "Hoenn Route 121"
        },
        {
            "TID": "196",
            "LocationName": "Hoenn Route 121"
        },
        {
            "TID": "197",
            "LocationName": "Hoenn Route 121"
        },
        {
            "TID": "198",
            "LocationName": "Hoenn Route 121"
        },
        {
            "TID": "199",
            "LocationName": "Hoenn Route 121"
        },
        {
            "TID": "2",
            "LocationName": "Abandoned Ship"
        },
        {
            "TID": "20",
            "LocationName": "Hoenn Route 103"
        },
        {
            "TID": "200",
            "LocationName": "Hoenn Route 123"
        },
        {
            "TID": "201",
            "LocationName": "Hoenn Route 123"
        },
        {
            "TID": "202",
            "LocationName": "Hoenn Route 123"
        },
        {
            "TID": "203",
            "LocationName": "Hoenn Route 123"
        },
        {
            "TID": "204",
            "LocationName": "Hoenn Route 123"
        },
        {
            "TID": "205",
            "LocationName": "Hoenn Route 123"
        },
        {
            "TID": "206",
            "LocationName": "Hoenn Route 123"
        },
        {
            "TID": "207",
            "LocationName": "Hoenn Route 123"
        },
        {
            "TID": "208",
            "LocationName": "Hoenn Route 123"
        },
        {
            "TID": "209",
            "LocationName": "Hoenn Route 123"
        },
        {
            "TID": "21",
            "LocationName": "Hoenn Route 103"
        },
        {
            "TID": "210",
            "LocationName": "Hoenn Route 123"
        },
        {
            "TID": "211",
            "LocationName": "Hoenn Route 123"
        },
        {
            "TID": "212",
            "LocationName": "Hoenn Route 123"
        },
        {
            "TID": "213",
            "LocationName": "Hoenn Route 123"
        },
        {
            "TID": "214",
            "LocationName": "Hoenn Route 123"
        },
        {
            "TID": "215",
            "LocationName": "Hoenn Route 124"
        },
        {
            "TID": "216",
            "LocationName": "Hoenn Route 124"
        },
        {
            "TID": "217",
            "LocationName": "Hoenn Route 124"
        },
        {
            "TID": "218",
            "LocationName": "Hoenn Route 124"
        },
        {
            "TID": "219",
            "LocationName": "Hoenn Route 124"
        },
        {
            "TID": "22",
            "LocationName": "Hoenn Route 103"
        },
        {
            "TID": "220",
            "LocationName": "Hoenn Route 124"
        },
        {
            "TID": "221",
            "LocationName": "Hoenn Route 124"
        },
        {
            "TID": "222",
            "LocationName": "Hoenn Route 124"
        },
        {
            "TID": "223",
            "LocationName": "Hoenn Route 125"
        },
        {
            "TID": "224",
            "LocationName": "Hoenn Route 125"
        },
        {
            "TID": "225",
            "LocationName": "Hoenn Route 125"
        },
        {
            "TID": "226",
            "LocationName": "Hoenn Route 125"
        },
        {
            "TID": "227",
            "LocationName": "Hoenn Route 125"
        },
        {
            "TID": "228",
            "LocationName": "Hoenn Route 125"
        },
        {
            "TID": "229",
            "LocationName": "Hoenn Route 125"
        },
        {
            "TID": "23",
            "LocationName": "Hoenn Route 103"
        },
        {
            "TID": "230",
            "LocationName": "Hoenn Route 125"
        },
        {
            "TID": "231",
            "LocationName": "Hoenn Route 126"
        },
        {
            "TID": "232",
            "LocationName": "Hoenn Route 126"
        },
        {
            "TID": "233",
            "LocationName": "Hoenn Route 126"
        },
        {
            "TID": "234",
            "LocationName": "Hoenn Route 126"
        },
        {
            "TID": "235",
            "LocationName": "Hoenn Route 126"
        },
        {
            "TID": "236",
            "LocationName": "Hoenn Route 126"
        },
        {
            "TID": "237",
            "LocationName": "Hoenn Route 126"
        },
        {
            "TID": "238",
            "LocationName": "Hoenn Route 126"
        },
        {
            "TID": "239",
            "LocationName": "Hoenn Route 127"
        },
        {
            "TID": "24",
            "LocationName": "Hoenn Route 103"
        },
        {
            "TID": "240",
            "LocationName": "Hoenn Route 127"
        },
        {
            "TID": "241",
            "LocationName": "Hoenn Route 127"
        },
        {
            "TID": "242",
            "LocationName": "Hoenn Route 127"
        },
        {
            "TID": "243",
            "LocationName": "Hoenn Route 127"
        },
        {
            "TID": "244",
            "LocationName": "Hoenn Route 127"
        },
        {
            "TID": "245",
            "LocationName": "Hoenn Route 127"
        },
        {
            "TID": "246",
            "LocationName": "Hoenn Route 127"
        },
        {
            "TID": "247",
            "LocationName": "Hoenn Route 128"
        },
        {
            "TID": "248",
            "LocationName": "Hoenn Route 128"
        },
        {
            "TID": "249",
            "LocationName": "Hoenn Route 128"
        },
        {
            "TID": "25",
            "LocationName": "Hoenn Route 103"
        },
        {
            "TID": "250",
            "LocationName": "Hoenn Route 128"
        },
        {
            "TID": "251",
            "LocationName": "Hoenn Route 128"
        },
        {
            "TID": "252",
            "LocationName": "Hoenn Route 128"
        },
        {
            "TID": "253",
            "LocationName": "Hoenn Route 128"
        },
        {
            "TID": "254",
            "LocationName": "Hoenn Route 129"
        },
        {
            "TID": "255",
            "LocationName": "Hoenn Route 129"
        },
        {
            "TID": "256",
            "LocationName": "Hoenn Route 129"
        },
        {
            "TID": "257",
            "LocationName": "Hoenn Route 129"
        },
        {
            "TID": "258",
            "LocationName": "Hoenn Route 129"
        },
        {
            "TID": "259",
            "LocationName": "Hoenn Route 130"
        },
        {
            "TID": "26",
            "LocationName": "Hoenn Route 103"
        },
        {
            "TID": "260",
            "LocationName": "Hoenn Route 130"
        },
        {
            "TID": "261",
            "LocationName": "Hoenn Route 130"
        },
        {
            "TID": "262",
            "LocationName": "Hoenn Route 131"
        },
        {
            "TID": "263",
            "LocationName": "Hoenn Route 131"
        },
        {
            "TID": "264",
            "LocationName": "Hoenn Route 131"
        },
        {
            "TID": "265",
            "LocationName": "Hoenn Route 131"
        },
        {
            "TID": "266",
            "LocationName": "Hoenn Route 131"
        },
        {
            "TID": "267",
            "LocationName": "Hoenn Route 131"
        },
        {
            "TID": "268",
            "LocationName": "Hoenn Route 131"
        },
        {
            "TID": "269",
            "LocationName": "Hoenn Route 132"
        },
        {
            "TID": "27",
            "LocationName": "Hoenn Route 105"
        },
        {
            "TID": "270",
            "LocationName": "Hoenn Route 132"
        },
        {
            "TID": "271",
            "LocationName": "Hoenn Route 132"
        },
        {
            "TID": "272",
            "LocationName": "Hoenn Route 132"
        },
        {
            "TID": "273",
            "LocationName": "Hoenn Route 132"
        },
        {
            "TID": "274",
            "LocationName": "Hoenn Route 132"
        },
        {
            "TID": "275",
            "LocationName": "Hoenn Route 132"
        },
        {
            "TID": "276",
            "LocationName": "Hoenn Route 132"
        },
        {
            "TID": "277",
            "LocationName": "Hoenn Route 133"
        },
        {
            "TID": "278",
            "LocationName": "Hoenn Route 133"
        },
        {
            "TID": "279",
            "LocationName": "Hoenn Route 133"
        },
        {
            "TID": "28",
            "LocationName": "Hoenn Route 105"
        },
        {
            "TID": "280",
            "LocationName": "Hoenn Route 133"
        },
        {
            "TID": "281",
            "LocationName": "Hoenn Route 133"
        },
        {
            "TID": "282",
            "LocationName": "Hoenn Route 133"
        },
        {
            "TID": "283",
            "LocationName": "Hoenn Route 133"
        },
        {
            "TID": "284",
            "LocationName": "Hoenn Route 134"
        },
        {
            "TID": "285",
            "LocationName": "Hoenn Route 134"
        },
        {
            "TID": "286",
            "LocationName": "Hoenn Route 134"
        },
        {
            "TID": "287",
            "LocationName": "Hoenn Route 134"
        },
        {
            "TID": "288",
            "LocationName": "Hoenn Route 134"
        },
        {
            "TID": "289",
            "LocationName": "Hoenn Route 134"
        },
        {
            "TID": "29",
            "LocationName": "Hoenn Route 105"
        },
        {
            "TID": "290",
            "LocationName": "Hoenn Route 134"
        },
        {
            "TID": "291",
            "LocationName": "Hoenn Route 134"
        },
        {
            "TID": "292",
            "LocationName": "Hoenn Route 134"
        },
        {
            "TID": "293",
            "LocationName": "Jagged Pass"
        },
        {
            "TID": "294",
            "LocationName": "Jagged Pass"
        },
        {
            "TID": "294",
            "LocationName": "Magma Hideout (Jagged Pass)"
        },
        {
            "TID": "294",
            "LocationName": "Mossdeep Space Center"
        },
        {
            "TID": "294",
            "LocationName": "Mt. Chimney"
        },
        {
            "TID": "294",
            "LocationName": "Rusturf Tunnel"
        },
        {
            "TID": "295",
            "LocationName": "Jagged Pass"
        },
        {
            "TID": "296",
            "LocationName": "Jagged Pass"
        },
        {
            "TID": "297",
            "LocationName": "Jagged Pass"
        },
        {
            "TID": "298",
            "LocationName": "Jagged Pass"
        },
        {
            "TID": "299",
            "LocationName": "Magma Hideout (Jagged Pass)"
        },
        {
            "TID": "299",
            "LocationName": "Mossdeep Space Center"
        },
        {
            "TID": "299",
            "LocationName": "Mt. Chimney"
        },
        {
            "TID": "3",
            "LocationName": "Abandoned Ship"
        },
        {
            "TID": "30",
            "LocationName": "Hoenn Route 105"
        },
        {
            "TID": "300",
            "LocationName": "Magma Hideout (Jagged Pass)"
        },
        {
            "TID": "300",
            "LocationName": "Mossdeep Space Center"
        },
        {
            "TID": "300",
            "LocationName": "Mt. Chimney"
        },
        {
            "TID": "301",
            "LocationName": "Mauville City"
        },
        {
            "TID": "301",
            "LocationName": "Victory Road (Hoenn)"
        },
        {
            "TID": "302",
            "LocationName": "Meteor Falls"
        },
        {
            "TID": "303",
            "LocationName": "Meteor Falls"
        },
        {
            "TID": "304",
            "LocationName": "Meteor Falls"
        },
        {
            "TID": "304",
            "LocationName": "Mossdeep Space Center"
        },
        {
            "TID": "305",
            "LocationName": "Mt. Chimney"
        },
        {
            "TID": "306",
            "LocationName": "Mt. Chimney"
        },
        {
            "TID": "307",
            "LocationName": "Mt. Chimney"
        },
        {
            "TID": "308",
            "LocationName": "Mt. Chimney"
        },
        {
            "TID": "309",
            "LocationName": "Mt. Chimney"
        },
        {
            "TID": "31",
            "LocationName": "Hoenn Route 105"
        },
        {
            "TID": "310",
            "LocationName": "Mt. Pyre"
        },
        {
            "TID": "311",
            "LocationName": "Mt. Pyre"
        },
        {
            "TID": "312",
            "LocationName": "Mt. Pyre"
        },
        {
            "TID": "313",
            "LocationName": "Mt. Pyre"
        },
        {
            "TID": "314",
            "LocationName": "Mt. Pyre"
        },
        {
            "TID": "315",
            "LocationName": "Mt. Pyre"
        },
        {
            "TID": "316",
            "LocationName": "Mt. Pyre"
        },
        {
            "TID": "317",
            "LocationName": "Mt. Pyre"
        },
        {
            "TID": "318",
            "LocationName": "Mt. Pyre"
        },
        {
            "TID": "319",
            "LocationName": "Mt. Pyre"
        },
        {
            "TID": "32",
            "LocationName": "Hoenn Route 105"
        },
        {
            "TID": "320",
            "LocationName": "Mt. Pyre"
        },
        {
            "TID": "321",
            "LocationName": "Mt. Pyre"
        },
        {
            "TID": "321",
            "LocationName": "Oceanic Museum"
        },
        {
            "TID": "321",
            "LocationName": "Petalburg Woods"
        },
        {
            "TID": "321",
            "LocationName": "Rusturf Tunnel"
        },
        {
            "TID": "321",
            "LocationName": "Seafloor Cavern"
        },
        {
            "TID": "321",
            "LocationName": "Team Aqua Hideout"
        },
        {
            "TID": "321",
            "LocationName": "Weather Institute"
        },
        {
            "TID": "322",
            "LocationName": "Petalburg Woods"
        },
        {
            "TID": "323",
            "LocationName": "Petalburg Woods"
        },
        {
            "TID": "326",
            "LocationName": "Rusturf Tunnel"
        },
        {
            "TID": "327",
            "LocationName": "S.S. Tidal"
        },
        {
            "TID": "328",
            "LocationName": "S.S. Tidal"
        },
        {
            "TID": "329",
            "LocationName": "S.S. Tidal"
        },
        {
            "TID": "33",
            "LocationName": "Hoenn Route 105"
        },
        {
            "TID": "330",
            "LocationName": "S.S. Tidal"
        },
        {
            "TID": "331",
            "LocationName": "S.S. Tidal"
        },
        {
            "TID": "332",
            "LocationName": "S.S. Tidal"
        },
        {
            "TID": "333",
            "LocationName": "S.S. Tidal"
        },
        {
            "TID": "334",
            "LocationName": "S.S. Tidal"
        },
        {
            "TID": "335",
            "LocationName": "Seafloor Cavern"
        },
        {
            "TID": "335",
            "LocationName": "Weather Institute"
        },
        {
            "TID": "336",
            "LocationName": "Seafloor Cavern"
        },
        {
            "TID": "337",
            "LocationName": "Seaside Cycling Road"
        },
        {
            "TID": "338",
            "LocationName": "Seaside Cycling Road"
        },
        {
            "TID": "339",
            "LocationName": "Seaside Cycling Road"
        },
        {
            "TID": "34",
            "LocationName": "Hoenn Route 106"
        },
        {
            "TID": "340",
            "LocationName": "Seaside Cycling Road"
        },
        {
            "TID": "341",
            "LocationName": "Seaside Cycling Road"
        },
        {
            "TID": "342",
            "LocationName": "Seaside Cycling Road"
        },
        {
            "TID": "343",
            "LocationName": "Team Aqua Hideout"
        },
        {
            "TID": "344",
            "LocationName": "Trainer Hill"
        },
        {
            "TID": "345",
            "LocationName": "Trainer Hill"
        },
        {
            "TID": "346",
            "LocationName": "Trainer Hill"
        },
        {
            "TID": "347",
            "LocationName": "Trainer Hill"
        },
        {
            "TID": "348",
            "LocationName": "Trainer Hill"
        },
        {
            "TID": "349",
            "LocationName": "Trainer Hill"
        },
        {
            "TID": "35",
            "LocationName": "Hoenn Route 106"
        },
        {
            "TID": "350",
            "LocationName": "Trainer Hill"
        },
        {
            "TID": "351",
            "LocationName": "Trainer Hill"
        },
        {
            "TID": "352",
            "LocationName": "Trainer Hill"
        },
        {
            "TID": "353",
            "LocationName": "Trainer Hill"
        },
        {
            "TID": "354",
            "LocationName": "Trainer Hill"
        },
        {
            "TID": "355",
            "LocationName": "Trainer Hill"
        },
        {
            "TID": "356",
            "LocationName": "Trainer Hill"
        },
        {
            "TID": "357",
            "LocationName": "Trainer Hill"
        },
        {
            "TID": "358",
            "LocationName": "Trainer Hill"
        },
        {
            "TID": "359",
            "LocationName": "Trainer Hill"
        },
        {
            "TID": "36",
            "LocationName": "Hoenn Route 106"
        },
        {
            "TID": "360",
            "LocationName": "Trainer Hill"
        },
        {
            "TID": "361",
            "LocationName": "Trainer Hill"
        },
        {
            "TID": "362",
            "LocationName": "Trainer Hill"
        },
        {
            "TID": "363",
            "LocationName": "Trainer Hill"
        },
        {
            "TID": "364",
            "LocationName": "Trainer Hill"
        },
        {
            "TID": "365",
            "LocationName": "Trainer Hill"
        },
        {
            "TID": "366",
            "LocationName": "Trainer Hill"
        },
        {
            "TID": "367",
            "LocationName": "Trainer Hill"
        },
        {
            "TID": "368",
            "LocationName": "Trainer Hill"
        },
        {
            "TID": "369",
            "LocationName": "Trainer Hill"
        },
        {
            "TID": "37",
            "LocationName": "Hoenn Route 106"
        },
        {
            "TID": "370",
            "LocationName": "Trainer Hill"
        },
        {
            "TID": "371",
            "LocationName": "Trainer Hill"
        },
        {
            "TID": "372",
            "LocationName": "Trainer Hill"
        },
        {
            "TID": "373",
            "LocationName": "Trainer Hill"
        },
        {
            "TID": "374",
            "LocationName": "Trainer Hill"
        },
        {
            "TID": "375",
            "LocationName": "Trainer Hill"
        },
        {
            "TID": "376",
            "LocationName": "Trainer Hill"
        },
        {
            "TID": "377",
            "LocationName": "Trainer Hill"
        },
        {
            "TID": "378",
            "LocationName": "Trainer Hill"
        },
        {
            "TID": "379",
            "LocationName": "Trainer Hill"
        },
        {
            "TID": "38",
            "LocationName": "Hoenn Route 107"
        },
        {
            "TID": "380",
            "LocationName": "Trainer Hill"
        },
        {
            "TID": "381",
            "LocationName": "Trainer Hill"
        },
        {
            "TID": "382",
            "LocationName": "Trainer Hill"
        },
        {
            "TID": "383",
            "LocationName": "Trainer Hill"
        },
        {
            "TID": "384",
            "LocationName": "Trick House"
        },
        {
            "TID": "385",
            "LocationName": "Trick House"
        },
        {
            "TID": "386",
            "LocationName": "Trick House"
        },
        {
            "TID": "387",
            "LocationName": "Trick House"
        },
        {
            "TID": "388",
            "LocationName": "Trick House"
        },
        {
            "TID": "389",
            "LocationName": "Trick House"
        },
        {
            "TID": "39",
            "LocationName": "Hoenn Route 107"
        },
        {
            "TID": "390",
            "LocationName": "Trick House"
        },
        {
            "TID": "391",
            "LocationName": "Trick House"
        },
        {
            "TID": "392",
            "LocationName": "Trick House"
        },
        {
            "TID": "393",
            "LocationName": "Trick House"
        },
        {
            "TID": "394",
            "LocationName": "Trick House"
        },
        {
            "TID": "395",
            "LocationName": "Trick House"
        },
        {
            "TID": "396",
            "LocationName": "Trick House"
        },
        {
            "TID": "397",
            "LocationName": "Trick House"
        },
        {
            "TID": "398",
            "LocationName": "Trick House"
        },
        {
            "TID": "399",
            "LocationName": "Trick House"
        },
        {
            "TID": "4",
            "LocationName": "Abandoned Ship"
        },
        {
            "TID": "40",
            "LocationName": "Hoenn Route 107"
        },
        {
            "TID": "400",
            "LocationName": "Trick House"
        },
        {
            "TID": "401",
            "LocationName": "Trick House"
        },
        {
            "TID": "402",
            "LocationName": "Trick House"
        },
        {
            "TID": "403",
            "LocationName": "Trick House"
        },
        {
            "TID": "404",
            "LocationName": "Trick House"
        },
        {
            "TID": "405",
            "LocationName": "Trick House"
        },
        {
            "TID": "406",
            "LocationName": "Trick House"
        },
        {
            "TID": "407",
            "LocationName": "Trick House"
        },
        {
            "TID": "408",
            "LocationName": "Victory Road (Hoenn)"
        },
        {
            "TID": "409",
            "LocationName": "Victory Road (Hoenn)"
        },
        {
            "TID": "41",
            "LocationName": "Hoenn Route 107"
        },
        {
            "TID": "410",
            "LocationName": "Victory Road (Hoenn)"
        },
        {
            "TID": "411",
            "LocationName": "Victory Road (Hoenn)"
        },
        {
            "TID": "412",
            "LocationName": "Victory Road (Hoenn)"
        },
        {
            "TID": "413",
            "LocationName": "Victory Road (Hoenn)"
        },
        {
            "TID": "414",
            "LocationName": "Victory Road (Hoenn)"
        },
        {
            "TID": "415",
            "LocationName": "Victory Road (Hoenn)"
        },
        {
            "TID": "416",
            "LocationName": "Victory Road (Hoenn)"
        },
        {
            "TID": "417",
            "LocationName": "Victory Road (Hoenn)"
        },
        {
            "TID": "418",
            "LocationName": "Victory Road (Hoenn)"
        },
        {
            "TID": "419",
            "LocationName": "Victory Road (Hoenn)"
        },
        {
            "TID": "42",
            "LocationName": "Hoenn Route 107"
        },
        {
            "TID": "420",
            "LocationName": "Victory Road (Hoenn)"
        },
        {
            "TID": "421",
            "LocationName": "Victory Road (Hoenn)"
        },
        {
            "TID": "422",
            "LocationName": "Victory Road (Hoenn)"
        },
        {
            "TID": "423",
            "LocationName": "Victory Road (Hoenn)"
        },
        {
            "TID": "424",
            "LocationName": "Rustboro City"
        },
        {
            "TID": "425",
            "LocationName": "Rustboro City"
        },
        {
            "TID": "426",
            "LocationName": "Rustboro City"
        },
        {
            "TID": "427",
            "LocationName": "Rustboro City"
        },
        {
            "TID": "428",
            "LocationName": "Dewford Town"
        },
        {
            "TID": "429",
            "LocationName": "Dewford Town"
        },
        {
            "TID": "43",
            "LocationName": "Hoenn Route 107"
        },
        {
            "TID": "430",
            "LocationName": "Dewford Town"
        },
        {
            "TID": "431",
            "LocationName": "Dewford Town"
        },
        {
            "TID": "432",
            "LocationName": "Dewford Town"
        },
        {
            "TID": "433",
            "LocationName": "Dewford Town"
        },
        {
            "TID": "434",
            "LocationName": "Dewford Town"
        },
        {
            "TID": "435",
            "LocationName": "Mauville City"
        },
        {
            "TID": "436",
            "LocationName": "Mauville City"
        },
        {
            "TID": "437",
            "LocationName": "Mauville City"
        },
        {
            "TID": "438",
            "LocationName": "Mauville City"
        },
        {
            "TID": "439",
            "LocationName": "Mauville City"
        },
        {
            "TID": "44",
            "LocationName": "Hoenn Route 108"
        },
        {
            "TID": "440",
            "LocationName": "Mauville City"
        },
        {
            "TID": "441",
            "LocationName": "Lavaridge Town"
        },
        {
            "TID": "442",
            "LocationName": "Lavaridge Town"
        },
        {
            "TID": "443",
            "LocationName": "Lavaridge Town"
        },
        {
            "TID": "444",
            "LocationName": "Lavaridge Town"
        },
        {
            "TID": "445",
            "LocationName": "Lavaridge Town"
        },
        {
            "TID": "446",
            "LocationName": "Lavaridge Town"
        },
        {
            "TID": "447",
            "LocationName": "Lavaridge Town"
        },
        {
            "TID": "448",
            "LocationName": "Lavaridge Town"
        },
        {
            "TID": "449",
            "LocationName": "Lavaridge Town"
        },
        {
            "TID": "45",
            "LocationName": "Hoenn Route 108"
        },
        {
            "TID": "450",
            "LocationName": "Petalburg City"
        },
        {
            "TID": "451",
            "LocationName": "Petalburg City"
        },
        {
            "TID": "452",
            "LocationName": "Petalburg City"
        },
        {
            "TID": "453",
            "LocationName": "Petalburg City"
        },
        {
            "TID": "454",
            "LocationName": "Petalburg City"
        },
        {
            "TID": "455",
            "LocationName": "Petalburg City"
        },
        {
            "TID": "456",
            "LocationName": "Petalburg City"
        },
        {
            "TID": "457",
            "LocationName": "Petalburg City"
        },
        {
            "TID": "458",
            "LocationName": "Fortree City"
        },
        {
            "TID": "459",
            "LocationName": "Fortree City"
        },
        {
            "TID": "46",
            "LocationName": "Hoenn Route 108"
        },
        {
            "TID": "460",
            "LocationName": "Fortree City"
        },
        {
            "TID": "461",
            "LocationName": "Fortree City"
        },
        {
            "TID": "462",
            "LocationName": "Fortree City"
        },
        {
            "TID": "463",
            "LocationName": "Fortree City"
        },
        {
            "TID": "464",
            "LocationName": "Fortree City"
        },
        {
            "TID": "465",
            "LocationName": "Mossdeep City"
        },
        {
            "TID": "466",
            "LocationName": "Mossdeep City"
        },
        {
            "TID": "467",
            "LocationName": "Mossdeep City"
        },
        {
            "TID": "468",
            "LocationName": "Mossdeep City"
        },
        {
            "TID": "469",
            "LocationName": "Mossdeep City"
        },
        {
            "TID": "47",
            "LocationName": "Hoenn Route 108"
        },
        {
            "TID": "470",
            "LocationName": "Mossdeep City"
        },
        {
            "TID": "471",
            "LocationName": "Mossdeep City"
        },
        {
            "TID": "472",
            "LocationName": "Mossdeep City"
        },
        {
            "TID": "473",
            "LocationName": "Mossdeep City"
        },
        {
            "TID": "474",
            "LocationName": "Mossdeep City"
        },
        {
            "TID": "475",
            "LocationName": "Mossdeep City"
        },
        {
            "TID": "476",
            "LocationName": "Mossdeep City"
        },
        {
            "TID": "477",
            "LocationName": "Mossdeep City"
        },
        {
            "TID": "478",
            "LocationName": "Sootopolis City"
        },
        {
            "TID": "479",
            "LocationName": "Sootopolis City"
        },
        {
            "TID": "48",
            "LocationName": "Hoenn Route 108"
        },
        {
            "TID": "480",
            "LocationName": "Sootopolis City"
        },
        {
            "TID": "481",
            "LocationName": "Sootopolis City"
        },
        {
            "TID": "482",
            "LocationName": "Sootopolis City"
        },
        {
            "TID": "483",
            "LocationName": "Sootopolis City"
        },
        {
            "TID": "484",
            "LocationName": "Sootopolis City"
        },
        {
            "TID": "485",
            "LocationName": "Sootopolis City"
        },
        {
            "TID": "486",
            "LocationName": "Sootopolis City"
        },
        {
            "TID": "487",
            "LocationName": "Sootopolis City"
        },
        {
            "TID": "488",
            "LocationName": "Sootopolis City"
        },
        {
            "TID": "489",
            "LocationName": "Hoenn Route 104"
        },
        {
            "TID": "49",
            "LocationName": "Hoenn Route 108"
        },
        {
            "TID": "490",
            "LocationName": "Hoenn Route 104"
        },
        {
            "TID": "491",
            "LocationName": "Hoenn Route 104"
        },
        {
            "TID": "492",
            "LocationName": "Hoenn Route 104"
        },
        {
            "TID": "493",
            "LocationName": "Hoenn Route 104"
        },
        {
            "TID": "494",
            "LocationName": "Hoenn Route 104"
        },
        {
            "TID": "495",
            "LocationName": "Hoenn Route 104"
        },
        {
            "TID": "5",
            "LocationName": "Abandoned Ship"
        },
        {
            "TID": "50",
            "LocationName": "Hoenn Route 109"
        },
        {
            "TID": "51",
            "LocationName": "Hoenn Route 109"
        },
        {
            "TID": "52",
            "LocationName": "Hoenn Route 109"
        },
        {
            "TID": "53",
            "LocationName": "Hoenn Route 109"
        },
        {
            "TID": "54",
            "LocationName": "Hoenn Route 109"
        },
        {
            "TID": "55",
            "LocationName": "Hoenn Route 109"
        },
        {
            "TID": "56",
            "LocationName": "Hoenn Route 109"
        },
        {
            "TID": "57",
            "LocationName": "Hoenn Route 109"
        },
        {
            "TID": "58",
            "LocationName": "Hoenn Route 109"
        },
        {
            "TID": "59",
            "LocationName": "Hoenn Route 109"
        },
        {
            "TID": "6",
            "LocationName": "Abandoned Ship"
        },
        {
            "TID": "60",
            "LocationName": "Hoenn Route 109"
        },
        {
            "TID": "61",
            "LocationName": "Hoenn Route 109"
        },
        {
            "TID": "62",
            "LocationName": "Hoenn Route 109"
        },
        {
            "TID": "63",
            "LocationName": "Hoenn Route 109"
        },
        {
            "TID": "64",
            "LocationName": "Hoenn Route 109"
        },
        {
            "TID": "65",
            "LocationName": "Hoenn Route 109"
        },
        {
            "TID": "66",
            "LocationName": "Hoenn Route 110"
        },
        {
            "TID": "67",
            "LocationName": "Hoenn Route 110"
        },
        {
            "TID": "68",
            "LocationName": "Hoenn Route 110"
        },
        {
            "TID": "69",
            "LocationName": "Hoenn Route 110"
        },
        {
            "TID": "7",
            "LocationName": "Abandoned Ship"
        },
        {
            "TID": "70",
            "LocationName": "Hoenn Route 110"
        },
        {
            "TID": "71",
            "LocationName": "Hoenn Route 110"
        },
        {
            "TID": "72",
            "LocationName": "Hoenn Route 110"
        },
        {
            "TID": "73",
            "LocationName": "Hoenn Route 110"
        },
        {
            "TID": "74",
            "LocationName": "Hoenn Route 111"
        },
        {
            "TID": "75",
            "LocationName": "Hoenn Route 111"
        },
        {
            "TID": "76",
            "LocationName": "Hoenn Route 111"
        },
        {
            "TID": "77",
            "LocationName": "Hoenn Route 111"
        },
        {
            "TID": "78",
            "LocationName": "Hoenn Route 111"
        },
        {
            "TID": "79",
            "LocationName": "Hoenn Route 111"
        },
        {
            "TID": "8",
            "LocationName": "Ever Grande City"
        },
        {
            "TID": "80",
            "LocationName": "Hoenn Route 111"
        },
        {
            "TID": "81",
            "LocationName": "Hoenn Route 111"
        },
        {
            "TID": "82",
            "LocationName": "Hoenn Route 111"
        },
        {
            "TID": "82",
            "LocationName": "Hoenn Route 118"
        },
        {
            "TID": "82",
            "LocationName": "Hoenn Route 120"
        },
        {
            "TID": "83",
            "LocationName": "Hoenn Route 111"
        },
        {
            "TID": "84",
            "LocationName": "Hoenn Route 111"
        },
        {
            "TID": "85",
            "LocationName": "Hoenn Route 111"
        },
        {
            "TID": "86",
            "LocationName": "Hoenn Route 111"
        },
        {
            "TID": "87",
            "LocationName": "Hoenn Route 111"
        },
        {
            "TID": "88",
            "LocationName": "Hoenn Route 111"
        },
        {
            "TID": "89",
            "LocationName": "Hoenn Route 111"
        },
        {
            "TID": "9",
            "LocationName": "Ever Grande City"
        },
        {
            "TID": "90",
            "LocationName": "Hoenn Route 111"
        },
        {
            "TID": "91",
            "LocationName": "Hoenn Route 111"
        },
        {
            "TID": "92",
            "LocationName": "Hoenn Route 111"
        },
        {
            "TID": "93",
            "LocationName": "Hoenn Route 111"
        },
        {
            "TID": "94",
            "LocationName": "Hoenn Route 111"
        },
        {
            "TID": "95",
            "LocationName": "Hoenn Route 111"
        },
        {
            "TID": "96",
            "LocationName": "Hoenn Route 112"
        },
        {
            "TID": "97",
            "LocationName": "Hoenn Route 112"
        },
        {
            "TID": "98",
            "LocationName": "Hoenn Route 112"
        },
        {
            "TID": "99",
            "LocationName": "Hoenn Route 112"
        }
        ],

        //just use location instead?? - need encounter tag?
        selectFoundAt:{},
        foundat: [
        {
            "Dex": "100",
            "LocationName": "New Mauville",
            "Encounter": "Basement",
            "Min": "22",
            "Max": "26",
            "Rate": "49"
        },
        {
            "Dex": "100",
            "LocationName": "New Mauville",
            "Encounter": "Entrance",
            "Min": "22",
            "Max": "26",
            "Rate": "50"
        },
        {
            "Dex": "100",
            "LocationName": "New Mauville",
            "Encounter": "Fake",
            "Min": "25",
            "Max": "25",
            "Rate": ""
        },
        {
            "Dex": "101",
            "LocationName": "New Mauville",
            "Encounter": "Basement",
            "Min": "26",
            "Max": "26",
            "Rate": "1"
        },
        {
            "Dex": "101",
            "LocationName": "Team Aqua Hideout",
            "Encounter": "Fake",
            "Min": "30",
            "Max": "30",
            "Rate": ""
        },
        {
            "Dex": "109",
            "LocationName": "Fiery Path",
            "Encounter": "Cave",
            "Min": "15",
            "Max": "16",
            "Rate": "25"
        },
        {
            "Dex": "111",
            "LocationName": "Safari Zone",
            "Encounter": "Grass",
            "Min": "27",
            "Max": "29",
            "Rate": "30"
        },
        {
            "Dex": "116",
            "LocationName": "Hoenn Route 132",
            "Encounter": "Fish Super",
            "Min": "25",
            "Max": "30",
            "Rate": "15"
        },
        {
            "Dex": "116",
            "LocationName": "Hoenn Route 133",
            "Encounter": "Fish Super",
            "Min": "25",
            "Max": "30",
            "Rate": "15"
        },
        {
            "Dex": "116",
            "LocationName": "Hoenn Route 134",
            "Encounter": "Fish Super",
            "Min": "25",
            "Max": "30",
            "Rate": "15"
        },
        {
            "Dex": "116",
            "LocationName": "Pacifidlog Town",
            "Encounter": "Trade",
            "Min": "",
            "Max": "",
            "Rate": ""
        },
        {
            "Dex": "118",
            "LocationName": "Hoenn Route 102",
            "Encounter": "Fish Good",
            "Min": "10",
            "Max": "30",
            "Rate": "20"
        },
        {
            "Dex": "118",
            "LocationName": "Hoenn Route 102",
            "Encounter": "Fish Old",
            "Min": "5",
            "Max": "10",
            "Rate": "30"
        },
        {
            "Dex": "118",
            "LocationName": "Hoenn Route 102",
            "Encounter": "Surf",
            "Min": "20",
            "Max": "30",
            "Rate": "1"
        },
        {
            "Dex": "118",
            "LocationName": "Hoenn Route 111",
            "Encounter": "Fish Good",
            "Min": "10",
            "Max": "30",
            "Rate": "20"
        },
        {
            "Dex": "118",
            "LocationName": "Hoenn Route 111",
            "Encounter": "Fish Old",
            "Min": "5",
            "Max": "10",
            "Rate": "30"
        },
        {
            "Dex": "118",
            "LocationName": "Hoenn Route 111",
            "Encounter": "Surf",
            "Min": "20",
            "Max": "30",
            "Rate": "1"
        },
        {
            "Dex": "118",
            "LocationName": "Hoenn Route 114",
            "Encounter": "Fish Good",
            "Min": "10",
            "Max": "30",
            "Rate": "20"
        },
        {
            "Dex": "118",
            "LocationName": "Hoenn Route 114",
            "Encounter": "Fish Old",
            "Min": "5",
            "Max": "10",
            "Rate": "30"
        },
        {
            "Dex": "118",
            "LocationName": "Hoenn Route 114",
            "Encounter": "Surf",
            "Min": "20",
            "Max": "30",
            "Rate": "1"
        },
        {
            "Dex": "118",
            "LocationName": "Hoenn Route 117",
            "Encounter": "Fish Good",
            "Min": "10",
            "Max": "30",
            "Rate": "20"
        },
        {
            "Dex": "118",
            "LocationName": "Hoenn Route 117",
            "Encounter": "Fish Old",
            "Min": "5",
            "Max": "10",
            "Rate": "30"
        },
        {
            "Dex": "118",
            "LocationName": "Hoenn Route 117",
            "Encounter": "Surf",
            "Min": "20",
            "Max": "30",
            "Rate": "1"
        },
        {
            "Dex": "118",
            "LocationName": "Hoenn Route 120",
            "Encounter": "Fish Good",
            "Min": "10",
            "Max": "30",
            "Rate": "20"
        },
        {
            "Dex": "118",
            "LocationName": "Hoenn Route 120",
            "Encounter": "Fish Old",
            "Min": "5",
            "Max": "10",
            "Rate": "30"
        },
        {
            "Dex": "118",
            "LocationName": "Hoenn Route 120",
            "Encounter": "Surf",
            "Min": "20",
            "Max": "30",
            "Rate": "1"
        },
        {
            "Dex": "118",
            "LocationName": "Petalburg City",
            "Encounter": "Fish Good",
            "Min": "10",
            "Max": "30",
            "Rate": "20"
        },
        {
            "Dex": "118",
            "LocationName": "Petalburg City",
            "Encounter": "Fish Old",
            "Min": "5",
            "Max": "10",
            "Rate": "30"
        },
        {
            "Dex": "118",
            "LocationName": "Safari Zone",
            "Encounter": "Fish Good",
            "Min": "10",
            "Max": "30",
            "Rate": "40"
        },
        {
            "Dex": "118",
            "LocationName": "Safari Zone",
            "Encounter": "Fish Old",
            "Min": "5",
            "Max": "10",
            "Rate": "30"
        },
        {
            "Dex": "118",
            "LocationName": "Safari Zone",
            "Encounter": "Fish Super",
            "Min": "25",
            "Max": "30",
            "Rate": "40"
        },
        {
            "Dex": "118",
            "LocationName": "Victory Road (Hoenn)",
            "Encounter": "Fish Good",
            "Min": "10",
            "Max": "30",
            "Rate": "20"
        },
        {
            "Dex": "118",
            "LocationName": "Victory Road (Hoenn)",
            "Encounter": "Fish Old",
            "Min": "5",
            "Max": "10",
            "Rate": "30"
        },
        {
            "Dex": "119",
            "LocationName": "Safari Zone",
            "Encounter": "Fish Super",
            "Min": "25",
            "Max": "40",
            "Rate": "20"
        },
        {
            "Dex": "120",
            "LocationName": "Lilycove City",
            "Encounter": "Fish Super",
            "Min": "25",
            "Max": "30",
            "Rate": "15"
        },
        {
            "Dex": "127",
            "LocationName": "Safari Zone",
            "Encounter": "Grass",
            "Min": "27",
            "Max": "29",
            "Rate": "5"
        },
        {
            "Dex": "129",
            "LocationName": "Abandoned Ship",
            "Encounter": "Fish Good",
            "Min": "10",
            "Max": "30",
            "Rate": "60"
        },
        {
            "Dex": "129",
            "LocationName": "Abandoned Ship",
            "Encounter": "Fish Old",
            "Min": "5",
            "Max": "10",
            "Rate": "70"
        },
        {
            "Dex": "129",
            "LocationName": "Dewford Town",
            "Encounter": "Fish Good",
            "Min": "10",
            "Max": "30",
            "Rate": "60"
        },
        {
            "Dex": "129",
            "LocationName": "Dewford Town",
            "Encounter": "Fish Old",
            "Min": "5",
            "Max": "10",
            "Rate": "70"
        },
        {
            "Dex": "129",
            "LocationName": "Ever Grande City",
            "Encounter": "Fish Good",
            "Min": "10",
            "Max": "30",
            "Rate": "60"
        },
        {
            "Dex": "129",
            "LocationName": "Ever Grande City",
            "Encounter": "Fish Old",
            "Min": "5",
            "Max": "10",
            "Rate": "70"
        },
        {
            "Dex": "129",
            "LocationName": "Hoenn Route 102",
            "Encounter": "Fish Good",
            "Min": "10",
            "Max": "30",
            "Rate": "60"
        },
        {
            "Dex": "129",
            "LocationName": "Hoenn Route 102",
            "Encounter": "Fish Old",
            "Min": "5",
            "Max": "10",
            "Rate": "70"
        },
        {
            "Dex": "129",
            "LocationName": "Hoenn Route 103",
            "Encounter": "Fish Good",
            "Min": "10",
            "Max": "30",
            "Rate": "60"
        },
        {
            "Dex": "129",
            "LocationName": "Hoenn Route 103",
            "Encounter": "Fish Old",
            "Min": "5",
            "Max": "10",
            "Rate": "70"
        },
        {
            "Dex": "129",
            "LocationName": "Hoenn Route 104",
            "Encounter": "Fish Good",
            "Min": "10",
            "Max": "30",
            "Rate": "100"
        },
        {
            "Dex": "129",
            "LocationName": "Hoenn Route 104",
            "Encounter": "Fish Old",
            "Min": "5",
            "Max": "10",
            "Rate": "100"
        },
        {
            "Dex": "129",
            "LocationName": "Hoenn Route 104",
            "Encounter": "Fish Super",
            "Min": "20",
            "Max": "45",
            "Rate": "100"
        },
        {
            "Dex": "129",
            "LocationName": "Hoenn Route 105",
            "Encounter": "Fish Good",
            "Min": "10",
            "Max": "30",
            "Rate": "60"
        },
        {
            "Dex": "129",
            "LocationName": "Hoenn Route 105",
            "Encounter": "Fish Old",
            "Min": "5",
            "Max": "10",
            "Rate": "70"
        },
        {
            "Dex": "129",
            "LocationName": "Hoenn Route 106",
            "Encounter": "Fish Good",
            "Min": "10",
            "Max": "30",
            "Rate": "60"
        },
        {
            "Dex": "129",
            "LocationName": "Hoenn Route 106",
            "Encounter": "Fish Old",
            "Min": "5",
            "Max": "10",
            "Rate": "70"
        },
        {
            "Dex": "129",
            "LocationName": "Hoenn Route 107",
            "Encounter": "Fish Good",
            "Min": "10",
            "Max": "30",
            "Rate": "60"
        },
        {
            "Dex": "129",
            "LocationName": "Hoenn Route 107",
            "Encounter": "Fish Old",
            "Min": "5",
            "Max": "10",
            "Rate": "70"
        },
        {
            "Dex": "129",
            "LocationName": "Hoenn Route 108",
            "Encounter": "Fish Good",
            "Min": "10",
            "Max": "30",
            "Rate": "60"
        },
        {
            "Dex": "129",
            "LocationName": "Hoenn Route 108",
            "Encounter": "Fish Old",
            "Min": "5",
            "Max": "10",
            "Rate": "70"
        },
        {
            "Dex": "129",
            "LocationName": "Hoenn Route 109",
            "Encounter": "Fish Good",
            "Min": "10",
            "Max": "30",
            "Rate": "60"
        },
        {
            "Dex": "129",
            "LocationName": "Hoenn Route 109",
            "Encounter": "Fish Old",
            "Min": "5",
            "Max": "10",
            "Rate": "70"
        },
        {
            "Dex": "129",
            "LocationName": "Hoenn Route 110",
            "Encounter": "Fish Good",
            "Min": "10",
            "Max": "30",
            "Rate": "60"
        },
        {
            "Dex": "129",
            "LocationName": "Hoenn Route 110",
            "Encounter": "Fish Old",
            "Min": "5",
            "Max": "10",
            "Rate": "70"
        },
        {
            "Dex": "129",
            "LocationName": "Hoenn Route 111",
            "Encounter": "Fish Good",
            "Min": "10",
            "Max": "30",
            "Rate": "60"
        },
        {
            "Dex": "129",
            "LocationName": "Hoenn Route 111",
            "Encounter": "Fish Old",
            "Min": "5",
            "Max": "10",
            "Rate": "70"
        },
        {
            "Dex": "129",
            "LocationName": "Hoenn Route 114",
            "Encounter": "Fish Good",
            "Min": "10",
            "Max": "30",
            "Rate": "60"
        },
        {
            "Dex": "129",
            "LocationName": "Hoenn Route 114",
            "Encounter": "Fish Old",
            "Min": "5",
            "Max": "10",
            "Rate": "70"
        },
        {
            "Dex": "129",
            "LocationName": "Hoenn Route 115",
            "Encounter": "Fish Good",
            "Min": "10",
            "Max": "30",
            "Rate": "60"
        },
        {
            "Dex": "129",
            "LocationName": "Hoenn Route 115",
            "Encounter": "Fish Old",
            "Min": "5",
            "Max": "10",
            "Rate": "70"
        },
        {
            "Dex": "129",
            "LocationName": "Hoenn Route 117",
            "Encounter": "Fish Good",
            "Min": "10",
            "Max": "30",
            "Rate": "60"
        },
        {
            "Dex": "129",
            "LocationName": "Hoenn Route 117",
            "Encounter": "Fish Old",
            "Min": "5",
            "Max": "10",
            "Rate": "70"
        },
        {
            "Dex": "129",
            "LocationName": "Hoenn Route 118",
            "Encounter": "Fish Good",
            "Min": "10",
            "Max": "30",
            "Rate": "60"
        },
        {
            "Dex": "129",
            "LocationName": "Hoenn Route 118",
            "Encounter": "Fish Old",
            "Min": "5",
            "Max": "10",
            "Rate": "70"
        },
        {
            "Dex": "129",
            "LocationName": "Hoenn Route 119",
            "Encounter": "Fish Good",
            "Min": "10",
            "Max": "30",
            "Rate": "60"
        },
        {
            "Dex": "129",
            "LocationName": "Hoenn Route 119",
            "Encounter": "Fish Old",
            "Min": "5",
            "Max": "10",
            "Rate": "70"
        },
        {
            "Dex": "129",
            "LocationName": "Hoenn Route 120",
            "Encounter": "Fish Good",
            "Min": "10",
            "Max": "30",
            "Rate": "60"
        },
        {
            "Dex": "129",
            "LocationName": "Hoenn Route 120",
            "Encounter": "Fish Old",
            "Min": "5",
            "Max": "10",
            "Rate": "70"
        },
        {
            "Dex": "129",
            "LocationName": "Hoenn Route 121",
            "Encounter": "Fish Good",
            "Min": "10",
            "Max": "30",
            "Rate": "60"
        },
        {
            "Dex": "129",
            "LocationName": "Hoenn Route 121",
            "Encounter": "Fish Old",
            "Min": "5",
            "Max": "10",
            "Rate": "70"
        },
        {
            "Dex": "129",
            "LocationName": "Hoenn Route 122",
            "Encounter": "Fish Good",
            "Min": "10",
            "Max": "30",
            "Rate": "60"
        },
        {
            "Dex": "129",
            "LocationName": "Hoenn Route 122",
            "Encounter": "Fish Old",
            "Min": "5",
            "Max": "10",
            "Rate": "70"
        },
        {
            "Dex": "129",
            "LocationName": "Hoenn Route 123",
            "Encounter": "Fish Good",
            "Min": "10",
            "Max": "30",
            "Rate": "60"
        },
        {
            "Dex": "129",
            "LocationName": "Hoenn Route 123",
            "Encounter": "Fish Old",
            "Min": "5",
            "Max": "10",
            "Rate": "70"
        },
        {
            "Dex": "129",
            "LocationName": "Hoenn Route 124",
            "Encounter": "Fish Good",
            "Min": "10",
            "Max": "30",
            "Rate": "60"
        },
        {
            "Dex": "129",
            "LocationName": "Hoenn Route 124",
            "Encounter": "Fish Old",
            "Min": "5",
            "Max": "10",
            "Rate": "70"
        },
        {
            "Dex": "129",
            "LocationName": "Hoenn Route 125",
            "Encounter": "Fish Good",
            "Min": "10",
            "Max": "30",
            "Rate": "60"
        },
        {
            "Dex": "129",
            "LocationName": "Hoenn Route 125",
            "Encounter": "Fish Old",
            "Min": "5",
            "Max": "10",
            "Rate": "70"
        },
        {
            "Dex": "129",
            "LocationName": "Hoenn Route 126",
            "Encounter": "Fish Good",
            "Min": "10",
            "Max": "30",
            "Rate": "60"
        },
        {
            "Dex": "129",
            "LocationName": "Hoenn Route 126",
            "Encounter": "Fish Old",
            "Min": "5",
            "Max": "10",
            "Rate": "70"
        },
        {
            "Dex": "129",
            "LocationName": "Hoenn Route 127",
            "Encounter": "Fish Good",
            "Min": "10",
            "Max": "30",
            "Rate": "60"
        },
        {
            "Dex": "129",
            "LocationName": "Hoenn Route 127",
            "Encounter": "Fish Old",
            "Min": "5",
            "Max": "10",
            "Rate": "70"
        },
        {
            "Dex": "129",
            "LocationName": "Hoenn Route 128",
            "Encounter": "Fish Good",
            "Min": "10",
            "Max": "30",
            "Rate": "60"
        },
        {
            "Dex": "129",
            "LocationName": "Hoenn Route 128",
            "Encounter": "Fish Old",
            "Min": "5",
            "Max": "10",
            "Rate": "70"
        },
        {
            "Dex": "129",
            "LocationName": "Hoenn Route 129",
            "Encounter": "Fish Good",
            "Min": "10",
            "Max": "30",
            "Rate": "60"
        },
        {
            "Dex": "129",
            "LocationName": "Hoenn Route 129",
            "Encounter": "Fish Old",
            "Min": "5",
            "Max": "10",
            "Rate": "70"
        },
        {
            "Dex": "129",
            "LocationName": "Hoenn Route 130",
            "Encounter": "Fish Good",
            "Min": "10",
            "Max": "30",
            "Rate": "60"
        },
        {
            "Dex": "129",
            "LocationName": "Hoenn Route 130",
            "Encounter": "Fish Old",
            "Min": "5",
            "Max": "10",
            "Rate": "70"
        },
        {
            "Dex": "129",
            "LocationName": "Hoenn Route 131",
            "Encounter": "Fish Good",
            "Min": "10",
            "Max": "30",
            "Rate": "60"
        },
        {
            "Dex": "129",
            "LocationName": "Hoenn Route 131",
            "Encounter": "Fish Old",
            "Min": "5",
            "Max": "10",
            "Rate": "70"
        },
        {
            "Dex": "129",
            "LocationName": "Hoenn Route 132",
            "Encounter": "Fish Good",
            "Min": "10",
            "Max": "30",
            "Rate": "60"
        },
        {
            "Dex": "129",
            "LocationName": "Hoenn Route 132",
            "Encounter": "Fish Old",
            "Min": "5",
            "Max": "10",
            "Rate": "70"
        },
        {
            "Dex": "129",
            "LocationName": "Hoenn Route 133",
            "Encounter": "Fish Good",
            "Min": "10",
            "Max": "30",
            "Rate": "60"
        },
        {
            "Dex": "129",
            "LocationName": "Hoenn Route 133",
            "Encounter": "Fish Old",
            "Min": "5",
            "Max": "10",
            "Rate": "70"
        },
        {
            "Dex": "129",
            "LocationName": "Hoenn Route 134",
            "Encounter": "Fish Good",
            "Min": "10",
            "Max": "30",
            "Rate": "60"
        },
        {
            "Dex": "129",
            "LocationName": "Hoenn Route 134",
            "Encounter": "Fish Old",
            "Min": "5",
            "Max": "10",
            "Rate": "70"
        },
        {
            "Dex": "129",
            "LocationName": "Lilycove City",
            "Encounter": "Fish Good",
            "Min": "10",
            "Max": "30",
            "Rate": "60"
        },
        {
            "Dex": "129",
            "LocationName": "Lilycove City",
            "Encounter": "Fish Old",
            "Min": "5",
            "Max": "10",
            "Rate": "70"
        },
        {
            "Dex": "129",
            "LocationName": "Mossdeep City",
            "Encounter": "Fish Good",
            "Min": "10",
            "Max": "30",
            "Rate": "60"
        },
        {
            "Dex": "129",
            "LocationName": "Mossdeep City",
            "Encounter": "Fish Old",
            "Min": "5",
            "Max": "10",
            "Rate": "70"
        },
        {
            "Dex": "129",
            "LocationName": "Pacifidlog Town",
            "Encounter": "Fish Good",
            "Min": "10",
            "Max": "30",
            "Rate": "60"
        },
        {
            "Dex": "129",
            "LocationName": "Pacifidlog Town",
            "Encounter": "Fish Old",
            "Min": "5",
            "Max": "10",
            "Rate": "70"
        },
        {
            "Dex": "129",
            "LocationName": "Petalburg City",
            "Encounter": "Fish Good",
            "Min": "10",
            "Max": "30",
            "Rate": "60"
        },
        {
            "Dex": "129",
            "LocationName": "Petalburg City",
            "Encounter": "Fish Old",
            "Min": "5",
            "Max": "10",
            "Rate": "70"
        },
        {
            "Dex": "129",
            "LocationName": "Safari Zone",
            "Encounter": "Fish Good",
            "Min": "10",
            "Max": "30",
            "Rate": "60"
        },
        {
            "Dex": "129",
            "LocationName": "Safari Zone",
            "Encounter": "Fish Old",
            "Min": "5",
            "Max": "30",
            "Rate": "70"
        },
        {
            "Dex": "129",
            "LocationName": "Seafloor Cavern",
            "Encounter": "Fish Good",
            "Min": "10",
            "Max": "30",
            "Rate": "60"
        },
        {
            "Dex": "129",
            "LocationName": "Seafloor Cavern",
            "Encounter": "Fish Old",
            "Min": "5",
            "Max": "10",
            "Rate": "70"
        },
        {
            "Dex": "129",
            "LocationName": "Shoal Cave",
            "Encounter": "Fish Good",
            "Min": "10",
            "Max": "30",
            "Rate": "60"
        },
        {
            "Dex": "129",
            "LocationName": "Shoal Cave",
            "Encounter": "Fish Old",
            "Min": "5",
            "Max": "10",
            "Rate": "70"
        },
        {
            "Dex": "129",
            "LocationName": "Slateport City",
            "Encounter": "Fish Good",
            "Min": "10",
            "Max": "30",
            "Rate": "60"
        },
        {
            "Dex": "129",
            "LocationName": "Slateport City",
            "Encounter": "Fish Old",
            "Min": "5",
            "Max": "10",
            "Rate": "70"
        },
        {
            "Dex": "129",
            "LocationName": "Sootopolis City",
            "Encounter": "Fish Good",
            "Min": "10",
            "Max": "30",
            "Rate": "100"
        },
        {
            "Dex": "129",
            "LocationName": "Sootopolis City",
            "Encounter": "Fish Old",
            "Min": "5",
            "Max": "10",
            "Rate": "70"
        },
        {
            "Dex": "129",
            "LocationName": "Sootopolis City",
            "Encounter": "Fish Super",
            "Min": "30",
            "Max": "35",
            "Rate": "80"
        },
        {
            "Dex": "129",
            "LocationName": "Sootopolis City",
            "Encounter": "Surf",
            "Min": "5",
            "Max": "35",
            "Rate": "100"
        },
        {
            "Dex": "129",
            "LocationName": "Victory Road (Hoenn)",
            "Encounter": "Fish Good",
            "Min": "10",
            "Max": "30",
            "Rate": "60"
        },
        {
            "Dex": "129",
            "LocationName": "Victory Road (Hoenn)",
            "Encounter": "Fish Old",
            "Min": "5",
            "Max": "10",
            "Rate": "70"
        },
        {
            "Dex": "130",
            "LocationName": "Sootopolis City",
            "Encounter": "Fish Super",
            "Min": "5",
            "Max": "45",
            "Rate": "20"
        },
        {
            "Dex": "132",
            "LocationName": "Desert Underpass",
            "Encounter": "Cave",
            "Min": "38",
            "Max": "40",
            "Rate": "43"
        },
        {
            "Dex": "152",
            "LocationName": "Littleroot Town",
            "Encounter": "Gift",
            "Min": "5",
            "Max": "5",
            "Rate": ""
        },
        {
            "Dex": "155",
            "LocationName": "Littleroot Town",
            "Encounter": "Gift",
            "Min": "5",
            "Max": "5",
            "Rate": ""
        },
        {
            "Dex": "158",
            "LocationName": "Littleroot Town",
            "Encounter": "Gift",
            "Min": "5",
            "Max": "5",
            "Rate": ""
        },
        {
            "Dex": "163",
            "LocationName": "Safari Zone",
            "Encounter": "Grass",
            "Min": "35",
            "Max": "35",
            "Rate": "5"
        },
        {
            "Dex": "165",
            "LocationName": "Safari Zone",
            "Encounter": "Grass",
            "Min": "33",
            "Max": "33",
            "Rate": "10"
        },
        {
            "Dex": "167",
            "LocationName": "Safari Zone",
            "Encounter": "Grass",
            "Min": "33",
            "Max": "33",
            "Rate": "10"
        },
        {
            "Dex": "170",
            "LocationName": "Hoenn Route 124",
            "Encounter": "Dive",
            "Min": "20",
            "Max": "30",
            "Rate": "30"
        },
        {
            "Dex": "170",
            "LocationName": "Hoenn Route 126",
            "Encounter": "Dive",
            "Min": "20",
            "Max": "30",
            "Rate": "30"
        },
        {
            "Dex": "170",
            "LocationName": "Underwater",
            "Encounter": "Dive",
            "Min": "20",
            "Max": "30",
            "Rate": "30"
        },
        {
            "Dex": "177",
            "LocationName": "Safari Zone",
            "Encounter": "Grass",
            "Min": "25",
            "Max": "25",
            "Rate": "10"
        },
        {
            "Dex": "178",
            "LocationName": "Safari Zone",
            "Encounter": "Grass",
            "Min": "29",
            "Max": "31",
            "Rate": "5"
        },
        {
            "Dex": "179",
            "LocationName": "Altering Cave",
            "Encounter": "Cave",
            "Min": "3",
            "Max": "13",
            "Rate": "100"
        },
        {
            "Dex": "179",
            "LocationName": "Safari Zone",
            "Encounter": "Grass",
            "Min": "34",
            "Max": "36",
            "Rate": "30"
        },
        {
            "Dex": "183",
            "LocationName": "Hoenn Route 102",
            "Encounter": "Surf",
            "Min": "5",
            "Max": "35",
            "Rate": "99"
        },
        {
            "Dex": "183",
            "LocationName": "Hoenn Route 104",
            "Encounter": "Grass",
            "Min": "4",
            "Max": "5",
            "Rate": "20"
        },
        {
            "Dex": "183",
            "LocationName": "Hoenn Route 111",
            "Encounter": "Surf",
            "Min": "5",
            "Max": "35",
            "Rate": "99"
        },
        {
            "Dex": "183",
            "LocationName": "Hoenn Route 112",
            "Encounter": "Grass",
            "Min": "14",
            "Max": "16",
            "Rate": "25"
        },
        {
            "Dex": "183",
            "LocationName": "Hoenn Route 114",
            "Encounter": "Surf",
            "Min": "5",
            "Max": "35",
            "Rate": "99"
        },
        {
            "Dex": "183",
            "LocationName": "Hoenn Route 117",
            "Encounter": "Grass",
            "Min": "13",
            "Max": "13",
            "Rate": "10"
        },
        {
            "Dex": "183",
            "LocationName": "Hoenn Route 117",
            "Encounter": "Surf",
            "Min": "5",
            "Max": "35",
            "Rate": "99"
        },
        {
            "Dex": "183",
            "LocationName": "Hoenn Route 120",
            "Encounter": "Long grass",
            "Min": "25",
            "Max": "27",
            "Rate": "15"
        },
        {
            "Dex": "183",
            "LocationName": "Hoenn Route 120",
            "Encounter": "Surf",
            "Min": "5",
            "Max": "35",
            "Rate": "99"
        },
        {
            "Dex": "183",
            "LocationName": "Petalburg City",
            "Encounter": "Surf",
            "Min": "5",
            "Max": "35",
            "Rate": "100"
        },
        {
            "Dex": "183",
            "LocationName": "Safari Zone",
            "Encounter": "Surf",
            "Min": "25",
            "Max": "35",
            "Rate": "39"
        },
        {
            "Dex": "190",
            "LocationName": "Altering Cave",
            "Encounter": "Cave",
            "Min": "18",
            "Max": "28",
            "Rate": "100"
        },
        {
            "Dex": "190",
            "LocationName": "Safari Zone",
            "Encounter": "Grass",
            "Min": "33",
            "Max": "35",
            "Rate": "30"
        },
        {
            "Dex": "191",
            "LocationName": "Safari Zone",
            "Encounter": "Grass",
            "Min": "33",
            "Max": "35",
            "Rate": "30"
        },
        {
            "Dex": "194",
            "LocationName": "Safari Zone",
            "Encounter": "Surf",
            "Min": "25",
            "Max": "30",
            "Rate": "60"
        },
        {
            "Dex": "195",
            "LocationName": "Safari Zone",
            "Encounter": "Surf",
            "Min": "35",
            "Max": "40",
            "Rate": "1"
        },
        {
            "Dex": "202",
            "LocationName": "Safari Zone",
            "Encounter": "Grass",
            "Min": "27",
            "Max": "29",
            "Rate": "10"
        },
        {
            "Dex": "203",
            "LocationName": "Safari Zone",
            "Encounter": "Grass",
            "Min": "25",
            "Max": "27",
            "Rate": "20"
        },
        {
            "Dex": "204",
            "LocationName": "Altering Cave",
            "Encounter": "Cave",
            "Min": "19",
            "Max": "29",
            "Rate": "100"
        },
        {
            "Dex": "204",
            "LocationName": "Safari Zone",
            "Encounter": "Grass",
            "Min": "34",
            "Max": "34",
            "Rate": "5"
        },
        {
            "Dex": "207",
            "LocationName": "Safari Zone",
            "Encounter": "Grass",
            "Min": "37",
            "Max": "40",
            "Rate": "5"
        },
        {
            "Dex": "209",
            "LocationName": "Safari Zone",
            "Encounter": "Grass",
            "Min": "34",
            "Max": "34",
            "Rate": "5"
        },
        {
            "Dex": "213",
            "LocationName": "Altering Cave",
            "Encounter": "Cave",
            "Min": "18",
            "Max": "28",
            "Rate": "100"
        },
        {
            "Dex": "213",
            "LocationName": "Safari Zone",
            "Encounter": "Rock Smash",
            "Min": "20",
            "Max": "40",
            "Rate": "100"
        },
        {
            "Dex": "214",
            "LocationName": "Safari Zone",
            "Encounter": "Grass",
            "Min": "27",
            "Max": "29",
            "Rate": "5"
        },
        {
            "Dex": "216",
            "LocationName": "Altering Cave",
            "Encounter": "Cave",
            "Min": "18",
            "Max": "28",
            "Rate": "100"
        },
        {
            "Dex": "216",
            "LocationName": "Safari Zone",
            "Encounter": "Grass",
            "Min": "34",
            "Max": "36",
            "Rate": "30"
        },
        {
            "Dex": "218",
            "LocationName": "Fiery Path",
            "Encounter": "Cave",
            "Min": "15",
            "Max": "15",
            "Rate": "10"
        },
        {
            "Dex": "218",
            "LocationName": "Hoenn Route 113",
            "Encounter": "Grass",
            "Min": "14",
            "Max": "16",
            "Rate": "25"
        },
        {
            "Dex": "222",
            "LocationName": "Ever Grande City",
            "Encounter": "Fish Super",
            "Min": "30",
            "Max": "35",
            "Rate": "15"
        },
        {
            "Dex": "222",
            "LocationName": "Hoenn Route 128",
            "Encounter": "Fish Super",
            "Min": "30",
            "Max": "35",
            "Rate": "15"
        },
        {
            "Dex": "223",
            "LocationName": "Safari Zone",
            "Encounter": "Fish Good",
            "Min": "30",
            "Max": "35",
            "Rate": "20"
        },
        {
            "Dex": "223",
            "LocationName": "Safari Zone",
            "Encounter": "Fish Super",
            "Min": "25",
            "Max": "35",
            "Rate": "59"
        },
        {
            "Dex": "224",
            "LocationName": "Safari Zone",
            "Encounter": "Fish Super",
            "Min": "35",
            "Max": "40",
            "Rate": "1"
        },
        {
            "Dex": "227",
            "LocationName": "Hoenn Route 113",
            "Encounter": "Grass",
            "Min": "16",
            "Max": "16",
            "Rate": "5"
        },
        {
            "Dex": "228",
            "LocationName": "Altering Cave",
            "Encounter": "Cave",
            "Min": "12",
            "Max": "20",
            "Rate": "100"
        },
        {
            "Dex": "228",
            "LocationName": "Safari Zone",
            "Encounter": "Grass",
            "Min": "36",
            "Max": "39",
            "Rate": "5"
        },
        {
            "Dex": "231",
            "LocationName": "Safari Zone",
            "Encounter": "Grass",
            "Min": "27",
            "Max": "29",
            "Rate": "30"
        },
        {
            "Dex": "234",
            "LocationName": "Altering Cave",
            "Encounter": "Cave",
            "Min": "18",
            "Max": "28",
            "Rate": "100"
        },
        {
            "Dex": "234",
            "LocationName": "Safari Zone",
            "Encounter": "Grass",
            "Min": "36",
            "Max": "39",
            "Rate": "5"
        },
        {
            "Dex": "235",
            "LocationName": "Altering Cave",
            "Encounter": "Cave",
            "Min": "18",
            "Max": "28",
            "Rate": "100"
        },
        {
            "Dex": "235",
            "LocationName": "Artisan Cave",
            "Encounter": "Cave",
            "Min": "40",
            "Max": "50",
            "Rate": "100"
        },
        {
            "Dex": "241",
            "LocationName": "Safari Zone",
            "Encounter": "Grass",
            "Min": "37",
            "Max": "40",
            "Rate": "5"
        },
        {
            "Dex": "25",
            "LocationName": "Safari Zone",
            "Encounter": "Grass",
            "Min": "25",
            "Max": "27",
            "Rate": "5"
        },
        {
            "Dex": "252",
            "LocationName": "Hoenn Route 101",
            "Encounter": "Starter",
            "Min": "5",
            "Max": "5",
            "Rate": ""
        },
        {
            "Dex": "255",
            "LocationName": "Hoenn Route 101",
            "Encounter": "Starter",
            "Min": "5",
            "Max": "5",
            "Rate": ""
        },
        {
            "Dex": "258",
            "LocationName": "Hoenn Route 101",
            "Encounter": "Starter",
            "Min": "5",
            "Max": "5",
            "Rate": ""
        },
        {
            "Dex": "261",
            "LocationName": "Hoenn Route 101",
            "Encounter": "Grass",
            "Min": "2",
            "Max": "3",
            "Rate": "45"
        },
        {
            "Dex": "261",
            "LocationName": "Hoenn Route 102",
            "Encounter": "Grass",
            "Min": "3",
            "Max": "4",
            "Rate": "30"
        },
        {
            "Dex": "261",
            "LocationName": "Hoenn Route 103",
            "Encounter": "Grass",
            "Min": "2",
            "Max": "4",
            "Rate": "60"
        },
        {
            "Dex": "261",
            "LocationName": "Hoenn Route 104",
            "Encounter": "Grass",
            "Min": "4",
            "Max": "5",
            "Rate": "40"
        },
        {
            "Dex": "261",
            "LocationName": "Hoenn Route 110",
            "Encounter": "Grass",
            "Min": "12",
            "Max": "12",
            "Rate": "20"
        },
        {
            "Dex": "261",
            "LocationName": "Hoenn Route 116",
            "Encounter": "Grass",
            "Min": "6",
            "Max": "8",
            "Rate": "28"
        },
        {
            "Dex": "261",
            "LocationName": "Hoenn Route 117",
            "Encounter": "Grass",
            "Min": "13",
            "Max": "14",
            "Rate": "30"
        },
        {
            "Dex": "261",
            "LocationName": "Hoenn Route 120",
            "Encounter": "Long grass",
            "Min": "25",
            "Max": "25",
            "Rate": "20"
        },
        {
            "Dex": "261",
            "LocationName": "Hoenn Route 121",
            "Encounter": "Grass",
            "Min": "26",
            "Max": "26",
            "Rate": "20"
        },
        {
            "Dex": "261",
            "LocationName": "Hoenn Route 123",
            "Encounter": "Grass",
            "Min": "26",
            "Max": "26",
            "Rate": "20"
        },
        {
            "Dex": "261",
            "LocationName": "Petalburg Woods",
            "Encounter": "Grass",
            "Min": "5",
            "Max": "6",
            "Rate": "30"
        },
        {
            "Dex": "262",
            "LocationName": "Hoenn Route 120",
            "Encounter": "Long grass",
            "Min": "25",
            "Max": "27",
            "Rate": "30"
        },
        {
            "Dex": "262",
            "LocationName": "Hoenn Route 121",
            "Encounter": "Grass",
            "Min": "26",
            "Max": "28",
            "Rate": "20"
        },
        {
            "Dex": "262",
            "LocationName": "Hoenn Route 123",
            "Encounter": "Grass",
            "Min": "26",
            "Max": "28",
            "Rate": "20"
        },
        {
            "Dex": "263",
            "LocationName": "Hoenn Route 101",
            "Encounter": "Grass",
            "Min": "2",
            "Max": "3",
            "Rate": "10"
        },
        {
            "Dex": "263",
            "LocationName": "Hoenn Route 101",
            "Encounter": "Special",
            "Min": "2",
            "Max": "2",
            "Rate": ""
        },
        {
            "Dex": "263",
            "LocationName": "Hoenn Route 102",
            "Encounter": "Grass",
            "Min": "3",
            "Max": "4",
            "Rate": "15"
        },
        {
            "Dex": "263",
            "LocationName": "Hoenn Route 103",
            "Encounter": "Grass",
            "Min": "3",
            "Max": "4",
            "Rate": "20"
        },
        {
            "Dex": "263",
            "LocationName": "Hoenn Route 118",
            "Encounter": "Grass",
            "Min": "24",
            "Max": "26",
            "Rate": "30"
        },
        {
            "Dex": "263",
            "LocationName": "Hoenn Route 119",
            "Encounter": "Long grass",
            "Min": "25",
            "Max": "27",
            "Rate": "30"
        },
        {
            "Dex": "264",
            "LocationName": "Hoenn Route 118",
            "Encounter": "Grass",
            "Min": "26",
            "Max": "26",
            "Rate": "10"
        },
        {
            "Dex": "264",
            "LocationName": "Hoenn Route 119",
            "Encounter": "Long grass",
            "Min": "25",
            "Max": "27",
            "Rate": "30"
        },
        {
            "Dex": "265",
            "LocationName": "Hoenn Route 101",
            "Encounter": "Grass",
            "Min": "2",
            "Max": "3",
            "Rate": "45"
        },
        {
            "Dex": "265",
            "LocationName": "Hoenn Route 102",
            "Encounter": "Grass",
            "Min": "3",
            "Max": "4",
            "Rate": "30"
        },
        {
            "Dex": "265",
            "LocationName": "Hoenn Route 104",
            "Encounter": "Grass",
            "Min": "4",
            "Max": "4",
            "Rate": "20"
        },
        {
            "Dex": "265",
            "LocationName": "Petalburg Woods",
            "Encounter": "Grass",
            "Min": "5",
            "Max": "6",
            "Rate": "25"
        },
        {
            "Dex": "266",
            "LocationName": "Petalburg Woods",
            "Encounter": "Grass",
            "Min": "5",
            "Max": "5",
            "Rate": "10"
        },
        {
            "Dex": "268",
            "LocationName": "Petalburg Woods",
            "Encounter": "Grass",
            "Min": "5",
            "Max": "5",
            "Rate": "10"
        },
        {
            "Dex": "27",
            "LocationName": "Hoenn Route 111",
            "Encounter": "Sand",
            "Min": "19",
            "Max": "21",
            "Rate": "35"
        },
        {
            "Dex": "270",
            "LocationName": "Hoenn Route 102",
            "Encounter": "Grass",
            "Min": "3",
            "Max": "4",
            "Rate": "20"
        },
        {
            "Dex": "270",
            "LocationName": "Hoenn Route 114",
            "Encounter": "Grass",
            "Min": "15",
            "Max": "16",
            "Rate": "30"
        },
        {
            "Dex": "271",
            "LocationName": "Hoenn Route 114",
            "Encounter": "Grass",
            "Min": "16",
            "Max": "18",
            "Rate": "20"
        },
        {
            "Dex": "273",
            "LocationName": "Hoenn Route 102",
            "Encounter": "Grass",
            "Min": "3",
            "Max": "3",
            "Rate": "1"
        },
        {
            "Dex": "273",
            "LocationName": "Hoenn Route 102",
            "Encounter": "Swarm",
            "Min": "3",
            "Max": "3",
            "Rate": "50"
        },
        {
            "Dex": "273",
            "LocationName": "Hoenn Route 117",
            "Encounter": "Grass",
            "Min": "13",
            "Max": "13",
            "Rate": "1"
        },
        {
            "Dex": "273",
            "LocationName": "Hoenn Route 117",
            "Encounter": "Swarm",
            "Min": "13",
            "Max": "13",
            "Rate": "50"
        },
        {
            "Dex": "273",
            "LocationName": "Hoenn Route 120",
            "Encounter": "Long grass",
            "Min": "25",
            "Max": "25",
            "Rate": "1"
        },
        {
            "Dex": "273",
            "LocationName": "Hoenn Route 120",
            "Encounter": "Swarm",
            "Min": "25",
            "Max": "25",
            "Rate": "50"
        },
        {
            "Dex": "273",
            "LocationName": "Rustboro City",
            "Encounter": "Trade",
            "Min": "",
            "Max": "",
            "Rate": ""
        },
        {
            "Dex": "274",
            "LocationName": "Hoenn Route 114",
            "Encounter": "Grass",
            "Min": "15",
            "Max": "15",
            "Rate": "1"
        },
        {
            "Dex": "274",
            "LocationName": "Hoenn Route 114",
            "Encounter": "Swarm",
            "Min": "15",
            "Max": "15",
            "Rate": "50"
        },
        {
            "Dex": "276",
            "LocationName": "Hoenn Route 104",
            "Encounter": "Grass",
            "Min": "4",
            "Max": "5",
            "Rate": "10"
        },
        {
            "Dex": "276",
            "LocationName": "Hoenn Route 115",
            "Encounter": "Grass",
            "Min": "23",
            "Max": "25",
            "Rate": "40"
        },
        {
            "Dex": "276",
            "LocationName": "Hoenn Route 116",
            "Encounter": "Grass",
            "Min": "6",
            "Max": "8",
            "Rate": "20"
        },
        {
            "Dex": "276",
            "LocationName": "Petalburg Woods",
            "Encounter": "Grass",
            "Min": "5",
            "Max": "6",
            "Rate": "5"
        },
        {
            "Dex": "277",
            "LocationName": "Hoenn Route 115",
            "Encounter": "Grass",
            "Min": "25",
            "Max": "25",
            "Rate": "10"
        },
        {
            "Dex": "278",
            "LocationName": "Dewford Town",
            "Encounter": "Surf",
            "Min": "10",
            "Max": "30",
            "Rate": "35"
        },
        {
            "Dex": "278",
            "LocationName": "Ever Grande City",
            "Encounter": "Surf",
            "Min": "10",
            "Max": "30",
            "Rate": "35"
        },
        {
            "Dex": "278",
            "LocationName": "Hoenn Route 103",
            "Encounter": "Grass",
            "Min": "2",
            "Max": "4",
            "Rate": "20"
        },
        {
            "Dex": "278",
            "LocationName": "Hoenn Route 103",
            "Encounter": "Surf",
            "Min": "10",
            "Max": "30",
            "Rate": "35"
        },
        {
            "Dex": "278",
            "LocationName": "Hoenn Route 104",
            "Encounter": "Grass",
            "Min": "3",
            "Max": "5",
            "Rate": "10"
        },
        {
            "Dex": "278",
            "LocationName": "Hoenn Route 104",
            "Encounter": "Surf",
            "Min": "10",
            "Max": "30",
            "Rate": "95"
        },
        {
            "Dex": "278",
            "LocationName": "Hoenn Route 105",
            "Encounter": "Surf",
            "Min": "10",
            "Max": "30",
            "Rate": "35"
        },
        {
            "Dex": "278",
            "LocationName": "Hoenn Route 106",
            "Encounter": "Surf",
            "Min": "10",
            "Max": "30",
            "Rate": "35"
        },
        {
            "Dex": "278",
            "LocationName": "Hoenn Route 107",
            "Encounter": "Surf",
            "Min": "10",
            "Max": "30",
            "Rate": "35"
        },
        {
            "Dex": "278",
            "LocationName": "Hoenn Route 108",
            "Encounter": "Surf",
            "Min": "10",
            "Max": "30",
            "Rate": "35"
        },
        {
            "Dex": "278",
            "LocationName": "Hoenn Route 109",
            "Encounter": "Surf",
            "Min": "10",
            "Max": "30",
            "Rate": "35"
        },
        {
            "Dex": "278",
            "LocationName": "Hoenn Route 110",
            "Encounter": "Grass",
            "Min": "12",
            "Max": "12",
            "Rate": "8"
        },
        {
            "Dex": "278",
            "LocationName": "Hoenn Route 110",
            "Encounter": "Surf",
            "Min": "10",
            "Max": "30",
            "Rate": "35"
        },
        {
            "Dex": "278",
            "LocationName": "Hoenn Route 115",
            "Encounter": "Grass",
            "Min": "24",
            "Max": "26",
            "Rate": "10"
        },
        {
            "Dex": "278",
            "LocationName": "Hoenn Route 115",
            "Encounter": "Surf",
            "Min": "10",
            "Max": "30",
            "Rate": "35"
        },
        {
            "Dex": "278",
            "LocationName": "Hoenn Route 118",
            "Encounter": "Grass",
            "Min": "25",
            "Max": "27",
            "Rate": "19"
        },
        {
            "Dex": "278",
            "LocationName": "Hoenn Route 118",
            "Encounter": "Surf",
            "Min": "10",
            "Max": "30",
            "Rate": "35"
        },
        {
            "Dex": "278",
            "LocationName": "Hoenn Route 119",
            "Encounter": "Surf",
            "Min": "10",
            "Max": "30",
            "Rate": "35"
        },
        {
            "Dex": "278",
            "LocationName": "Hoenn Route 121",
            "Encounter": "Grass",
            "Min": "26",
            "Max": "28",
            "Rate": "9"
        },
        {
            "Dex": "278",
            "LocationName": "Hoenn Route 121",
            "Encounter": "Surf",
            "Min": "10",
            "Max": "30",
            "Rate": "35"
        },
        {
            "Dex": "278",
            "LocationName": "Hoenn Route 122",
            "Encounter": "Surf",
            "Min": "10",
            "Max": "30",
            "Rate": "35"
        },
        {
            "Dex": "278",
            "LocationName": "Hoenn Route 123",
            "Encounter": "Grass",
            "Min": "26",
            "Max": "28",
            "Rate": "9"
        },
        {
            "Dex": "278",
            "LocationName": "Hoenn Route 123",
            "Encounter": "Surf",
            "Min": "10",
            "Max": "30",
            "Rate": "35"
        },
        {
            "Dex": "278",
            "LocationName": "Hoenn Route 124",
            "Encounter": "Surf",
            "Min": "10",
            "Max": "30",
            "Rate": "35"
        },
        {
            "Dex": "278",
            "LocationName": "Hoenn Route 125",
            "Encounter": "Surf",
            "Min": "10",
            "Max": "30",
            "Rate": "35"
        },
        {
            "Dex": "278",
            "LocationName": "Hoenn Route 126",
            "Encounter": "Surf",
            "Min": "10",
            "Max": "30",
            "Rate": "35"
        },
        {
            "Dex": "278",
            "LocationName": "Hoenn Route 127",
            "Encounter": "Surf",
            "Min": "10",
            "Max": "30",
            "Rate": "35"
        },
        {
            "Dex": "278",
            "LocationName": "Hoenn Route 128",
            "Encounter": "Surf",
            "Min": "10",
            "Max": "30",
            "Rate": "35"
        },
        {
            "Dex": "278",
            "LocationName": "Hoenn Route 129",
            "Encounter": "Surf",
            "Min": "10",
            "Max": "30",
            "Rate": "35"
        },
        {
            "Dex": "278",
            "LocationName": "Hoenn Route 130",
            "Encounter": "Surf",
            "Min": "10",
            "Max": "30",
            "Rate": "35"
        },
        {
            "Dex": "278",
            "LocationName": "Hoenn Route 131",
            "Encounter": "Surf",
            "Min": "10",
            "Max": "30",
            "Rate": "35"
        },
        {
            "Dex": "278",
            "LocationName": "Hoenn Route 132",
            "Encounter": "Surf",
            "Min": "10",
            "Max": "30",
            "Rate": "35"
        },
        {
            "Dex": "278",
            "LocationName": "Hoenn Route 133",
            "Encounter": "Surf",
            "Min": "10",
            "Max": "30",
            "Rate": "35"
        },
        {
            "Dex": "278",
            "LocationName": "Hoenn Route 134",
            "Encounter": "Surf",
            "Min": "10",
            "Max": "30",
            "Rate": "35"
        },
        {
            "Dex": "278",
            "LocationName": "Lilycove City",
            "Encounter": "Surf",
            "Min": "10",
            "Max": "30",
            "Rate": "35"
        },
        {
            "Dex": "278",
            "LocationName": "Mossdeep City",
            "Encounter": "Surf",
            "Min": "10",
            "Max": "30",
            "Rate": "35"
        },
        {
            "Dex": "278",
            "LocationName": "Mt. Pyre",
            "Encounter": "Grass",
            "Min": "26",
            "Max": "28",
            "Rate": "10"
        },
        {
            "Dex": "278",
            "LocationName": "Pacifidlog Town",
            "Encounter": "Surf",
            "Min": "10",
            "Max": "30",
            "Rate": "35"
        },
        {
            "Dex": "278",
            "LocationName": "Slateport City",
            "Encounter": "Surf",
            "Min": "10",
            "Max": "30",
            "Rate": "35"
        },
        {
            "Dex": "279",
            "LocationName": "Dewford Town",
            "Encounter": "Surf",
            "Min": "25",
            "Max": "30",
            "Rate": "5"
        },
        {
            "Dex": "279",
            "LocationName": "Ever Grande City",
            "Encounter": "Surf",
            "Min": "25",
            "Max": "30",
            "Rate": "5"
        },
        {
            "Dex": "279",
            "LocationName": "Hoenn Route 103",
            "Encounter": "Surf",
            "Min": "25",
            "Max": "30",
            "Rate": "5"
        },
        {
            "Dex": "279",
            "LocationName": "Hoenn Route 104",
            "Encounter": "Surf",
            "Min": "25",
            "Max": "30",
            "Rate": "5"
        },
        {
            "Dex": "279",
            "LocationName": "Hoenn Route 105",
            "Encounter": "Surf",
            "Min": "25",
            "Max": "30",
            "Rate": "5"
        },
        {
            "Dex": "279",
            "LocationName": "Hoenn Route 106",
            "Encounter": "Surf",
            "Min": "25",
            "Max": "30",
            "Rate": "5"
        },
        {
            "Dex": "279",
            "LocationName": "Hoenn Route 107",
            "Encounter": "Surf",
            "Min": "25",
            "Max": "30",
            "Rate": "5"
        },
        {
            "Dex": "279",
            "LocationName": "Hoenn Route 108",
            "Encounter": "Surf",
            "Min": "25",
            "Max": "30",
            "Rate": "5"
        },
        {
            "Dex": "279",
            "LocationName": "Hoenn Route 109",
            "Encounter": "Surf",
            "Min": "25",
            "Max": "30",
            "Rate": "5"
        },
        {
            "Dex": "279",
            "LocationName": "Hoenn Route 110",
            "Encounter": "Surf",
            "Min": "25",
            "Max": "30",
            "Rate": "5"
        },
        {
            "Dex": "279",
            "LocationName": "Hoenn Route 115",
            "Encounter": "Surf",
            "Min": "25",
            "Max": "30",
            "Rate": "5"
        },
        {
            "Dex": "279",
            "LocationName": "Hoenn Route 118",
            "Encounter": "Surf",
            "Min": "25",
            "Max": "30",
            "Rate": "5"
        },
        {
            "Dex": "279",
            "LocationName": "Hoenn Route 119",
            "Encounter": "Surf",
            "Min": "25",
            "Max": "30",
            "Rate": "5"
        },
        {
            "Dex": "279",
            "LocationName": "Hoenn Route 121",
            "Encounter": "Surf",
            "Min": "25",
            "Max": "30",
            "Rate": "5"
        },
        {
            "Dex": "279",
            "LocationName": "Hoenn Route 122",
            "Encounter": "Surf",
            "Min": "25",
            "Max": "30",
            "Rate": "5"
        },
        {
            "Dex": "279",
            "LocationName": "Hoenn Route 123",
            "Encounter": "Surf",
            "Min": "25",
            "Max": "30",
            "Rate": "5"
        },
        {
            "Dex": "279",
            "LocationName": "Hoenn Route 124",
            "Encounter": "Surf",
            "Min": "25",
            "Max": "30",
            "Rate": "5"
        },
        {
            "Dex": "279",
            "LocationName": "Hoenn Route 125",
            "Encounter": "Surf",
            "Min": "25",
            "Max": "30",
            "Rate": "5"
        },
        {
            "Dex": "279",
            "LocationName": "Hoenn Route 126",
            "Encounter": "Surf",
            "Min": "25",
            "Max": "30",
            "Rate": "5"
        },
        {
            "Dex": "279",
            "LocationName": "Hoenn Route 127",
            "Encounter": "Surf",
            "Min": "25",
            "Max": "30",
            "Rate": "5"
        },
        {
            "Dex": "279",
            "LocationName": "Hoenn Route 128",
            "Encounter": "Surf",
            "Min": "25",
            "Max": "30",
            "Rate": "5"
        },
        {
            "Dex": "279",
            "LocationName": "Hoenn Route 129",
            "Encounter": "Surf",
            "Min": "25",
            "Max": "30",
            "Rate": "4"
        },
        {
            "Dex": "279",
            "LocationName": "Hoenn Route 130",
            "Encounter": "Surf",
            "Min": "25",
            "Max": "30",
            "Rate": "5"
        },
        {
            "Dex": "279",
            "LocationName": "Hoenn Route 131",
            "Encounter": "Surf",
            "Min": "25",
            "Max": "30",
            "Rate": "5"
        },
        {
            "Dex": "279",
            "LocationName": "Hoenn Route 132",
            "Encounter": "Surf",
            "Min": "25",
            "Max": "30",
            "Rate": "5"
        },
        {
            "Dex": "279",
            "LocationName": "Hoenn Route 133",
            "Encounter": "Surf",
            "Min": "25",
            "Max": "30",
            "Rate": "5"
        },
        {
            "Dex": "279",
            "LocationName": "Hoenn Route 134",
            "Encounter": "Surf",
            "Min": "25",
            "Max": "30",
            "Rate": "5"
        },
        {
            "Dex": "279",
            "LocationName": "Lilycove City",
            "Encounter": "Surf",
            "Min": "25",
            "Max": "30",
            "Rate": "5"
        },
        {
            "Dex": "279",
            "LocationName": "Mossdeep City",
            "Encounter": "Surf",
            "Min": "25",
            "Max": "30",
            "Rate": "5"
        },
        {
            "Dex": "279",
            "LocationName": "Pacifidlog Town",
            "Encounter": "Surf",
            "Min": "25",
            "Max": "30",
            "Rate": "5"
        },
        {
            "Dex": "279",
            "LocationName": "Slateport City",
            "Encounter": "Surf",
            "Min": "25",
            "Max": "30",
            "Rate": "5"
        },
        {
            "Dex": "280",
            "LocationName": "Hoenn Route 102",
            "Encounter": "Grass",
            "Min": "4",
            "Max": "4",
            "Rate": "4"
        },
        {
            "Dex": "285",
            "LocationName": "Petalburg Woods",
            "Encounter": "Grass",
            "Min": "5",
            "Max": "6",
            "Rate": "15"
        },
        {
            "Dex": "287",
            "LocationName": "Petalburg Woods",
            "Encounter": "Grass",
            "Min": "5",
            "Max": "6",
            "Rate": "5"
        },
        {
            "Dex": "290",
            "LocationName": "Hoenn Route 116",
            "Encounter": "Grass",
            "Min": "6",
            "Max": "7",
            "Rate": "20"
        },
        {
            "Dex": "293",
            "LocationName": "Desert Underpass",
            "Encounter": "Cave",
            "Min": "35",
            "Max": "36",
            "Rate": "38"
        },
        {
            "Dex": "293",
            "LocationName": "Hoenn Route 116",
            "Encounter": "Grass",
            "Min": "6",
            "Max": "6",
            "Rate": "20"
        },
        {
            "Dex": "293",
            "LocationName": "Rusturf Tunnel",
            "Encounter": "Cave",
            "Min": "5",
            "Max": "8",
            "Rate": "100"
        },
        {
            "Dex": "293",
            "LocationName": "Victory Road (Hoenn)",
            "Encounter": "Cave",
            "Min": "36",
            "Max": "36",
            "Rate": "5"
        },
        {
            "Dex": "294",
            "LocationName": "Desert Underpass",
            "Encounter": "Cave",
            "Min": "38",
            "Max": "44",
            "Rate": "16"
        },
        {
            "Dex": "294",
            "LocationName": "Victory Road (Hoenn)",
            "Encounter": "Cave",
            "Min": "40",
            "Max": "40",
            "Rate": "10"
        },
        {
            "Dex": "296",
            "LocationName": "Granite Cave",
            "Encounter": "Cave",
            "Min": "10",
            "Max": "11",
            "Rate": "10"
        },
        {
            "Dex": "296",
            "LocationName": "Victory Road (Hoenn)",
            "Encounter": "Cave",
            "Min": "36",
            "Max": "36",
            "Rate": "10"
        },
        {
            "Dex": "297",
            "LocationName": "Victory Road (Hoenn)",
            "Encounter": "Cave",
            "Min": "38",
            "Max": "40",
            "Rate": "25"
        },
        {
            "Dex": "299",
            "LocationName": "Granite Cave",
            "Encounter": "Rock Smash",
            "Min": "10",
            "Max": "20",
            "Rate": "30"
        },
        {
            "Dex": "300",
            "LocationName": "Hoenn Route 116",
            "Encounter": "Grass",
            "Min": "7",
            "Max": "8",
            "Rate": "2"
        },
        {
            "Dex": "300",
            "LocationName": "Hoenn Route 116",
            "Encounter": "Swarm",
            "Min": "8",
            "Max": "8",
            "Rate": "50"
        },
        {
            "Dex": "302",
            "LocationName": "Cave of Origin",
            "Encounter": "Cave",
            "Min": "30",
            "Max": "34",
            "Rate": "30"
        },
        {
            "Dex": "302",
            "LocationName": "Granite Cave",
            "Encounter": "Cave",
            "Min": "10",
            "Max": "12",
            "Rate": "20"
        },
        {
            "Dex": "302",
            "LocationName": "Sky Pillar",
            "Encounter": "1F",
            "Min": "33",
            "Max": "34",
            "Rate": "30"
        },
        {
            "Dex": "302",
            "LocationName": "Sky Pillar",
            "Encounter": "3F",
            "Min": "33",
            "Max": "34",
            "Rate": "30"
        },
        {
            "Dex": "302",
            "LocationName": "Sky Pillar",
            "Encounter": "5F",
            "Min": "33",
            "Max": "34",
            "Rate": "30"
        },
        {
            "Dex": "302",
            "LocationName": "Victory Road (Hoenn)",
            "Encounter": "Cave",
            "Min": "40",
            "Max": "44",
            "Rate": "35"
        },
        {
            "Dex": "303",
            "LocationName": "Victory Road (Hoenn)",
            "Encounter": "Cave",
            "Min": "38",
            "Max": "38",
            "Rate": "5"
        },
        {
            "Dex": "304",
            "LocationName": "Granite Cave",
            "Encounter": "Cave",
            "Min": "10",
            "Max": "12",
            "Rate": "40"
        },
        {
            "Dex": "304",
            "LocationName": "Victory Road (Hoenn)",
            "Encounter": "Cave",
            "Min": "36",
            "Max": "36",
            "Rate": "5"
        },
        {
            "Dex": "305",
            "LocationName": "Victory Road (Hoenn)",
            "Encounter": "Cave",
            "Min": "40",
            "Max": "40",
            "Rate": "10"
        },
        {
            "Dex": "309",
            "LocationName": "Hoenn Route 110",
            "Encounter": "Grass",
            "Min": "12",
            "Max": "13",
            "Rate": "30"
        },
        {
            "Dex": "309",
            "LocationName": "Hoenn Route 118",
            "Encounter": "Grass",
            "Min": "24",
            "Max": "26",
            "Rate": "30"
        },
        {
            "Dex": "310",
            "LocationName": "Hoenn Route 118",
            "Encounter": "Grass",
            "Min": "26",
            "Max": "26",
            "Rate": "10"
        },
        {
            "Dex": "311",
            "LocationName": "Fortree City",
            "Encounter": "Trade",
            "Min": "",
            "Max": "",
            "Rate": ""
        },
        {
            "Dex": "311",
            "LocationName": "Hoenn Route 110",
            "Encounter": "Grass",
            "Min": "12",
            "Max": "13",
            "Rate": "2"
        },
        {
            "Dex": "312",
            "LocationName": "Hoenn Route 110",
            "Encounter": "Grass",
            "Min": "13",
            "Max": "13",
            "Rate": "15"
        },
        {
            "Dex": "313",
            "LocationName": "Hoenn Route 117",
            "Encounter": "Grass",
            "Min": "13",
            "Max": "13",
            "Rate": "1"
        },
        {
            "Dex": "314",
            "LocationName": "Hoenn Route 117",
            "Encounter": "Grass",
            "Min": "13",
            "Max": "14",
            "Rate": "18"
        },
        {
            "Dex": "316",
            "LocationName": "Hoenn Route 110",
            "Encounter": "Grass",
            "Min": "12",
            "Max": "13",
            "Rate": "15"
        },
        {
            "Dex": "318",
            "LocationName": "Hoenn Route 118",
            "Encounter": "Fish Good",
            "Min": "10",
            "Max": "30",
            "Rate": "20"
        },
        {
            "Dex": "318",
            "LocationName": "Hoenn Route 118",
            "Encounter": "Fish Super",
            "Min": "20",
            "Max": "25",
            "Rate": "30"
        },
        {
            "Dex": "318",
            "LocationName": "Hoenn Route 119",
            "Encounter": "Fish Good",
            "Min": "10",
            "Max": "30",
            "Rate": "20"
        },
        {
            "Dex": "318",
            "LocationName": "Hoenn Route 119",
            "Encounter": "Fish Super",
            "Min": "20",
            "Max": "45",
            "Rate": "100"
        },
        {
            "Dex": "319",
            "LocationName": "Hoenn Route 103",
            "Encounter": "Fish Super",
            "Min": "30",
            "Max": "35",
            "Rate": "40"
        },
        {
            "Dex": "319",
            "LocationName": "Hoenn Route 118",
            "Encounter": "Fish Super",
            "Min": "30",
            "Max": "35",
            "Rate": "40"
        },
        {
            "Dex": "319",
            "LocationName": "Hoenn Route 122",
            "Encounter": "Fish Super",
            "Min": "30",
            "Max": "35",
            "Rate": "40"
        },
        {
            "Dex": "319",
            "LocationName": "Hoenn Route 124",
            "Encounter": "Fish Super",
            "Min": "30",
            "Max": "35",
            "Rate": "40"
        },
        {
            "Dex": "319",
            "LocationName": "Hoenn Route 125",
            "Encounter": "Fish Super",
            "Min": "30",
            "Max": "35",
            "Rate": "40"
        },
        {
            "Dex": "319",
            "LocationName": "Hoenn Route 126",
            "Encounter": "Fish Super",
            "Min": "30",
            "Max": "35",
            "Rate": "40"
        },
        {
            "Dex": "319",
            "LocationName": "Hoenn Route 127",
            "Encounter": "Fish Super",
            "Min": "30",
            "Max": "35",
            "Rate": "40"
        },
        {
            "Dex": "319",
            "LocationName": "Hoenn Route 129",
            "Encounter": "Fish Super",
            "Min": "30",
            "Max": "35",
            "Rate": "40"
        },
        {
            "Dex": "319",
            "LocationName": "Hoenn Route 130",
            "Encounter": "Fish Super",
            "Min": "30",
            "Max": "35",
            "Rate": "40"
        },
        {
            "Dex": "319",
            "LocationName": "Hoenn Route 131",
            "Encounter": "Fish Super",
            "Min": "30",
            "Max": "35",
            "Rate": "40"
        },
        {
            "Dex": "319",
            "LocationName": "Hoenn Route 132",
            "Encounter": "Fish Super",
            "Min": "30",
            "Max": "35",
            "Rate": "40"
        },
        {
            "Dex": "319",
            "LocationName": "Hoenn Route 133",
            "Encounter": "Fish Super",
            "Min": "30",
            "Max": "35",
            "Rate": "40"
        },
        {
            "Dex": "319",
            "LocationName": "Hoenn Route 134",
            "Encounter": "Fish Super",
            "Min": "30",
            "Max": "35",
            "Rate": "40"
        },
        {
            "Dex": "319",
            "LocationName": "Mossdeep City",
            "Encounter": "Fish Super",
            "Min": "30",
            "Max": "35",
            "Rate": "40"
        },
        {
            "Dex": "319",
            "LocationName": "Pacifidlog Town",
            "Encounter": "Fish Super",
            "Min": "30",
            "Max": "35",
            "Rate": "40"
        },
        {
            "Dex": "320",
            "LocationName": "Dewford Town",
            "Encounter": "Fish Good",
            "Min": "10",
            "Max": "30",
            "Rate": "20"
        },
        {
            "Dex": "320",
            "LocationName": "Dewford Town",
            "Encounter": "Fish Super",
            "Min": "20",
            "Max": "45",
            "Rate": "100"
        },
        {
            "Dex": "320",
            "LocationName": "Ever Grande City",
            "Encounter": "Fish Good",
            "Min": "10",
            "Max": "30",
            "Rate": "20"
        },
        {
            "Dex": "320",
            "LocationName": "Ever Grande City",
            "Encounter": "Fish Super",
            "Min": "30",
            "Max": "45",
            "Rate": "45"
        },
        {
            "Dex": "320",
            "LocationName": "Hoenn Route 103",
            "Encounter": "Fish Good",
            "Min": "10",
            "Max": "30",
            "Rate": "20"
        },
        {
            "Dex": "320",
            "LocationName": "Hoenn Route 103",
            "Encounter": "Fish Super",
            "Min": "25",
            "Max": "45",
            "Rate": "60"
        },
        {
            "Dex": "320",
            "LocationName": "Hoenn Route 105",
            "Encounter": "Fish Good",
            "Min": "10",
            "Max": "30",
            "Rate": "20"
        },
        {
            "Dex": "320",
            "LocationName": "Hoenn Route 105",
            "Encounter": "Fish Super",
            "Min": "20",
            "Max": "45",
            "Rate": "100"
        },
        {
            "Dex": "320",
            "LocationName": "Hoenn Route 106",
            "Encounter": "Fish Good",
            "Min": "10",
            "Max": "30",
            "Rate": "20"
        },
        {
            "Dex": "320",
            "LocationName": "Hoenn Route 106",
            "Encounter": "Fish Super",
            "Min": "20",
            "Max": "45",
            "Rate": "100"
        },
        {
            "Dex": "320",
            "LocationName": "Hoenn Route 107",
            "Encounter": "Fish Good",
            "Min": "10",
            "Max": "30",
            "Rate": "20"
        },
        {
            "Dex": "320",
            "LocationName": "Hoenn Route 107",
            "Encounter": "Fish Super",
            "Min": "20",
            "Max": "45",
            "Rate": "100"
        },
        {
            "Dex": "320",
            "LocationName": "Hoenn Route 108",
            "Encounter": "Fish Good",
            "Min": "10",
            "Max": "30",
            "Rate": "20"
        },
        {
            "Dex": "320",
            "LocationName": "Hoenn Route 108",
            "Encounter": "Fish Super",
            "Min": "20",
            "Max": "45",
            "Rate": "100"
        },
        {
            "Dex": "320",
            "LocationName": "Hoenn Route 109",
            "Encounter": "Fish Good",
            "Min": "10",
            "Max": "30",
            "Rate": "20"
        },
        {
            "Dex": "320",
            "LocationName": "Hoenn Route 109",
            "Encounter": "Fish Super",
            "Min": "20",
            "Max": "45",
            "Rate": "100"
        },
        {
            "Dex": "320",
            "LocationName": "Hoenn Route 110",
            "Encounter": "Fish Good",
            "Min": "10",
            "Max": "30",
            "Rate": "20"
        },
        {
            "Dex": "320",
            "LocationName": "Hoenn Route 110",
            "Encounter": "Fish Super",
            "Min": "20",
            "Max": "45",
            "Rate": "100"
        },
        {
            "Dex": "320",
            "LocationName": "Hoenn Route 115",
            "Encounter": "Fish Good",
            "Min": "10",
            "Max": "30",
            "Rate": "20"
        },
        {
            "Dex": "320",
            "LocationName": "Hoenn Route 115",
            "Encounter": "Fish Super",
            "Min": "20",
            "Max": "45",
            "Rate": "100"
        },
        {
            "Dex": "320",
            "LocationName": "Hoenn Route 121",
            "Encounter": "Fish Good",
            "Min": "10",
            "Max": "30",
            "Rate": "20"
        },
        {
            "Dex": "320",
            "LocationName": "Hoenn Route 121",
            "Encounter": "Fish Super",
            "Min": "20",
            "Max": "45",
            "Rate": "100"
        },
        {
            "Dex": "320",
            "LocationName": "Hoenn Route 122",
            "Encounter": "Fish Good",
            "Min": "10",
            "Max": "30",
            "Rate": "20"
        },
        {
            "Dex": "320",
            "LocationName": "Hoenn Route 122",
            "Encounter": "Fish Super",
            "Min": "25",
            "Max": "45",
            "Rate": "60"
        },
        {
            "Dex": "320",
            "LocationName": "Hoenn Route 123",
            "Encounter": "Fish Good",
            "Min": "10",
            "Max": "30",
            "Rate": "20"
        },
        {
            "Dex": "320",
            "LocationName": "Hoenn Route 123",
            "Encounter": "Fish Super",
            "Min": "20",
            "Max": "45",
            "Rate": "100"
        },
        {
            "Dex": "320",
            "LocationName": "Hoenn Route 124",
            "Encounter": "Fish Good",
            "Min": "10",
            "Max": "30",
            "Rate": "20"
        },
        {
            "Dex": "320",
            "LocationName": "Hoenn Route 124",
            "Encounter": "Fish Super",
            "Min": "25",
            "Max": "45",
            "Rate": "60"
        },
        {
            "Dex": "320",
            "LocationName": "Hoenn Route 125",
            "Encounter": "Fish Good",
            "Min": "10",
            "Max": "30",
            "Rate": "20"
        },
        {
            "Dex": "320",
            "LocationName": "Hoenn Route 125",
            "Encounter": "Fish Super",
            "Min": "25",
            "Max": "45",
            "Rate": "60"
        },
        {
            "Dex": "320",
            "LocationName": "Hoenn Route 126",
            "Encounter": "Fish Good",
            "Min": "10",
            "Max": "30",
            "Rate": "20"
        },
        {
            "Dex": "320",
            "LocationName": "Hoenn Route 126",
            "Encounter": "Fish Super",
            "Min": "25",
            "Max": "45",
            "Rate": "60"
        },
        {
            "Dex": "320",
            "LocationName": "Hoenn Route 127",
            "Encounter": "Fish Good",
            "Min": "10",
            "Max": "30",
            "Rate": "20"
        },
        {
            "Dex": "320",
            "LocationName": "Hoenn Route 127",
            "Encounter": "Fish Super",
            "Min": "25",
            "Max": "45",
            "Rate": "60"
        },
        {
            "Dex": "320",
            "LocationName": "Hoenn Route 128",
            "Encounter": "Fish Good",
            "Min": "10",
            "Max": "30",
            "Rate": "20"
        },
        {
            "Dex": "320",
            "LocationName": "Hoenn Route 128",
            "Encounter": "Fish Super",
            "Min": "30",
            "Max": "45",
            "Rate": "45"
        },
        {
            "Dex": "320",
            "LocationName": "Hoenn Route 129",
            "Encounter": "Fish Good",
            "Min": "10",
            "Max": "30",
            "Rate": "20"
        },
        {
            "Dex": "320",
            "LocationName": "Hoenn Route 129",
            "Encounter": "Fish Super",
            "Min": "25",
            "Max": "45",
            "Rate": "60"
        },
        {
            "Dex": "320",
            "LocationName": "Hoenn Route 130",
            "Encounter": "Fish Good",
            "Min": "10",
            "Max": "30",
            "Rate": "20"
        },
        {
            "Dex": "320",
            "LocationName": "Hoenn Route 130",
            "Encounter": "Fish Super",
            "Min": "25",
            "Max": "45",
            "Rate": "60"
        },
        {
            "Dex": "320",
            "LocationName": "Hoenn Route 131",
            "Encounter": "Fish Good",
            "Min": "10",
            "Max": "30",
            "Rate": "20"
        },
        {
            "Dex": "320",
            "LocationName": "Hoenn Route 131",
            "Encounter": "Fish Super",
            "Min": "25",
            "Max": "45",
            "Rate": "60"
        },
        {
            "Dex": "320",
            "LocationName": "Hoenn Route 132",
            "Encounter": "Fish Good",
            "Min": "10",
            "Max": "30",
            "Rate": "20"
        },
        {
            "Dex": "320",
            "LocationName": "Hoenn Route 132",
            "Encounter": "Fish Super",
            "Min": "30",
            "Max": "45",
            "Rate": "45"
        },
        {
            "Dex": "320",
            "LocationName": "Hoenn Route 133",
            "Encounter": "Fish Good",
            "Min": "10",
            "Max": "30",
            "Rate": "20"
        },
        {
            "Dex": "320",
            "LocationName": "Hoenn Route 133",
            "Encounter": "Fish Super",
            "Min": "30",
            "Max": "45",
            "Rate": "45"
        },
        {
            "Dex": "320",
            "LocationName": "Hoenn Route 134",
            "Encounter": "Fish Good",
            "Min": "10",
            "Max": "30",
            "Rate": "20"
        },
        {
            "Dex": "320",
            "LocationName": "Hoenn Route 134",
            "Encounter": "Fish Super",
            "Min": "30",
            "Max": "45",
            "Rate": "45"
        },
        {
            "Dex": "320",
            "LocationName": "Lilycove City",
            "Encounter": "Fish Good",
            "Min": "10",
            "Max": "30",
            "Rate": "20"
        },
        {
            "Dex": "320",
            "LocationName": "Lilycove City",
            "Encounter": "Fish Super",
            "Min": "25",
            "Max": "45",
            "Rate": "85"
        },
        {
            "Dex": "320",
            "LocationName": "Mossdeep City",
            "Encounter": "Fish Good",
            "Min": "10",
            "Max": "30",
            "Rate": "20"
        },
        {
            "Dex": "320",
            "LocationName": "Mossdeep City",
            "Encounter": "Fish Super",
            "Min": "25",
            "Max": "45",
            "Rate": "60"
        },
        {
            "Dex": "320",
            "LocationName": "Pacifidlog Town",
            "Encounter": "Fish Good",
            "Min": "10",
            "Max": "30",
            "Rate": "20"
        },
        {
            "Dex": "320",
            "LocationName": "Pacifidlog Town",
            "Encounter": "Fish Super",
            "Min": "25",
            "Max": "45",
            "Rate": "60"
        },
        {
            "Dex": "320",
            "LocationName": "Seafloor Cavern",
            "Encounter": "Fish Good",
            "Min": "10",
            "Max": "30",
            "Rate": "20"
        },
        {
            "Dex": "320",
            "LocationName": "Seafloor Cavern",
            "Encounter": "Fish Super",
            "Min": "20",
            "Max": "45",
            "Rate": "100"
        },
        {
            "Dex": "320",
            "LocationName": "Shoal Cave",
            "Encounter": "Fish Good",
            "Min": "10",
            "Max": "30",
            "Rate": "20"
        },
        {
            "Dex": "320",
            "LocationName": "Shoal Cave",
            "Encounter": "Fish Super",
            "Min": "20",
            "Max": "45",
            "Rate": "100"
        },
        {
            "Dex": "320",
            "LocationName": "Slateport City",
            "Encounter": "Fish Good",
            "Min": "10",
            "Max": "30",
            "Rate": "20"
        },
        {
            "Dex": "320",
            "LocationName": "Slateport City",
            "Encounter": "Fish Super",
            "Min": "20",
            "Max": "45",
            "Rate": "100"
        },
        {
            "Dex": "321",
            "LocationName": "Hoenn Route 129",
            "Encounter": "Surf",
            "Min": "25",
            "Max": "30",
            "Rate": "1"
        },
        {
            "Dex": "322",
            "LocationName": "Fiery Path",
            "Encounter": "Cave",
            "Min": "15",
            "Max": "16",
            "Rate": "30"
        },
        {
            "Dex": "322",
            "LocationName": "Hoenn Route 112",
            "Encounter": "Grass",
            "Min": "14",
            "Max": "16",
            "Rate": "75"
        },
        {
            "Dex": "322",
            "LocationName": "Jagged Pass",
            "Encounter": "Grass",
            "Min": "20",
            "Max": "22",
            "Rate": "55"
        },
        {
            "Dex": "324",
            "LocationName": "Fiery Path",
            "Encounter": "Cave",
            "Min": "14",
            "Max": "16",
            "Rate": "18"
        },
        {
            "Dex": "324",
            "LocationName": "Magma Hideout",
            "Encounter": "Cave",
            "Min": "28",
            "Max": "30",
            "Rate": "30"
        },
        {
            "Dex": "325",
            "LocationName": "Jagged Pass",
            "Encounter": "Grass",
            "Min": "20",
            "Max": "22",
            "Rate": "20"
        },
        {
            "Dex": "327",
            "LocationName": "Hoenn Route 113",
            "Encounter": "Grass",
            "Min": "14",
            "Max": "16",
            "Rate": "70"
        },
        {
            "Dex": "328",
            "LocationName": "Hoenn Route 111",
            "Encounter": "Sand",
            "Min": "19",
            "Max": "21",
            "Rate": "35"
        },
        {
            "Dex": "331",
            "LocationName": "Hoenn Route 111",
            "Encounter": "Sand",
            "Min": "20",
            "Max": "22",
            "Rate": "6"
        },
        {
            "Dex": "333",
            "LocationName": "Hoenn Route 114",
            "Encounter": "Grass",
            "Min": "15",
            "Max": "17",
            "Rate": "40"
        },
        {
            "Dex": "333",
            "LocationName": "Hoenn Route 115",
            "Encounter": "Grass",
            "Min": "23",
            "Max": "25",
            "Rate": "30"
        },
        {
            "Dex": "334",
            "LocationName": "Sky Pillar",
            "Encounter": "5F",
            "Min": "38",
            "Max": "39",
            "Rate": "6"
        },
        {
            "Dex": "336",
            "LocationName": "Hoenn Route 114",
            "Encounter": "Grass",
            "Min": "15",
            "Max": "17",
            "Rate": "9"
        },
        {
            "Dex": "339",
            "LocationName": "Hoenn Route 111",
            "Encounter": "Fish Good",
            "Min": "10",
            "Max": "30",
            "Rate": "20"
        },
        {
            "Dex": "339",
            "LocationName": "Hoenn Route 111",
            "Encounter": "Fish Super",
            "Min": "20",
            "Max": "45",
            "Rate": "100"
        },
        {
            "Dex": "339",
            "LocationName": "Hoenn Route 114",
            "Encounter": "Fish Good",
            "Min": "10",
            "Max": "30",
            "Rate": "20"
        },
        {
            "Dex": "339",
            "LocationName": "Hoenn Route 114",
            "Encounter": "Fish Super",
            "Min": "20",
            "Max": "45",
            "Rate": "100"
        },
        {
            "Dex": "339",
            "LocationName": "Hoenn Route 120",
            "Encounter": "Fish Good",
            "Min": "10",
            "Max": "30",
            "Rate": "20"
        },
        {
            "Dex": "339",
            "LocationName": "Hoenn Route 120",
            "Encounter": "Fish Super",
            "Min": "20",
            "Max": "45",
            "Rate": "100"
        },
        {
            "Dex": "339",
            "LocationName": "Victory Road (Hoenn)",
            "Encounter": "Fish Good",
            "Min": "10",
            "Max": "30",
            "Rate": "20"
        },
        {
            "Dex": "339",
            "LocationName": "Victory Road (Hoenn)",
            "Encounter": "Fish Super",
            "Min": "25",
            "Max": "35",
            "Rate": "80"
        },
        {
            "Dex": "340",
            "LocationName": "Victory Road (Hoenn)",
            "Encounter": "Fish Super",
            "Min": "30",
            "Max": "45",
            "Rate": "20"
        },
        {
            "Dex": "341",
            "LocationName": "Hoenn Route 102",
            "Encounter": "Fish Good",
            "Min": "10",
            "Max": "30",
            "Rate": "20"
        },
        {
            "Dex": "341",
            "LocationName": "Hoenn Route 102",
            "Encounter": "Fish Super",
            "Min": "20",
            "Max": "45",
            "Rate": "100"
        },
        {
            "Dex": "341",
            "LocationName": "Hoenn Route 117",
            "Encounter": "Fish Good",
            "Min": "10",
            "Max": "30",
            "Rate": "20"
        },
        {
            "Dex": "341",
            "LocationName": "Hoenn Route 117",
            "Encounter": "Fish Super",
            "Min": "20",
            "Max": "45",
            "Rate": "100"
        },
        {
            "Dex": "341",
            "LocationName": "Petalburg City",
            "Encounter": "Fish Good",
            "Min": "10",
            "Max": "30",
            "Rate": "20"
        },
        {
            "Dex": "341",
            "LocationName": "Petalburg City",
            "Encounter": "Fish Super",
            "Min": "20",
            "Max": "45",
            "Rate": "100"
        },
        {
            "Dex": "343",
            "LocationName": "Hoenn Route 111",
            "Encounter": "Sand",
            "Min": "19",
            "Max": "21",
            "Rate": "24"
        },
        {
            "Dex": "344",
            "LocationName": "Sky Pillar",
            "Encounter": "1F",
            "Min": "36",
            "Max": "38",
            "Rate": "25"
        },
        {
            "Dex": "344",
            "LocationName": "Sky Pillar",
            "Encounter": "3F",
            "Min": "36",
            "Max": "38",
            "Rate": "25"
        },
        {
            "Dex": "344",
            "LocationName": "Sky Pillar",
            "Encounter": "5F",
            "Min": "36",
            "Max": "38",
            "Rate": "19"
        },
        {
            "Dex": "349",
            "LocationName": "Hoenn Route 119",
            "Encounter": "Fish Good",
            "Min": "20",
            "Max": "25",
            "Rate": "5"
        },
        {
            "Dex": "349",
            "LocationName": "Hoenn Route 119",
            "Encounter": "Fish Old",
            "Min": "20",
            "Max": "25",
            "Rate": "5"
        },
        {
            "Dex": "349",
            "LocationName": "Hoenn Route 119",
            "Encounter": "Fish Super",
            "Min": "20",
            "Max": "25",
            "Rate": "5"
        },
        {
            "Dex": "351",
            "LocationName": "Weather Institute",
            "Encounter": "Gift",
            "Min": "25",
            "Max": "25",
            "Rate": ""
        },
        {
            "Dex": "352",
            "LocationName": "Hoenn Route 118",
            "Encounter": "Grass",
            "Min": "25",
            "Max": "25",
            "Rate": "1"
        },
        {
            "Dex": "352",
            "LocationName": "Hoenn Route 119",
            "Encounter": "Long grass",
            "Min": "25",
            "Max": "25",
            "Rate": "1"
        },
        {
            "Dex": "352",
            "LocationName": "Hoenn Route 119",
            "Encounter": "Special",
            "Min": "30",
            "Max": "30",
            "Rate": ""
        },
        {
            "Dex": "352",
            "LocationName": "Hoenn Route 120",
            "Encounter": "Long grass",
            "Min": "25",
            "Max": "25",
            "Rate": "1"
        },
        {
            "Dex": "352",
            "LocationName": "Hoenn Route 120",
            "Encounter": "Special",
            "Min": "30",
            "Max": "30",
            "Rate": ""
        },
        {
            "Dex": "352",
            "LocationName": "Hoenn Route 121",
            "Encounter": "Grass",
            "Min": "25",
            "Max": "25",
            "Rate": "1"
        },
        {
            "Dex": "352",
            "LocationName": "Hoenn Route 123",
            "Encounter": "Grass",
            "Min": "25",
            "Max": "25",
            "Rate": "1"
        },
        {
            "Dex": "353",
            "LocationName": "Hoenn Route 121",
            "Encounter": "Grass",
            "Min": "26",
            "Max": "28",
            "Rate": "30"
        },
        {
            "Dex": "353",
            "LocationName": "Hoenn Route 123",
            "Encounter": "Grass",
            "Min": "26",
            "Max": "28",
            "Rate": "30"
        },
        {
            "Dex": "353",
            "LocationName": "Mt. Pyre",
            "Encounter": "Grass",
            "Min": "24",
            "Max": "30",
            "Rate": "85"
        },
        {
            "Dex": "354",
            "LocationName": "Sky Pillar",
            "Encounter": "1F",
            "Min": "37",
            "Max": "38",
            "Rate": "15"
        },
        {
            "Dex": "354",
            "LocationName": "Sky Pillar",
            "Encounter": "3F",
            "Min": "37",
            "Max": "38",
            "Rate": "15"
        },
        {
            "Dex": "354",
            "LocationName": "Sky Pillar",
            "Encounter": "5F",
            "Min": "37",
            "Max": "38",
            "Rate": "15"
        },
        {
            "Dex": "355",
            "LocationName": "Mt. Pyre",
            "Encounter": "Grass",
            "Min": "26",
            "Max": "30",
            "Rate": "13"
        },
        {
            "Dex": "357",
            "LocationName": "Hoenn Route 119",
            "Encounter": "Long grass",
            "Min": "25",
            "Max": "27",
            "Rate": "9"
        },
        {
            "Dex": "358",
            "LocationName": "Mt. Pyre",
            "Encounter": "Grass",
            "Min": "28",
            "Max": "28",
            "Rate": "2"
        },
        {
            "Dex": "359",
            "LocationName": "Hoenn Route 120",
            "Encounter": "Long grass",
            "Min": "25",
            "Max": "27",
            "Rate": "8"
        },
        {
            "Dex": "360",
            "LocationName": "Hoenn Route 130",
            "Encounter": "Grass",
            "Min": "5",
            "Max": "10",
            "Rate": "15"
        },
        {
            "Dex": "360",
            "LocationName": "Lavaridge Town",
            "Encounter": "Egg",
            "Min": "5",
            "Max": "5",
            "Rate": ""
        },
        {
            "Dex": "360",
            "LocationName": "Mirage Island",
            "Encounter": "Grass",
            "Min": "5",
            "Max": "10",
            "Rate": "15"
        },
        {
            "Dex": "361",
            "LocationName": "Shoal Cave",
            "Encounter": "Cave",
            "Min": "26",
            "Max": "30",
            "Rate": "10"
        },
        {
            "Dex": "363",
            "LocationName": "Shoal Cave",
            "Encounter": "Cave",
            "Min": "26",
            "Max": "28",
            "Rate": "30"
        },
        {
            "Dex": "363",
            "LocationName": "Shoal Cave",
            "Encounter": "Surf",
            "Min": "25",
            "Max": "35",
            "Rate": "10"
        },
        {
            "Dex": "366",
            "LocationName": "Hoenn Route 124",
            "Encounter": "Dive",
            "Min": "20",
            "Max": "35",
            "Rate": "65"
        },
        {
            "Dex": "366",
            "LocationName": "Hoenn Route 126",
            "Encounter": "Dive",
            "Min": "20",
            "Max": "35",
            "Rate": "65"
        },
        {
            "Dex": "366",
            "LocationName": "Underwater",
            "Encounter": "Dive",
            "Min": "20",
            "Max": "35",
            "Rate": "65"
        },
        {
            "Dex": "369",
            "LocationName": "Hoenn Route 124",
            "Encounter": "Dive",
            "Min": "30",
            "Max": "35",
            "Rate": "5"
        },
        {
            "Dex": "369",
            "LocationName": "Hoenn Route 126",
            "Encounter": "Dive",
            "Min": "30",
            "Max": "35",
            "Rate": "5"
        },
        {
            "Dex": "369",
            "LocationName": "Underwater",
            "Encounter": "Dive",
            "Min": "30",
            "Max": "35",
            "Rate": "5"
        },
        {
            "Dex": "37",
            "LocationName": "Mt. Pyre",
            "Encounter": "Grass",
            "Min": "25",
            "Max": "29",
            "Rate": "30"
        },
        {
            "Dex": "370",
            "LocationName": "Ever Grande City",
            "Encounter": "Fish Good",
            "Min": "10",
            "Max": "30",
            "Rate": "20"
        },
        {
            "Dex": "370",
            "LocationName": "Ever Grande City",
            "Encounter": "Fish Super",
            "Min": "30",
            "Max": "35",
            "Rate": "40"
        },
        {
            "Dex": "370",
            "LocationName": "Hoenn Route 128",
            "Encounter": "Fish Good",
            "Min": "10",
            "Max": "30",
            "Rate": "20"
        },
        {
            "Dex": "370",
            "LocationName": "Hoenn Route 128",
            "Encounter": "Fish Super",
            "Min": "30",
            "Max": "35",
            "Rate": "40"
        },
        {
            "Dex": "374",
            "LocationName": "Mossdeep City",
            "Encounter": "Gift",
            "Min": "5",
            "Max": "5",
            "Rate": ""
        },
        {
            "Dex": "377",
            "LocationName": "Desert Ruins",
            "Encounter": "Special",
            "Min": "40",
            "Max": "40",
            "Rate": ""
        },
        {
            "Dex": "378",
            "LocationName": "Island Cave",
            "Encounter": "Special",
            "Min": "40",
            "Max": "40",
            "Rate": ""
        },
        {
            "Dex": "379",
            "LocationName": "Ancient Tomb",
            "Encounter": "Special",
            "Min": "40",
            "Max": "40",
            "Rate": ""
        },
        {
            "Dex": "380",
            "LocationName": "Southern Island",
            "Encounter": "Eon",
            "Min": "50",
            "Max": "50",
            "Rate": ""
        },
        {
            "Dex": "381",
            "LocationName": "Southern Island",
            "Encounter": "Eon",
            "Min": "50",
            "Max": "50",
            "Rate": ""
        },
        {
            "Dex": "382",
            "LocationName": "Marine Cave",
            "Encounter": "Special",
            "Min": "70",
            "Max": "70",
            "Rate": ""
        },
        {
            "Dex": "383",
            "LocationName": "Terra Cave",
            "Encounter": "Special",
            "Min": "70",
            "Max": "70",
            "Rate": ""
        },
        {
            "Dex": "384",
            "LocationName": "Sky Pillar",
            "Encounter": "Special",
            "Min": "70",
            "Max": "70",
            "Rate": ""
        },
        {
            "Dex": "386",
            "LocationName": "Birth Island",
            "Encounter": "Aurora",
            "Min": "30",
            "Max": "30",
            "Rate": ""
        },
        {
            "Dex": "39",
            "LocationName": "Hoenn Route 115",
            "Encounter": "Grass",
            "Min": "24",
            "Max": "25",
            "Rate": "10"
        },
        {
            "Dex": "41",
            "LocationName": "Altering Cave",
            "Encounter": "Cave",
            "Min": "6",
            "Max": "16",
            "Rate": "100"
        },
        {
            "Dex": "41",
            "LocationName": "Cave of Origin",
            "Encounter": "Cave",
            "Min": "28",
            "Max": "35",
            "Rate": "90"
        },
        {
            "Dex": "41",
            "LocationName": "Granite Cave",
            "Encounter": "Cave",
            "Min": "10",
            "Max": "11",
            "Rate": "30"
        },
        {
            "Dex": "41",
            "LocationName": "Seafloor Cavern",
            "Encounter": "Cave",
            "Min": "28",
            "Max": "35",
            "Rate": "90"
        },
        {
            "Dex": "41",
            "LocationName": "Seafloor Cavern",
            "Encounter": "Surf",
            "Min": "5",
            "Max": "35",
            "Rate": "35"
        },
        {
            "Dex": "41",
            "LocationName": "Shoal Cave",
            "Encounter": "Cave",
            "Min": "26",
            "Max": "28",
            "Rate": "30"
        },
        {
            "Dex": "41",
            "LocationName": "Shoal Cave",
            "Encounter": "Surf",
            "Min": "5",
            "Max": "35",
            "Rate": "30"
        },
        {
            "Dex": "41",
            "LocationName": "Victory Road (Hoenn)",
            "Encounter": "Cave",
            "Min": "36",
            "Max": "36",
            "Rate": "10"
        },
        {
            "Dex": "42",
            "LocationName": "Cave of Origin",
            "Encounter": "Cave",
            "Min": "33",
            "Max": "36",
            "Rate": "10"
        },
        {
            "Dex": "42",
            "LocationName": "Seafloor Cavern",
            "Encounter": "Cave",
            "Min": "33",
            "Max": "36",
            "Rate": "10"
        },
        {
            "Dex": "42",
            "LocationName": "Seafloor Cavern",
            "Encounter": "Surf",
            "Min": "30",
            "Max": "35",
            "Rate": "5"
        },
        {
            "Dex": "42",
            "LocationName": "Shoal Cave",
            "Encounter": "Cave",
            "Min": "30",
            "Max": "32",
            "Rate": "5"
        },
        {
            "Dex": "42",
            "LocationName": "Sky Pillar",
            "Encounter": "1F",
            "Min": "34",
            "Max": "35",
            "Rate": "30"
        },
        {
            "Dex": "42",
            "LocationName": "Sky Pillar",
            "Encounter": "3F",
            "Min": "34",
            "Max": "35",
            "Rate": "30"
        },
        {
            "Dex": "42",
            "LocationName": "Sky Pillar",
            "Encounter": "5F",
            "Min": "34",
            "Max": "35",
            "Rate": "30"
        },
        {
            "Dex": "42",
            "LocationName": "Victory Road (Hoenn)",
            "Encounter": "Cave",
            "Min": "38",
            "Max": "40",
            "Rate": "25"
        },
        {
            "Dex": "42",
            "LocationName": "Victory Road (Hoenn)",
            "Encounter": "Surf",
            "Min": "25",
            "Max": "40",
            "Rate": "100"
        },
        {
            "Dex": "43",
            "LocationName": "Hoenn Route 110",
            "Encounter": "Grass",
            "Min": "13",
            "Max": "13",
            "Rate": "10"
        },
        {
            "Dex": "43",
            "LocationName": "Hoenn Route 117",
            "Encounter": "Grass",
            "Min": "13",
            "Max": "14",
            "Rate": "40"
        },
        {
            "Dex": "43",
            "LocationName": "Hoenn Route 119",
            "Encounter": "Long grass",
            "Min": "24",
            "Max": "27",
            "Rate": "30"
        },
        {
            "Dex": "43",
            "LocationName": "Hoenn Route 120",
            "Encounter": "Long grass",
            "Min": "25",
            "Max": "27",
            "Rate": "25"
        },
        {
            "Dex": "43",
            "LocationName": "Hoenn Route 121",
            "Encounter": "Grass",
            "Min": "26",
            "Max": "28",
            "Rate": "15"
        },
        {
            "Dex": "43",
            "LocationName": "Hoenn Route 123",
            "Encounter": "Grass",
            "Min": "26",
            "Max": "28",
            "Rate": "15"
        },
        {
            "Dex": "43",
            "LocationName": "Safari Zone",
            "Encounter": "Grass",
            "Min": "25",
            "Max": "27",
            "Rate": "40"
        },
        {
            "Dex": "44",
            "LocationName": "Hoenn Route 121",
            "Encounter": "Grass",
            "Min": "28",
            "Max": "28",
            "Rate": "5"
        },
        {
            "Dex": "44",
            "LocationName": "Hoenn Route 123",
            "Encounter": "Grass",
            "Min": "28",
            "Max": "28",
            "Rate": "5"
        },
        {
            "Dex": "44",
            "LocationName": "Safari Zone",
            "Encounter": "Grass",
            "Min": "25",
            "Max": "25",
            "Rate": "5"
        },
        {
            "Dex": "54",
            "LocationName": "Safari Zone",
            "Encounter": "Surf",
            "Min": "20",
            "Max": "35",
            "Rate": "100"
        },
        {
            "Dex": "55",
            "LocationName": "Safari Zone",
            "Encounter": "Surf",
            "Min": "25",
            "Max": "40",
            "Rate": "5"
        },
        {
            "Dex": "63",
            "LocationName": "Granite Cave",
            "Encounter": "Cave",
            "Min": "10",
            "Max": "10",
            "Rate": "10"
        },
        {
            "Dex": "63",
            "LocationName": "Hoenn Route 116",
            "Encounter": "Grass",
            "Min": "7",
            "Max": "7",
            "Rate": "10"
        },
        {
            "Dex": "66",
            "LocationName": "Fiery Path",
            "Encounter": "Cave",
            "Min": "15",
            "Max": "16",
            "Rate": "15"
        },
        {
            "Dex": "66",
            "LocationName": "Jagged Pass",
            "Encounter": "Grass",
            "Min": "20",
            "Max": "22",
            "Rate": "25"
        },
        {
            "Dex": "72",
            "LocationName": "Abandoned Ship",
            "Encounter": "Fish Good",
            "Min": "10",
            "Max": "30",
            "Rate": "40"
        },
        {
            "Dex": "72",
            "LocationName": "Abandoned Ship",
            "Encounter": "Fish Old",
            "Min": "5",
            "Max": "10",
            "Rate": "30"
        },
        {
            "Dex": "72",
            "LocationName": "Abandoned Ship",
            "Encounter": "Fish Super",
            "Min": "25",
            "Max": "35",
            "Rate": "80"
        },
        {
            "Dex": "72",
            "LocationName": "Abandoned Ship",
            "Encounter": "Surf",
            "Min": "5",
            "Max": "35",
            "Rate": "99"
        },
        {
            "Dex": "72",
            "LocationName": "Dewford Town",
            "Encounter": "Fish Good",
            "Min": "10",
            "Max": "30",
            "Rate": "20"
        },
        {
            "Dex": "72",
            "LocationName": "Dewford Town",
            "Encounter": "Fish Old",
            "Min": "5",
            "Max": "10",
            "Rate": "30"
        },
        {
            "Dex": "72",
            "LocationName": "Dewford Town",
            "Encounter": "Surf",
            "Min": "5",
            "Max": "35",
            "Rate": "60"
        },
        {
            "Dex": "72",
            "LocationName": "Ever Grande City",
            "Encounter": "Fish Old",
            "Min": "5",
            "Max": "10",
            "Rate": "30"
        },
        {
            "Dex": "72",
            "LocationName": "Ever Grande City",
            "Encounter": "Surf",
            "Min": "5",
            "Max": "35",
            "Rate": "60"
        },
        {
            "Dex": "72",
            "LocationName": "Hoenn Route 103",
            "Encounter": "Fish Good",
            "Min": "10",
            "Max": "30",
            "Rate": "20"
        },
        {
            "Dex": "72",
            "LocationName": "Hoenn Route 103",
            "Encounter": "Fish Old",
            "Min": "5",
            "Max": "10",
            "Rate": "30"
        },
        {
            "Dex": "72",
            "LocationName": "Hoenn Route 103",
            "Encounter": "Surf",
            "Min": "5",
            "Max": "35",
            "Rate": "60"
        },
        {
            "Dex": "72",
            "LocationName": "Hoenn Route 105",
            "Encounter": "Fish Good",
            "Min": "10",
            "Max": "30",
            "Rate": "20"
        },
        {
            "Dex": "72",
            "LocationName": "Hoenn Route 105",
            "Encounter": "Fish Old",
            "Min": "5",
            "Max": "10",
            "Rate": "30"
        },
        {
            "Dex": "72",
            "LocationName": "Hoenn Route 105",
            "Encounter": "Surf",
            "Min": "5",
            "Max": "35",
            "Rate": "60"
        },
        {
            "Dex": "72",
            "LocationName": "Hoenn Route 106",
            "Encounter": "Fish Good",
            "Min": "10",
            "Max": "30",
            "Rate": "20"
        },
        {
            "Dex": "72",
            "LocationName": "Hoenn Route 106",
            "Encounter": "Fish Old",
            "Min": "5",
            "Max": "10",
            "Rate": "30"
        },
        {
            "Dex": "72",
            "LocationName": "Hoenn Route 106",
            "Encounter": "Surf",
            "Min": "5",
            "Max": "35",
            "Rate": "60"
        },
        {
            "Dex": "72",
            "LocationName": "Hoenn Route 107",
            "Encounter": "Fish Good",
            "Min": "10",
            "Max": "30",
            "Rate": "20"
        },
        {
            "Dex": "72",
            "LocationName": "Hoenn Route 107",
            "Encounter": "Fish Old",
            "Min": "5",
            "Max": "10",
            "Rate": "30"
        },
        {
            "Dex": "72",
            "LocationName": "Hoenn Route 107",
            "Encounter": "Surf",
            "Min": "5",
            "Max": "35",
            "Rate": "60"
        },
        {
            "Dex": "72",
            "LocationName": "Hoenn Route 108",
            "Encounter": "Fish Good",
            "Min": "10",
            "Max": "30",
            "Rate": "20"
        },
        {
            "Dex": "72",
            "LocationName": "Hoenn Route 108",
            "Encounter": "Fish Old",
            "Min": "5",
            "Max": "10",
            "Rate": "30"
        },
        {
            "Dex": "72",
            "LocationName": "Hoenn Route 108",
            "Encounter": "Surf",
            "Min": "5",
            "Max": "35",
            "Rate": "60"
        },
        {
            "Dex": "72",
            "LocationName": "Hoenn Route 109",
            "Encounter": "Fish Good",
            "Min": "10",
            "Max": "30",
            "Rate": "20"
        },
        {
            "Dex": "72",
            "LocationName": "Hoenn Route 109",
            "Encounter": "Fish Old",
            "Min": "5",
            "Max": "10",
            "Rate": "30"
        },
        {
            "Dex": "72",
            "LocationName": "Hoenn Route 109",
            "Encounter": "Surf",
            "Min": "5",
            "Max": "35",
            "Rate": "60"
        },
        {
            "Dex": "72",
            "LocationName": "Hoenn Route 110",
            "Encounter": "Fish Good",
            "Min": "10",
            "Max": "30",
            "Rate": "20"
        },
        {
            "Dex": "72",
            "LocationName": "Hoenn Route 110",
            "Encounter": "Fish Old",
            "Min": "5",
            "Max": "10",
            "Rate": "30"
        },
        {
            "Dex": "72",
            "LocationName": "Hoenn Route 110",
            "Encounter": "Surf",
            "Min": "5",
            "Max": "35",
            "Rate": "60"
        },
        {
            "Dex": "72",
            "LocationName": "Hoenn Route 115",
            "Encounter": "Fish Good",
            "Min": "10",
            "Max": "30",
            "Rate": "20"
        },
        {
            "Dex": "72",
            "LocationName": "Hoenn Route 115",
            "Encounter": "Fish Old",
            "Min": "5",
            "Max": "10",
            "Rate": "30"
        },
        {
            "Dex": "72",
            "LocationName": "Hoenn Route 115",
            "Encounter": "Surf",
            "Min": "5",
            "Max": "35",
            "Rate": "60"
        },
        {
            "Dex": "72",
            "LocationName": "Hoenn Route 118",
            "Encounter": "Fish Good",
            "Min": "10",
            "Max": "30",
            "Rate": "20"
        },
        {
            "Dex": "72",
            "LocationName": "Hoenn Route 118",
            "Encounter": "Fish Old",
            "Min": "5",
            "Max": "10",
            "Rate": "30"
        },
        {
            "Dex": "72",
            "LocationName": "Hoenn Route 118",
            "Encounter": "Surf",
            "Min": "5",
            "Max": "35",
            "Rate": "60"
        },
        {
            "Dex": "72",
            "LocationName": "Hoenn Route 119",
            "Encounter": "Fish Good",
            "Min": "10",
            "Max": "30",
            "Rate": "20"
        },
        {
            "Dex": "72",
            "LocationName": "Hoenn Route 119",
            "Encounter": "Fish Old",
            "Min": "5",
            "Max": "10",
            "Rate": "30"
        },
        {
            "Dex": "72",
            "LocationName": "Hoenn Route 119",
            "Encounter": "Surf",
            "Min": "5",
            "Max": "35",
            "Rate": "60"
        },
        {
            "Dex": "72",
            "LocationName": "Hoenn Route 121",
            "Encounter": "Fish Good",
            "Min": "10",
            "Max": "30",
            "Rate": "20"
        },
        {
            "Dex": "72",
            "LocationName": "Hoenn Route 121",
            "Encounter": "Fish Old",
            "Min": "5",
            "Max": "10",
            "Rate": "30"
        },
        {
            "Dex": "72",
            "LocationName": "Hoenn Route 121",
            "Encounter": "Surf",
            "Min": "5",
            "Max": "35",
            "Rate": "60"
        },
        {
            "Dex": "72",
            "LocationName": "Hoenn Route 122",
            "Encounter": "Fish Good",
            "Min": "10",
            "Max": "30",
            "Rate": "20"
        },
        {
            "Dex": "72",
            "LocationName": "Hoenn Route 122",
            "Encounter": "Fish Old",
            "Min": "5",
            "Max": "10",
            "Rate": "30"
        },
        {
            "Dex": "72",
            "LocationName": "Hoenn Route 122",
            "Encounter": "Surf",
            "Min": "5",
            "Max": "35",
            "Rate": "60"
        },
        {
            "Dex": "72",
            "LocationName": "Hoenn Route 123",
            "Encounter": "Fish Good",
            "Min": "10",
            "Max": "30",
            "Rate": "20"
        },
        {
            "Dex": "72",
            "LocationName": "Hoenn Route 123",
            "Encounter": "Fish Old",
            "Min": "5",
            "Max": "10",
            "Rate": "30"
        },
        {
            "Dex": "72",
            "LocationName": "Hoenn Route 123",
            "Encounter": "Surf",
            "Min": "5",
            "Max": "35",
            "Rate": "60"
        },
        {
            "Dex": "72",
            "LocationName": "Hoenn Route 124",
            "Encounter": "Fish Good",
            "Min": "10",
            "Max": "30",
            "Rate": "20"
        },
        {
            "Dex": "72",
            "LocationName": "Hoenn Route 124",
            "Encounter": "Fish Old",
            "Min": "5",
            "Max": "10",
            "Rate": "30"
        },
        {
            "Dex": "72",
            "LocationName": "Hoenn Route 124",
            "Encounter": "Surf",
            "Min": "5",
            "Max": "35",
            "Rate": "60"
        },
        {
            "Dex": "72",
            "LocationName": "Hoenn Route 125",
            "Encounter": "Fish Good",
            "Min": "10",
            "Max": "30",
            "Rate": "20"
        },
        {
            "Dex": "72",
            "LocationName": "Hoenn Route 125",
            "Encounter": "Fish Old",
            "Min": "5",
            "Max": "10",
            "Rate": "30"
        },
        {
            "Dex": "72",
            "LocationName": "Hoenn Route 125",
            "Encounter": "Surf",
            "Min": "5",
            "Max": "35",
            "Rate": "60"
        },
        {
            "Dex": "72",
            "LocationName": "Hoenn Route 126",
            "Encounter": "Fish Good",
            "Min": "10",
            "Max": "30",
            "Rate": "20"
        },
        {
            "Dex": "72",
            "LocationName": "Hoenn Route 126",
            "Encounter": "Fish Old",
            "Min": "5",
            "Max": "10",
            "Rate": "30"
        },
        {
            "Dex": "72",
            "LocationName": "Hoenn Route 126",
            "Encounter": "Surf",
            "Min": "5",
            "Max": "35",
            "Rate": "60"
        },
        {
            "Dex": "72",
            "LocationName": "Hoenn Route 127",
            "Encounter": "Fish Good",
            "Min": "10",
            "Max": "30",
            "Rate": "20"
        },
        {
            "Dex": "72",
            "LocationName": "Hoenn Route 127",
            "Encounter": "Fish Old",
            "Min": "5",
            "Max": "10",
            "Rate": "30"
        },
        {
            "Dex": "72",
            "LocationName": "Hoenn Route 127",
            "Encounter": "Surf",
            "Min": "5",
            "Max": "35",
            "Rate": "60"
        },
        {
            "Dex": "72",
            "LocationName": "Hoenn Route 128",
            "Encounter": "Fish Old",
            "Min": "5",
            "Max": "10",
            "Rate": "30"
        },
        {
            "Dex": "72",
            "LocationName": "Hoenn Route 128",
            "Encounter": "Surf",
            "Min": "5",
            "Max": "35",
            "Rate": "60"
        },
        {
            "Dex": "72",
            "LocationName": "Hoenn Route 129",
            "Encounter": "Fish Good",
            "Min": "10",
            "Max": "30",
            "Rate": "20"
        },
        {
            "Dex": "72",
            "LocationName": "Hoenn Route 129",
            "Encounter": "Fish Old",
            "Min": "5",
            "Max": "10",
            "Rate": "30"
        },
        {
            "Dex": "72",
            "LocationName": "Hoenn Route 129",
            "Encounter": "Surf",
            "Min": "5",
            "Max": "35",
            "Rate": "60"
        },
        {
            "Dex": "72",
            "LocationName": "Hoenn Route 130",
            "Encounter": "Fish Good",
            "Min": "10",
            "Max": "30",
            "Rate": "20"
        },
        {
            "Dex": "72",
            "LocationName": "Hoenn Route 130",
            "Encounter": "Fish Old",
            "Min": "5",
            "Max": "10",
            "Rate": "30"
        },
        {
            "Dex": "72",
            "LocationName": "Hoenn Route 130",
            "Encounter": "Surf",
            "Min": "5",
            "Max": "35",
            "Rate": "60"
        },
        {
            "Dex": "72",
            "LocationName": "Hoenn Route 131",
            "Encounter": "Fish Good",
            "Min": "10",
            "Max": "30",
            "Rate": "20"
        },
        {
            "Dex": "72",
            "LocationName": "Hoenn Route 131",
            "Encounter": "Fish Old",
            "Min": "5",
            "Max": "10",
            "Rate": "30"
        },
        {
            "Dex": "72",
            "LocationName": "Hoenn Route 131",
            "Encounter": "Surf",
            "Min": "5",
            "Max": "35",
            "Rate": "60"
        },
        {
            "Dex": "72",
            "LocationName": "Hoenn Route 132",
            "Encounter": "Fish Good",
            "Min": "10",
            "Max": "30",
            "Rate": "20"
        },
        {
            "Dex": "72",
            "LocationName": "Hoenn Route 132",
            "Encounter": "Fish Old",
            "Min": "5",
            "Max": "10",
            "Rate": "30"
        },
        {
            "Dex": "72",
            "LocationName": "Hoenn Route 132",
            "Encounter": "Surf",
            "Min": "5",
            "Max": "35",
            "Rate": "60"
        },
        {
            "Dex": "72",
            "LocationName": "Hoenn Route 133",
            "Encounter": "Fish Good",
            "Min": "10",
            "Max": "30",
            "Rate": "20"
        },
        {
            "Dex": "72",
            "LocationName": "Hoenn Route 133",
            "Encounter": "Fish Old",
            "Min": "5",
            "Max": "10",
            "Rate": "30"
        },
        {
            "Dex": "72",
            "LocationName": "Hoenn Route 133",
            "Encounter": "Surf",
            "Min": "5",
            "Max": "35",
            "Rate": "60"
        },
        {
            "Dex": "72",
            "LocationName": "Hoenn Route 134",
            "Encounter": "Fish Good",
            "Min": "10",
            "Max": "30",
            "Rate": "20"
        },
        {
            "Dex": "72",
            "LocationName": "Hoenn Route 134",
            "Encounter": "Fish Old",
            "Min": "5",
            "Max": "10",
            "Rate": "30"
        },
        {
            "Dex": "72",
            "LocationName": "Hoenn Route 134",
            "Encounter": "Surf",
            "Min": "5",
            "Max": "35",
            "Rate": "60"
        },
        {
            "Dex": "72",
            "LocationName": "Lilycove City",
            "Encounter": "Fish Good",
            "Min": "10",
            "Max": "30",
            "Rate": "20"
        },
        {
            "Dex": "72",
            "LocationName": "Lilycove City",
            "Encounter": "Fish Old",
            "Min": "5",
            "Max": "10",
            "Rate": "30"
        },
        {
            "Dex": "72",
            "LocationName": "Lilycove City",
            "Encounter": "Surf",
            "Min": "5",
            "Max": "35",
            "Rate": "60"
        },
        {
            "Dex": "72",
            "LocationName": "Mossdeep City",
            "Encounter": "Fish Good",
            "Min": "10",
            "Max": "30",
            "Rate": "20"
        },
        {
            "Dex": "72",
            "LocationName": "Mossdeep City",
            "Encounter": "Fish Old",
            "Min": "5",
            "Max": "10",
            "Rate": "30"
        },
        {
            "Dex": "72",
            "LocationName": "Mossdeep City",
            "Encounter": "Surf",
            "Min": "5",
            "Max": "35",
            "Rate": "60"
        },
        {
            "Dex": "72",
            "LocationName": "Pacifidlog Town",
            "Encounter": "Fish Good",
            "Min": "10",
            "Max": "30",
            "Rate": "20"
        },
        {
            "Dex": "72",
            "LocationName": "Pacifidlog Town",
            "Encounter": "Fish Old",
            "Min": "5",
            "Max": "10",
            "Rate": "30"
        },
        {
            "Dex": "72",
            "LocationName": "Pacifidlog Town",
            "Encounter": "Surf",
            "Min": "5",
            "Max": "35",
            "Rate": "60"
        },
        {
            "Dex": "72",
            "LocationName": "Seafloor Cavern",
            "Encounter": "Fish Good",
            "Min": "10",
            "Max": "30",
            "Rate": "20"
        },
        {
            "Dex": "72",
            "LocationName": "Seafloor Cavern",
            "Encounter": "Fish Old",
            "Min": "5",
            "Max": "10",
            "Rate": "30"
        },
        {
            "Dex": "72",
            "LocationName": "Seafloor Cavern",
            "Encounter": "Surf",
            "Min": "5",
            "Max": "35",
            "Rate": "60"
        },
        {
            "Dex": "72",
            "LocationName": "Shoal Cave",
            "Encounter": "Fish Good",
            "Min": "10",
            "Max": "30",
            "Rate": "20"
        },
        {
            "Dex": "72",
            "LocationName": "Shoal Cave",
            "Encounter": "Fish Old",
            "Min": "5",
            "Max": "10",
            "Rate": "30"
        },
        {
            "Dex": "72",
            "LocationName": "Shoal Cave",
            "Encounter": "Surf",
            "Min": "5",
            "Max": "35",
            "Rate": "60"
        },
        {
            "Dex": "72",
            "LocationName": "Slateport City",
            "Encounter": "Fish Good",
            "Min": "10",
            "Max": "30",
            "Rate": "20"
        },
        {
            "Dex": "72",
            "LocationName": "Slateport City",
            "Encounter": "Fish Old",
            "Min": "5",
            "Max": "10",
            "Rate": "30"
        },
        {
            "Dex": "72",
            "LocationName": "Slateport City",
            "Encounter": "Surf",
            "Min": "5",
            "Max": "35",
            "Rate": "60"
        },
        {
            "Dex": "72",
            "LocationName": "Sootopolis City",
            "Encounter": "Fish Old",
            "Min": "5",
            "Max": "10",
            "Rate": "30"
        },
        {
            "Dex": "73",
            "LocationName": "Abandoned Ship",
            "Encounter": "Fish Super",
            "Min": "20",
            "Max": "35",
            "Rate": "20"
        },
        {
            "Dex": "73",
            "LocationName": "Abandoned Ship",
            "Encounter": "Surf",
            "Min": "30",
            "Max": "35",
            "Rate": "1"
        },
        {
            "Dex": "74",
            "LocationName": "Granite Cave",
            "Encounter": "Cave",
            "Min": "6",
            "Max": "9",
            "Rate": "10"
        },
        {
            "Dex": "74",
            "LocationName": "Granite Cave",
            "Encounter": "Rock Smash",
            "Min": "5",
            "Max": "20",
            "Rate": "70"
        },
        {
            "Dex": "74",
            "LocationName": "Hoenn Route 111",
            "Encounter": "Rock Smash",
            "Min": "5",
            "Max": "20",
            "Rate": "100"
        },
        {
            "Dex": "74",
            "LocationName": "Hoenn Route 114",
            "Encounter": "Rock Smash",
            "Min": "5",
            "Max": "20",
            "Rate": "100"
        },
        {
            "Dex": "74",
            "LocationName": "Magma Hideout",
            "Encounter": "Cave",
            "Min": "27",
            "Max": "30",
            "Rate": "55"
        },
        {
            "Dex": "74",
            "LocationName": "Safari Zone",
            "Encounter": "Rock Smash",
            "Min": "5",
            "Max": "30",
            "Rate": "100"
        },
        {
            "Dex": "74",
            "LocationName": "Victory Road (Hoenn)",
            "Encounter": "Rock Smash",
            "Min": "30",
            "Max": "40",
            "Rate": "30"
        },
        {
            "Dex": "75",
            "LocationName": "Magma Hideout",
            "Encounter": "Cave",
            "Min": "30",
            "Max": "33",
            "Rate": "15"
        },
        {
            "Dex": "75",
            "LocationName": "Victory Road (Hoenn)",
            "Encounter": "Rock Smash",
            "Min": "30",
            "Max": "40",
            "Rate": "70"
        },
        {
            "Dex": "81",
            "LocationName": "New Mauville",
            "Encounter": "Basement",
            "Min": "22",
            "Max": "26",
            "Rate": "49"
        },
        {
            "Dex": "81",
            "LocationName": "New Mauville",
            "Encounter": "Entrance",
            "Min": "22",
            "Max": "26",
            "Rate": "50"
        },
        {
            "Dex": "82",
            "LocationName": "New Mauville",
            "Encounter": "Basement",
            "Min": "26",
            "Max": "26",
            "Rate": "1"
        },
        {
            "Dex": "84",
            "LocationName": "Safari Zone",
            "Encounter": "Grass",
            "Min": "25",
            "Max": "25",
            "Rate": "10"
        },
        {
            "Dex": "85",
            "LocationName": "Safari Zone",
            "Encounter": "Grass",
            "Min": "29",
            "Max": "31",
            "Rate": "5"
        },
        {
            "Dex": "88",
            "LocationName": "Fiery Path",
            "Encounter": "Cave",
            "Min": "14",
            "Max": "14",
            "Rate": "2"
        }
        ],

        //dunno if used?? - just use type?
        selectHasTypes:{},
        hastypes: [
        {
            "Dex": "1",
            "TypeName": "Grass"
        },
        {
            "Dex": "1",
            "TypeName": "Poison"
        },
        {
            "Dex": "2",
            "TypeName": "Grass"
        },
        {
            "Dex": "2",
            "TypeName": "Poison"
        },
        {
            "Dex": "3",
            "TypeName": "Grass"
        },
        {
            "Dex": "3",
            "TypeName": "Poison"
        },
        {
            "Dex": "4",
            "TypeName": "Fire"
        },
        {
            "Dex": "5",
            "TypeName": "Fire"
        },
        {
            "Dex": "6",
            "TypeName": "Fire"
        },
        {
            "Dex": "6",
            "TypeName": "Flying"
        },
        {
            "Dex": "7",
            "TypeName": "Water"
        },
        {
            "Dex": "8",
            "TypeName": "Water"
        },
        {
            "Dex": "9",
            "TypeName": "Water"
        },
        {
            "Dex": "10",
            "TypeName": "Bug"
        },
        {
            "Dex": "11",
            "TypeName": "Bug"
        },
        {
            "Dex": "12",
            "TypeName": "Bug"
        },
        {
            "Dex": "12",
            "TypeName": "Flying"
        },
        {
            "Dex": "13",
            "TypeName": "Bug"
        },
        {
            "Dex": "13",
            "TypeName": "Poison"
        },
        {
            "Dex": "14",
            "TypeName": "Bug"
        },
        {
            "Dex": "14",
            "TypeName": "Poison"
        },
        {
            "Dex": "15",
            "TypeName": "Bug"
        },
        {
            "Dex": "15",
            "TypeName": "Poison"
        },
        {
            "Dex": "16",
            "TypeName": "Flying"
        },
        {
            "Dex": "16",
            "TypeName": "Normal"
        },
        {
            "Dex": "17",
            "TypeName": "Flying"
        },
        {
            "Dex": "17",
            "TypeName": "Normal"
        },
        {
            "Dex": "18",
            "TypeName": "Flying"
        },
        {
            "Dex": "18",
            "TypeName": "Normal"
        },
        {
            "Dex": "19",
            "TypeName": "Normal"
        },
        {
            "Dex": "20",
            "TypeName": "Normal"
        },
        {
            "Dex": "21",
            "TypeName": "Flying"
        },
        {
            "Dex": "21",
            "TypeName": "Normal"
        },
        {
            "Dex": "22",
            "TypeName": "Flying"
        },
        {
            "Dex": "22",
            "TypeName": "Normal"
        },
        {
            "Dex": "23",
            "TypeName": "Poison"
        },
        {
            "Dex": "24",
            "TypeName": "Poison"
        },
        {
            "Dex": "25",
            "TypeName": "Electric"
        },
        {
            "Dex": "26",
            "TypeName": "Electric"
        },
        {
            "Dex": "27",
            "TypeName": "Ground"
        },
        {
            "Dex": "28",
            "TypeName": "Ground"
        },
        {
            "Dex": "29",
            "TypeName": "Poison"
        },
        {
            "Dex": "30",
            "TypeName": "Poison"
        },
        {
            "Dex": "31",
            "TypeName": "Ground"
        },
        {
            "Dex": "31",
            "TypeName": "Poison"
        },
        {
            "Dex": "32",
            "TypeName": "Poison"
        },
        {
            "Dex": "33",
            "TypeName": "Poison"
        },
        {
            "Dex": "34",
            "TypeName": "Ground"
        },
        {
            "Dex": "34",
            "TypeName": "Poison"
        },
        {
            "Dex": "35",
            "TypeName": "Normal"
        },
        {
            "Dex": "36",
            "TypeName": "Normal"
        },
        {
            "Dex": "37",
            "TypeName": "Fire"
        },
        {
            "Dex": "38",
            "TypeName": "Fire"
        },
        {
            "Dex": "39",
            "TypeName": "Normal"
        },
        {
            "Dex": "40",
            "TypeName": "Normal"
        },
        {
            "Dex": "41",
            "TypeName": "Flying"
        },
        {
            "Dex": "41",
            "TypeName": "Poison"
        },
        {
            "Dex": "42",
            "TypeName": "Flying"
        },
        {
            "Dex": "42",
            "TypeName": "Poison"
        },
        {
            "Dex": "43",
            "TypeName": "Grass"
        },
        {
            "Dex": "43",
            "TypeName": "Poison"
        },
        {
            "Dex": "44",
            "TypeName": "Grass"
        },
        {
            "Dex": "44",
            "TypeName": "Poison"
        },
        {
            "Dex": "45",
            "TypeName": "Grass"
        },
        {
            "Dex": "45",
            "TypeName": "Poison"
        },
        {
            "Dex": "46",
            "TypeName": "Bug"
        },
        {
            "Dex": "46",
            "TypeName": "Grass"
        },
        {
            "Dex": "47",
            "TypeName": "Bug"
        },
        {
            "Dex": "47",
            "TypeName": "Grass"
        },
        {
            "Dex": "48",
            "TypeName": "Bug"
        },
        {
            "Dex": "48",
            "TypeName": "Poison"
        },
        {
            "Dex": "49",
            "TypeName": "Bug"
        },
        {
            "Dex": "49",
            "TypeName": "Poison"
        },
        {
            "Dex": "50",
            "TypeName": "Ground"
        },
        {
            "Dex": "51",
            "TypeName": "Ground"
        },
        {
            "Dex": "52",
            "TypeName": "Normal"
        },
        {
            "Dex": "53",
            "TypeName": "Normal"
        },
        {
            "Dex": "54",
            "TypeName": "Water"
        },
        {
            "Dex": "55",
            "TypeName": "Water"
        },
        {
            "Dex": "56",
            "TypeName": "Fighting"
        },
        {
            "Dex": "57",
            "TypeName": "Fighting"
        },
        {
            "Dex": "58",
            "TypeName": "Fire"
        },
        {
            "Dex": "59",
            "TypeName": "Fire"
        },
        {
            "Dex": "60",
            "TypeName": "Water"
        },
        {
            "Dex": "61",
            "TypeName": "Water"
        },
        {
            "Dex": "62",
            "TypeName": "Fighting"
        },
        {
            "Dex": "62",
            "TypeName": "Water"
        },
        {
            "Dex": "63",
            "TypeName": "Psychic"
        },
        {
            "Dex": "64",
            "TypeName": "Psychic"
        },
        {
            "Dex": "65",
            "TypeName": "Psychic"
        },
        {
            "Dex": "66",
            "TypeName": "Fighting"
        },
        {
            "Dex": "67",
            "TypeName": "Fighting"
        },
        {
            "Dex": "68",
            "TypeName": "Fighting"
        },
        {
            "Dex": "69",
            "TypeName": "Grass"
        },
        {
            "Dex": "69",
            "TypeName": "Poison"
        },
        {
            "Dex": "70",
            "TypeName": "Grass"
        },
        {
            "Dex": "70",
            "TypeName": "Poison"
        },
        {
            "Dex": "71",
            "TypeName": "Grass"
        },
        {
            "Dex": "71",
            "TypeName": "Poison"
        },
        {
            "Dex": "72",
            "TypeName": "Poison"
        },
        {
            "Dex": "72",
            "TypeName": "Water"
        },
        {
            "Dex": "73",
            "TypeName": "Poison"
        },
        {
            "Dex": "73",
            "TypeName": "Water"
        },
        {
            "Dex": "74",
            "TypeName": "Ground"
        },
        {
            "Dex": "74",
            "TypeName": "Rock"
        },
        {
            "Dex": "75",
            "TypeName": "Ground"
        },
        {
            "Dex": "75",
            "TypeName": "Rock"
        },
        {
            "Dex": "76",
            "TypeName": "Ground"
        },
        {
            "Dex": "76",
            "TypeName": "Rock"
        },
        {
            "Dex": "77",
            "TypeName": "Fire"
        },
        {
            "Dex": "78",
            "TypeName": "Fire"
        },
        {
            "Dex": "79",
            "TypeName": "Psychic"
        },
        {
            "Dex": "79",
            "TypeName": "Water"
        },
        {
            "Dex": "80",
            "TypeName": "Psychic"
        },
        {
            "Dex": "80",
            "TypeName": "Water"
        },
        {
            "Dex": "81",
            "TypeName": "Electric"
        },
        {
            "Dex": "81",
            "TypeName": "Steel"
        },
        {
            "Dex": "82",
            "TypeName": "Electric"
        },
        {
            "Dex": "82",
            "TypeName": "Steel"
        },
        {
            "Dex": "83",
            "TypeName": "Flying"
        },
        {
            "Dex": "83",
            "TypeName": "Normal"
        },
        {
            "Dex": "84",
            "TypeName": "Flying"
        },
        {
            "Dex": "84",
            "TypeName": "Normal"
        },
        {
            "Dex": "85",
            "TypeName": "Flying"
        },
        {
            "Dex": "85",
            "TypeName": "Normal"
        },
        {
            "Dex": "86",
            "TypeName": "Water"
        },
        {
            "Dex": "87",
            "TypeName": "Ice"
        },
        {
            "Dex": "87",
            "TypeName": "Water"
        },
        {
            "Dex": "88",
            "TypeName": "Poison"
        },
        {
            "Dex": "89",
            "TypeName": "Poison"
        },
        {
            "Dex": "90",
            "TypeName": "Water"
        },
        {
            "Dex": "91",
            "TypeName": "Ice"
        },
        {
            "Dex": "91",
            "TypeName": "Water"
        },
        {
            "Dex": "92",
            "TypeName": "Ghost"
        },
        {
            "Dex": "92",
            "TypeName": "Poison"
        },
        {
            "Dex": "93",
            "TypeName": "Ghost"
        },
        {
            "Dex": "93",
            "TypeName": "Poison"
        },
        {
            "Dex": "94",
            "TypeName": "Ghost"
        },
        {
            "Dex": "94",
            "TypeName": "Poison"
        },
        {
            "Dex": "95",
            "TypeName": "Ground"
        },
        {
            "Dex": "95",
            "TypeName": "Rock"
        },
        {
            "Dex": "96",
            "TypeName": "Psychic"
        },
        {
            "Dex": "97",
            "TypeName": "Psychic"
        },
        {
            "Dex": "98",
            "TypeName": "Water"
        },
        {
            "Dex": "99",
            "TypeName": "Water"
        },
        {
            "Dex": "100",
            "TypeName": "Electric"
        },
        {
            "Dex": "101",
            "TypeName": "Electric"
        },
        {
            "Dex": "102",
            "TypeName": "Grass"
        },
        {
            "Dex": "102",
            "TypeName": "Psychic"
        },
        {
            "Dex": "103",
            "TypeName": "Grass"
        },
        {
            "Dex": "103",
            "TypeName": "Psychic"
        },
        {
            "Dex": "104",
            "TypeName": "Ground"
        },
        {
            "Dex": "105",
            "TypeName": "Ground"
        },
        {
            "Dex": "106",
            "TypeName": "Fighting"
        },
        {
            "Dex": "107",
            "TypeName": "Fighting"
        },
        {
            "Dex": "108",
            "TypeName": "Normal"
        },
        {
            "Dex": "109",
            "TypeName": "Poison"
        },
        {
            "Dex": "110",
            "TypeName": "Poison"
        },
        {
            "Dex": "111",
            "TypeName": "Ground"
        },
        {
            "Dex": "111",
            "TypeName": "Rock"
        },
        {
            "Dex": "112",
            "TypeName": "Ground"
        },
        {
            "Dex": "112",
            "TypeName": "Rock"
        },
        {
            "Dex": "113",
            "TypeName": "Normal"
        },
        {
            "Dex": "114",
            "TypeName": "Grass"
        },
        {
            "Dex": "115",
            "TypeName": "Normal"
        },
        {
            "Dex": "116",
            "TypeName": "Water"
        },
        {
            "Dex": "117",
            "TypeName": "Water"
        },
        {
            "Dex": "118",
            "TypeName": "Water"
        },
        {
            "Dex": "119",
            "TypeName": "Water"
        },
        {
            "Dex": "120",
            "TypeName": "Water"
        },
        {
            "Dex": "121",
            "TypeName": "Psychic"
        },
        {
            "Dex": "121",
            "TypeName": "Water"
        },
        {
            "Dex": "122",
            "TypeName": "Psychic"
        },
        {
            "Dex": "123",
            "TypeName": "Bug"
        },
        {
            "Dex": "123",
            "TypeName": "Flying"
        },
        {
            "Dex": "124",
            "TypeName": "Ice"
        },
        {
            "Dex": "124",
            "TypeName": "Psychic"
        },
        {
            "Dex": "125",
            "TypeName": "Electric"
        },
        {
            "Dex": "126",
            "TypeName": "Fire"
        },
        {
            "Dex": "127",
            "TypeName": "Bug"
        },
        {
            "Dex": "128",
            "TypeName": "Normal"
        },
        {
            "Dex": "129",
            "TypeName": "Water"
        },
        {
            "Dex": "130",
            "TypeName": "Flying"
        },
        {
            "Dex": "130",
            "TypeName": "Water"
        },
        {
            "Dex": "131",
            "TypeName": "Ice"
        },
        {
            "Dex": "131",
            "TypeName": "Water"
        },
        {
            "Dex": "132",
            "TypeName": "Normal"
        },
        {
            "Dex": "133",
            "TypeName": "Normal"
        },
        {
            "Dex": "134",
            "TypeName": "Water"
        },
        {
            "Dex": "135",
            "TypeName": "Electric"
        },
        {
            "Dex": "136",
            "TypeName": "Fire"
        },
        {
            "Dex": "137",
            "TypeName": "Normal"
        },
        {
            "Dex": "138",
            "TypeName": "Rock"
        },
        {
            "Dex": "138",
            "TypeName": "Water"
        },
        {
            "Dex": "139",
            "TypeName": "Rock"
        },
        {
            "Dex": "139",
            "TypeName": "Water"
        },
        {
            "Dex": "140",
            "TypeName": "Rock"
        },
        {
            "Dex": "140",
            "TypeName": "Water"
        },
        {
            "Dex": "141",
            "TypeName": "Rock"
        },
        {
            "Dex": "141",
            "TypeName": "Water"
        },
        {
            "Dex": "142",
            "TypeName": "Flying"
        },
        {
            "Dex": "142",
            "TypeName": "Rock"
        },
        {
            "Dex": "143",
            "TypeName": "Normal"
        },
        {
            "Dex": "144",
            "TypeName": "Flying"
        },
        {
            "Dex": "144",
            "TypeName": "Ice"
        },
        {
            "Dex": "145",
            "TypeName": "Electric"
        },
        {
            "Dex": "145",
            "TypeName": "Flying"
        },
        {
            "Dex": "146",
            "TypeName": "Fire"
        },
        {
            "Dex": "146",
            "TypeName": "Flying"
        },
        {
            "Dex": "147",
            "TypeName": "Dragon"
        },
        {
            "Dex": "148",
            "TypeName": "Dragon"
        },
        {
            "Dex": "149",
            "TypeName": "Dragon"
        },
        {
            "Dex": "149",
            "TypeName": "Flying"
        },
        {
            "Dex": "150",
            "TypeName": "Psychic"
        },
        {
            "Dex": "151",
            "TypeName": "Psychic"
        },
        {
            "Dex": "152",
            "TypeName": "Grass"
        },
        {
            "Dex": "153",
            "TypeName": "Grass"
        },
        {
            "Dex": "154",
            "TypeName": "Grass"
        },
        {
            "Dex": "155",
            "TypeName": "Fire"
        },
        {
            "Dex": "156",
            "TypeName": "Fire"
        },
        {
            "Dex": "157",
            "TypeName": "Fire"
        },
        {
            "Dex": "158",
            "TypeName": "Water"
        },
        {
            "Dex": "159",
            "TypeName": "Water"
        },
        {
            "Dex": "160",
            "TypeName": "Water"
        },
        {
            "Dex": "161",
            "TypeName": "Normal"
        },
        {
            "Dex": "162",
            "TypeName": "Normal"
        },
        {
            "Dex": "163",
            "TypeName": "Flying"
        },
        {
            "Dex": "163",
            "TypeName": "Normal"
        },
        {
            "Dex": "164",
            "TypeName": "Flying"
        },
        {
            "Dex": "164",
            "TypeName": "Normal"
        },
        {
            "Dex": "165",
            "TypeName": "Bug"
        },
        {
            "Dex": "165",
            "TypeName": "Flying"
        },
        {
            "Dex": "166",
            "TypeName": "Bug"
        },
        {
            "Dex": "166",
            "TypeName": "Flying"
        },
        {
            "Dex": "167",
            "TypeName": "Bug"
        },
        {
            "Dex": "167",
            "TypeName": "Poison"
        },
        {
            "Dex": "168",
            "TypeName": "Bug"
        },
        {
            "Dex": "168",
            "TypeName": "Poison"
        },
        {
            "Dex": "169",
            "TypeName": "Flying"
        },
        {
            "Dex": "169",
            "TypeName": "Poison"
        },
        {
            "Dex": "170",
            "TypeName": "Electric"
        },
        {
            "Dex": "170",
            "TypeName": "Water"
        },
        {
            "Dex": "171",
            "TypeName": "Electric"
        },
        {
            "Dex": "171",
            "TypeName": "Water"
        },
        {
            "Dex": "172",
            "TypeName": "Electric"
        },
        {
            "Dex": "173",
            "TypeName": "Normal"
        },
        {
            "Dex": "174",
            "TypeName": "Normal"
        },
        {
            "Dex": "175",
            "TypeName": "Normal"
        },
        {
            "Dex": "176",
            "TypeName": "Flying"
        },
        {
            "Dex": "176",
            "TypeName": "Normal"
        },
        {
            "Dex": "177",
            "TypeName": "Flying"
        },
        {
            "Dex": "177",
            "TypeName": "Psychic"
        },
        {
            "Dex": "178",
            "TypeName": "Flying"
        },
        {
            "Dex": "178",
            "TypeName": "Psychic"
        },
        {
            "Dex": "179",
            "TypeName": "Electric"
        },
        {
            "Dex": "180",
            "TypeName": "Electric"
        },
        {
            "Dex": "181",
            "TypeName": "Electric"
        },
        {
            "Dex": "182",
            "TypeName": "Grass"
        },
        {
            "Dex": "183",
            "TypeName": "Water"
        },
        {
            "Dex": "184",
            "TypeName": "Water"
        },
        {
            "Dex": "185",
            "TypeName": "Rock"
        },
        {
            "Dex": "186",
            "TypeName": "Water"
        },
        {
            "Dex": "187",
            "TypeName": "Flying"
        },
        {
            "Dex": "187",
            "TypeName": "Grass"
        },
        {
            "Dex": "188",
            "TypeName": "Flying"
        },
        {
            "Dex": "188",
            "TypeName": "Grass"
        },
        {
            "Dex": "189",
            "TypeName": "Flying"
        },
        {
            "Dex": "189",
            "TypeName": "Grass"
        },
        {
            "Dex": "190",
            "TypeName": "Normal"
        },
        {
            "Dex": "191",
            "TypeName": "Grass"
        },
        {
            "Dex": "192",
            "TypeName": "Grass"
        },
        {
            "Dex": "193",
            "TypeName": "Bug"
        },
        {
            "Dex": "193",
            "TypeName": "Flying"
        },
        {
            "Dex": "194",
            "TypeName": "Ground"
        },
        {
            "Dex": "194",
            "TypeName": "Water"
        },
        {
            "Dex": "195",
            "TypeName": "Ground"
        },
        {
            "Dex": "195",
            "TypeName": "Water"
        },
        {
            "Dex": "196",
            "TypeName": "Psychic"
        },
        {
            "Dex": "197",
            "TypeName": "Dark"
        },
        {
            "Dex": "198",
            "TypeName": "Dark"
        },
        {
            "Dex": "198",
            "TypeName": "Flying"
        },
        {
            "Dex": "199",
            "TypeName": "Psychic"
        },
        {
            "Dex": "199",
            "TypeName": "Water"
        },
        {
            "Dex": "200",
            "TypeName": "Ghost"
        },
        {
            "Dex": "201",
            "TypeName": "Psychic"
        },
        {
            "Dex": "202",
            "TypeName": "Psychic"
        },
        {
            "Dex": "203",
            "TypeName": "Normal"
        },
        {
            "Dex": "203",
            "TypeName": "Psychic"
        },
        {
            "Dex": "204",
            "TypeName": "Bug"
        },
        {
            "Dex": "205",
            "TypeName": "Bug"
        },
        {
            "Dex": "205",
            "TypeName": "Steel"
        },
        {
            "Dex": "206",
            "TypeName": "Normal"
        },
        {
            "Dex": "207",
            "TypeName": "Flying"
        },
        {
            "Dex": "207",
            "TypeName": "Ground"
        },
        {
            "Dex": "208",
            "TypeName": "Ground"
        },
        {
            "Dex": "208",
            "TypeName": "Steel"
        },
        {
            "Dex": "209",
            "TypeName": "Normal"
        },
        {
            "Dex": "210",
            "TypeName": "Normal"
        },
        {
            "Dex": "211",
            "TypeName": "Poison"
        },
        {
            "Dex": "211",
            "TypeName": "Water"
        },
        {
            "Dex": "212",
            "TypeName": "Bug"
        },
        {
            "Dex": "212",
            "TypeName": "Steel"
        },
        {
            "Dex": "213",
            "TypeName": "Bug"
        },
        {
            "Dex": "213",
            "TypeName": "Rock"
        },
        {
            "Dex": "214",
            "TypeName": "Bug"
        },
        {
            "Dex": "214",
            "TypeName": "Fighting"
        },
        {
            "Dex": "215",
            "TypeName": "Dark"
        },
        {
            "Dex": "215",
            "TypeName": "Ice"
        },
        {
            "Dex": "216",
            "TypeName": "Normal"
        },
        {
            "Dex": "217",
            "TypeName": "Normal"
        },
        {
            "Dex": "218",
            "TypeName": "Fire"
        },
        {
            "Dex": "219",
            "TypeName": "Fire"
        },
        {
            "Dex": "219",
            "TypeName": "Rock"
        },
        {
            "Dex": "220",
            "TypeName": "Ground"
        },
        {
            "Dex": "220",
            "TypeName": "Ice"
        },
        {
            "Dex": "221",
            "TypeName": "Ground"
        },
        {
            "Dex": "221",
            "TypeName": "Ice"
        },
        {
            "Dex": "222",
            "TypeName": "Rock"
        },
        {
            "Dex": "222",
            "TypeName": "Water"
        },
        {
            "Dex": "223",
            "TypeName": "Water"
        },
        {
            "Dex": "224",
            "TypeName": "Water"
        },
        {
            "Dex": "225",
            "TypeName": "Flying"
        },
        {
            "Dex": "225",
            "TypeName": "Ice"
        },
        {
            "Dex": "226",
            "TypeName": "Flying"
        },
        {
            "Dex": "226",
            "TypeName": "Water"
        },
        {
            "Dex": "227",
            "TypeName": "Flying"
        },
        {
            "Dex": "227",
            "TypeName": "Steel"
        },
        {
            "Dex": "228",
            "TypeName": "Dark"
        },
        {
            "Dex": "228",
            "TypeName": "Fire"
        },
        {
            "Dex": "229",
            "TypeName": "Dark"
        },
        {
            "Dex": "229",
            "TypeName": "Fire"
        },
        {
            "Dex": "230",
            "TypeName": "Dragon"
        },
        {
            "Dex": "230",
            "TypeName": "Water"
        },
        {
            "Dex": "231",
            "TypeName": "Ground"
        },
        {
            "Dex": "232",
            "TypeName": "Ground"
        },
        {
            "Dex": "233",
            "TypeName": "Normal"
        },
        {
            "Dex": "234",
            "TypeName": "Normal"
        },
        {
            "Dex": "235",
            "TypeName": "Normal"
        },
        {
            "Dex": "236",
            "TypeName": "Fighting"
        },
        {
            "Dex": "237",
            "TypeName": "Fighting"
        },
        {
            "Dex": "238",
            "TypeName": "Ice"
        },
        {
            "Dex": "238",
            "TypeName": "Psychic"
        },
        {
            "Dex": "239",
            "TypeName": "Electric"
        },
        {
            "Dex": "240",
            "TypeName": "Fire"
        },
        {
            "Dex": "241",
            "TypeName": "Normal"
        },
        {
            "Dex": "242",
            "TypeName": "Normal"
        },
        {
            "Dex": "243",
            "TypeName": "Electric"
        },
        {
            "Dex": "244",
            "TypeName": "Fire"
        },
        {
            "Dex": "245",
            "TypeName": "Water"
        },
        {
            "Dex": "246",
            "TypeName": "Ground"
        },
        {
            "Dex": "246",
            "TypeName": "Rock"
        },
        {
            "Dex": "247",
            "TypeName": "Ground"
        },
        {
            "Dex": "247",
            "TypeName": "Rock"
        },
        {
            "Dex": "248",
            "TypeName": "Dark"
        },
        {
            "Dex": "248",
            "TypeName": "Rock"
        },
        {
            "Dex": "249",
            "TypeName": "Flying"
        },
        {
            "Dex": "249",
            "TypeName": "Psychic"
        },
        {
            "Dex": "250",
            "TypeName": "Fire"
        },
        {
            "Dex": "250",
            "TypeName": "Flying"
        },
        {
            "Dex": "251",
            "TypeName": "Grass"
        },
        {
            "Dex": "251",
            "TypeName": "Psychic"
        },
        {
            "Dex": "252",
            "TypeName": "Grass"
        },
        {
            "Dex": "253",
            "TypeName": "Grass"
        },
        {
            "Dex": "254",
            "TypeName": "Grass"
        },
        {
            "Dex": "255",
            "TypeName": "Fire"
        },
        {
            "Dex": "256",
            "TypeName": "Fighting"
        },
        {
            "Dex": "256",
            "TypeName": "Fire"
        },
        {
            "Dex": "257",
            "TypeName": "Fighting"
        },
        {
            "Dex": "257",
            "TypeName": "Fire"
        },
        {
            "Dex": "258",
            "TypeName": "Water"
        },
        {
            "Dex": "259",
            "TypeName": "Ground"
        },
        {
            "Dex": "259",
            "TypeName": "Water"
        },
        {
            "Dex": "260",
            "TypeName": "Ground"
        },
        {
            "Dex": "260",
            "TypeName": "Water"
        },
        {
            "Dex": "261",
            "TypeName": "Dark"
        },
        {
            "Dex": "262",
            "TypeName": "Dark"
        },
        {
            "Dex": "263",
            "TypeName": "Normal"
        },
        {
            "Dex": "264",
            "TypeName": "Normal"
        },
        {
            "Dex": "265",
            "TypeName": "Bug"
        },
        {
            "Dex": "266",
            "TypeName": "Bug"
        },
        {
            "Dex": "267",
            "TypeName": "Bug"
        },
        {
            "Dex": "267",
            "TypeName": "Flying"
        },
        {
            "Dex": "268",
            "TypeName": "Bug"
        },
        {
            "Dex": "269",
            "TypeName": "Bug"
        },
        {
            "Dex": "269",
            "TypeName": "Poison"
        },
        {
            "Dex": "270",
            "TypeName": "Grass"
        },
        {
            "Dex": "270",
            "TypeName": "Water"
        },
        {
            "Dex": "271",
            "TypeName": "Grass"
        },
        {
            "Dex": "271",
            "TypeName": "Water"
        },
        {
            "Dex": "272",
            "TypeName": "Grass"
        },
        {
            "Dex": "272",
            "TypeName": "Water"
        },
        {
            "Dex": "273",
            "TypeName": "Grass"
        },
        {
            "Dex": "274",
            "TypeName": "Dark"
        },
        {
            "Dex": "274",
            "TypeName": "Grass"
        },
        {
            "Dex": "275",
            "TypeName": "Dark"
        },
        {
            "Dex": "275",
            "TypeName": "Grass"
        },
        {
            "Dex": "276",
            "TypeName": "Flying"
        },
        {
            "Dex": "276",
            "TypeName": "Normal"
        },
        {
            "Dex": "277",
            "TypeName": "Flying"
        },
        {
            "Dex": "277",
            "TypeName": "Normal"
        },
        {
            "Dex": "278",
            "TypeName": "Flying"
        },
        {
            "Dex": "278",
            "TypeName": "Water"
        },
        {
            "Dex": "279",
            "TypeName": "Flying"
        },
        {
            "Dex": "279",
            "TypeName": "Water"
        },
        {
            "Dex": "280",
            "TypeName": "Psychic"
        },
        {
            "Dex": "281",
            "TypeName": "Psychic"
        },
        {
            "Dex": "282",
            "TypeName": "Psychic"
        },
        {
            "Dex": "283",
            "TypeName": "Bug"
        },
        {
            "Dex": "283",
            "TypeName": "Water"
        },
        {
            "Dex": "284",
            "TypeName": "Bug"
        },
        {
            "Dex": "284",
            "TypeName": "Flying"
        },
        {
            "Dex": "285",
            "TypeName": "Grass"
        },
        {
            "Dex": "286",
            "TypeName": "Fighting"
        },
        {
            "Dex": "286",
            "TypeName": "Grass"
        },
        {
            "Dex": "287",
            "TypeName": "Normal"
        },
        {
            "Dex": "288",
            "TypeName": "Normal"
        },
        {
            "Dex": "289",
            "TypeName": "Normal"
        },
        {
            "Dex": "290",
            "TypeName": "Bug"
        },
        {
            "Dex": "290",
            "TypeName": "Ground"
        },
        {
            "Dex": "291",
            "TypeName": "Bug"
        },
        {
            "Dex": "291",
            "TypeName": "Flying"
        },
        {
            "Dex": "292",
            "TypeName": "Bug"
        },
        {
            "Dex": "292",
            "TypeName": "Ghost"
        },
        {
            "Dex": "293",
            "TypeName": "Normal"
        },
        {
            "Dex": "294",
            "TypeName": "Normal"
        },
        {
            "Dex": "295",
            "TypeName": "Normal"
        },
        {
            "Dex": "296",
            "TypeName": "Fighting"
        },
        {
            "Dex": "297",
            "TypeName": "Fighting"
        },
        {
            "Dex": "298",
            "TypeName": "Normal"
        },
        {
            "Dex": "299",
            "TypeName": "Rock"
        },
        {
            "Dex": "300",
            "TypeName": "Normal"
        },
        {
            "Dex": "301",
            "TypeName": "Normal"
        },
        {
            "Dex": "302",
            "TypeName": "Dark"
        },
        {
            "Dex": "302",
            "TypeName": "Ghost"
        },
        {
            "Dex": "303",
            "TypeName": "Steel"
        },
        {
            "Dex": "304",
            "TypeName": "Rock"
        },
        {
            "Dex": "304",
            "TypeName": "Steel"
        },
        {
            "Dex": "305",
            "TypeName": "Rock"
        },
        {
            "Dex": "305",
            "TypeName": "Steel"
        },
        {
            "Dex": "306",
            "TypeName": "Rock"
        },
        {
            "Dex": "306",
            "TypeName": "Steel"
        },
        {
            "Dex": "307",
            "TypeName": "Fighting"
        },
        {
            "Dex": "307",
            "TypeName": "Psychic"
        },
        {
            "Dex": "308",
            "TypeName": "Fighting"
        },
        {
            "Dex": "308",
            "TypeName": "Psychic"
        },
        {
            "Dex": "309",
            "TypeName": "Electric"
        },
        {
            "Dex": "310",
            "TypeName": "Electric"
        },
        {
            "Dex": "311",
            "TypeName": "Electric"
        },
        {
            "Dex": "312",
            "TypeName": "Electric"
        },
        {
            "Dex": "313",
            "TypeName": "Bug"
        },
        {
            "Dex": "314",
            "TypeName": "Bug"
        },
        {
            "Dex": "315",
            "TypeName": "Grass"
        },
        {
            "Dex": "315",
            "TypeName": "Poison"
        },
        {
            "Dex": "316",
            "TypeName": "Poison"
        },
        {
            "Dex": "317",
            "TypeName": "Poison"
        },
        {
            "Dex": "318",
            "TypeName": "Dark"
        },
        {
            "Dex": "318",
            "TypeName": "Water"
        },
        {
            "Dex": "319",
            "TypeName": "Dark"
        },
        {
            "Dex": "319",
            "TypeName": "Water"
        },
        {
            "Dex": "320",
            "TypeName": "Water"
        },
        {
            "Dex": "321",
            "TypeName": "Water"
        },
        {
            "Dex": "322",
            "TypeName": "Fire"
        },
        {
            "Dex": "322",
            "TypeName": "Ground"
        },
        {
            "Dex": "323",
            "TypeName": "Fire"
        },
        {
            "Dex": "323",
            "TypeName": "Ground"
        },
        {
            "Dex": "324",
            "TypeName": "Fire"
        },
        {
            "Dex": "325",
            "TypeName": "Psychic"
        },
        {
            "Dex": "326",
            "TypeName": "Psychic"
        },
        {
            "Dex": "327",
            "TypeName": "Normal"
        },
        {
            "Dex": "328",
            "TypeName": "Ground"
        },
        {
            "Dex": "329",
            "TypeName": "Dragon"
        },
        {
            "Dex": "329",
            "TypeName": "Ground"
        },
        {
            "Dex": "330",
            "TypeName": "Dragon"
        },
        {
            "Dex": "330",
            "TypeName": "Ground"
        },
        {
            "Dex": "331",
            "TypeName": "Grass"
        },
        {
            "Dex": "332",
            "TypeName": "Dark"
        },
        {
            "Dex": "332",
            "TypeName": "Grass"
        },
        {
            "Dex": "333",
            "TypeName": "Flying"
        },
        {
            "Dex": "333",
            "TypeName": "Normal"
        },
        {
            "Dex": "334",
            "TypeName": "Dragon"
        },
        {
            "Dex": "334",
            "TypeName": "Flying"
        },
        {
            "Dex": "335",
            "TypeName": "Normal"
        },
        {
            "Dex": "336",
            "TypeName": "Poison"
        },
        {
            "Dex": "337",
            "TypeName": "Psychic"
        },
        {
            "Dex": "337",
            "TypeName": "Rock"
        },
        {
            "Dex": "338",
            "TypeName": "Psychic"
        },
        {
            "Dex": "338",
            "TypeName": "Rock"
        },
        {
            "Dex": "339",
            "TypeName": "Ground"
        },
        {
            "Dex": "339",
            "TypeName": "Water"
        },
        {
            "Dex": "340",
            "TypeName": "Ground"
        },
        {
            "Dex": "340",
            "TypeName": "Water"
        },
        {
            "Dex": "341",
            "TypeName": "Water"
        },
        {
            "Dex": "342",
            "TypeName": "Dark"
        },
        {
            "Dex": "342",
            "TypeName": "Water"
        },
        {
            "Dex": "343",
            "TypeName": "Ground"
        },
        {
            "Dex": "343",
            "TypeName": "Psychic"
        },
        {
            "Dex": "344",
            "TypeName": "Ground"
        },
        {
            "Dex": "344",
            "TypeName": "Psychic"
        },
        {
            "Dex": "345",
            "TypeName": "Grass"
        },
        {
            "Dex": "345",
            "TypeName": "Rock"
        },
        {
            "Dex": "346",
            "TypeName": "Grass"
        },
        {
            "Dex": "346",
            "TypeName": "Rock"
        },
        {
            "Dex": "347",
            "TypeName": "Bug"
        },
        {
            "Dex": "347",
            "TypeName": "Rock"
        },
        {
            "Dex": "348",
            "TypeName": "Bug"
        },
        {
            "Dex": "348",
            "TypeName": "Rock"
        },
        {
            "Dex": "349",
            "TypeName": "Water"
        },
        {
            "Dex": "350",
            "TypeName": "Water"
        },
        {
            "Dex": "351",
            "TypeName": "Normal"
        },
        {
            "Dex": "352",
            "TypeName": "Normal"
        },
        {
            "Dex": "353",
            "TypeName": "Ghost"
        },
        {
            "Dex": "354",
            "TypeName": "Ghost"
        },
        {
            "Dex": "355",
            "TypeName": "Ghost"
        },
        {
            "Dex": "356",
            "TypeName": "Ghost"
        },
        {
            "Dex": "357",
            "TypeName": "Flying"
        },
        {
            "Dex": "357",
            "TypeName": "Grass"
        },
        {
            "Dex": "358",
            "TypeName": "Psychic"
        },
        {
            "Dex": "359",
            "TypeName": "Dark"
        },
        {
            "Dex": "360",
            "TypeName": "Psychic"
        },
        {
            "Dex": "361",
            "TypeName": "Ice"
        },
        {
            "Dex": "362",
            "TypeName": "Ice"
        },
        {
            "Dex": "363",
            "TypeName": "Ice"
        },
        {
            "Dex": "363",
            "TypeName": "Water"
        },
        {
            "Dex": "364",
            "TypeName": "Ice"
        },
        {
            "Dex": "364",
            "TypeName": "Water"
        },
        {
            "Dex": "365",
            "TypeName": "Ice"
        },
        {
            "Dex": "365",
            "TypeName": "Water"
        },
        {
            "Dex": "366",
            "TypeName": "Water"
        },
        {
            "Dex": "367",
            "TypeName": "Water"
        },
        {
            "Dex": "368",
            "TypeName": "Water"
        },
        {
            "Dex": "369",
            "TypeName": "Rock"
        },
        {
            "Dex": "369",
            "TypeName": "Water"
        },
        {
            "Dex": "370",
            "TypeName": "Water"
        },
        {
            "Dex": "371",
            "TypeName": "Dragon"
        },
        {
            "Dex": "372",
            "TypeName": "Dragon"
        },
        {
            "Dex": "373",
            "TypeName": "Dragon"
        },
        {
            "Dex": "373",
            "TypeName": "Flying"
        },
        {
            "Dex": "374",
            "TypeName": "Psychic"
        },
        {
            "Dex": "374",
            "TypeName": "Steel"
        },
        {
            "Dex": "375",
            "TypeName": "Psychic"
        },
        {
            "Dex": "375",
            "TypeName": "Steel"
        },
        {
            "Dex": "376",
            "TypeName": "Psychic"
        },
        {
            "Dex": "376",
            "TypeName": "Steel"
        },
        {
            "Dex": "377",
            "TypeName": "Rock"
        },
        {
            "Dex": "378",
            "TypeName": "Ice"
        },
        {
            "Dex": "379",
            "TypeName": "Steel"
        },
        {
            "Dex": "380",
            "TypeName": "Dragon"
        },
        {
            "Dex": "380",
            "TypeName": "Psychic"
        },
        {
            "Dex": "381",
            "TypeName": "Dragon"
        },
        {
            "Dex": "381",
            "TypeName": "Psychic"
        },
        {
            "Dex": "382",
            "TypeName": "Water"
        },
        {
            "Dex": "383",
            "TypeName": "Ground"
        },
        {
            "Dex": "384",
            "TypeName": "Dragon"
        },
        {
            "Dex": "384",
            "TypeName": "Flying"
        },
        {
            "Dex": "385",
            "TypeName": "Psychic"
        },
        {
            "Dex": "385",
            "TypeName": "Steel"
        },
        {
            "Dex": "386",
            "TypeName": "Psychic"
        }
        ],

        //need to import remaining json files - going to start on visibility modifiers

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
        case '11':{ break;} //nothing needed??
        case '12':{ break;} //nothing needed?
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