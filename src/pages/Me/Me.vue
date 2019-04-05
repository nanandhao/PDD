<template>
  <div class="me">
    <div v-if="userInfo.user_id">
      <me-menu />
    </div>
    <select-login v-else/>
  </div>
</template>
<script>
import { mapState } from 'vuex';
import SelectLogin from './../Login/selecetLogin';
import MeMenu from './MeMenu';


export default {
  name: 'Me',
  data() {
    return {

    };
  },
  computed: {
    ...mapState(['userInfo']),
  },
  components: {
    SelectLogin,
    MeMenu,
  },
  mounted() {
  },
};
</script>

<style lang='stylus' ref='stylesheet/stylus' scoped>
  div
    width 100%
    height 100%
</style>
