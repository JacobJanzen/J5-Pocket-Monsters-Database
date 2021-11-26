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

     <v-container fluid class="selectPokemon" v-if="pokemonVisible">
      <v-row align="center">
        <v-col cols="6">
          <v-autocomplete
            v-model="selectPokemon"
            :items="pokemon"
            item-text="value"
            item-value="id"
            label="Which pokemon are you looking for?"
            persistent-hint
            return-object
            single-line
            filled
          ></v-autocomplete>
        </v-col>
      </v-row>
    </v-container>

    <v-container fluid class="selectLocation" v-if="locationVisible">
      <v-row align="center">
        <v-col cols="6">
          <v-autocomplete
            v-model="selectLocation"
            :items="locations"
            item-text="value"
            item-value="id"
            label="Which location are you looking for?"
            persistent-hint
            return-object
            single-line
            filled
          ></v-autocomplete>
        </v-col>
      </v-row>
    </v-container>

     <v-container fluid class="selectMove" v-if="moveVisible">
      <v-row align="center">
        <v-col cols="6">
          <v-autocomplete
            v-model="selectMove"
            :items="moves"
            item-text="value"
            item-value="id"
            label="Which move are you looking for?"
            persistent-hint
            return-object
            single-line
            filled
          ></v-autocomplete>
        </v-col>
      </v-row>
    </v-container>

     <v-container fluid class="selectStat" v-if="statVisible">
      <v-row align="center">
        <v-col cols="6">
          <v-autocomplete
            v-model="selectStat"
            :items="stats"
            item-text="value"
            item-value="id"
            label="Which stat are you looking for?"
            persistent-hint
            return-object
            single-line
            filled
          ></v-autocomplete>
        </v-col>
      </v-row>
    </v-container>

    <v-container fluid class="selectEvolution" v-if="evolutionVisible">
      <v-row align="center">
        <v-col cols="6">
          <v-autocomplete
            v-model="selectEvolution"
            :items="evolutions"
            item-text="value"
            item-value="id"
            label="Which evolution are you looking for?"
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
        pokemonVisible: false,
        locationVisible: false,
        moveVisible: false,
        statVisible: false,
        evolutionVisible: false,
        //add all other params here


        //Queries are ordered in file order
        //breeding > locations > moves > pokemon > teams > types
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

        selectPokemon: { value: 'pokemon', id: '0' },
        pokemon: [
          { value: 'testPokemon', id: '1' },
        ],

        selectLocation: { value: 'location', id: '0' },
        locations: [
          { value: 'testLocation', id: '1' },
        ],

        selectMove: { value: 'move', id: '0' },
        moves: [
          { value: 'testMove', id: '1' },
        ],

        selectStat: { value: 'stat', id: '0'},
        stats: [
          { value: 'testStat', id: '1'},
        ],

        selectEvolutions: { value: 'evolution', id: '0'},
        evolutions: [
          { value: 'testEvolution', id: '1' },
        ],
        
      }
    },

  methods:{
    setVisibilty(query){ //use this function to make required dropdowns visible for appropriate queries
      this.setAllHidden();
      switch(query){
        case '1': {
          
          break;
        }
        case '2':{
          
          break;
        } 
        case '3':{
          
          break;
        } 
        case '4':{
          
          break;
        } 
        case '5':{
          
          break;
        } 
      }
    },

    setAllHidden(){
        this.locationVisible = false;
        this.pokemonVisible = false;
        this.moveVisible = false;
        this.statVisible = false;
        this.evolutionVisible = false;
        //add all remaining selections here
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
        return "use this to diplay query results prolly" + 
        "\n pokemon selected: "+ this.selectPokemon.id +
        "\n location selected: "+ this.selectLocation.id +
        "\n move selected: "+ this.selectMove.id +
        "\n stat selected: "+ this.selectStat.value ;
      }
      return "";//required for computed property apparently
    },

  }
}

</script>



<style>

  .INTERACThome{
      padding:25px;
  }  

</style>