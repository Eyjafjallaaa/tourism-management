<template>
  <div id="app">
    <!-- 使用组件 -->
    <Head v-if="showHeadAndFoot" />
    <br>
    <router-view/>
    <Foot v-if="showHeadAndFoot" />
  </div>
</template>

<script>
import Head from '../src/views/components/Head.vue';
import Foot from '../src/views/components/Foot.vue';
import updateElementUiTheme from "update-element-ui-theme";

export default {
  data() {
    return {
      color: '#C7923E', // 默认颜色
      showHeadAndFoot: true // 控制显示头部和尾部
    };
  },
  watch: {
    $route(to) {
      // 根据路由的 meta 字段来控制是否显示头部和尾部
      this.showHeadAndFoot = !to.meta.hideHeadAndFoot;
    }
  },
  created() {
    // 在组件创建时应用默认颜色
    updateElementUiTheme({
      theme: this.color, // 使用默认主题色
      themeName: "--my-theme"
    });

    // 初始化判断当前路由是否需要隐藏头部和尾部
    this.showHeadAndFoot = !this.$route.meta.hideHeadAndFoot;
  },
  components: {
    Head,
    Foot
  }
};
</script>

<style>
/* 全局样式 */
:root {
  --my-theme: #C7923E; /* 默认值 */
}
</style>
