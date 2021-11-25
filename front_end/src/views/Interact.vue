<template>
    <div class="INTERACThome">
        <h1>Interact with the Database!</h1>

        <h3 id ="temp">Select which info you're looking for in the drop-down below</h3>
      
    <v-container fluid class="querySelect">
      <v-row align="center">
          <v-select 
            v-model="selectQuery"
            :items="queries"
            item-text="query"
            item-value="qid"
            label="What do you want to know?"
            persistent-hint
            return-object
            single-line
          ></v-select>
      </v-row>
    </v-container>

      <h3>Select the specific data you're requesting below...</h3>

     <v-container fluid class="selectPokemon" v-if="pokemonVisible">
      <v-row align="center">
        <v-col cols="6">
          <v-select
            v-model="selectPokemon"
            :items="pokemon"
            item-text="pokemon"
            item-value="pid"
            label="Which pokemon are you looking for?"
            persistent-hint
            return-object
            single-line
          ></v-select>
        </v-col>
      </v-row>
    </v-container>

    <v-container fluid class="selectLocation" v-if="locationVisible">
      <v-row align="center">
        <v-col cols="6">
          <v-select
            v-model="selectLocation"
            :items="locations"
            item-text="location"
            item-value="lid"
            label="Which location are you looking for?"
            persistent-hint
            return-object
            single-line
          ></v-select>
        </v-col>
      </v-row>
    </v-container>

     <v-container fluid class="selectMove" v-if="moveVisible">
      <v-row align="center">
        <v-col cols="6">
          <v-select
            v-model="selectMove"
            :items="moves"
            item-text="Which move are you looking for?"
            item-value="mid"
            label="Which move are you looking for?"
            persistent-hint
            return-object
            single-line
          ></v-select>
        </v-col>
      </v-row>
    </v-container>

     <v-container fluid class="selectStat" v-if="statVisible">
      <v-row align="center">
        <v-col cols="6">
          <v-select
            v-model="selectStat"
            :items="stats"
            item-text="stat"
            item-value="sid"
            label="Which stat are you looking for?"
            persistent-hint
            return-object
            single-line
          ></v-select>
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
        //add all other params here


        selectQuery: { query: 'query', qid: '0' },
        queries: [
          { query: 'What do you want to know?', qid: '0' },
          { query: 'All stats from a pokemon', qid: '1' },
          { query: 'All evolutions of a pokemon', qid: '2' },
          { query: 'All pokemon that learn a certain move', qid: '3' },
          { query: 'query4', qid: '4' },
          { query: 'query5', qid: '5' },
        ],

        selectPokemon: { pokemon: 'pokemon', pid: '0' },
        pokemon: [
          { pokemon: 'pokemon1', pid: '1' },
          { pokemon: 'pokemon2', pid: '2' },
          { pokemon: 'pokemon3', pid: '3' },
          { pokemon: 'pokemon4', pid: '4' },
          { pokemon: 'pokemon5', pid: '5' },
        ],

        selectLocation: { location: 'location', lid: '0' },
        locations: [
          { location: 'location1', lid: '1' },
          { location: 'location2', lid: '2' },
          { location: 'location3', lid: '3' },
          { location: 'location4', lid: '4' },
          { location: 'location5', lid: '5' },
          { location: 'location1', lid: '6' },
          { location: 'location2', lid: '7' },
          { location: 'location3', lid: '8' },
          { location: 'location4', lid: '9' },
          { location: 'location5', lid: '10' },
          { location: 'location1', lid: '11' },
          { location: 'location2', lid: '12' },
          { location: 'location3', lid: '13' },
          { location: 'location4', lid: '14' },
          { location: 'location5', lid: '15' },
           { location: 'location1', lid: '16' },
          { location: 'location2', lid: '17' },
          { location: 'location3', lid: '18' },
        ],

        selectMove: { move: 'move', mid: '0' },
        moves: [
          { move: 'move', mid: '1' },
          { move: 'move', mid: '2' },
          { move: 'move', mid: '3' },
          { move: 'move', mid: '4' },
          { move: 'move', mid: '5' },
        ],

        selectStat: { stat: 'stat', sid: '0' },
        stats: [
          { stat: 'stat', sid: '1' },
          { stat: 'stat', sid: '2' },
          { stat: 'stat', sid: '3' },
          { stat: 'stat', sid: '4' },
          { stat: 'stat', sid: '5' },
        ],
      }
    },

  methods:{
    setVisibilty(qid){ //use this function to make required dropdowns visible for appropriate queries
      if(qid == 0){
        //set all to false
        this.locationVisible = false;
        this.pokemonVisible = false;
        this.moveVisible = false;
        this.statVisible = false;
      }else{ //determine which dropdowns are needed for qid
        this.locationVisible = true;
        this.pokemonVisible = true;
        this.moveVisible = true;
        this.statVisible = true;
      }
    }

  },

  computed: {
    //make sure all appropriate values are selected for selected query
    validateQuery(){
      this.setVisibilty(this.selectQuery.qid);
      if(this.selectQuery.qid!=0){//make sure to change these tests
        return true;
      } 
      return false;
    },

    //should be triggered by a 'query' button - currently placeholder doesnt do shit
    updateQuery(){
      if(this.validateQuery){
        return "use this to diplay query results prolly";
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