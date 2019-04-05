<template>
  <div class="search_input" >
    <div class="search_input_btn" @click="showBoxFlag">
      <img src="./../images/search.png" alt="">
      <span>请输入商品名称</span>
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
  methods: {
    showBoxFlag() {
      this.$emit('isShow', true);
    },
  },
};
</script>

<style lang='stylus' ref='stylesheet/stylus' scoped>
  @import "../../../common/stylus/mixins.styl"
  .search_input
    position fixed
    top 0
    left 0
    z-index 999
    width 100%
    height 1.1rem
    display flex
    justify-content center
    align-items center
    background-color #fff
    border-bottom-1px(#ccc)
    .search_input_btn
      display flex
      justify-content center
      align-items center
      width 90%
      height .8rem
      background-color #e8e8e8
      font-size .36rem
      border-radius .15rem
      color #aaa
      cursor pointer
      img
        width .5rem
        margin-right .1rem
</style>
