<template>
    <div class="INTERACThome">
        <h1>Interact with the Database!</h1>

        <h3 id ="temp">Select which info you're looking for in the drop-down below</h3>
      
    <v-container fluid class="querySelect">
      <v-row align="center">
          <v-select 
            v-model="selectQuery"
            :items="queries"
            item-text="value"
            item-value="id"
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


        selectQuery: { value: 'query', id: '0' },
        queries: [
          { value: 'What do you want to know?', id: '0' },
          { value: 'All stats from a pokemon', id: '1' },
          { value: 'All evolutions of a pokemon', id: '2' },
          { value: 'All pokemon that learn a certain move', id: '3' },
          { value: 'query4', id: '4' },
          { value: 'query5', id: '5' },
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
          { value: 'testStat'},
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
        case 1: {
          this.statVisible = true;
          break;
        }
        case 2:{
          this.evolutionVisible = true;
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