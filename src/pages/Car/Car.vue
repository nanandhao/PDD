<template>
  <div class="car">
    <div v-if="userInfo.user_id" class="shop_car">
      <div class="shop_car_top">购物车</div>
      <div class="car_goods_list">
        <div class="shop_car_prompt">您正在安全购物环境中，请放心购物</div>
        <div class="car_goods_box">
          <div class="car_goods_item" v-for="(item,index) in shopcar" :key="index">
            <a href="javascript:;" :checked="item.checked" @click="selectOneGoods(item)"></a>
            <div class="goods_info">
              <div class="goods_img">
                <img :src="item.thumb_url">
              </div>
              <div class="goods_info_right">
                <h3 class="goods_title">{{item.goods_name}}</h3>
                <span class="goods_price">{{item.price/100 | moneyFilter}}</span>
                <div class="input_box">
                  <div class="amount_box"><span class="input_box_dowm" @click="setCount(item,false)">-</span><input type="text" maxlength="3" :value="item.goods_amount" disabled="disabled"><span class="input_box_up" @click="setCount(item,true)">+</span></div>
                  <a href="javascript:;" class="delete" @click="deleteBtn(item)"></a>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="shop_car_bottom">
        <div class="bottom_left">
          <a href="javascript:;" :checked="isAllSelect" @click="selectAllGoods"></a>
          <span>全选</span>
          <p class="price">合计：<span>{{money | moneyFilter}}</span></p>
        </div>
        <div class="bottom_right">
          <a href="javascript:;">去结算</a>
        </div>
      </div>
    </div>
    <select-login v-else/>
  </div>
</template>
<script>
import { mapState } from 'vuex';
import { MessageBox } from 'mint-ui';
import SelectLogin from './../Login/selecetLogin';

export default {
  name: 'Car',
  data() {
    return {
      isAllSelect: false,
      money: 0,
    };
  },
  computed: {
    ...mapState(['userInfo', 'shopcar']),
  },
  mounted() {
    this.checkedSelectedAll();// 检查是否全选
    this.totalPrice();// 商品价格合计
  },
  components: {
    SelectLogin,
  },
  filters: {
    moneyFilter(money) {
      return '￥' + money;
    },
  },
  watch: {
    // 监控购物车数据变化后，执行对应action重新商品价格合计,检查是否全选
    shopcar() {
      this.$nextTick(() => {
        this.checkedSelectedAll();// 检查是否全选
        this.totalPrice();// 商品价格合计
      });
    },
  },
  methods: {
    // 增加减少按钮
    setCount(item, isAdd) {
      item.isAdd = isAdd;
      item.callback = this.totalPrice;// 商品价格合计
      if (!isAdd) {
        if (item.goods_amount > 1) {
          this.$store.dispatch('setShopCount', item);
        } else {
          this.deleteBtn(item);
        }
      } else {
        this.$store.dispatch('setShopCount', item);
      }
    },
    // 删除按钮
    deleteBtn(params) {
      MessageBox.confirm('您确定删除该商品吗?').then((action) => {
        if (action === 'confirm') {
          this.$store.dispatch('deleteShop', params);
        }
      });
    },
    // 选中或者取消单个商品
    selectOneGoods(goods) {
      this.$store.dispatch('setSelectOneGoods', goods);
      this.checkedSelectedAll();// 检查是否全选
      this.totalPrice();// 商品价格合计
    },
    // 选中或者取消所有商品
    selectAllGoods() {
      this.isAllSelect = !this.isAllSelect;
      this.$store.dispatch('setSelectAllGoods', this.isAllSelect);
      this.totalPrice();// 商品价格合计
    },
    // 判断是否全选
    checkedSelectedAll() {
      let flag = true;
      this.shopcar.forEach((goods, index) => {
        if (!goods.checked) {
          flag = false;
        }
      });
      this.isAllSelect = flag;
      this.totalPrice();// 商品价格合计
    },
    // 商品价格合计
    totalPrice() {
      let sum = 0;
      this.shopcar.forEach((goods, index) => {
        if (goods.checked) {
          sum += (goods.price / 100) * goods.goods_amount;
        }
      });
      this.money = sum.toFixed(2);
    },
  },
};
</script>

<style lang='stylus' ref='stylesheet/stylus' scoped>
  .car
    width 100%
    height 100%
    overflow-x hidden
    .shop_car
      width 100%
      position relative
      padding-top .8rem
      .shop_car_top
        width 100%
        height .8rem
        position fixed
        left 0
        top 0
        z-index 8888
        background-color #fff
        text-align center
        line-height .8rem
        color red
        font-size .33rem
      .car_goods_list
        width 100%
        padding-bottom 1.95rem
        .shop_car_prompt
          width 100%
          height .6rem
          padding-left .3rem
          font-size .24rem
          background url("./images/safe_icon.png") no-repeat
          -webkit-background-size .3rem .3rem
          background-size .3rem .3rem
          background-position 1.8rem
          text-align center
          line-height .6rem
        .car_goods_box
          width 100%
          background-color #fff
          .car_goods_item
            height 2rem
            position relative
            padding .2rem .1rem .2rem .6rem
            a
              position absolute
              left .2rem
              top .4rem
              background  url("./images/shop-icon.png") no-repeat 0 0
              -webkit-background-size 1rem 2rem
              background-size 1rem 2rem
              width .4rem
              height .4rem
            a[checked]
              background-position -.5rem 0
            .goods_info
              display flex
              height 100%
              .goods_img
                width 3rem
                img
                  width 2rem
            .goods_info_right
              display flex
              margin-left .1rem
              flex-direction column
              .goods_title
                font-size .26rem
                line-height .4rem
                color #aaa
              .goods_price
                margin-top .2rem
                font-size .32rem
                color red
                font-weight bold
              .input_box
                display flex
                font-size .26rem
                width 100%
                margin-top .2rem
                height .6rem
                position relative
                .amount_box
                  width 1.64rem
                  height .4rem
                  border 1px solid #ccc
                  span
                    display inline-block
                    width .4rem
                    height .4rem
                    text-align center
                    line-height .4rem
                  .input_box_dowm
                    border-right 1px solid #ccc
                  .input_box_up
                    border-left 1px solid #ccc
                  input
                    text-align center
                    width .8rem
                    height .4rem
                    outline none
                    border none
                    padding 0
                    position relative
                    top -1px
                .delete
                  width .3rem
                  height .3rem
                  position absolute
                  left 4.2rem
                  top 0
                  background url("./images/delete_down.png") no-repeat
                  -webkit-background-size .3rem .3rem
                  background-size .3rem .3rem
                  &::before
                    content ''
                    width .3rem
                    height .2rem
                    background url("./images/delete_up.png") no-repeat
                    -webkit-background-size .3rem .1rem
                    background-size .3rem .1rem
                    position absolute
                    top -.04rem
      .shop_car_bottom
        width 100%
        height .8rem
        background-color #fff
        position fixed
        bottom 1.15rem
        left 0
        font-size .3rem
        display flex
        justify-content space-between
        align-items center
        .bottom_left
          display flex
          justify-content center
          align-items center
          margin-left .1rem
          a
            background  url("./images/shop-icon.png") no-repeat 0 0
            -webkit-background-size 1rem 2rem
            background-size 1rem 2rem
            width .4rem
            height .4rem
            margin-top .04rem
          a[checked]
            background-position -.5rem 0
          .price
           margin-left .14rem
           font-size .32rem
           span
            font-weight bold
            color red
        .bottom_right
          width 2rem
          height .8rem
          text-align center
          line-height .8rem
          background-color red
          a
            color #ffffff
</style>
