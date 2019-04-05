<template>
  <div class="search-scroll">
    <div class="search-scroll-left">
      <div class="left-contont">
        <div v-for="(item,index) in searchdata" :key="index" @click="selecet(index)" ref="menulist">
          <a href="javascript:;" :class="{active: index === activeIndex}">{{item.name}}</a>
        </div>
      </div>
    </div>
    <div class="search-scroll-right">
      <ul class="right-contont"  ref="rightContont">
        <li class="right-contont-list" v-for="(item,index) in searchdata" :key="index">
          <div class="shops-title">
            <h4>{{item.name}}</h4>
            <a href="javascript:;">查看更多></a>
          </div>
          <ul class="shops-list">
            <li v-for="(shop,num) in item.items" :key="num">
              <img :src="shop.icon" :alt="shop.title">
              <span>{{shop.title}}</span>
            </li>
          </ul>
        </li>
      </ul>
    </div>
  </div>
</template>

<script>
import { mapState } from 'vuex';
import BScroll from 'better-scroll';

export default {
  name: '',
  data() {
    return {
      leftScroll: null,
      rightScroll: null,
      scrollY: 0, // 右侧列表滑动的Y轴坐标(实时更新)
      rightLiTops: [], // 所有分类的头部位置
    };
  },
  mounted() {
    this.$store.dispatch('reqSearchData');
  },
  computed: {
    ...mapState(['searchdata']),
    // 根据到顶部距离获得索引，进行联动
    activeIndex() {
      return this.rightLiTops.findIndex((top, index) => {
        return this.scrollY >= top && this.scrollY < this.rightLiTops[index + 1];
      });
    },
  },
  watch: {
    // 初始化
    searchdata() {
      this.$nextTick(() => {
        this.leftScroll = new BScroll('.search-scroll-left', {
          scrollY: true,
          scrollX: false,
          mouseWheel: true,
          click: true,
          taps: true,
        });
        this.rightScroll = new BScroll('.search-scroll-right', {
          probeType: 3,
          scrollY: true,
          scrollX: false,
          mouseWheel: true,
          click: true,
          taps: true,
        });
        this.getScrollY();
        this.getRightLi();
      });
    },
  },
  methods: {
    // 获得后边导航滚动距离
    getScrollY() {
      this.rightScroll.on('scroll', (pos) => {
        this.scrollY = Math.abs(pos.y);
        // 右侧滚动时，左侧也跟着滚动
        this.LScroll(this.activeIndex);
      });
    },
    // 获得后边导航每个LI的高度，然后与左边导航进行联动
    getRightLi() {
      const arr = [];
      let fist = 0;
      arr.push(fist);
      const aLa = this.$refs.rightContont.getElementsByClassName('right-contont-list');
      Array.prototype.slice.call(aLa).forEach((li) => {
        fist += li.clientHeight;
        arr.push(fist);
      });
      this.rightLiTops = arr;
    },
    // 点击选中
    selecet(index) {
      this.scrollY = this.rightLiTops[index];
      console.log(this.scrollY);
      this.rightScroll.scrollTo(0, -this.scrollY, 300);
      // 1.4 左侧联动
      this.LScroll(index);
    },
    LScroll(index) {
      const menuLists = this.$refs.menulist;
      const el = menuLists[index];
      this.leftScroll.scrollToElement(el, 300, 0, -100);
    },
  },
};
</script>

<style lang='stylus' ref='stylesheet/stylus' scoped>
  .search-scroll
    display flex
    width 100%
    height 100%
    color #999
    .search-scroll-left
      height 100%
      overflow hidden
      flex 1
      .left-contont
        padding-bottom 2.2rem
        div
          height 1.2rem
          display flex
          flex-direction column
          justify-content center
          align-items center
          font-size .32rem
          font-weight: lighter
          background-color #fafafa
          color #ccc
          a
            position relative
            width 100%
            height .5rem
            text-align center
            line-height .5rem
          .active
            color red
          .active::before
            content ""
            width .06rem
            height 100%
            background-color red
            position absolute
            top 0
            left 0
    .search-scroll-right
      background-color #fff
      flex 4
      .right-contont
        padding-bottom 6.8rem
        .right-contont-list
          .shops-title
            font-size .26rem
            display flex
            padding .1rem .3rem
            height .4rem
            justify-content space-between
            align-items center
          .shops-list
            width 100%
            display flex
            flex-wrap wrap
            li
              display flex
              flex-direction column
              font-size .26rem
              width 33.3%
              height 2rem
              justify-content center
              align-items center
              img
                width 60%
              span
                margin-top .1rem
</style>

