<template>
  <div class="login">
    <div class="login-box">
      <div class="login-logo">
        <img src="./images/login_logo.png" alt="">
      </div>
      <div class="login-title">
        <div :class="{selecet:selectLogin}" @click="switchLogin(true)">手机登录</div>
        <div :class="{selecet:!selectLogin}" @click="switchLogin(false)">帐号登录</div>
      </div>
      <div class="login-input">
        <div class="login-input-phone" v-show="selectLogin">
          <input type="phone" placeholder="请输入手机号码" maxlength="11" v-model="phone">
          <button @click="getCode" v-show="isShowCodeBtn" ref="codeBtn" disabled>获取验证码</button>
          <button v-show="!isShowCodeBtn" disabled>已发送({{this.ms}}s)</button>
        </div>
        <div class="login-input-account" v-show="!selectLogin">
          <input type="text" placeholder="请输入邮箱" maxlength="30" v-model="email">
        </div>
        <div class="login-input-code" v-if="selectLogin">
          <input type="text" placeholder="请输入验证码" maxlength="6" v-model="code">
        </div>
        <div class="login-input-pwd" v-else>
          <input type="password" placeholder="请输入密码" v-if="!isShowPwd" v-model="pwd" maxlength="18">
          <input type="text" placeholder="请输入密码" v-else v-model="pwd" maxlength="18">
          <div class="show-pwd" @click="switchPwdShow">
            <img src="./images/hide_pwd.png" v-if="!isShowPwd">
            <img src="./images/show_pwd.png" v-else>
          </div>
        </div>
        <div class="login-input-code" v-if="!selectLogin">
          <input type="text" maxlength="4" v-model="captcha">
          <div class="code-img" @click="getCaptcha">
            <img src="http://www.haoandnan.top/api/captcha" alt="captcha" ref="captcha" @click.prevent="getCaptcha()"/>
          </div>
        </div>
        <p>
          温馨提示：未注册撩课帐号的手机号，登录时将自动注册，且代表已同意<a href="javascript:;">服务协议与隐私政策</a>
        </p>
        <div class="login-btn-box">
          <button class="login-submit" v-if="selectLogin" @click="loginPhone">登陆</button>
          <button class="login-submit" v-else @click="loginEmail">登陆</button>
          <button class="login-return" @click="loginReturn">返回</button>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
export default {
  name: 'Login',
  data() {
    return {
      selectLogin: true, // 切换登录方式
      ms: 10, // 存储秒数
      timer: null, // 存储定时器
      isShowCodeBtn: true, // 显示隐藏倒计时Btn
      email: '', // 登录邮箱
      pwd: '', // 密码
      captcha: '', // 图形验证码
      isShowPwd: false, // 切换密码显示方式
      phone: '', // 手机号码
      code: '', // 手机验证码
    };
  },
  watch: {
    // 验证手机号码是否合法
    phone() {
      const phoneReg = /^1[34578]\d{9}$/;
      if (phoneReg.test(this.phone)) {
        this.$refs.codeBtn.disabled = false;
      } else {
        this.$refs.codeBtn.disabled = true;
      }
    },
  },
  mounted() {
  },
  methods: {
    // 跳转到个人信息页面
    loginReturn() {
      this.$router.replace('/me');
    },
    // 点击切换登录方式
    switchLogin(flag) {
      // 解决切换登录，文本框已有合法手机号码，不能被选中问题
      const phoneReg = /^1[34578]\d{9}$/;
      if (phoneReg.test(this.phone)) {
        this.$refs.codeBtn.disabled = false;
      } else {
        this.$refs.codeBtn.disabled = true;
      }
      this.selectLogin = flag;
    },
    // 获取图形验证码
    getCaptcha() {
      // this.$refs.captcha.src = 'http://www.haoandnan.top:31/api/captcha?time=' + new Date();
      this.$refs.captcha.src = 'http://localhost:3001/api/captcha?time=' + new Date();
    },
    // 点击切换密码是否显示明文
    switchPwdShow() {
      this.isShowPwd = !this.isShowPwd;
    },
    // 点击获取验证码按钮
    getCode() {
      this.isShowCodeBtn = false;
      this.timer = setInterval(() => {
        this.ms = this.ms - 1;
        if (this.ms === 0) {
          clearInterval(this.timer);
          this.ms = 10;
          this.isShowCodeBtn = true;
        }
      }, 1000);
      const params = {
        phone: this.phone,
      };
      this.$store.dispatch('reqGetCode', params);
    },
    // 邮箱登录
    loginEmail() {
      // 验证邮箱
      const emailReg = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
      // 约定密码格式
      const pwdReg = /^(?![^a-zA-Z]+$)(?!\D+$)/;
      if (this.email.length === 0 || this.email === '') {
        alert('邮箱不能为空');
      } else if (!emailReg.test(this.email)) {
        alert('请输入正确的邮箱');
      } else if (this.pwd.length < 8 || this.pwd.length > 18 || pwdReg.test(this.pwd)) {
        alert('密码必须为8-18位字母、数字');
      } else {
        const params = {
          email: this.email,
          pwd: this.pwd,
          captcha: this.captcha,
          callback: this.getCaptcha,
          loginReturn: this.loginReturn,
        };
        this.$store.dispatch('emailLogin', params);
      }
    },
    // 手机验证码登录
    loginPhone() {
      // 约定手机号码格式
      const phoneReg = /^1[34578]\d{9}$/;
      if (this.phone === '') {
        alert('手机号码不能为空');
      } else if (this.code === '') {
        alert('验证码不能为空');
      } else if (!phoneReg.test(this.phone)) {
        alert('请输入正确的手机号码');
      } else {
        const params = {
          phone: this.phone,
          code: this.code,
          loginReturn: this.loginReturn,
        };
        this.$store.dispatch('phoneLogin', params);
      }
    },
  },
};
</script>

