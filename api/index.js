import ajax from './ajax';

// 定义统一URL，方便以后修改
// const BASE_URL = '/api';
const BASE_URL = 'http://www.haoandnan.top:81';

// 发送请求获得首页轮播图
export const getHomeCarousel = ()=> ajax(BASE_URL+'/api/homecarousel');
// 发送请求获得首页热门板块导航图片
export const getHomeNav = ()=> ajax(BASE_URL+'/api/homenav');
// 发送请求获得首页热门板块商品数据
export const getShopList = ()=> ajax(BASE_URL+'/api/shoplist');
// 发送请求获得推介板块数据
export const getRcommendShopList = (params)=> ajax(BASE_URL+'/api/recommend_shop_list',params);
// 发送请求获得搜索页数据
export const getSearchData = ()=> ajax(BASE_URL+'/api/search');
// 邮箱登录
export const postEmailLogin = (params)=> ajax(BASE_URL+'/api/login_email',params,'POST');
// 获取手机验证码
export const getPhoneCode = (params)=> ajax(BASE_URL+'/api/phone_code',params);
// 手机登录
export const postPhoneLogin = (params)=> ajax(BASE_URL+'/api/login_phone',params,'POST');
// 获得用户信息用于记录登录状态
export const getUserInfo = ()=> ajax(BASE_URL+'/api/user_info');
// 修改用户信息
export const postUserInfo = (params)=> ajax(BASE_URL+'/api/set_user_info',params,'POST');
// 退出登录
export const loginOut = () => ajax(BASE_URL+'/api/login_out');
// 添加到购物车
export const addShopCar = (params) => ajax(BASE_URL+'/api/add_car',params,'POST');
// 获取购物车数据
export const getShopCar = () => ajax(BASE_URL+'/api/shop_car_list');
// 购物车加减按钮
export const postShopCount =  (params) => ajax(BASE_URL+'/api/set_shop_count',params,'POST');
// 购物车商品删除按钮
export const postDeleteShop =  (params) => ajax(BASE_URL+'/api/delete_shop',params,'POST');
