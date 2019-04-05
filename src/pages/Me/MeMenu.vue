<template>
  <div class="me-menu">
    <div>
      <div class="me-username">
          <img src="./images/me_icon.png" alt="">
          <span @click="showInfo=true">{{userInfo.user_phone | phoneFormat}}</span>
          <i class="itlike-3"></i>
      </div>
      <div class="me-order">
        <div class="older-top">
          <h3>我的订单</h3>
          <span>查看全部 > </span>
        </div>
        <div class="older-bottom">
          <div class="bottom-item">
            <i class="itlike-1"></i>
            <span>待付款</span>
          </div>
          <div class="bottom-item">
            <i class="itlike-2"></i>
            <span>待分享</span>
          </div>
          <div class="bottom-item">
            <i class="itlike-3"></i>
            <span>待发货</span>
          </div>
          <div class="bottom-item">
            <i class="itlike-4"></i>
            <span>待收货</span>
          </div>
          <div class="bottom-item">
            <i class="itlike-5"></i>
            <span>待评价</span>
          </div>
        </div>
      </div>
      <div class="me-setting-box">
        <div class="setting-item">
          <i class="itlike-1"></i>
          <span>新人红包</span>
        </div>
        <div class="setting-item">
          <i class="itlike-2"></i>
          <span>多多果园</span>
        </div>
        <div class="setting-item">
          <i class="itlike-3"></i>
          <span>砍价免费拿</span>
        </div>
        <div class="setting-item">
          <i class="itlike-4"></i>
          <span>边逛边赚</span>
        </div>
        <div class="setting-item">
          <i class="itlike-5"></i>
          <span>天天领红包</span>
        </div>
        <div class="setting-item">
          <i class="itlike-uniE902"></i>
          <span>收货地址</span>
        </div>
        <div class="setting-item">
          <i class="itlike-1"></i>
          <span>我的评价</span>
        </div>
        <div class="setting-item">
          <i class="itlike-3"></i>
          <span>官方客服</span>
        </div>
        <router-link tag="div" class="setting-item" to="/setting">
          <i class="itlike-4"></i>
          <span>设置</span>
        </router-link>
      </div>
    </div>
    <me-info v-if="showInfo" @setInfoShow = "setInfoShow"/>
  </div>
</template>

<script>
import { mapState } from 'vuex';
import MeInfo from './MeInfo';

export default {
  name: 'MeMenu',
  data() {
    return {
      showInfo: false,
    };
  },
  components: {
    MeInfo,
  },
  computed: {
    ...mapState(['userInfo']),
  },
  filters: {
    phoneFormat(phone) {
      // 1. 转成数组
      let phoneArr = [...phone];
      // 2. 遍历
      let str = '';
      phoneArr.forEach((item, index) => {
        if (index === 3 || index === 4 || index === 5 || index === 6) {
          str += '*';
        } else {
          str += item;
        }
      });
      return str;
    },
  },
  methods: {
    setInfoShow() {
      this.showInfo = false;
    },
  },
};
</script>

<style lang='stylus' ref='stylesheet/stylus' scoped>
  .me-menu
    width 100%
    height 100%
    padding .2rem
    box-sizing border-box
    position relative
    .me-username
      width 100%
      height 2rem
      background #fff
      display flex
      align-items center
      font-size .3rem
      img
        width 20%
        border-radius 50%
        margin-left .4rem
      span
        margin-left .2rem
      .itlike-3
        margin-left .1rem
        font-size .5rem
    .me-order
      width 100%
      height 2rem
      background-color #fff
      margin-top .2rem
      font-size .3rem
      .older-top
        height .6rem
        display flex
        justify-content space-between
        align-items center
        font-size .28rem
        padding 0 .18rem
      .older-bottom
        display flex
        justify-content center
        align-items center
        height 1.4rem
        .bottom-item
          flex 1
          display flex
          flex-direction column
          justify-content center
          align-items center
          i[class^="itlike"]
            font-size .55rem
            color red
          span
            margin-top .1rem
    .me-setting-box
      width 100%
      background-color #fff
      display flex
      align-items center
      flex-wrap wrap
      font-size .28rem
      padding-bottom .2rem
      .setting-item
        width 25%
        display flex
        flex-direction column
        justify-content center
        align-items center
        margin-top .2rem
        i[class^="itlike"]
          font-size .55rem
          color #f6a622
        span
          margin-top .1rem
</style>

