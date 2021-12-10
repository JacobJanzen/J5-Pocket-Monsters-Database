<template>
    <div class="INTERACThome">

      <!-- forces polling on query parameter dropdowns -->
      <h1>{{vaidateQuery}}</h1>
    
    <v-container fluid class="querySelect" v-if="queryVisible">
          
         <v-row align="center">
          <v-col cols="8">
            <h3 id ="temp">Select which info you're looking for in the drop-down below</h3>
          </v-col>
         </v-row>

         <v-row align="center">
           <v-col cols="3">
            <h3>Filter Common Queries:</h3>
            <v-btn class="filterClear" @click="showAllQueries()">Show All Queries</v-btn>
           </v-col>

           <v-col cols="2">
            <div>
              <input type="checkbox" @change="pokemonCheckboxUpdate()" id="pokemonCheckbox" checked>
              <label class = "checkboxLabel" for="pokemonCheckbox">Pokemon</label>
            </div>

            <div>
              <input type="checkbox" @change="moveCheckboxUpdate()" id="moveCheckbox" checked>
              <label class = "checkboxLabel" for="moveCheckbox">Moves</label>
            </div>
           </v-col>

             <v-col cols="2">
            <div>
              <input type="checkbox" @change="teamCheckboxUpdate()" id="teamCheckbox" checked>
              <label class = "checkboxLabel" for="teamCheckbox">Teams</label>
            </div>

            <div>
              <input type="checkbox" @change="locationCheckboxUpdate()" id="locationCheckbox" checked>
              <label class = "checkboxLabel" for="locationCheckbox">Locations</label>
            </div>
            </v-col>

           <v-col cols="2">
            <div>
              <input type="checkbox" @change="typeCheckboxUpdate()" id="typeCheckbox" checked>
              <label class = "checkboxLabel" for="typeCheckbox">Types</label>
            </div>

             <div>
              <input type="checkbox" @change="otherCheckboxUpdate()" id="otherCheckbox" checked>
              <label class = "checkboxLabel" for="otherCheckbox">Other</label>
            </div>
            </v-col>
         </v-row>

      <v-row align="center">
          <v-col cols="8">
          <v-autocomplete 
            v-model="selectQuery"
            :items="queries"
            item-text="value"
            item-value="id"
            label="What do you want to know?"
            persistent-hint
            return-object
            single-line
            v-on:click="this.setVisibilty(this.selectQuery.id)"
          ></v-autocomplete>
          </v-col>

        <v-col cols="4">
             <v-btn @click="makeQuery()">Query!</v-btn>
             <p v-if="errorMessageVisible" style="color:red;"> Selection Required </p>
        </v-col> 
      </v-row>

    <v-row align="center" v-if="dropdownMessageVisible">
    <v-col cols="8">
        <h3>Select the specific data you're requesting below...</h3>    
    </v-col>
    </v-row>
    </v-container>

    <v-container fluid class="resultView" v-if="resultsVisible">
      <v-row align="center">
          <v-col cols="8">
              <h3>View your query results below when they've loaded...</h3>
          </v-col>

        <v-col cols="4" >
             <v-btn class="button" @click="newQuery()">New Query</v-btn>
             <v-btn class="button" v-if="downloadButtonVisible" @click="downloadFile()">Download</v-btn>
        </v-col>
      </v-row>

      <v-row align="center">
          <!-- display query result table -->
          <p class = "output" id='showData'></p>
      </v-row>
    </v-container>

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
            item-value="TypeName"
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
            item-value="TypeName"
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
            :items="trainerNames"
            item-text=TrainerName
            item-value=TrainerName
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
            :items="trainerClasses"
            item-text=TrainerClass
            item-value=TrainerClass
            label="Which Trainer Class are you looking for?"
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
            v-model="selectPokemon"
            :items="pokemon"
            item-text=PokemonName
            item-value=PokemonName
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
            item-value=GroupName
            label="Which Egg Group are you looking for?"
            persistent-hint
            return-object
            single-line
            filled
          ></v-autocomplete>
        </v-col>
      </v-row>
    </v-container>

    <v-container fluid class="selectBreedingMethod" v-if="breedingMethodVisible">
      <v-row align="center">
        <v-col cols="6">
          <v-autocomplete
            v-model="selectBreedingMethod"
            :items="breedingMethods"
            item-text=MoveName
            item-value=MoveName
            label="Which Breeding Type are you looking for?"
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

    <v-container fluid class="selectMove" v-if="moveVisible">
      <v-row align="center">
        <v-col cols="6">
          <v-autocomplete
            v-model="selectMove"
            :items="moves"
            item-text=MoveName
            item-value=MoveName
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
            item-text=stat
            item-value=stat
            label="Which stat are you looking for?"
            persistent-hint
            return-object
            single-line
            filled
          ></v-autocomplete>
        </v-col>
      </v-row>
    </v-container>

    <v-container fluid class="selectEncounter" v-if="encounterVisible">
      <v-row align="center">
        <v-col cols="6">
          <v-autocomplete
            v-model="selectEncounter"
            :items="encounters"
            item-text=Encounter
            item-value=Encounter
            label="Which Encounter are you looking for?"
            persistent-hint
            return-object
            single-line
            filled
          ></v-autocomplete>
        </v-col>
      </v-row>
    </v-container>

    <v-container fluid class="selectQuality" v-if="qualityVisible">
      <v-row align="center">
        <v-col cols="6">
          <v-autocomplete
            v-model="selectQuality"
            :items="quality"
            item-text=Quality
            item-value=Quality
            label="Which Effectiveness are you looking for?"
            persistent-hint
            return-object
            single-line
            filled
          ></v-autocomplete>
        </v-col>
      </v-row>
    </v-container>

    <v-container fluid class="selectValue" v-if="valueVisible">
      <v-row align="center">
        <v-col cols="6">
          <v-autocomplete
            v-model="selectValue"
            :items="values"
            item-text=Value
            item-value=Value
            label="Which Value are you looking for?"
            persistent-hint
            return-object
            single-line
            filled
          ></v-autocomplete>
        </v-col>
      </v-row>
    </v-container>

    <v-container fluid class="selectFather" v-if="fatherVisible">
      <v-row align="center">
        <v-col cols="6">
          <v-autocomplete
            v-model="selectFather"
            :items="pokemon"
            item-text=PokemonName
            item-value=PokemonName
            label="Which Father are you looking for?"
            persistent-hint
            return-object
            single-line
            filled
          ></v-autocomplete>
        </v-col>
      </v-row>
    </v-container>

    </div>
