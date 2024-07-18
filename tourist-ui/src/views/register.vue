<template>
  <div class="container">
    <div class="wrapper">
      <div class="center-container">
        <el-card class="box-card" tyle="width: 40em">
          <div slot="header" class="clearfix" style="text-align: center">
            <span style="font-size: 30px; margin-left: 20px;color: #C7923E">注册</span>
            <el-button style="float: right; padding: 15px 0;color: #C7923E" type="text" @click="goLogin()">登录</el-button>
          </div>
          <div >
            <el-form ref="registerForm" :model="registerForm" :rules="registerRules" class="register-form">
              <el-form-item prop="username">
                <el-input v-model="registerForm.username" type="text" auto-complete="off" placeholder="手机号">
                </el-input>
              </el-form-item>
              <el-form-item prop="password">
                <el-input
                    v-model="registerForm.password"
                    type="password"
                    auto-complete="off"
                    placeholder="密码"
                >
                </el-input>
              </el-form-item>
              <el-form-item prop="confirmPassword">
                <el-input
                    v-model="registerForm.confirmPassword"
                    type="password"
                    auto-complete="off"
                    placeholder="确认密码"
                >
                </el-input>
              </el-form-item>
              <el-form-item prop="code" v-if="captchaOnOff">
                <el-input
                    v-model="registerForm.code"
                    auto-complete="off"
                    placeholder="验证码"
                    style="width: 63%"
                >
                </el-input>
                <div class="register-code">
                  <img :src="codeUrl" @click="getCode" class="register-code-img"/>
                </div>
              </el-form-item>
              <el-form-item style="width:100%;">
                <el-button
                    :loading="loading"
                    size="medium"
                    type="primary"
                    style="width:100%;"
                    @click="handleRegister"
                >
                  <span v-if="!loading">注 册</span>
                  <span v-else>注 册 中...</span>
                </el-button>
              </el-form-item>
            </el-form>
          </div>
        </el-card>
      </div>
    </div>
  </div>
</template>
<script>
    import { getCodeImg,register } from "@/utils/request";
    export default {
        name: "Register",
        data() {
            const equalToPassword = (rule, value, callback) => {
                if (this.registerForm.password !== value) {
                    callback(new Error("两次输入的密码不一致"));
                } else {
                    callback();
                }
            };
            return {
                codeUrl: "",
                registerForm: {
                    username: "",
                    password: "",
                    confirmPassword: "",
                    code: "",
                    uuid: ""
                },
                registerRules: {
                    username: [
                        { required: true, trigger: "blur", message: "请输入您的账号" },
                        { min: 2, max: 20, message: '用户账号长度必须介于 2 和 20 之间', trigger: 'blur' }
                    ],
                    password: [
                        { required: true, trigger: "blur", message: "请输入您的密码" },
                        { min: 5, max: 20, message: '用户密码长度必须介于 5 和 20 之间', trigger: 'blur' }
                    ],
                    confirmPassword: [
                        { required: true, trigger: "blur", message: "请再次输入您的密码" },
                        { required: true, validator: equalToPassword, trigger: "blur" }
                    ],
                    code: [{ required: true, trigger: "change", message: "请输入验证码" }]
                },
                loading: false,
                captchaOnOff: true
            };
        },
        methods: {
            //  跳转登录
            goLogin(){
                // 跳转页面
                this.$router.push({path:'/login'})
            },
            getCode() {
                getCodeImg().then(res => {
                    this.captchaOnOff = res.captchaOnOff === undefined ? true : res.captchaOnOff;
                    if (this.captchaOnOff) {
                        this.codeUrl = "data:image/gif;base64," + res.img;
                        this.registerForm.uuid = res.uuid;
                    }
                });
            },
            handleRegister() {
                this.$refs.registerForm.validate(valid => {
                    if (valid) {
                        this.loading = true;
                        register(this.registerForm).then(res => {
                            const username = this.registerForm.username;
                            this.$alert("<font color='red'>恭喜你，您的账号 " + username + " 注册成功！</font>", '系统提示', {
                                dangerouslyUseHTMLString: true,
                                type: 'success'
                            }).then(() => {
                                this.$router.push("/login");
                            }).catch(() => {});
                        }).catch(() => {
                            this.loading = false;
                            this.getCode();
                        })
                    }
                });
            }
        },
        created() {
            this.getCode();
        },
    };
</script>

<style scoped lang="scss">
.container{
  background-image: url("~@/assets/yxtx/background.jpeg");
  background-size: cover;
  height: 650px;
  width: 100%;
  padding: 1em 0;
}
.text {
  font-size: 14px;
}

.item {
  margin-bottom: 18px;
}

.clearfix:before,
.clearfix:after {
  display: table;
  content: "";
}
.clearfix:after {
  clear: both
}

.box-card {
  border-radius: 15px;
  width: 600px;
}
.wrapper {
  padding: 40px 0px 0px 480px;
}
.register-code-img {
  height: 38px;
}
.register-code {
  width: 33%;
  height: 38px;
  float: right;
  img {
    cursor: pointer;
    vertical-align: middle;
  }
}
</style>
