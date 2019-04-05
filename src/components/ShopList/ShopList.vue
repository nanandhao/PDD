<template>
  <div class="recommend">
    <div class="recommend_top">
      <a href="javascript:;">
        <img :src="item.thumb_url" alt="" width="100%">
      </a>
      <a href="javascript:;" class="shop_name">
        <p>{{item.short_name}}</p>
      </a>
    </div>
    <div class="recommend_bottom">
      <span class="price">¥{{item.price / 100}}</span>
      <span class="singe">{{item.sales_tip}}</span>
      <span class="add_car" @click="addShopCar(item)">加入购物车</span>
    </div>
    <select-login v-if="isShowLogin"/>
  </div>
</template>

<script>
import { mapState } from 'vuex';
import { Toast } from 'mint-ui';
import SelectLogin from './../../pages/Login/selecetLogin';

export default {
  name: 'ShopList',
  props: {
    item: Object,
  },
  data() {
    return {
      isShowLogin: false,
    };
  },
  mounted() {
  },
  components: {
    SelectLogin,
  },
  computed: {
    ...mapState(['userInfo']),
  },
  methods: {
    addShopCar(item) {
      let params = item;
      params.isAdd = true;
      if (this.userInfo.user_id) {
        this.$store.dispatch('postAddShopCar', params);
      } else {
        Toast({
          message: '请先登录',
          position: 'center',
          duration: 1500,
        });
        setTimeout(() => {
          this.isShowLogin = true;
        }, 1500);
      }
    },
  },
};
</script>

<style lang='stylus' ref='stylesheet/stylus' scoped>
  .recommend:nth-child(2n-1)
    margin-right 1%
    margin-left 0.5%
  .recommend
    background-color #fff
    width 49%
    height 5.2rem
    display flex
    flex-direction column
    justify-items center
    align-items center
    .recommend_top
      .shop_name
        display block
        margin-top .1rem
        font-size .24rem
        p
          overflow: hidden;
          line-height .28rem
          text-overflow: ellipsis
          display:-webkit-box //作为弹性伸缩盒子模型显示。
          -webkit-box-orient:vertical; //设置伸缩盒子的子元素排列方式--从上到下垂直排列
          -webkit-line-clamp:1 //显示的行
    .recommend_bottom
      margin-top .2rem
      display flex
      justify-items center
      align-items center
      .price
        font-size .3rem
        color red
        font-weight bolder
      .singe
        flex 2
        font-size .24rem
        color #cccccc
        margin-left .06rem
      .add_car
        width 1.6rem
        color #fff
        border 1px red solid
        border-radius .1rem
        height .5rem
        background-color red
        font-size .24rem
        margin 0 .1rem
        text-align center
        line-height .5rem
</style>

