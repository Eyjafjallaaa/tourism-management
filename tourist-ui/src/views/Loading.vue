<!-- Loading.vue -->

<template>
  <div class="loading-container" @click="goHome">
    <img src="@/assets/page-0.jpg" alt="Loading..." class="loading-image">
  </div>
</template>

<script>
export default {
  mounted() {
    this.timeoutId = setTimeout(() => {
      this.goHome(); // 跳转到首页
    }, 3000); // 修改为3秒
  },
  methods: {
    goHome() {
      clearTimeout(this.timeoutId); // 清除计时器，防止重复跳转
      this.$router.push('/home');
    }
  },
  beforeDestroy() {
    clearTimeout(this.timeoutId); // 组件销毁前清除计时器
  }
};
</script>

<style scoped>
.loading-container {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100vh;
  background-color: #fff;
  cursor: pointer; /* 添加手型光标 */
}

.loading-image {
  width: 1600px; /* 调整图片大小 */
  height: auto;
}
</style>
