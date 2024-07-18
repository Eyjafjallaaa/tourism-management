<template>
  <div class="footer-container">
    <el-row :gutter="20" class="footer-content">
      <el-col :span="30" >
        <div class="contact-info">
          <h1>如果遇到什么困难，我们很乐意帮助你！</h1>
          <p>如果您有任何问题或想与我们预订旅游，请与我们联系。</p>
          <p>Phone: +12345678910</p>
          <p>Email: <a href="mailto:vincentdeng@gmail.com"></a>vincentdeng@gmail.com</p>
          <p>地址：成都市青羊区文庙前街93号</p>
        </div>
      </el-col>
    </el-row>
    <el-row :gutter="10" class="subscribe-section" style="padding-left: 250px">
      <el-col :span="5">
        <h2>请持续关注最新消息</h2>
      </el-col>
      <el-col :span="8">
        <el-input placeholder="在此输入邮箱联系我们"></el-input>
      </el-col>
      <el-col :span="8">
        <el-button type="primary">></el-button>
      </el-col>
    </el-row>
    <el-row :gutter="20" class="footer-bottom">
      <el-col :span="24">
        <p>Copyright Vincent Deng 2024</p>
      </el-col>
    </el-row>
  </div>
</template>

<script>
export default {
  // 组件逻辑
}
</script>

<style scoped>

.footer-container {
  background-color: #304f47;
  color: #ffffff;
  padding: 40px 20px;
}

.footer-content {
  margin-bottom: 40px;
}
.contact-info {
  text-align: center; /* 居中对齐 */
}

.contact-info h1 {
  font-size: 32px;
  font-weight: bold;
  margin-bottom: 20px;
}

.contact-info p {
  font-size: 16px;
  margin-bottom: 10px;
}

.contact-info a {
  color: #ffffff;
  text-decoration: underline;
}

.social-media {
  text-align: center;
}

.social-media .logo {
  width: 100px;
  margin-bottom: 20px;
}

.social-media .icons {
  display: flex;
  justify-content: center;
  gap: 15px;
}

.social-media i {
  font-size: 24px;
}

.links ul {
  list-style-type: none;
  padding: 0;
}

.links li {
  font-size: 16px;
  margin-bottom: 10px;
}

.subscribe-section {
  display: flex;
  align-items: center;
  justify-content: center;
  margin-bottom: 40px;
}

.subscribe-section h2 {
  font-size: 24px;
  font-weight: bold;
}

.footer-bottom {
  text-align: center;
}
.el-row {
  width: 100%;
  display: flex;
  justify-content: center; /* 水平居中 */
  font-family: 'Lora', serif;
}
</style>
