
<template>
  <div class="details">
    <div class="wrapper">
      <el-row>
        <el-col :span="12" class="left-column">
          <h2 class="name">{{ data.name }}</h2>
          <img class="img" :src="data.pic" />
          <div class="spacing"></div>
        </el-col>
        <el-col :span="12" class="right-column">
          <div class="description-section">
            <h2 class="oth">描述</h2>
            <span class="con">{{ data.description }}</span>
          </div>
          <div class="recommendation-section">
            <h2 class="oth">推荐饭店</h2>
            <div v-for="item in data.list" :key="item" class="recommendation-item">
              <span class="con">{{ item }}</span>
            </div>
          </div>
          <div class="price-section">
            <h1 class="oth">价格</h1>
            <span class="oth">¥{{ data.price }}</span>
          </div>
        </el-col>
      </el-row>
      <el-row>
        <el-col :span="12" style="padding-left: 280px">
          <el-button @click="purchase">立即购买</el-button>
          <div class="spacing"></div>
        </el-col>
        <el-col :span="12">
          <div id="mapContainer" class="map-container" v-if="showmap"></div>
          <div id="resultPanel" ></div>
        </el-col>
      </el-row>
      <el-dialog title="提示" :visible.sync="dialogVisible" width="550px" :before-close="handleClose">
        <div>
          <el-row>
            <el-col :span="16">
              <el-form>
                <el-form-item label="商品名:">
                  <span>{{ data.name }}</span>
                </el-form-item>
                <el-form-item label="饭店名:">
                  <span>{{ data.restaurant }}</span>
                </el-form-item>
                <el-form-item label="数量:">
                  <el-input-number v-model="num" :min="0" :max="10" @change="handleChange" />
                </el-form-item>
                <el-form-item label="总价:">
                  <span class="total-price">¥{{ totalpice }}</span>
                </el-form-item>
                <el-form-item>
                  <el-button type="primary" @click="toPay">确定</el-button>
                </el-form-item>
              </el-form>
            </el-col>
            <el-col :span="8" class="dialog-image-container">
              <img :src="data.pic" class="dialog-image">
            </el-col>
          </el-row>
        </div>
      </el-dialog>
    </div>
  </div>
</template>

<script>
import AMapLoader from "@amap/amap-jsapi-loader";
import { getFood, findTjFood, getToken, addSchedule } from "@/utils/request";

export default {
  name: "FoodDetail",
  data() {
    return {
      showmap: false,
      id: "",
      num: 0,
      dialogVisible: false,
      data: {},
      queryParams: {
        city: null,
      },
      totalpice: 0,
      findFoods: [],
    };
  },
  methods: {
    creat_map() {
      window._AMapSecurityConfig = {
        securityJsCode: "4d2cd63d9ce101672db52253edc1e05f",
      };
      AMapLoader.load({
        key: "4ce48e76340b131517af4f0cb5dac11c",
        version: "2.0",
        plugins: ["AMap.Scale", "AMap.Driving","AMap.PlaceSearch"],
      }).then((AMap) => {
        const map = new AMap.Map("mapContainer");
        /*const points = [
          { keyword: '中南大学',city:'长沙' }, //起始点坐标
          { keyword: this.data.restaurant,city:this.data.city } //终点坐标
        ]
        const driving = new AMap.Driving({
          map:map,
          pannel:"resultPanel"
        })
        driving.search(points, function (status, result) {
          if (status === "complete") {
            //status：complete 表示查询成功，no_data 为查询无结果，error 代表查询错误
            //查询成功时，result 即为对应的驾车导航信息
            console.log(result);
          } else {
            console.log("获取驾车数据失败：" + result);
          }
        })
        map.addControl(new AMap.Scale());*/
        /******************************/
        const placeSearch = new AMap.PlaceSearch({
          pageSize: 5,
          pageIndex: 1,
          map: map,
          citylimit: false,
          city: this.data.city,
          panel: "resultPanel",
        });
        placeSearch.search(this.data.restaurant, (status, result) => {
          if (status === "complete" && result.info === "OK") {
            console.log(result);
          } else {
            console.log("搜索失败");
          }
        });
        map.addControl(new AMap.Scale());
      });
    },
    toPay() {
      const orderdetails = {
        sid: "0",
        sname: this.data.name,
        price: this.totalpice,
        num: this.num,
        status: "已购买",
      };
      if (getToken() !== undefined) {
        addSchedule(orderdetails).then((res) => {
          if (res.code == 200) {
            this.$message({
              type: "success",
              message: "购买成功，请前往地图所示餐厅",
            });
            this.dialogVisible = false;
            this.showmap = true;
            this.creat_map();
          } else {
            this.$message({
              type: "error",
              message: "购买失败",
            });
          }
        });
      }
    },
    handleChange(val) {
      this.totalpice = val * this.data.price;
    },
    purchase() {
      this.dialogVisible = true;
    },
    handleClose(done) {
      this.$confirm("确认关闭？")
          .then((_) => {
            done();
          })
          .catch((_) => {});
    },
    findDetails() {
      getFood(this.id).then((res) => {
        if (res.code == 200) {
          this.data = res.data;
          this.queryParams.city = res.data.city;
          findTjFood(this.queryParams).then((res) => {
            if (res.code == 200) {
              this.findFoods = res.data;
            } else {
              this.$message({
                type: "error",
                message: this.message,
              });
            }
          });
        } else {
          this.$message({
            type: "error",
            message: res.msg,
          });
        }
      });
    },
    findPageQueryFood() {},
  },
  created() {
    this.id = this.$route.query.id;
    this.findDetails();
    this.findPageQueryFood();
  },
};
</script>

<style scoped lang="scss">
.details {
  background-color: #f9f9f9;
  padding: 20px;
  .wrapper {
    background-color: #ffffff;
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    .left-column {
      text-align: center;
    }
    .right-column {
      padding-left: 20px;
    }
    .name {
      font-size: 30px;
      color: #0189ec;
      margin-bottom: 20px;
      font-family: 'Volkhov', serif;
    }
    .img {
      width: 200px;
      height: 200px;
      border-radius: 50%;
      object-fit: cover;
      display: block;
      margin: 0 auto;
    }
    .spacing {
      height: 50px;
    }
    .description-section,
    .recommendation-section,
    .price-section {
      margin-bottom: 20px;
    }
    .oth {
      font-size: 30px;
      font-family: 'Volkhov', serif;
      color: #333;
      margin-bottom: 10px;
    }
    .con {
      font-size: 16px;
      color: #666;
      line-height: 1.5;
    }
    .price-section .oth {
      font-size: 24px;
      font-weight: bold;
    }
    .map-container {
      width: 100%;
      height: 400px;
      margin-top: 20px;
    }
    .dialog-image-container {
      text-align: center;
    }
    .dialog-image {
      width: 100px;
      height: 100px;
      border-radius: 10px;
      object-fit: cover;
    }
    .total-price {
      font-size: 20px;
      color: #0189ec;
    }
  }
}
</style>
