<template>
  <div class="HOMEhome">

      <!-- maybe replace with plaintext?? -->
      <p></p>
      <div class=headerImage></div>

      <p> </p> <!-- spacer -->

      <v-card 
        elevation="2"
        shaped
        class = "card"
      >
        <div class="cardInner">
          <h2>Group Info</h2>
          <pre><h4>Colin Johnson    -- johns233@myumanitoba.ca</h4></pre>
          <pre><h4>Jacob Janzen     -- janzenj2@myumanitoba.ca</h4></pre>
          <pre><h4>Daniel La Rocque -- larocq17@myumanitoba.ca</h4></pre>
          <pre><h4>Jared Webber     -- webberj1@myumanitoba.ca</h4></pre>
        </div>
      </v-card>

      <v-card
        elevation="2"
        shaped
        class = "card"
      >
        <div class="cardInner">
          <h2>Github Repo</h2>
          <h4>All source files are available in our Github repo <a target="_blank" href = "https://github.com/JacobJanzen/3380_Project"> HERE</a></h4>
        </div>
      </v-card>

       <v-card
        elevation="2"
        shaped
        class = "card"
      >
        <div class="cardInner">
          <h2>Navigation</h2>
          <h4>Use the top menu to:</h4>
          <li>Read our project write-up</li>
          <li>View the ER Diagram & assumptions</li>
          <li>Interact with the database!</li>
          <ul class="tabcontent">
            <li>Click dropdown that says "What do you want to know?"</li>
            <li>Start typing or scroll through the list of queries</li>
            <li>New dropdown menus may appear after selecting the query</li>
            <li>Once all dropdowns are filled, click "QUERY!" to run the query</li>
            <li>To save the results of the query, click "DOWNLOAD"</li>
            <li>To run a new query, click "NEW QUERY"</li>
          </ul>
        </div>
      </v-card>

        <!-- dumb & lazy footer spacer -->
         <v-card
        elevation="2"
        shaped
        class = "invisibleCard"
      >
        <div class="cardInner">
        </div>
      </v-card>
      

  </div>
</template>


<style lang="scss" scoped>

  .tabcontent{
    padding-left:50px;
  }

  .HOMEhome{
    background-image: url("../assets/bkg.png");
    height: 100%;    
    width: 100%;
    overflow: hidden;
    background-size: cover;
    background-position: center;
    }

  .headerImage{
    background-image: url("../assets/PokeDB.jpg");
    width: 100%;
    height: 12vh;
    background-size: cover;
    //overflow: hidden;
    background-position: center;
    border-bottom: solid, black, 2px;
    margin-bottom:20px;
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

  .invisibleCard{
    opacity: 0;
  }

</style>
