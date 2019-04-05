<template>
  <div id="app">
    <router-view></router-view>
    <tab-bar v-show="$route.meta.showBottomTabBar" />
  </div>
</template>

<script>
import { mapState } from 'vuex';
import TabBar from './components/TabBar/TabBar';

export default {
  name: 'App',
  components: {
    TabBar,
  },
  computed: {
    ...mapState(['shopcar', 'userInfo']),
  },
  mounted() {
    this.$store.dispatch('reqUserInfo');// 请求用户信息
  },
  watch: {
    // 监控用户登录后，请求购物车数据
    userInfo() {
      this.$nextTick(() => {
        this.$store.dispatch('reqShopCar');// 请求购物车数据
      });
    },
    // 监控购物车数据变化后，执行对应action重新统计商品数量
    shopcar() {
      this.$nextTick(() => {
        this.$store.dispatch('setShopTotal');// 商品数量统计,Tabbar购物车图标显示的商品数量
      });
    },
  },
};
</script>

<style lang='stylus' ref='stylesheet/stylus' scoped>
  #app
    width 100%
    height 100%
    background #F5F5F5
    position relative
</style>
