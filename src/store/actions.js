import { Toast } from 'mint-ui';
import {
  getHomeCarousel,
  getHomeNav,
  getShopList,
  getRcommendShopList,
  getSearchData,
  postEmailLogin,
  getPhoneCode,
  postPhoneLogin,
  getUserInfo,
  postUserInfo,
  loginOut,
  addShopCar,
  getShopCar,
  postShopCount,
  postDeleteShop,
} from '../../api/index';
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
  // 获取轮播图
  async reqHomeCarousel({ commit }) {
    const result = await getHomeCarousel();
    if (result.code === 200) {
      commit(HOME_CACROUSEL, { homecarousel: result.message });
    } else {
      Toast({
        message: result.message,
        position: 'center',
        duration: 500,
      });
    }
  },
  // 获得首页热门板块导航图片
  async reqHomeNav({ commit }) {
    const result = await getHomeNav();
    if (result.code === 200) {
      commit(HOME_NAV, { homenav: result.message });
    } else {
      Toast({
        message: result.message,
        position: 'center',
        duration: 500,
      });
    }
  },
  // 获取首页商品列表数据
  async reqShopList({ commit }) {
    const result = await getShopList();
    if (result.code === 200) {
      commit(HOME_SHOP_LIST, { shoplist: result.message });
    }
  },
  // 获取推介页商品列表数据
  async reqRecommendShopList({ commit }, params) {
    const result = await getRcommendShopList(params);
    if (result.code === 200) {
      if (params.num === 0) {
        commit(RESET_RECOMMEND, { recommendshoplist: result.message });
      } else {
        commit(RECOMMEND_SHOP_LIST, { recommendshoplist: result.message });
      }
    }
  },
  // 获取搜索页数据
  async reqSearchData({ commit }) {
    const result = await getSearchData();
    if (result.code === 200) {
      commit(SEARCH_DATA, { searchdata: result.message });
    }
  },
  // 邮箱登录
  async emailLogin({ commit, dispatch }, params) {
    const result = await postEmailLogin(params);
    params.callback && params.callback();
    if (result.code === 200) {
      commit(USER_INFO, { userInfo: result.message });
      if (result.message.user_id) {
        params.loginReturn && params.loginReturn();
        dispatch('reqShopCar');
      }
    } else {
      Toast({
        message: result.message,
        position: 'center',
        duration: 500,
      });
    }
  },
  // 获取手机验证码
  async reqGetCode({ commit }, params) {
    const result = await getPhoneCode(params);
    if (result.code === 200) {
      alert('你的验证码为: ' + result.message);
    }
  },
  // 手机登录
  async phoneLogin({ commit, dispatch }, params) {
    const result = await postPhoneLogin(params);
    if (result.code === 200) {
      commit(USER_INFO, { userInfo: result.message });
      if (result.message.user_id) {
        params.loginReturn && params.loginReturn();
        dispatch('reqShopCar');
      }
    } else {
      // 提示信息
      Toast({
        message: result.message,
        position: 'center',
        duration: 500,
      });
    }
  },
  // 获取用户信息
  async reqUserInfo({ commit }) {
    const result = await getUserInfo();
    if (result.code === 200) {
      commit(USER_INFO, { userInfo: result.message });
    }
  },
  // 修改用户信息
  async setUserInfo({ commit }, params) {
    const result = await postUserInfo(params);
    if (result.code === 200) {
      commit(USER_INFO, { userInfo: result.message });
      params.callback && params.callback();
    }
  },
  // 退出登录
  async reqLoginOut({ commit }, params) {
    const result = await loginOut();
    if (result.code === 200) {
      commit(USER_INFO, { userInfo: params.userInfo }); // 清空个人信息
      commit(SHOP_CAR, { shopcar: params.shopcar }); // 清空购物车
      params.callback && params.callback();
    }
  },
  // 添加到购物车
  async postAddShopCar({ dispatch }, params) {
    const result = await addShopCar(params);
    if (result.code === 200) {
      dispatch('reqShopCar');// 添加成功后重新获取购物车数据
      // 提示信息
      Toast({
        message: result.message,
        position: 'center',
        duration: 500,
      });
    }
  },
  // 获取购物车数据
  async reqShopCar({ commit }) {
    const result = await getShopCar();
    if (result.code === 200) {
      commit(SHOP_CAR, { shopcar: result.message });
    } else {
      // 提示信息
      Toast({
        message: result.message,
        position: 'center',
        duration: 500,
      });
    }
  },
  // 购物车加减按钮
  async setShopCount({ commit, dispatch }, item) {
    const result = await postShopCount(item);
    if (result.code === 200) {
      commit(SHOP_COUNT, item);
      dispatch('setShopTotal');// 统计购物车商品总数量,因为加减操作要请求有延时，所以造成购物车图标显示有延迟
      item.callback && item.callback(); // 统计购物车商品总价格
    } else {
      // 提示信息
      Toast({
        message: result.message,
        position: 'center',
        duration: 500,
      });
    }
  },
  // 删除购物车商品
  async deleteShop({ commit }, params) {
    const result = await postDeleteShop(params);
    if (result.code === 200) {
      commit(DELETE_SHOP, params);
    } else {
      // 提示信息
      Toast({
        message: result.message,
        position: 'center',
        duration: 500,
      });
    }
  },
  // Tabbar购物车图标显示的商品数量
  setShopTotal({ commit }) {
    commit(SHOP_TOTAL);
  },
  // 选中或者取消单个商品
  setSelectOneGoods({ commit }, goods) {
    commit(SELECT_ONE_GOODS, goods);
  },
  // 选中或者取消所有商品
  setSelectAllGoods({ commit }, isAllSelect) {
    commit(SELECT_ALL_GOODS, isAllSelect);
  },
};
