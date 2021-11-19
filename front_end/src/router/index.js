import Vue from "vue";
import VueRouter from "vue-router";
import Home from "../views/Home.vue";
import ER from "../views/ER.vue";
import WriteUp from "../views/WriteUp.vue"
import Interact from "../views/Interact.vue"

Vue.use(VueRouter);

const routes = [
  {
    path: "/",
    name: "Home",
    component: Home,
  },
  {
    path: "/ER",
    name: "ER",
    component: ER,
  },
  {
    path: "/WriteUp",
    name: "WriteUp",
    component: WriteUp,
  },
  {
    path: "/Interact",
    name: "Interact",
    component: Interact,
  }
];

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes,
});

export default router;
