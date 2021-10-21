<template>
  <div class="home">
    <h1>Ambitious Pokemon Database </h1>
    <v-img :src="bkg"></v-img>
  </div>
</template>

<script>
  export default {
    data() {
      return {
        bkg: require(`@/assets/bkg.png`)
      }
    },

  }

  
</script>

<style lang="scss" scoped>
.h1 {
  color: grey;
}
</style>