import { createRouter, createWebHistory } from 'vue-router';
import Home from '../views/pages/Home.vue';
import Login from '../views/pages/Login.vue';

const routes = [
  {
    path: '/',
    name: 'Home',
    component: Home,
  },
  {
    path: '/login',
    name: 'Login',
    component: Login,
  },
  
];

const router = createRouter({
  history: createWebHistory(),
  routes,
});

export default router;
