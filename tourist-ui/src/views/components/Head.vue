<template>
  <div>
    <div class="top-bar">
    <div class="wrapper">
      <div class="contact-info">
        <img width="200px" src="../../img/logo.svg" alt="" style="padding-right: 20px; padding-top: 10px"/>
        <span>电话: 123-456-7890      </span>
        <span>地址: 成都市青羊区文庙前街93号       </span>
        <span>邮箱: info@tourism.com</span>

        <div class="contact" @click="goRegister()" v-show="!isLogin">注册</div>
        <div class="contact" @click="goLogin()" v-show="!isLogin">登录</div>
        <div class="contact" @click="exit()" v-show="isLogin">退出</div>
        <div class="contact" @click="goPerson()" v-show="isLogin">个人中心</div>
        <div class="contact2" v-show="isLogin" style="width: 250px">
          <marquee direction="left" behavior="alternate" scrollamount="5">
            <span v-model="remark" style="color: red">{{remark}}</span>
            <span v-model="username">{{username}},欢迎您</span></marquee>
        </div>
      </div>
    </div>
  </div>
    <div class="head"style="height: 22px;">
      <div class="wrapper">
        <div class="category">
          <ul >
            <li @click="toHomeHandler(),selectStyle(1)" :class="{title:currentIndex==1}">中南旅游</li>
            <li @click="goScenic(),selectStyle(2)" :class="{title:currentIndex==2}">旅游景区</li>
            <li @click="goTourist(),selectStyle(3)" :class="{title:currentIndex==3}">游记</li>
            <li @click="goRestaurant(),selectStyle(4)" :class="{title:currentIndex==4}">星级饭店</li>
            <li @click="goGuide(),selectStyle(5)" :class="{title:currentIndex==5}">导游信息</li>
            <li @click="goComplaint(),selectStyle(6)" :class="{title:currentIndex==6}">投诉渠道</li>
            <li @click="goCompany(),selectStyle(7)" :class="{title:currentIndex==7}">旅行社查看</li>
            <li @click="goCar(),selectStyle(8)" :class="{title:currentIndex==8}">车辆查看</li>
          </ul>
        </div>

      </div>
  <div>

  </div>
  </div>
  </div>

</template>

<script>
    import {get, getInfo,removeToken,getToken} from "@/utils/request";

    export default {
        data() {
            return {
                isLogin: false,
                username: "",
                remark:'',
                currentIndex: 1,
                typeArray: ['中南旅游', '旅游景区', '星级饭店','旅行社及车辆','导游信息','投诉渠道','企业查看']
            };
        },
        methods: {
            // 跳转注册
            goRegister() {
                // 跳转页面
                this.$router.push({path: '/register'})
            },
            //  跳转登录
            goLogin() {
                // 跳转页面
                this.$router.push({path: '/login'})
            },
            //跳转到首页
            toHomeHandler() {
                this.$router.push({path: '/home'})
            },
            //跳转到个人
            goPerson() {
                this.$router.push({path: '/person'})
            },//跳转到景点
            goScenic() {
                this.$router.push({path: '/scenic'})
            },//跳转到游记
            goTourist() {
                this.$router.push({path: '/travels'})
            },//跳转到小吃
            goRestaurant(){
              this.$router.push({path: '/restaurant'})
            },//跳转到导游
            goGuide() {
              this.$router.push({path: '/guides'})
            },//跳转到投诉
            goComplaint() {
              this.$router.push({path: '/complaints'})
            },//跳转到公司
            goCompany() {
                this.$router.push({path: '/agency'})
            },
            goCar() {
              this.$router.push({path: '/cars'})
            },
            exit(){
                this.$router.push({path: '/login'});
                removeToken();
            },
            selectStyle (index) {
                this.currentIndex = index;
            },
            getUser() {
                // getToken();
                let a = undefined;
                if (a!==getToken()){
                    getInfo().then(res => {
                        if (res.code === 200) {
                            this.isLogin = true;
                            this.username = res.user.nickName
                            this.remark=res.user.remark
                        }
                    });
                }


            }
        },
        created() {
            this.getUser()
        }
    };
</script>

<style scoped lang='scss'>
.top-bar {
  background-color: #304f47;
  height: 50px;
  color: #ffffff;
}

.top-bar .contact-info {
  color: #ffffff;
  font-family: PMingLiU,serif;
}
.head {
  padding: 1.2em;
}

.wrapper {
  width: 90%;
  height: 50px;
  line-height: 50px;

  .logo {
    float: left;
    cursor: pointer;
  }

  .title {
    float: left;
    font-size: 26px;
    font-weight: bold;
    padding: 0 1em;
    cursor: pointer;
    font-family: PMingLiU,serif;
    color: #304f47
  }

  .category {
    font-size: 20px;
    float: left;
    font-family: PMingLiU,serif;
    ul {
      list-style: none;
      padding: 0;
      margin: 0;

      li {
        float: left;
        padding: 0 2em;
        cursor: pointer;
      }
    }
  }

  .contact {
    float: right;
    cursor: pointer;
    padding-left: 10px;
    margin: 8px 0;
    width: 70px;
    height: 35px;
    background-color: #C7923E;
    color: #ffffff;
    border-radius: 8px; /* 圆角矩形 */
    text-align: center; /* 文字水平居中 */
    display: flex; /* 使用 flexbox 布局 */
    padding-right: 10px;
    align-items: center; /* 文字垂直居中 */
    justify-content: center; /* 文字水平居中 */
    margin-left: 10px; /* 添加间距 */
    margin-right: 1px;
    font-family: PMingLiU,serif;
    font-size: 17px;
  }

  .contact2 {
    float: right;
    cursor: pointer;
    font-family: PMingLiU,serif;
    font-size: 22px;
  }


}
</style>
