// const { default: VueRouter } = require('vue-router');

// require('./bootstrap');

// window.Vue = require('vue');

// // 单文件组件
// const routes = [
    
// ];

// const router = new VueRouter({
//     routes // （缩写）相当于 routes: routes
// });

// const app = new Vue({
//     el: "#app",
//     router
// });

import Vue from 'vue'

import App from '~/App'

Vue.config.productionTip = false

/* eslint-disable no-new */
new Vue({
  ...App
})