</template>

<script> 
const axios = require('axios').default;

//Import dropdown info
import dropdown from '../Dropdown.json'

export default {
     data () {
      return {

        //used to display results of api call
        results: {value: "default"},

        //used to track current selections
        apiStr:{url: "init"},

        //visibility modifiers
        locationVisible: false,
        qualityVisible: false,
        abilityVisible: false,
        fatherVisible: false,
        typeVisible: false,
        secondTypeVisible:false,
        trainerNameVisible: false,
        trainerClassVisible: false,
        pokemonNameVisible:false,
        eggGroupVisible: false,
        levelSelectVisible: false,
        moveVisible:false,
        breedingMethodVisible: false,
        encounterVisible: false,
        dropdownMessageVisible: false,
        queryVisible:true,
        resultsVisible: false,
        errorMessageVisible: false,
        statVisible: false,
        valueVisible:false,
        downloadButtonVisible:true,

        //checkbox selections
        pokemonCheckbox: true,
        moveCheckbox: true,
        typeCheckbox: true,
        teamCheckbox: true,
        locationCheckbox:true,
        otherCheckbox: true,

        //dropdown selections
        selectQuery: { value: 'query', id: '0' },
        queries: [
          { value: 'What do you want to know?', id: '0' },//default query value
          //other values loaded via dropdown.json
        ],

        selectQuality:{Quality: null},
        quality: dropdown["quality"],

        selectValue:{Value: null},
        values: dropdown["values"],

        selectLevel: {Level: null},
        levels: dropdown["levels"],

        selectLocation: { LocationName: null},
        locations: dropdown["location"],

        selectAbility: { Ability: null},
        abilities: dropdown["abilities"],

        selectSecondType: {TypeName: null, Category: null},
        selectType: {TypeName: null, Category: null},
        types: dropdown["types"],

        selectTrainerClass: { TrainerClass: null},
        trainerClasses: dropdown["trainerClasses"],

        selectTrainerName: {TrainerName: null, TID: null},
        trainerNames: dropdown["trainerNames"],

        selectPokemon:{PokemonName: null},
        selectFather:{PokemonName: null},
        pokemon: dropdown["pokemon"],

        selectEggGroup:{GroupName: null},
        egggroups: dropdown["egggroups"],

        selectMove:{MoveName: null},
        moves: dropdown["moves"],

        selectBreedingMethod:{MoveName: null},
        breedingMethods: dropdown["breedingMethods"],

        selectStat:{stat: null},
        stats: dropdown["stats"],

        selectEncounter:{Encounter: null},
        encounters: dropdown["encounters"]
      }
  },

   methods:{
     updateFilteredQueries(){
        //clear all 'queries' in queries
        this.queries.splice(1);
       
        var i = 0;//loop iterator
        var json;//json obj

       if(this.pokemonCheckbox){
          json = dropdown["pokemonQueries"];
          for(i=0; i<json.length; i++){
              this.queries.push(json[i]);
          }
       }
       if(this.moveCheckbox){
          json = dropdown["moveQueries"];
          for(i=0; i<json.length; i++){
              this.queries.push(json[i]);
          }
       }
       if(this.typeCheckbox){
          json = dropdown["typeQueries"];
          for(i=0; i<json.length; i++){
              this.queries.push(json[i]);
          }
       }
       if(this.teamCheckbox){
          json = dropdown["teamQueries"];
          for(i=0; i<json.length; i++){
              this.queries.push(json[i]);
          }
       }
       if(this.locationCheckbox){
          json = dropdown["locationQueries"];
          for(i=0; i<json.length; i++){
              this.queries.push(json[i]);
          }
       }
       if(this.otherCheckbox){
          json = dropdown["otherQueries"];
          for(i=0; i<json.length; i++){
              this.queries.push(json[i]);
          }
       }
     },

     pokemonCheckboxUpdate(){
        if(this.pokemonCheckbox){
         this.pokemonCheckbox = false
        }else{
          this.pokemonCheckbox = true;
        }
        this.updateFilteredQueries();
     },

     moveCheckboxUpdate(){
        if(this.moveCheckbox){
         this.moveCheckbox = false
        }else{
          this.moveCheckbox = true;
        }
        this.updateFilteredQueries();
     },

     typeCheckboxUpdate(){
        if(this.typeCheckbox){
         this.typeCheckbox = false
        }else{
          this.typeCheckbox = true;
        }
        this.updateFilteredQueries();
     },

     teamCheckboxUpdate(){
        if(this.teamCheckbox){
         this.teamCheckbox = false
        }else{
          this.teamCheckbox = true;
        }
        this.updateFilteredQueries();
     },

     locationCheckboxUpdate(){
        if(this.locationCheckbox){
         this.locationCheckbox = false
        }else{
          this.locationCheckbox = true;
        }
        this.updateFilteredQueries();
     }, 

     otherCheckboxUpdate(){
        if(this.otherCheckbox){
         this.otherCheckbox = false
        }else{
          this.otherCheckbox = true;
        }
        this.updateFilteredQueries();
     },

     showAllQueries(){
        document.getElementById("pokemonCheckbox").checked = true;
        document.getElementById("moveCheckbox").checked = true;
        document.getElementById("typeCheckbox").checked = true;
        document.getElementById("teamCheckbox").checked = true;
        document.getElementById("locationCheckbox").checked = true;
        document.getElementById("otherCheckbox").checked = true;

        this.pokemonCheckbox = true;
        this.moveCheckbox = true;
        this.typeCheckbox = true;
        this.teamCheckbox = true;
        this.locationCheckbox =true;
        this.otherCheckbox = true;

        //make all queries visible
        var json = dropdown["pokemonQueries"];
        for(var i=0; i<json.length; i++){ this.queries.push(json[i]); }
        json = dropdown["moveQueries"];
        for(i=0; i<json.length; i++){ this.queries.push(json[i]); }
        json = dropdown["typeQueries"];
        for(i=0; i<json.length; i++){ this.queries.push(json[i]); }
        json = dropdown["teamQueries"];
        for(i=0; i<json.length; i++){ this.queries.push(json[i]); }
        json = dropdown["locationQueries"];
        for(i=0; i<json.length; i++){ this.queries.push(json[i]); }
        json = dropdown["otherQueries"];
        for(i=0; i<json.length; i++){ this.queries.push(json[i]); }
     },

     downloadFile(){
           axios.get(this.apiStr.url)
          .then((response) => {

            //convert json to csv formatting
            var json = response.data;
            var fields = Object.keys(json[0])
            //var replacer = function(key, value) { return value === null ? '' : value } 
            var csv = json.map(function(row){
              return fields.map(function(fieldName){
                //return JSON.stringify(row[fieldName], replacer)+ "\r\n"
                return row[fieldName];
              }).join(',')
            })
            csv.unshift(fields.join(',')) // add header column
            csv = csv.join('\n');
    
            //write csv file
            const blob = new Blob([csv], { type: "text/csv;charset=utf-8;" });
            const link = document.createElement("a");
            link.href = URL.createObjectURL(blob);
            link.download = "results.csv";
            link.click();
            URL.revokeObjectURL(link.href); 
            
         })
        .catch(() => {
          console.log("error");
        });        

     },
    
    newQuery(){
        //Reset all selected param dropdowns
        this.selectPokemon = null;
        this.selectQuality = null;
        this.selectLevel = null;
        this.selectLocation = null;
        this.selectAbility = null;
        this.selectSecondType = null;
        this.selectType = null;
        this.selectTrainerClass = null;
        this.selectTrainerName = null;
        this.selectFather = null;
        this.selectEggGroup = null;
        this.selectMove = null;
        this.selectBreedingMethod = null;
        this.selectStat = null;
        this.selectEncounter = null;

        //Reset Query selection && api string
        this.selectQuery = this.queries[0];
        this.apiStr.url = "reset";

        this.downloadButtonVisible = true;
        this.resultsVisible = false;

        this.queryVisible = true;
        this.showAllQueries();
        this.setAllHidden();
            
    },

    setVisibilty(query){ //use this function to make required dropdowns visible for appropriate queries
      this.setAllHidden();
    
      switch(query){
          case '1':{ this.dropdownMessageVisible = true; this.eggGroupVisible = true; break;}
          case '2':{ this.dropdownMessageVisible = true; this.pokemonNameVisible = true; break;} 
          case '3':{ this.dropdownMessageVisible = true; this.pokemonNameVisible = true; break;} 
          case '4':{ this.dropdownMessageVisible = true; this.pokemonNameVisible = true; this.encounterVisible = true; break;} 
          case '5':{ this.dropdownMessageVisible = true; this.typeVisible = true; break;}
          case '6':{ this.dropdownMessageVisible = true; this.typeVisible = true; this.secondTypeVisible = true; break;}
          case '7':{ this.dropdownMessageVisible = true; this.trainerNameVisible = true; break;}
          case '9':{ this.dropdownMessageVisible = true; this.trainerClassVisible = true; break;}
          case '10':{ this.dropdownMessageVisible = true; this.levelSelectVisible = true; this.pokemonNameVisible = true; break;}
          case '12':{ break;}
          case '14':{ this.dropdownMessageVisible = true; this.pokemonNameVisible = true; break;}
          case '14.5':{ this.dropdownMessageVisible = true; this.typeVisible = true; this.qualityVisible = true; break;}
          case '15':{ this.dropdownMessageVisible = true; this.pokemonNameVisible = true; break;}
          case '16':{ this.dropdownMessageVisible = true; this.pokemonNameVisible = true; break;}
          case '17':{ this.dropdownMessageVisible = true; this.pokemonNameVisible = true; break;}
          case '18':{ this.dropdownMessageVisible = true; this.pokemonNameVisible = true; break;} 
          case '19':{ this.dropdownMessageVisible = true; this.pokemonNameVisible = true; break;} 
          case '20':{ break;} 
          case '21':{ this.dropdownMessageVisible = true; this.pokemonNameVisible = true; this.moveVisible = true; break;}
          case '23':{ this.dropdownMessageVisible = true; this.pokemonNameVisible = true; this.typeVisible = true; break;}
          case '24':{ this.dropdownMessageVisible = true; this.pokemonNameVisible = true; this.breedingMethodVisible = true; break;}
          case '25':{ this.dropdownMessageVisible = true; this.pokemonNameVisible = true; break;}
          case '26':{ this.dropdownMessageVisible = true; this.fatherVisible = true; this.pokemonNameVisible = true; break;}
          case '28':{ break;} 
          case '29':{ break;} 
          case '30':{ break;} 
          case '31':{ this.dropdownMessageVisible = true; this.pokemonNameVisible = true; break;}
          case '32':{ this.dropdownMessageVisible = true; this.pokemonNameVisible = true; break;}
          case '33':{ this.dropdownMessageVisible = true; this.moveVisible = true; break;}
          case '34':{ this.dropdownMessageVisible = true; this.statVisible = true; break;} 
          case '35':{ this.dropdownMessageVisible = true; this.statVisible = true; break;} 
          case '36':{ this.dropdownMessageVisible = true; this.valueVisible = true; this.statVisible = true; break;} 
          case '37':{ this.dropdownMessageVisible = true; this.valueVisible = true; this.statVisible = true; break;} 
          case '38':{ this.dropdownMessageVisible = true; this.locationVisible = true; break;}
          case '39':{ this.dropdownMessageVisible = true; this.locationVisible = true; this.encounterVisible = true; break;} 
          case '40':{ this.dropdownMessageVisible = true; this.pokemonNameVisible = true; break;} 
          case '41':{ this.dropdownMessageVisible = true; this.locationVisible = true; this.pokemonNameVisible = true; break;}
          case '42':{ this.dropdownMessageVisible = true; this.moveVisible = true; break;}
          case '43':{ this.dropdownMessageVisible = true; this.moveVisible = true; break;}
          case '44':{ this.dropdownMessageVisible = true; this.moveVisible = true; break;}
          case '45':{ this.dropdownMessageVisible = true; this.moveVisible = true; break;}
          case '46':{ this.dropdownMessageVisible = true; this.moveVisible = true; break;}
          case '47':{ break;} 
          case '48':{ this.dropdownMessageVisible = true; this.abilityVisible = true; break;}
          case '50':{ this.dropdownMessageVisible = true; this.typeVisible = true; this.secondTypeVisible = true; break;}
          case '51':{ this.dropdownMessageVisible = true; this.trainerNameVisible = true; break;} //idk if this should be name or class?
          case '52':{ this.dropdownMessageVisible = true; this.pokemonNameVisible = true; break;}
          case '53':{ this.dropdownMessageVisible = true; this.levelSelectVisible = true; break;}
          case '54':{ this.dropdownMessageVisible = true; this.levelSelectVisible = true; break;}
          case '55':{ break;} 
          case '56':{ break;} 
          case '57':{ break;} 
          case '58':{ break;} 
          case '59':{ break;} 
          case '60':{ break;} 
          case '61':{ break;} 
          case '62':{ this.dropdownMessageVisible = true; this.pokemonNameVisible = true; break;} 
          case '63':{ this.dropdownMessageVisible = true; this.pokemonNameVisible = true; break;} 
        }
    },

    makeQuery(){ //function validates input and calls api
        let query = this.selectQuery.id;
        let valid = false;
        this.apiStr.url = "http://127.0.0.1:5000/";
        
        try{
            switch(query){
            case '1':{ 
                if(this.selectEggGroup.GroupName != null){ 
                    this.apiStr.url += "breeding/pokemon_in_egg_group/"+this.selectEggGroup.GroupName;
                    valid = true;
                } break;}
            case '2':{ 
                if(this.selectPokemon.PokemonName != null){
                    this.apiStr.url += "breeding/pokemon_can_breed_with/"+this.selectPokemon.PokemonName
                    valid = true;
                }break;} 
            case '3':{ 
                if(this.selectPokemon.PokemonName != null){
                    this.apiStr.url += "locations/locations_pokemon_can_be_found/"+this.selectPokemon.PokemonName;
                    valid = true;
                }break;} 
            case '4':{ 
                if(this.selectPokemon.PokemonName != null){
                    this.apiStr.url += "locations/locations_pokemon_can_be_found_with_method/"+this.selectPokemon.PokemonName+"&"+this.selectEncounter.Encounter;
                    valid = true;
                }break;}
            case '5':{ 
                if(this.selectType.TypeName != null){
                    this.apiStr.url += "locations/locations_with_pokemon_of_type/"+this.selectType.TypeName;
                    valid = true;
                }break;}
            case '6':{ 
                if(this.selectType.TypeName != null && this.selectSecondType.TypeName != null){
                    this.apiStr.url += "locations/locations_with_pokemon_of_dual_type/"+this.selectType.TypeName+"&"+this.selectSecondType.TypeName;
                    valid = true;
                }break;}
            case '7':{ 
                if(this.selectTrainerName.TID != null){
                    this.apiStr.url += "locations/locations_with_trainer/"+this.selectTrainerName.TID;//havnt tested with TID??
                    valid = true;
                }break;}
            case '9':{ 
                if(this.selectTrainerClass.TrainerClass != null){
                    this.apiStr.url += "locations/locations_with_trainer_class_fight/"+this.selectTrainerClass.TrainerClass;
                    valid = true;
                }break;}
            case '10':{ 
                if(this.selectLevel.Level != null && this.selectPokemon.PokemonName !=null){
                    this.apiStr.url += "locations/locations_with_pokemon_of_level/"+this.selectPokemon.PokemonName+"&"+this.selectLevel.Level;
                    valid = true;
                }break;}
            case '12':{ 
                this.apiStr.url += "moves/moves_learned_by_pokemon_by_method";
                valid = true;
                break;}
            case '14':{
                if(this.selectPokemon.PokemonName != null){
                    this.apiStr.url += "moves/moves_learned_by_a_pokemon_by_method/"+this.selectPokemon.PokemonName;
                    valid = true;
                }break;}
            case "14.5":{
                if(this.selectType.TypeName != null && this.selectQuality.Quality != null){
                    this.apiStr.url += "moves/moves_with_effectiveness_against_type/"+this.selectType.TypeName+"&"+this.selectQuality.Quality;
                    valid = true;
                }break;}            
            case '15':{ 
                if(this.selectPokemon.PokemonName != null){
                    this.apiStr.url += "moves/moves_supereffective_against_pokemon/"+this.selectPokemon.PokemonName;
                    valid = true;
                }break;}
            case '16':{ 
                if(this.selectPokemon.PokemonName != null){
                    this.apiStr.url += "moves/moves_neutral_against_pokemon/"+this.selectPokemon.PokemonName;
                    valid = true;
                }break;}
            case '17':{ 
                if(this.selectPokemon.PokemonName != null){
                    this.apiStr.url += "moves/moves_noteffective_against_pokemon/"+this.selectPokemon.PokemonName;
                    valid = true;
                }break;}
            case '18':{ 
                if(this.selectPokemon.PokemonName != null){
                    this.apiStr.url += "moves/moves_non_effective_against_pokemon/"+this.selectPokemon.PokemonName;
                    valid = true;
                }break;} 
            case '19':{ 
                if(this.selectPokemon.PokemonName != null){
                    this.apiStr.url += "moves/moves_effectiveness_against_pokemon/"+this.selectPokemon.PokemonName;
                    valid = true;
                }break;} 
            case '20':{ 
                this.apiStr.url += "moves/status_moves/";
                valid = true;
                break;} 
            case '21':{ 
                if(this.selectPokemon.PokemonName != null && this.selectMove.MoveName != null){
                    this.apiStr.url += "moves/methods_pokemon_can_learn_move/"+this.selectPokemon.PokemonName+"&"+this.selectMove.MoveName;
                    valid = true;
                }break;}
            case '23':{ 
                if(this.selectPokemon.PokemonName != null &&this.selectType.TypeName != null){
                    this.apiStr.url += "moves/moves_of_type_that_pokemon_can_learn_by_method/"+this.selectPokemon.PokemonName+"&"+this.selectType.TypeName;
                    valid = true;
                }break;}
            case '24':{ 
                if(this.selectPokemon.PokemonName != null && this.selectBreedingMethod.MoveName !=null){
                    this.apiStr.url += "moves/moves_pokemon_learns_with_method/"+this.selectPokemon.PokemonName+"&"+this.selectBreedingMethod.MoveName;
                    valid = true;
                }break;}
            case '25':{ 
                if(this.selectPokemon.PokemonName != null){
                    this.apiStr.url += "moves/moves_pokemon_learns_by_breeding/"+this.selectPokemon.PokemonName;
                    valid = true;
                }break;}
            case '26':{ 
                if(this.selectPokemon.PokemonName != null && this.selectFather.PokemonName != null){
                    this.apiStr.url += "moves/moves_pokemon_learns_by_breeding_with_father/"+this.selectPokemon.PokemonName+"&"+this.selectFather.PokemonName;
                    valid = true;
                }break;}
            case '27.5':{ 
                this.apiStr.url += "pokemon/hatch_times";
                valid = true;
                break;} 
            case '28':{ 
                this.apiStr.url += "pokemon/move_names";
                valid = true;
                break;} 
            case '29':{ 
                this.apiStr.url += "pokemon/dex_pokemon_names";
                valid = true;
                break;} 
            case '30':{ 
                this.apiStr.url += "pokemon/trainer_data";
                valid = true;
                break;} 
            case '31':{ 
                if(this.selectPokemon.PokemonName != null){
                    this.apiStr.url += "pokemon/pokemon_stats/"+this.selectPokemon.PokemonName;
                    valid = true;
                }break;}
            case '32':{ 
                if(this.selectPokemon.PokemonName != null){
                    this.apiStr.url += "pokemon/pokemon_evolutions/"+this.selectPokemon.PokemonName;
                    valid = true;
                }break;}
            case '33':{ 
                if(this.selectMove.MoveName != null){
                    this.apiStr.url += "pokemon/pokemon_with_move/"+this.selectMove.MoveName;
                    valid = true;
                }break;}
            case '34':{ 
                if(this.selectStat.stat != null){
                    this.apiStr.url += "pokemon/pokemon_from_types_with_highest_stat/"+this.selectStat.stat;
                    valid = true;
                }break;} 
            case '35':{ 
                if(this.selectStat.stat != null){
                    this.apiStr.url += "pokemon/pokemon_from_types_with_lowest_stat/"+this.selectStat.stat;
                    valid = true;
                }break;} 
            case '36':{ 
                if(this.selectValue.Value != null && this.selectStat.stat != null){
                    this.apiStr.url += "pokemon/pokemon_with_stat_greater_than/"+this.selectStat.stat+"&"+this.selectValue.Value;
                    valid = true;
                }break;} 
            case '37':{ 
                if(this.selectValue.Value != null && this.selectStat.stat != null){
                    this.apiStr.url += "pokemon/pokemon_with_stat_less_than/"+this.selectStat.stat+"&"+this.selectValue.Value;
                    valid = true;
                }break;} 
            case '38':{ 
                if(this.selectLocation.LocationName != null){
                    this.apiStr.url += "pokemon/pokemon_can_be_caught_at_location/"+this.selectLocation.LocationName;
                    valid = true;
                }break;}
            case '39':{ 
                if(this.selectLocation.LocationName != null && this.selectEncounter.Encounter != null){
                    this.apiStr.url += "pokemon/pokemon_can_be_caught_at_location_from_encounter/"+this.selectLocation.LocationName+"&"+this.selectEncounter.Encounter;
                    valid = true;
                }break;} 
            case '40':{ 
                if(this.selectPokemon.PokemonName != null){
                    this.apiStr.url += "pokemon/pokemon_with_supereffective_against_pokemon/"+this.selectPokemon.PokemonName;
                    valid = true;
                }break;} 
            case '41':{ 
                if(this.selectLocation.LocationName != null && this.selectPokemon.PokemonName != null){
                    this.apiStr.url += "pokemon/pokemon_from_location_with_supereffective_against_pokemon/"+this.selectPokemon.PokemonName+"&"+this.selectLocation.LocationName;
                    valid = true;
                }break;}
            case '42':{ 
                if(this.selectMove.MoveName != null){
                    this.apiStr.url += "pokemon/pokemon_that_move_is_supereffective_against/"+this.selectMove.MoveName;
                    valid = true;
                }break;}
            case '43':{ 
                if(this.selectMove.MoveName != null){
                    this.apiStr.url += "pokemon/pokemon_that_move_is_neutral_against/"+this.selectMove.MoveName;
                    valid = true;
                }break;}
            case '44':{ 
                if(this.selectMove.MoveName != null){
                    this.apiStr.url += "pokemon/pokemon_that_move_is_weak_against/"+this.selectMove.MoveName;
                    valid = true;
                }break;}
            case '45':{ 
                if(this.selectMove.MoveName != null){
                    this.apiStr.url += "pokemon/pokemon_that_move_is_noteffective_against/"+this.selectMove.MoveName;
                    valid = true;
                }break;}
            case '46':{ 
                if(this.selectMove.MoveName != null){
                    this.apiStr.url += "pokemon/effects_on_pokemon_by_move/"+this.selectMove.MoveName;
                    valid = true;
                }break;}
            case '47':{ 
                this.apiStr.url += "pokemon/pokemon_abilities";
                valid = true;
                break;} 
            case '48':{ 
                if(this.selectAbility.Ability != null){
                    this.apiStr.url += "pokemon/pokemon_with_ability/"+this.selectAbility.Ability;
                    valid = true;
                }break;}
            case '50':{ 
                if(this.selectType.TypeName != null && this.selectSecondType.TypeName != null){
                    this.apiStr.url += "pokemon/pokemon_of_type_can_learn_other_type_from_method/"+this.selectType.TypeName+"&"+this.selectSecondType.TypeName;
                    valid = true;
                }break;}
            case '51':{  
                if(this.selectTrainerName.TID != null){
                    this.apiStr.url += "teams/teams_with_trainer/"+this.selectTrainerName.TID;
                    valid = true;
                }break;}
            case '52':{ 
                if(this.selectPokemon.PokemonName != null){
                    this.apiStr.url += "teams/teams_with_pokemon/"+this.selectPokemon.PokemonName;
                    valid = true;
                }break;}
            case '53':{ 
                if(this.selectLevel.Level != null){
                    this.apiStr.url += "teams/teams_with_minimum_level/"+this.selectLevel.Level;
                    valid = true;
                }break;}
            case '54':{ 
                if(this.selectLevel.Level != null){
                    this.apiStr.url += "teams/teams_with_maximum_level/"+this.selectLevel.Level;
                    valid = true;
                }break;}
            case '55':{ 
                this.apiStr.url += "types/number_of_pokemon_per_type";
                valid = true;
                break;} 
            case '56':{ 
                this.apiStr.url += "types/types_with_physical_damage";
                valid = true;
                break;} 
            case '57':{ 
                this.apiStr.url += "types/types_with_special_damage";
                valid = true;
                break;} 
            case '58':{ 
                this.apiStr.url += "moves/tm_moves/";
                valid = true;
                break;} 
            case '59':{ 
                this.apiStr.url += "moves/hm_moves/";
                valid = true;
                break;} 
            case '60':{ 
                this.apiStr.url += "moves/tm_moves_all_pokemon/";
                valid = true;
                break;} 
            case '61':{ 
                this.apiStr.url += "moves/hm_moves_all_pokemon";
                valid = true;
                break;} 
            case '62':{ 
              if(this.selectPokemon.PokemonName != null){
                  this.apiStr.url += "moves/tm_moves_pokemon/"+this.selectPokemon.PokemonName;
                  valid = true;
              } break;} 
            case '63':{ 
                if(this.selectPokemon.PokemonName != null){
                  this.apiStr.url += "moves/hm_moves_pokemon/"+this.selectPokemon.PokemonName;
                  valid = true;
              } break;} 
            }
        }catch(error){
            //handle failures from evaluating null object 
            //ex if selectLevel is null - cant evaluate selectLevel.Level

            //error message from missing selection is made visible below in if(valid)
        }

       if(valid){
            //hide query boxes, display results container
            this.queryVisible = false;
            this.setAllHidden();
            this.resultsVisible = true;
            this.downloadButtonVisible = true;

            //this is just a label which displays the generated url
            this.results.value = this.apiStr.url;//will be removed

            axios.get(this.apiStr.url).then((response) => {
                  //console.log(response.data);
                  document.getElementById("showData").innerText = "ready";
                  this.updateOutput(response.data);
                })
                .catch(() => {
                  document.getElementById("showData").innerText = "No Results";
                });
       }else{
           this.errorMessageVisible = true;
       }
    },

    updateOutput(response){
        /* code from https://www.encodedna.com/javascript/practice-ground/default.htm?pg=convert_json_to_table_javascript */

        if(response.length!=0){
          // Extract value from table header. 
          var col = [];
          for (var i = 0; i < response.length; i++) {
              for (var key in response[i]) {
                  if (col.indexOf(key) === -1) {
                      col.push(key);
                  }
              }
          }

          // Create a table.
          var table = document.createElement("table");

          // Create table header row using the extracted headers above.
          var tr = table.insertRow(-1);                   // table row.

          for (var j = 0; j < col.length; j++) {
              var th = document.createElement("th");      // table header.
              th.innerHTML = col[j];
              tr.appendChild(th);
          }

          // add json data to the table as rows.
          for (var k = 0; k < response.length; k++) {
              tr = table.insertRow(-1);
              for (var m = 0; m < col.length; m++) {
                  var tabCell = tr.insertCell(-1);
                  tabCell.innerHTML = response[k][col[m]];
              }
          }

          // Now, add the newly created table with json data, to a container.
          var divShowData = document.getElementById('showData');
          divShowData.innerHTML = "";
          divShowData.appendChild(table);
        }else{
          document.getElementById("showData").innerText = "No Results";
          this.downloadButtonVisible = false;
        }
    },

    setAllHidden(){
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
        this.moveVisible = false;
        this.breedingMethodVisible = false;
        this.encounterVisible = false;
        this.dropdownMessageVisible = false; 
        this.errorMessageVisible = false;
        this.statVisible = false;
        this.qualityVisible = false;
        this.fatherVisible = false;
        this.valueVisible = false;
        this.downloadButtonVisible = false;
    }
  },

  computed: {
      //make sure all appropriate values are selected for selected query
      vaidateQuery(){
      this.setVisibilty(this.selectQuery.id); //force polling on the parameter dropdown visibility
      if(this.selectQuery.id!=0){return "Interact with the Database!";}
      return "Interact with the Database!";
      },
  }, 

  //called on page load
  mounted: function () {
    this.$nextTick(function () {
      //make all queries visible initially
      this.showAllQueries();
    })
  },

}
</script>



<style>
  table, th, td {
    border: solid 1px #ddd;
      border-collapse: collapse;
      padding: 1px 10px;
      text-align: center;
  }
  th {
      font-weight:bold;
  }

  .output{
    margin-left:12px;
  }

  .INTERACThome{
      padding:25px;
  }  

  .button{
      margin: 5px;
      text-decoration: none;
  }

  .checkboxLabel {
      margin: .4rem;
      font-weight: bold;
  }

  .filterClear{
    margin-left:10px;
  }
</style>
