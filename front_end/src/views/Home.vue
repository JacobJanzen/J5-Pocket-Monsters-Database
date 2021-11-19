<template>
  <div class="home">

      <!-- idk if this is what it was designed for -->
      <div class=headerImage></div>

      <p> </p>

      <v-card
        elevation="2"
        shaped
        class = "card"
      >
      <div class="cardInner">
        <h2>Group Info</h2>
        <h4>Jared Webber -- webberj1@myumanitoba.ca</h4>
        <h4>Jared Webber -- webberj1@myumanitoba.ca</h4>
        <h4>Jared Webber -- webberj1@myumanitoba.ca</h4>
        <h4>Jared Webber -- webberj1@myumanitoba.ca</h4>

        <br>

        <h2>Github Repo</h2>
        <h4>All our source files are available in our Github repo <a href = ""> HERE</a></h4>
      </div>
      
      </v-card>

  </div>
</template>


<style lang="scss" scoped>

  .home{
    background-image: url("../assets/bkg.png");
    background-size: cover;
    background-position: center;
    height: 120%;
    width:100%;
    align-content: center;
  }

  .headerImage{
    background-image: url("../assets/PokeDB.jpg");
    width: 100%;
    height: 15%;
    background-size: cover;
    background-position: center;
  }

  .h1 {
    color: grey;
  }

  .card{
    margin: 20px;
  }

  .cardInner{
    padding: 15px;
  }

</style>