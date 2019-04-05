<template>
<div class="home_shop">
  <div class="home_shop_list" v-for="(shop,index) in shoplist" :key="index">
    <div class="home_shop_list_t">
      <a href="javascript:;">
        <img :src="shop.image_url" alt="" width="100%">
      </a>
      <a href="javascript:;">
        <span>{{shop.short_name}}</span>
      </a>
    </div>
    <div class="home_shop_list_b">
      <div class="home_shop_list_b_l">
        <span class="price">￥{{shop.normal_price / 100}}</span>
        <span class="amount">{{shop.sales_tip}}</span>
      </div>
      <div class="home_shop_list_b_r">
        <span class="user"><img :src="user.avatar" alt="" v-for="(user, index1) in shop.bubble" :key="index1"></span>
        <span class="buy"><button>去拼单</button></span>
      </div>
    </div>
  </div>
</div>
</template>

<script>
import { mapState } from 'vuex';

export default {
  name: 'HotList',
  data() {
    return {

    };
  },
  computed: {
    ...mapState(['shoplist']),
  },
  mounted() {
    this.$store.dispatch('reqShopList');
  },
};
</script>

<style lang='stylus' ref='stylesheet/stylus' scoped>
  .home_shop
    margin-bottom 1.6rem
    .home_shop_list
      border-top 8px solid #f5f5f5
      display flex
      flex-direction column
      background-color #fff
      .home_shop_list_t
        a
          &:last-child
            font-size .34rem
            display block
            width 96%
            height 1rem
            margin 0 auto
            line-height .52rem
      .home_shop_list_b
        display flex
        width 100%
        height .8rem
        .home_shop_list_b_l
          flex 1
          display flex
          justify-items center
          align-items center
          .price
            font-size .44rem
            font-weight bolder
            color red
          .amount
            font-size .12rem
            color #ccc
            margin-left .1rem
        .home_shop_list_b_r
          flex 1
          display flex
          justify-items center
          align-items center
          justify-content space-around
          span
            display flex
            justify-items center
            align-items center
            img
              width .6rem
              border-radius 50%
            img
              &:nth-child(n+2)
                margin-left -10px
          .buy
            button
              width 2rem
              height .67rem
              font-size .3rem
              border none
              color #fff
              display flex
              justify-content center
              align-items center
              margin-left 10px
              background-color red
              border-radius 8px
</style>
