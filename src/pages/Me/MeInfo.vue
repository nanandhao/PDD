<template>
  <div class="me-info">
    <div class="info-title">基本信息</div>
    <ul class="info-content">
      <li>
        <span>头像信息</span>
        <img src="./images/me_icon.png" alt="">
      </li>
      <li>
        <span>昵称</span>
        <span>{{user_name}}</span>
      </li>
      <li @click="sheetVisible = true">
        <span>性别</span>
        <span>{{user_sex}}</span>
      </li>
      <li>
        <span>常住地</span>
        <span>未填写</span>
      </li>
      <li @click="$refs.picker.open()">
        <span>生日</span>
        <span>{{user_birthday}}</span>
      </li>
      <li>
        <span>个性签名</span>
        <span>{{user_sign}}</span>
      </li>
      <li class="set-info"><button @click="setInfo">确认修改</button></li>
    </ul>
    <mt-actionsheet
      :actions="actions"
      v-model="sheetVisible">
    </mt-actionsheet>
    <mt-datetime-picker
      ref="picker"
      type="date"
      year-format="{value} 年"
      month-format="{value} 月"
      date-format="{value} 日"
      :startDate=startDate
      :endDate=endDate
      @confirm="handleConfirm"
      >
    </mt-datetime-picker>
  </div>
</template>

<script>
import moment from 'moment';
import { mapState } from 'vuex';

export default {
  name: 'MeInfo',
  data() {
    return {
      user_pic: '', // 头像
      user_name: '', // 昵称
      user_sex: '', // 性别
      user_address: '', // 地址
      user_birthday: '', // 生日
      user_sign: '', // 个性签名
      sheetVisible: false, // actionsheet显示与隐藏
      pickerVisible: false, // datetime-picker显示与隐藏
      actions: [
        { name: '男', method: this.selectSex },
        { name: '女', method: this.selectSex },
      ],
      // 3. 出生年月日
      startDate: new Date('1940-01-01'),
      endDate: new Date(),
    };
  },
  computed: {
    ...mapState(['userInfo']),
  },
  mounted() {
    this.user_sign = this.userInfo.user_sign || '未填写';
    this.user_address = this.userInfo.user_address || '未填写';
    this.user_name = this.userInfo.user_name || '未填写';
    this.user_sex = this.userInfo.user_sex || '未填写';
    this.user_birthday = this.userInfo.user_birthday || '1960年01月01日';
  },
  methods: {
    // 选择性别
    selectSex(props) {
      this.user_sex = props.name;
    },
    // 选择日期
    handleConfirm(date) {
      this.user_birthday = moment(date).format('YYYY年MM月DD日');
    },
    // 提交修改信息
    setInfo() {
      let params = {
        user_name: this.user_name,
        user_sex: this.user_sex,
        user_address: this.user_address,
        user_birthday: this.user_birthday,
        user_sign: this.user_sign,
        callback: this.closeInfoBox,
      };
      this.$store.dispatch('setUserInfo', params);
    },
    // 关闭修改信息窗口
    closeInfoBox() {
      this.$emit('setInfoShow');
    },
  },
};
</script>

<style lang='stylus' ref='stylesheet/stylus' scoped>
  @import "./../../common/stylus/mixins.styl"
  .me-info
    width 100%
    height 100%
    position absolute
    left 0
    top 0
    background-color #f5f5f5;
    z-index 9900
    .info-title
      width 100%
      height 1rem
      line-height 1rem
      font-size .34rem
      padding-left .3rem
    .info-content
      width 100%
      padding-left .3rem
      background-color #fff
      font-size .28rem
      box-sizing border-box
      color #666666
      li
        display flex
        justify-content space-between
        align-items center
        height 1.2rem
        padding-right .2rem
        border-bottom-1px(#ccc)
        img
          width 1.6rem
          border-radius 50%
      li:first-child
        height 1.9rem
      .set-info
        display flex
        justify-content center
        align-items center
        button
          width 100%
          height 80%
          background-color red
          color #fff
          border-radius 10px
          font-size .3rem
          border none
          outline-style none
        button:active
          background-color #FFD700
          color #fff
</style>

