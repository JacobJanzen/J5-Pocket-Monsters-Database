// Alternatively, omit the .min from the path for Vue debugging purposes.
import Vue from '../node_modules/vue/dist/vue.esm.browser.min.js';

const app = new Vue({
  el: '#app',
  data: {
    message: 'Hello Vue!'
  }
})