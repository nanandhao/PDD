import Vue from 'vue';

import {
  HOME_CACROUSEL,
  HOME_NAV,
  HOME_SHOP_LIST,
  RECOMMEND_SHOP_LIST,
  RESET_RECOMMEND,
  SEARCH_DATA,
  USER_INFO,
  SHOP_CAR,
  SHOP_COUNT,
  DELETE_SHOP,
  SHOP_TOTAL,
  SELECT_ONE_GOODS,
  SELECT_ALL_GOODS,
} from './mutation-types';

export default {
  // 修改state中的轮播图数据
  [HOME_CACROUSEL](state, { homecarousel }) {
    state.homecarousel = homecarousel;
  },
  // 修改state中的homenav数据
  [HOME_NAV](state, { homenav }) {
    state.homenav = homenav;
  },
  // 修改state中的shoplist数据
  [HOME_SHOP_LIST](state, { shoplist }) {
    state.shoplist = shoplist;
  },
  // 修改state中的recommendshoplist数据
  [RECOMMEND_SHOP_LIST](state, { recommendshoplist }) {
    state.recommendshoplist = state.recommendshoplist.concat(recommendshoplist);
  },
  // 当下拉刷新时商品列表不用concat拼接
  [RESET_RECOMMEND](state, { recommendshoplist }) {
    state.recommendshoplist = recommendshoplist;
  },
  // 搜索页数据修改
  [SEARCH_DATA](state, { searchdata }) {
    state.searchdata = searchdata;
  },
  // 设置用户信息
  [USER_INFO](state, { userInfo }) {
    state.userInfo = userInfo;
  },
  // 保存购物车信息
  [SHOP_CAR](state, { shopcar }) {
    state.shopcar = shopcar;
  },
  // 减少或者添加商品数量
  [SHOP_COUNT](state, item) {
    if (item.isAdd) {
      item.goods_amount += 1;
    } else {
      item.goods_amount -= 1;
    }
  },
  // 删除购物车商品
  [DELETE_SHOP](state, params) {
    let index = state.shopcar.indexOf(params);
    state.shopcar.splice(index, 1);
  },
  // Tabbar购物车图标显示的商品数量
  [SHOP_TOTAL](state) {
    let shoptotal = 0;
    state.shopcar.forEach((shop, index) => {
      shoptotal += shop.goods_amount;
    });
    state.shoptotal = shoptotal;
  },
  // 选中或者取消单个商品
  [SELECT_ONE_GOODS](state, goods) {
    if (goods.checked) { // 存在该属性
      goods.checked = !goods.checked;
    } else {
      Vue.set(goods, 'checked', true);
    }
  },
  // 选中或者取消所有商品
  [SELECT_ALL_GOODS](state, isAllSelect) {
    state.shopcar.forEach((goods) => {
      if (goods.checked) { // 存在该属性
        goods.checked = isAllSelect;
      } else {
        Vue.set(goods, 'checked', isAllSelect);
      }
    });
  },
};
