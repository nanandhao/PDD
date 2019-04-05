<template>
  <div class="search" >
    <search-nav @isShow="showBox"/>
    <search-scroll />
    <search-window v-show="flag" @isShow="showBox"/>
  </div>
</template>
<script>
import SearchNav from './children/SearchNav';
import SearchScroll from './children/SearchScroll';
import SearchWindow from './children/SearchWindow';

export default {
  name: 'Search',
  data() {
    return {
      // 显示隐藏搜索界面
      flag: false,
    };
  },
  components: {
    SearchNav,
    SearchScroll,
    SearchWindow,
  },
  methods: {
    showBox(flag) {
      this.flag = flag;
    },
  },
};
</script>
<style lang='stylus' ref='stylesheet/stylus' scoped>
  .search
    width 100%
    height 100%
    overflow hidden
    position relative
</style>
