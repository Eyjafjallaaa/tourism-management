<template>
    <div class="container" >
        <div class="wrapper" >
          <div class="center-container">
            <el-card class="box-card" style="width: 40em">
              <div slot="header" class="clearfix" style="text-align: center" >
                <span style="font-size: 30px; margin-left: 50px;color: #C7923E">登录</span>
                <el-button style="float: right; padding: 15px 0;color: #C7923E" type="text" @click="goRegister()">注册</el-button>
              </div>
              <div>
                <el-form ref="form" :model="form" :rules="loginRules" label-width="80px">
                  <el-form-item label="账号：" prop="username">
                    <el-input
                        style="width: 30em;text-align: center"
                        v-model="form.username"
                        type="text"
                        auto-complete="off"
                        placeholder="请输入账号"
                    />
                  </el-form-item>
                  <el-form-item label="密码：" prop="password">
                    <el-input
                        style="width: 30em"
                        v-model="form.password"
                        type="password"
                        auto-complete="off"
                        placeholder="请输入密码"
                    />
                  </el-form-item>
                  <el-form-item label="验证码" prop="code" >
                    <el-input
                        v-model="form.code"
                        auto-complete="off"
                        placeholder="验证码"
                        style="width: 63%"
                    >
                    </el-input>
                    <div class="login-code">
                      <img :src="codeUrl" @click="getCode" class="login-code-img"/>
                    </div>
                  </el-form-item>
                  <el-form-item style="width:100%;">
                    <el-button
                        :loading="loading"
                        size="medium"
                        type="primary"

                        style="width:30em;"
                        @click="handleLogin"
                    >
                      <span v-if="!loading">登 录</span>
                      <span v-else>登 录 中...</span>
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
    import { getCodeImg,login,setToken } from "@/utils/request";
    import * as url from "url";

    export default {
        name: "Login",
      computed: {
        url() {
          return url
        }
      },
        data() {
            return {
                form: {
                    username: '',
                    password: '',
                    code: '',
                    uuid: ''
                },
                codeUrl: '',
                loading: false,
                loginRules: {
                    username: [
                        {required: true, trigger: "blur", message: "请输入您的账号"}
                    ],
                    password: [
                        {required: true, trigger: "blur", message: "请输入您的密码"}
                    ],
                    code: [{required: true, trigger: "change", message: "请输入验证码"}]
                },
            };
        },
        methods: {
            // 跳转注册
            goRegister() {
                // 跳转页面
                this.$router.push({path: '/register'})
            },
            getCode() {
                getCodeImg().then(res => {
                    if (true) {
                        this.codeUrl = "data:image/gif;base64," + res.img;
                        this.form.uuid = res.uuid;
                    }
                });
            },
            handleLogin() {
                this.$refs.form.validate(valid => {
                    if (valid) {
                        this.loading = true;
                        login(this.form).then(res => {
                            setToken(res.token)
                            this.$router.push("/home");
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
    .container {
        background-image: url("~@/assets/yxtx/background.jpeg");
        background-size: cover;
        height: 650px;
        width: 100%;
        padding: 1em 0;
    }
    .center-container{
      justify-content: center; /* 水平居中 */
      align-items: center; /* 垂直居中 */
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
        padding: 80px 0px 0px 480px;
    }
    .login-code {
        width: 33%;
        height: 38px;
        float: right;
        img {
            cursor: pointer;
            vertical-align: middle;
        }
    }
    .login-code-img {
        height: 38px;
    }

</style>
