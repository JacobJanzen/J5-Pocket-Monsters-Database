<template>
    <div class="INTERACThome">
        <h1>Interact with the Database!</h1>

        <h3>Select which info you're looking for in the drop-down below</h3>
          <v-card>
            <v-container fluid>
              <v-row
                align="center"
              >
                <v-col cols="12">
                  <v-autocomplete
                    v-model="value"
                    :items="items"
                    dense
                    filled
                    label="What do you want to know?"
                  ></v-autocomplete>
                </v-col>
              </v-row>
            </v-container>
          </v-card> 

            <br>
            <h3>BASED ON ABOVE QUERY SELECTION, HAVE MORE DROP-DOWNS TO SELECT PARAMETERS</h3>
            <h3>Probably use a different auto-complete type which shows all options easily</h3>

            <!-- https://blog.devgenius.io/vuetify-autocomplete-de19719dff0d -->


    </div>
</template>

<script id="querySelector">
   export default {
    data: () => ({
      items: [
        'why is jared the dumbest person on earth', 
        'what does simp mean', 
        'i dont know anything about pokemon', 
        'hell ya more queries'],
      values: ['foo', 'bar'],
      value: null,
    }),
  }
</script>

<style>

  .INTERACThome{
      padding:25px;
  }  

  .querySelector{

    }

</style>
