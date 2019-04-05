// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue';
import { Actionsheet, DatetimePicker } from 'mint-ui';
import LyTab from 'ly-tab';
import App from './App';
import router from './router';
import store from './store';
// 配置字体图标
import './common/css/style.css';
// 引入mint样式文件
import '../node_modules/mint-ui/lib/style.css';
// 配置mint-ui
Vue.component(Actionsheet.name, Actionsheet);
Vue.component(DatetimePicker.name, DatetimePicker);
// 配置LyTab
Vue.use(LyTab);

Vue.config.productionTip = false;

/* eslint-disable no-new */
new Vue({
  el: '#app',
  router,
  store,
  components: { App },
  template: '<App/>',
});
