<template>
  <div class="home">
    <div class="swiper-container">
      <div class="swiper-wrapper">
        <div class="swiper-slide" v-for="(item,index) in homecarousel" :key="index">
          <img :src="item.imgurl" alt="">
        </div>
      </div>
      <!-- 如果需要分页器 -->
      <div class="swiper-pagination"></div>
    </div>
    <hot-nav/>
    <div class="ad">
      <!-- <img src="http://localhost:3001/images/home/center_banner.jpeg" alt="" width="100%"> -->
      <img src="http://www.haoandnan.top:81/images/home/center_banner.jpeg" alt="" width="100%">
    </div>
    <hot-list/>
  </div>
</template>

<script>
import Swiper from 'swiper';
import 'swiper/dist/css/swiper.min.css';
import { mapState } from 'vuex';
import HotNav from './HotNav';
import HotList from './HotList';

export default {
  name: 'Hot',
  data() {
    return {

    };
  },
  computed: {
    ...mapState(['homecarousel']),
  },
  mounted() {
    this.$store.dispatch('reqHomeCarousel');
  },
  components: {
    HotNav,
    HotList,
  },
  watch: {
    homecarousel() {
      this.$nextTick(() => {
        this.mySwiper = new Swiper('.swiper-container', {
          autoplay: true, // 可选选项，自动滑动
          loop: true, // 是否循环播放
          speed: 300, // 运动快慢
          // 分页器
          pagination: {
            el: '.swiper-pagination',
          },
        });
      });
    },
  },
};
</script>

<style lang='stylus' ref='stylesheet/stylus' scoped>
  .home
    margin-top .85rem
    width 100%
    height 100%
    img
      width 100%
    .ad
      width 100%
      margin-top .1rem
      background-color #fff
</style>

