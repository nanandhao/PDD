<template>
  <div class="selecet-login">
    <div class="selecet-login-box">
      <div class="login-text">选择登陆方式</div>
      <div class="login-btn">
        <button @click="login">手机登录</button>
      </div>
    </div>
    <router-link tag="div" class="selecet-login-logo" to="/">
      <img src="./images/login_logo.png" alt="">
    </router-link>
  </div>
</template>

<script>
export default {
  name: 'selecetLogin',
  data() {
    return {
    };
  },
  methods: {
    login() {
      this.$router.replace('/login');
    },
  },
};
</script>

<style lang='stylus' ref='stylesheet/stylus' scoped>
  .selecet-login
    width 100%
    height 100%
    position absolute
    left 0
    top 0
    z-index 8888
    background-color #f4f4f4
    .selecet-login-box
      width 100%
      position absolute
      top 3rem
      display flex
      flex-direction column
      .login-text
        width 100%
        height .8rem
        font-size .35rem
        text-align center
        line-height .8rem
        color #aaa
      .login-btn
        margin-top .5rem
        display flex
        flex-direction column
        justify-content center
        align-items center
        button
          width 80%
          height .8rem;
          border none
          background-color #f6a622;
          border-radius .1rem;
          color #fff;
          font-size .32rem;
          margin-top .2rem
          outline none
    .selecet-login-logo
      position absolute
      width 100%
      bottom 1rem
      display flex
      justify-content center
      align-items center
      img
        width 50%
</style>

