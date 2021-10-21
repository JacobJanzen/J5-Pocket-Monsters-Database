<template>
  <div class="root">
    <h1>This is an ER page</h1>
    <v-img :src="diagram" aspect-ratio=""></v-img>

    <p>
      Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus viverra ante sit amet scelerisque sagittis. Nullam congue molestie ex ut luctus. Nullam nisi magna, interdum sit amet imperdiet quis, semper at elit. Phasellus vel turpis eget quam molestie pulvinar. Praesent aliquam semper elit, id tristique ex tempor et. Sed mattis justo tortor, tincidunt ullamcorper ex condimentum sed. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras eros elit, tempus sed mauris scelerisque, congue pretium turpis. Pellentesque gravida efficitur molestie. Sed euismod eget mauris at tempus. Morbi eu magna non mauris efficitur dignissim.
    </p>
    <p>
Nunc quis erat enim. In tincidunt, libero ut aliquet pellentesque, neque felis malesuada ligula, a venenatis metus velit et diam. Quisque odio libero, blandit non metus sit amet, fringilla pharetra lacus. Nullam et neque sem. Nulla facilisis tortor nisi, vel efficitur lectus facilisis sit amet. Vivamus ut ullamcorper sapien, ut eleifend nisl. Vestibulum maximus ante nisi, eget blandit arcu fringilla ac. Sed dictum luctus magna, quis ornare odio lacinia et. Proin dignissim convallis sapien, in congue quam finibus id. Nullam nec volutpat mauris. Suspendisse erat nunc, feugiat nec elit quis, feugiat congue risus.
    </p>
  </div>
</template>


<script>
export default {
  data () {
    return {
      diagram: require("@/assets/ER.png")
    }
  }
}
</script>

<style>

  .root h1 {
    color:gold;
  }

  .root p {
    padding-left: 14px;
    font-family: Arial, "Helvetica Neue", Helvetica, sans-serif
  }
</style>