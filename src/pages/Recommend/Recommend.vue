<template>
  <div ref="mescroll" class="mescroll">
    <div class="recommend_box" ref="recommend_box">
      <shop-list
        v-for="(item,index) in recommendshoplist"
        :key="index"
        :item=item
      />
    </div>
  </div>
</template>
<script>
import MeScroll from 'mescroll.js';
import { mapState } from 'vuex';
import 'mescroll.js/mescroll.min.css';
import ShopList from './../../components/ShopList/ShopList';

export default {
  name: 'Recommend',
  data() {
    return {
      mescroll: null, // mescroll实例对象
      size: 10, // 下拉刷新使用
    };
  },
  computed: {
    ...mapState(['recommendshoplist']),
  },
  components: {
    ShopList,
  },
  mounted() {
    this.mescroll = new MeScroll(this.$refs.mescroll, { // 在mounted初始化mescroll,确保此处配置的ref有值
      up: {
        callback: this.upCallback,
        page: {
          num: 0, // 当前页 默认0,回调之前会加1; 即callback(page)会从1开始
          size: 10, // 每页数据条数,默认10
        },
      },
      down: {
        callback: this.downCallback,
      },
    });
  },
  watch: {
    recommendshoplist() {
      this.$nextTick(() => {
        this.mescroll.endSuccess(this.recommendshoplist.length);
      });
    },
  },
  methods: {
    upCallback(page) {
      this.size = page.size;
      const params = {
        num: (page.num - 1) * page.size,
        size: page.size,
      };
      // 这里有个无数次拖动都会发送请求的BUG
      this.$store.dispatch('reqRecommendShopList', params);
    },
    downCallback() {
      const size = this.size;
      const params = {
        num: 0,
        size,
      };
      // 下拉刷新
      this.$store.dispatch('reqRecommendShopList', params);
      // mescroll恢复原来的页码
      this.mescroll.setPageNum(1);
    },
  },
};
</script>

<style lang='stylus' ref='stylesheet/stylus' scoped>
  .recommend_box
    display flex
    flex-wrap wrap
</style>
