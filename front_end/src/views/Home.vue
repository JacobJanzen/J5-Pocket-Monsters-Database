<template>
  <div class="home">
    <h1>Ambitious Pokemon Database </h1>
    <!-- UNUSED <v-img :src="bkg"></v-img> -->
  </div>
</template>

<!-- UNUSED VUETIFY BACKGROUND
<script>
  export default {
    data() {
      return {
        bkg: require(`@/assets/bkg.png`)
      }
    },
  }
</script>
-->

<style lang="scss" scoped>

  .home{
    background-image: url("../assets/bkg.png");
    background-size: cover;
    background-position: center;
    height: 120%;
    width:100%;
  }

  .h1 {
    color: grey;
  }
</style>