<template>
    <div class="tab_bar">
        <router-link tag="div" to="/home" class="tab_bar_home">
            <img :src="$route.path.includes('/home') ? tabBarImgArr[0].selected : tabBarImgArr[0].normal">
            <span :class="{active:$route.path.includes('/home')}">首页</span>
        </router-link>
        <router-link tag="div" to="/recommend" class="tab_bar_recommend">
            <img :src="$route.path.includes('/recommend') ? tabBarImgArr[1].selected : tabBarImgArr[1].normal">
            <span :class="{active:$route.path.includes('/recommend')}">推介</span>
        </router-link>
        <router-link tag="div" to="/search" class="tab_bar_search">
            <img :src="$route.path.includes('/search') ? tabBarImgArr[2].selected : tabBarImgArr[2].normal">
            <span :class="{active:$route.path.includes('/search')}">搜索</span>
        </router-link>
        <router-link tag="div" to="/car" class="tab_bar_car">
            <span class="shop-count" v-if="shoptotal > 0">{{shoptotal}}</span>
            <img :src="$route.path.includes('/car') ? tabBarImgArr[3].selected : tabBarImgArr[3].normal">
            <span :class="{active:$route.path.includes('/car')}">购物车</span>
        </router-link>
        <router-link tag="div" to="/me" class="tab_bar_me">
            <img :src="$route.path.includes('/me') ? tabBarImgArr[4].selected : tabBarImgArr[4].normal">
            <span :class="{active:$route.path.includes('/me')}">我的</span>
        </router-link>
    </div>
</template>
<script>
import { mapState } from 'vuex';

const IconHome = require('./img/icon_home.png');
const IconHomeSelected = require('./img/icon_home_selected.png');
const IconIntro = require('./img/icon_intro.png');
const IconIntroSelected = require('./img/icon_intro_selected.png');
const IconSearch = require('./img/icon_search.png');
const IconSearchSelected = require('./img/icon_search_selected.png');
const IconChat = require('./img/icon_chat.png');
const IconChatSelected = require('./img/icon_chat_selected.png');
const IconMine = require('./img/icon_mine.png');
const IconMineSelected = require('./img/icon_mine_selected.png');

export default {
  name: 'TabBar',
  data() {
    return {
      tabBarImgArr: [
        { normal: IconHome, selected: IconHomeSelected },
        { normal: IconIntro, selected: IconIntroSelected },
        { normal: IconSearch, selected: IconSearchSelected },
        { normal: IconChat, selected: IconChatSelected },
        { normal: IconMine, selected: IconMineSelected },
      ],
    };
  },
  computed: {
    ...mapState(['shoptotal']),
  },
};
</script>

<style lang='stylus' ref='stylesheet/stylus' scoped>
.tab_bar
  position fixed
  width 100%
  bottom 0
  display flex
  justify-items center
  align-items center
  justify-content space-around
  background-color #ffffff
  padding .08rem 0
  div
    display flex
    flex-direction column
    justify-items center
    align-items center
    img
      width .65rem
    span
      margin-top .07rem
      font-size .28rem
  .tab_bar_car
    position relative
    .shop-count
      position absolute
      right 0
      top -.12rem
      width .25rem
      height .25rem
      border 2px solid #e12a1f
      background-color #e12a1f
      border-radius 50%
      font-size .16rem
      text-align center
      line-height .2rem
      color #fff
      font-weight 300
.active
  color red
</style>
