<template>
  <div>
    <div class="carousel">
      <!-- 轮播图开始 -->
      <div class="block" >
        <el-carousel height="720px" style="z-index: 1;" >
          <el-carousel-item >
              <img width="1840px" src="@/img/熊猫.jpg" />
          </el-carousel-item>
          <el-carousel-item >
            <img width="1840px" src = '@/img/东安湖.jpg' />
          </el-carousel-item>
          <el-carousel-item >
            <img width="1840px" src = '@/img/金融城.jpg' />
          </el-carousel-item>
          <el-carousel-item >
            <img width="1840px" src = '@/img/火锅.jpg' />
          </el-carousel-item>
        </el-carousel>
      </div>
      <!-- 轮播图结束 -->
      <div class="floating-text">
        <p>探索未知，触摸心灵</p>
        <p>让每一次旅行</p>
        <p>都成为一次心灵的觉醒</p>
      </div>
    </div>
    <el-row class="ad" gutter="20" justify="center" style="text-align: center;padding-top: 30px;" >
      <el-col :span="4">
        <div class="info-box">
          <i class="el-icon-location-information"></i>
          <p>100+ 全球最靓景点</p>
        </div>
      </el-col>
      <el-col :span="4">
        <div class="info-box">
          <i class="el-icon-date"></i>
          <p>100% 信任我们</p>
        </div>
      </el-col>
      <el-col :span="4">
        <div class="info-box">
          <i class="el-icon-trophy"></i>
          <p>10 年专业团队</p>
        </div>
      </el-col>
      <el-col :span="4">
        <div class="info-box">
          <i class="el-icon-circle-check"></i>
          <p>90% 游客好评</p>
        </div>
      </el-col>
    </el-row>
    <!--slogan模块结束 -->
    <div class="package-section">
      <div class="package-header">
        <h3 class="small-text">发现精彩景点</h3>
        <h1 class="large-text">挑选您的旅游目的地</h1>
      </div>
    </div>
    <div class="pro">
      <div class="wrapper">
        <div class="art">
          <el-row class="spot" gutter="20">
            <div
                    class="left"
                    v-for="item in scenicList"
                    :key="item.id"
                    @click="goDetail(item.id)"
            >
              <el-col :span="25">
                <div class="grid-content bg-purple">
                <div class="pic"><img width="100%" :src="item.pic" /></div>
                <div class="text" style="text-align: center;font-size: 24px;">
                  <div class="name">{{ item.name }}</div>
                </div>
                <div class="top"></div></div>
              </el-col>
            </div>
          </el-row>
        </div>
      </div>
    <!--</div>-->
    <!-- 旅游景点结束 -->
    <el-row class="ad">
      <el-col :span="16">
        <div class="article">
          <div class="wrapper">
            <h3 class="small-text">探索梦想之旅</h3>
            <h1 class="large-text">寻找理想的旅游服务</h1>
            <div class="project" v-for="item in travels" :key="item.id" @click="goTravelDetail(item.id)">
              <div class="left">
                <el-row :gutter="20">
                  <el-col span="50">
                    <div class="grid-content bg-purple">
                      <div class="pic">
                        <img width="100%" :src="item.pic" alt="" />
                      </div>
                      <div class="top"></div>
                    </div>
                  </el-col>
                </el-row>
              </div>

            <div class="right">
                <div class="name" style="font-size: 2em ;color: #000000;" >{{item.name}}</div>
<!--              <div v-for="item in items" :key="item.id" class="date" style="font-size: 1.3em;color: #9A9AB0">-->
<!--
<!-             </div>-->
              <div class="date" style="font-size: 1.3em;color: #9A9AB0">{{ truncateText(item.content) }}</div>
              </div>
            </div>
          </div>
        </div>
      </el-col>

    </el-row>
    </div>
  </div>
</template>


<script>
import { getScenic,hotTravels } from "@/utils/request";
export default {
    name: "Person",
  data() {
    return {
        scenicList:[],
        travels:[],
        queryParams: {
            name:null,
            pageNum: 1,
            pageSize: 4,
            total:0
        },
        queryParams2: {
            name:null,
            pageNum: 1,
            pageSize: 4,
            total:0
        }
    }
  },
  methods: {
      listDataApi(){
          getScenic(this.queryParams).then(res => {
              if(res.code == 200){
                  this.scenicList = res.rows;
                  this.queryParams.total=res.total;
              }else{
                  this.$message({
                      type:'error',
                      message:res.msg
                  })
              }
          })
      },
      findTravels() {
          hotTravels().then(res => {
              if (res.code == 200) {
                  this.travels = res.data;
              } else {
                  this.$message({
                      type: 'error',
                      message:res.msg
                  })
              }
          })
      },
      goDetail(id){
          // 跳转到详情页面，并且传递id
          this.$router.push({path:'/scenicDetail',query:{id:id}})
      },
      goTravelDetail(id){
          // 跳转到详情页面，并且传递id
          this.$router.push({path:'/travelsDetail',query:{id:id}})
      },
    truncateText(str) {
      if (str.length > 150) {
        return str.slice(0, 150) + '...'; // 截断文本并在末尾添加省略号
      }
      return str;
    }
  },
  created() {
      this.listDataApi();
      this.findTravels()
  },
}
</script>

