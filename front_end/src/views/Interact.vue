<template>
    <div class="INTERACThome">
        <h1>Interact with the Database!</h1>

        <h3>Select which info you're looking for in the drop-down below</h3>
    <v-container fluid>
      <v-row align="center">
        <v-col cols="6">
          <v-subheader>
            Custom items
          </v-subheader>
        </v-col>

        <v-col cols="6">
          <v-select
            v-model="select"
            :hint="`${select.state}, ${select.abbr}`"
            :items="items"
            item-text="state"
            item-value="abbr"
            label="Select"
            persistent-hint
            return-object
            single-line
          ></v-select>
        </v-col>
      </v-row>
    </v-container>

    <!-- this shit dont work https://vuetifyjs.com/en/components/selects/ -->

            <br>
            <h3>BASED ON ABOVE QUERY SELECTION, HAVE MORE DROP-DOWNS TO SELECT PARAMETERS</h3>
            <h3>Probably use a different auto-complete type which shows all options easily</h3>

            <!-- Maybe use combobox instead - only allow single selection at a time ?
                  with 'change' event to trigger parameter popup options?-->


    </div>
</template>

<script>
  export default {
    data () {
      return {
        select: { state: 'Florida', abbr: 'FL' },
        items: [
          { state: 'Florida', abbr: 'FL' },
          { state: 'Georgia', abbr: 'GA' },
          { state: 'Nebraska', abbr: 'NE' },
          { state: 'California', abbr: 'CA' },
          { state: 'New York', abbr: 'NY' },
        ],
      }
    },
  }
</script>

<style>

  .INTERACThome{
      padding:25px;
  }  

  .querySelector{

    }

</style>
