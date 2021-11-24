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

      <h3>BASED ON ABOVE QUERY, ADD MORE DROP-DOWNS TO SELECT PARAMETERS</h3>

     <v-container fluid class="pokemonSelect">
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
        selectQuery: { query: 'query', qid: '0' },
        queries: [
          { query: 'query1', qid: '1' },
          { query: 'query2', qid: '2' },
          { query: 'query3', qid: '3' },
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
      }
    },

  computed: {
    //make sure all appropriate values are selected for selected query
    validateQuery(){
      if(this.selectQuery.qid!=0 && this.selectPokemon.pid != 2){//make sure to change these tests
        return true;
      } 
      return false;
    },

    //should be triggered by a 'query' button
    updateQuery(){
      if(this.validateQuery){ //literally why is this a value not a function with () !!!!!!!!!!!!!!!!
        return "gucci gang";
      }else{
        return "missing params"
      }
    },
  }
}

</script>



<style>

  .INTERACThome{
      padding:25px;
  }  

  .pokemonSelect{
    visibility: visible;
  }

</style>