<template>
  <v-app id="app">
      <v-bottom-navigation
      v-model="value"
      :background-color="color"
      grow
      shift
      mandatory
      >

      <v-btn to="/" class="nav-btn" :color="color" rounded fab>
        <v-icon>mdi-home</v-icon>
        <span> Home </span>
      </v-btn>

      <v-btn to="/WriteUp" :color="color" rounded fab>
        <span>Write Up</span>
        <v-icon>mdi-pen</v-icon>
      </v-btn>

      <v-btn to="/ER" :color="color" rounded fab>
        <v-icon>mdi-graph</v-icon>
        <span>ER Diagram</span>
      </v-btn>

      <v-btn to="/Interact" :color="color" rounded fab>
        <v-icon>mdi-hand-okay</v-icon>
        <span>Interact</span>
      </v-btn>
      

      </v-bottom-navigation>

    <router-view />

    <!-- 
      ALL pages show anything here
      maybe just have a copy of the home page here - or a reference
      and then when the menu is clicked, hide the copy in this file??
    
    -->



  </v-app>   
</template>

<style>
  .v-bottom-navigation {
    justify-content: left;
  }
</style>

<script>
export default {
  data: () => ({
     value: 0
     }),

     created() {
      window.addEventListener('beforeunload', function(event) {
         event.returnValue = 'value: 0'
      })
    },
  
  computed: {
    color () {
      switch (this.value) {
        case 0: return '#A2D7D5'
        case 1: return '#DF807E'
        case 2: return '#F5E97E'
        case 3: return '#89C893'
        default: return '#A2D7D5'
      }
    },
  },

}
</script>
