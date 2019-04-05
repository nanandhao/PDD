<template>
  <div class="me-setting">
    <div>
      <me-cell left-icon="itlike-2" left-title="免密码支付" right-title="接收" />
      <me-cell left-icon="itlike-3" left-title="免拼单设置" right-title="接收" :clickCell="dealCellClick" />
      <me-cell left-icon="itlike-1" left-title="消息接收设置" right-title="接收" right-title-color="red" />
    </div>
    <div style="margin-top: 10px;">
      <me-cell left-icon="itlike-5" left-title="免密码支付" right-title="接收" :clickCell="dealCellClick" />
      <me-cell left-icon="itlike-4" left-title="免密码支付" right-title="接收" />
    </div>
    <div style="margin-top: 10px;">
      <me-cell left-icon="itlike-1" left-title="免密码支付" right-title="接收" />
    </div>
    <div class="login-out" @click="loginOut">退出登录</div>
    <div class="retrun" @click="returnUp">返回</div>
  </div>
</template>
<script>
import { mapActions } from 'vuex';
import { MessageBox } from 'mint-ui';
import MeCell from './MeCell';

export default {
  name: 'Mesetting',
  data() {
    return {

    };
  },
  components: {
    MeCell,
  },
  methods: {
    ...mapActions(['reqLoginOut']),
    // 点击me-cell组件的回调函数，第一个参数为左侧文字内容
    dealCellClick(props) {
      alert(props);
    },
    // 退出登录按钮
    loginOut() {
      MessageBox.confirm('您确定退出登录吗?').then((action) => {
        if (action === 'confirm') {
          // 退出登录
          let params = {
            userInfo: {},
            shopcar: [],
            callback: this.$router.replace('/home'), // 回到主界面
          };
          this.reqLoginOut(params);
        }
      });
    },
    // 返回上一级按钮
    returnUp() {
      this.$router.back();
    },
  },
};
</script>

<style lang='stylus' ref='stylesheet/stylus' scoped>
  .me-setting
    width 100%
    height 100%
    .login-out
    .retrun
      width 100%
      height .8rem
      background-color #fff
      margin-top 10px
      display flex
      justify-content center
      align-items center
      text-align center
      font-size .28rem
</style>