<style scoped lang='scss'>
.info-container {
  width: 60%;
  padding: 10px;
  display: flex;
  justify-content: center; /* 水平居中 */
}

.info-box {
  background-color: #304f47;
  color: #ffffff;
  text-align: center;
  padding: 10px;
  border-radius: 25px; /* 圆角矩形 */
  font-size: 25px;
  font-weight: bold;
}

.info-box i {
  font-size: 48px;
  margin-bottom: 10px;
}
  .pro{
    .wrapper {
      width: 1240px;
      .title {
        font-size: 20px;
        line-height: 80px;
        border-bottom: 1px solid #f4f4f4;
      }
      .project {
        display: flex;
        padding: 1em 0;
        border-bottom: 1px solid #f4f4f4;
        .left {
          width: 300px;
          height: 200px;
          background-color: #f4f4f4;
          border-radius: 5px;
          overflow: hidden;
        }
        .right {
          flex: 1;
          padding: 0 2em;
          .name {
            font-weight: bolder;
            font-size: 1em;
          }
          .date {
            margin: 1em 0;
          }
        }
      }
    }
  }
.article{
  .wrapper {
    width: 740px;
    .title {
      font-size: 20px;
      line-height: 80px;
      border-bottom: 1px solid #f4f4f4;
    }
    //.project {
    //  display: flex;
    //  padding: 1em 0;
    //  border-bottom: 1px solid #f4f4f4;
    //  .left {
    //    width: 300px;
    //    height: 200px;
    //    background-color: #f4f4f4;
    //    border-radius: 5px;
    //    overflow: hidden;
    //  }
    //  .right {
    //    flex: 1;
    //    padding: 0 2em;
    //    .name {
    //      font-weight: bolder;
    //      font-size: 1em;
    //    }
    //    .date {
    //      margin: 1em 0;
    //      overflow: hidden;
    //      text-overflow: ellipsis;
    //      display: -webkit-box;
    //      -webkit-box-orient: vertical;
    //      -webkit-line-clamp: 2;
    //    }
    //  }
    //}
  }
}
  .about{
    font-size: 20px;
    line-height: 80px;
    border-bottom: 1px solid #f4f4f4;
  }
.ad {
  width: 100%;
  display: flex;
  justify-content: center; /* 水平居中 */
  font-family: 'Lora', serif;
}
.package-section {
  width: 100%;
  display: flex;
  justify-content: center;
  align-items: center;
  flex-direction: column;
  text-align: center;
  margin: 20px 0;
}

.package-header {
  font-family: 'Lora', serif;
}

.small-text {
  text-align: center;
  font-size: 42px;
  color: #C7923E;
  letter-spacing: 2px;
}

.large-text {
  text-align: center;
  font-size: 48px;
  font-weight: bold;
  color: #000000;
  margin-top: 10px;
  letter-spacing: 3px;
}
.project {
  display: flex;
  flex-direction: row;
  align-items: center;
}
.left {
  display: flex;
  justify-content: center;
  margin-bottom: 20px;
}
.grid-content {
  background-color: white;
  border-radius: 10px;
  overflow: hidden;
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
  text-align: center;
  transition: transform 0.3s;
}

.grid-content:hover {
  transform: scale(1.05);
}

.pic img {
  border-radius: 15px;
  width: 100%;
  height: auto;
}
.spot{
  //width: 100%;
  display: flex;
  justify-content: center; /* 水平居中 */
  font-family: 'Lora', serif;
}
.floating-text {
  position: absolute;
  top: 300px;
  left: 130px;
  font-family: 'Lora' ,serif;
  font-size: 72px;
  font-weight: bold; /* 加粗字体 */
  z-index: 3;
  color: #FFFFFF;
  -webkit-text-stroke: 1px #000000; /* 黑色描边，1px 宽 */
  white-space: nowrap; /* 防止文字换行 */
}
.floating-text p {
  margin: 15px; /* 移除外边距 */
  padding: 0; /* 移除内边距 */
  line-height: 1; /* 如果需要，可以调整行高 */
}
.block::after {
  content: "";
  position: absolute;
  top: 15.4%;
  left: 0;
  right: 0;
  bottom: -3.3%;
  background-color: rgba(48, 79, 71, 0.5); /* 颜色 #304F47，50% 透明度 */
  z-index: 2; /* 确保遮罩在图片上方 */
}
</style>
