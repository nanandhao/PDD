// 1. 引入对应模块
import Vue from 'vue';
import VueRouter from 'vue-router';

import Home from './../pages/Home/Home';
import Recommend from './../pages/Recommend/Recommend';
import Search from './../pages/Search/Search';
import Car from './../pages/Car/Car';
import Me from './../pages/Me/Me';
import Login from './../pages/Login/Login';
import MeSetting from './../pages/Me/MeSetting';

import Hot from './../pages/Home/children/Hot/Hot';
import Dress from './../pages/Home/children/Dress';
import Box from './../pages/Home/children/Box';
import Mbaby from './../pages/Home/children/Mbaby';
import General from './../pages/Home/children/General';
import Food from './../pages/Home/children/Food';
import Shirt from './../pages/Home/children/Shirt';
import Man from './../pages/Home/children/Man';
import Ele from './../pages/Home/children/Ele';

// 2. 声明使用
Vue.use(VueRouter);

// 3. 输出路由对象
export default new VueRouter({
  mode: 'history',
  // 3.1 配置一级路由
  routes: [
    {
      path: '/',
      redirect: '/home/hot',
    },
    {
      path: '/home',
      component: Home,
      redirect: '/home/hot',
      meta: {
        showBottomTabBar: true,
      },
      children: [
        {
          path: 'hot',
          component: Hot,
          meta: {
            showBottomTabBar: true,
          },
        },
        {
          path: 'dress',
          component: Dress,
          meta: {
            showBottomTabBar: true,
          },
        },
        {
          path: 'box',
          component: Box,
          meta: {
            showBottomTabBar: true,
          },
        },
        {
          path: 'mbaby',
          component: Mbaby,
          meta: {
            showBottomTabBar: true,
          },
        },
        {
          path: 'general',
          component: General,
          meta: {
            showBottomTabBar: true,
          },
        },
        {
          path: 'food',
          component: Food,
          meta: {
            showBottomTabBar: true,
          },
        },
        {
          path: 'shirt',
          component: Shirt,
          meta: {
            showBottomTabBar: true,
          },
        },
        {
          path: 'man',
          component: Man,
          meta: {
            showBottomTabBar: true,
          },
        },
        {
          path: 'ele',
          component: Ele,
          meta: {
            showBottomTabBar: true,
          },
        },
      ],
    },
    {
      path: '/recommend',
      component: Recommend,
      meta: {
        showBottomTabBar: true,
      },
    },
    {
      path: '/search',
      component: Search,
      meta: {
        showBottomTabBar: true,
      },
    },
    {
      path: '/car',
      component: Car,
      meta: {
        showBottomTabBar: true,
      },
    },
    {
      path: '/me',
      component: Me,
      meta: {
        showBottomTabBar: true,
      },
    },
    {
      path: '/login',
      component: Login,
    },
    {
      path: '/setting',
      component: MeSetting,
    },
  ],
});
