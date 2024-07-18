<template>
  <div class="details">
    <div class="wrapper">
      <h2 class="name">{{ data.name }}</h2>
      <el-row>
        <el-col :span="6">
          <img class="avatar" :src="data.pic" />
        </el-col>
        <el-col :span="18" class="info-column">
          <h2 class="oth">导游姓名：{{ data.name }}</h2>
          <div class="info-item">
            <h2 class="oth">导游年龄：{{ data.age }}</h2>
          </div>
          <div class="info-item">
            <h2 class="oth">导游电话：{{ data.phone }}</h2>
          </div>
          <div class="info-item">
            <h2 class="oth">导游所在地：{{ data.address }}</h2>
          </div>
          <div class="info-item">
            <h2 class="oth">导游所属景区：{{ data.scenic }}</h2>
          </div>
          <div class="info-item">
            <h2 class="oth">导游资质审验：{{ data.qualification }}</h2>
          </div>
        </el-col>
      </el-row>

      <div class="description">
        <h2 class="oth">导游简介</h2>
        <span class="con">{{ data.info }}</span>
      </div>
    </div>
  </div>
</template>

<script>
import { getGuideDetail } from "@/utils/request";

export default {
  name: "GuideDetail",
  data() {
    return {
      id: "",
      data: {},
    };
  },
  methods: {
    // 查询项目的详细信息
    findDetails() {
      getGuideDetail(this.id).then((res) => {
        if (res.code == 200) {
          this.data = res.data;
        } else {
          this.$message({
            type: "error",
            message: res.msg,
          });
        }
      });
    },

    goDetail(id) {
      // 跳转到详情页面，并且传递id
      this.$router.push({ path: '/packageDetail', query: { id: id } });
    },
  },
  created() {
    // 在页面加载的时候拿到数据
    this.id = this.$route.query.id;
    this.findDetails();
  },
};
</script>

<style scoped lang="scss">
.details {
  background-color: #f9f9f9;
  padding: 20px;
  font-family: 'Volkhov', serif;
  .wrapper {
    background-color: #ffffff;
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    .name {
      text-align: center;
      font-size: 50px;
      color: #0189ec;
      margin-bottom: 20px;
    }
    .avatar {
      width: 150px;
      height: 150px;
      border-radius: 50%;
      object-fit: cover;
      display: block;
      padding-left: 500px;
    }
    .info-column {
      padding-left: 400px;
    }
    .oth {
      font-size: 18px;
      color: #333;
      margin-bottom: 10px;
    }
    .info-item {
      margin-bottom: 10px;
    }
    .description {
      margin-top: 20px;
      .con {
        font-size: 20px;
        color: #666;
        line-height: 1.5;
      }
    }
  }
}
</style>
