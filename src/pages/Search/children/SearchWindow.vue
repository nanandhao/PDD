<template>
<div class="SearchWindow">
  <div class="SearchWindow-input">
    <div class="input-box">
      <img src="./../images/search.png">
      <input type="text" placeholder="请输入商品名称" ref="mySearch">
    </div>
    <div class="input-box-cancel" @click="showBoxFlag">取消</div>
  </div>
  <div class="keyword-list">
    <div class="hot">
      <img src="./../images/hot.png" alt="">
      <span>热门搜索</span>
    </div>
    <ul class="list">
      <li>石榴水果</li>
      <li>床上用品</li>
      <li>手机</li>
      <li>床上用品</li>
      <li>零食食品</li>
      <li>电脑配件</li>
    </ul>
  </div>
</div>
</template>

<script>
export default {
  name: '',
  data() {
    return {

    };
  },
  mounted() {
    this.$refs.mySearch.focus();
  },
  methods: {
    showBoxFlag() {
      this.$emit('isShow', false);
    },
  },
};
</script>

<style lang='stylus' ref='stylesheet/stylus' scoped>
  @import "../../../common/stylus/mixins.styl"
  .SearchWindow
    width 100%
    height 100%
    position absolute
    z-index 8888
    left 0
    top 0
    background-color #fff
    font-size 16px
    .SearchWindow-input
      display flex
      justify-content center
      align-items center
      width 100%
      height 1.2rem
      border-bottom-1px(#dddddd)
      .input-box
        width 75%
        height .8rem
        background-color #ededed
        border-radius .1rem
        display flex
        justify-content center
        align-items center
        img
          width .6rem
        input
          height .7rem
          font-size 16px
          font-weight lighter
          color #ccc
          width 80%
          border none
          background-color transparent
          padding-left 10px
          color #aaa
          outline none
      .input-box-cancel
        width 10%
        color #ccc
        text-align center
        height .7rem
        line-height .7rem
        margin-left .2rem
        cursor pointer
    .keyword-list
      width 100%
      padding .8rem .5rem
      .hot
        width 100%
        display flex
        justify-content left
        align-items center
        color #ccc
        img
          width .5rem
      .list
        display flex
        flex-wrap wrap
        li
          background-color #ededed
          border-radius .2rem
          padding .14rem
          color #ccc
          margin-top .15rem
          margin-left .4rem
</style>
