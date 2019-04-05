<template>
  <div class="me-cell" @click="clickCell(leftTitle)">
    <div class="cell-left">
      <i :class="leftIcon" v-show="leftIcon"></i>
      <span style="{color:leftTitleColor}" v-show="leftTitle">{{leftTitle}}</span>
    </div>
    <div class="cell-right">
      <span style="{color:rightTitleColor}" v-show="rightTitle">接收</span>
      <i class="itlike-uniE909" v-show="isShowRightArrow"></i>
    </div>
  </div>
</template>

<script>
export default {
  name: 'MeCell',
  data() {
    return {
    };
  },
  props: {
    leftTitle: { type: String, default: '' }, // 左侧文字内容
    leftIcon: { type: String, default: '' }, // 左侧文字图标
    rightTitle: { type: String, default: '' }, // 右侧文字内容
    leftTitleColor: { type: String, default: '' }, // 左侧文字颜色
    rightTitleColor: { type: String, default: '' }, // 右侧文字颜色
    isShowRightArrow: { type: Boolean, default: true }, // 右侧箭头显示开关
    clickCell: { type: Function, default: () => {} }, // 组件点击事件
  },
};
</script>

<style lang='stylus' ref='stylesheet/stylus' scoped>
  .me-cell
    width 100%
    height .8rem
    background-color #fff
    font-size .28rem
    display flex
    justify-content space-between
    align-items center
    box-sizing border-box
    padding 0 .2rem
</style>

