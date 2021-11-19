<template>
    <div class="home">
        <h1>Interact with the Database!</h1>

          <v-toolbar
                dark
                color="blue"
                class = "querySelector"
            >
                <v-toolbar-title>Select Query</v-toolbar-title>
                <v-autocomplete
                v-model="select"
                :loading="loading"
                :items="items"
                :search-input.sync="search"
                cache-items
                class="mx-4"
                flat
                hide-no-data
                hide-details
                label="What do you want to know?"
                solo-inverted
                ></v-autocomplete>
            </v-toolbar>


            <br>
            <h3>BASED ON ABOVE QUERY SELECTION, HAVE MORE DROP-DOWNS TO SELECT PARAMETERS</h3>
            <h3>Probably use a different auto-complete type which shows all options easily</h3>


    </div>
</template>

<script id="querySelector">
  export default {
    data () {
      return {
        loading: false,
        items: [],
        search: null,
        select: null,
        queries: [
          'How many pokemon are on vacation',
          'what am i doing',
          'rip josh',
          'i miss you',
        ],
      }
    },
    watch: {
      search (val) {
        val && val !== this.select && this.querySelections(val)
      },
    },
    methods: {
      querySelections (v) {
        this.loading = true
        // Simulated ajax query
        setTimeout(() => {
          this.items = this.queries.filter(e => {
            return (e || '').toLowerCase().indexOf((v || '').toLowerCase()) > -1
          })
          this.loading = false
        }, 500)
      },
    },
  }
</script>

<style>

  .home{
      padding:25px;
  }  

  .querySelector{

    }

</style>