<style lang='stylus' ref='stylesheet/stylus' scoped>
  .login
    position absolute
    top 0
    left 0
    background-color #f5f5f5
    width 100%
    height 100%
    .login-box
      width 80%
      margin 0 auto
      padding-top 1.5rem
      display flex
      flex-direction column
      justify-content center
      align-items center
      .login-logo
        width 100%
        display flex
        justify-content center
        align-items center
        img
          width 80%
      .login-title
        width 100%
        font-size .3rem
        display flex
        justify-content center
        align-items center
        margin-top .7rem
        div
          padding-bottom .2rem
        div:first-child
          margin-right .8rem
        .selecet
          color rgb(222, 48, 37)
          font-weight 700
          border-bottom 2px solid rgb(222, 48, 37)
      .login-input
        width 100%
        height .9rem
        margin-top .5rem
        .login-input-code
        .login-input-pwd
          margin-top .3rem
        .login-input-phone
        .login-input-code
        .login-input-account
        .login-input-pwd
          width 100%
          height 100%
          box-sizing border-box
          border 1px solid #ddd
          border-radius 4px
          outline 0
          font 400 14px Arial
          display flex
          justify-content center
          align-items cente
          position relative
          input
            outline 0
            border none
            width 100%
            height 100%
            box-sizing border-box
            background-color transparent
            padding-left .2rem
            &:focus
              border 1px solid #f6a622
              border-radius 4px
          button
            width 30%
            border none
            background-color transparent
            position absolute
            right .1rem
            height 100%
        .login-input-pwd
          input
          width 100%
          .show-pwd
            position absolute
            right 0
            height 100%
            text-align center
            display flex
            justify-content center
            align-items center
            width .6rem
            img
              width 80%
        .login-input-code
          position relative
          .code-img
            position absolute
            top 1px
            right -4px
            width 45%
            height 100%
            box-sizing border-box
            img
              width 100%
              height 97%
        p
          font-size .26rem
          color rgb(153, 153, 153)
          margin-top .4rem
          line-height .4rem
          a
           color rgb(222, 48, 37)
        .login-btn-box
          display flex
          flex-direction column
          justify-content center
          align-items center
          margin-top .2rem
          button
            border none
            width 100%
            height .8rem
            border-radius .04rem
            font-size .3rem
          button:first-child
            background-color rgb(222, 48, 37)
            color #fff
          button:last-child
            background-color transparent
            color rgb(222, 48, 37)
            border 1px solid rgb(222, 48, 37)
            margin-top .2rem
</style>
