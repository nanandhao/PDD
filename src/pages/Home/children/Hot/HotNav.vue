<template>
  <div class="hot_nav">
    <div class="hot_list_contenter">
      <div class="nav-content-inner">
        <div v-for="(item,index) in homenav" :key="index">
          <a href="javascript:;">
            <img :src="item.iconurl" alt="">
            <span>{{item.icontitle}}</span>
          </a>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import { mapState } from 'vuex';

export default {
  name: 'HotNav',
  data() {
    return {

    };
  },
  mounted() {
    this.$store.dispatch('reqHomeNav');
  },
  computed: {
    ...mapState(['homenav']),
  },
};
</script>

<style lang='stylus' ref='stylesheet/stylus' scoped>
  .hot_nav
    width 100%
    height 3.2rem
    background-color #fff
    .hot_list_contenter
      width 100%
      overflow-x scroll
      .nav-content-inner
        width 15rem
        display flex
        flex-wrap wrap
        div
          width 1.875rem
          height 1.6rem
          font-size .16rem
          display flex
          a
            flex 1
            display flex
            flex-direction column
            justify-content center
            align-items center
            img
              width 45%
    .hot_list_contenter::-webkit-scrollbar
      display none
</style>
