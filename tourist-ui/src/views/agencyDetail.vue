<template>
  <div class="details">
    <div class="wrapper">
      <h2 class="name">{{ data.name }}</h2>
      <el-row>
        <el-col :span="16">
          <img class="img" :src="data.pic"/>
        </el-col>
        <el-col :span="8">
          <h2 class="oth">好评率：{{ (data.positive / data.evaluations * 100).toFixed(1) }}%</h2>
          <h2 class="oth">咨询电话：{{data.phone}}</h2>
          <h2 class="oth">地址：{{data.location}}</h2>
          <h2 class="oth">诚信评级：A</h2>
        </el-col>
      </el-row>
      <div class="button-container">
        <button class="button" @click="handlePositiveReview" :disabled="reviewed">好评</button><!-- 添加了 :disabled="data.reviewed" 属性 -->
        <button class="button" @click="handleNegativeReview" :disabled="reviewed">差评</button><!-- 添加了 :disabled="data.reviewed" 属性 -->
      </div>
    </div>
  </div>

</template>

<script>
import {getAgencyDetail,updateAgencyReview} from "@/utils/request";
export default {
  name: "AgencyDetail",
  data() {
    return {
      id: "",
      name:null,
      positive:null,
      phone:null,
      location:null,
      integrity:null,
      evaluations:null,
      reviewed:false,
      data: {},
      scenicList:[],
      scenic: '',
      page: {
        size: 8,
        currentPage: 1,
        total: 0,
      },
      datas: {
        pageNum: 1,
        pageSize: 8,
        city: '',
      }
    };
  },
  methods: {

    // 查询项目的详细信息
    findDetails() {
      // 数据交互
      getAgencyDetail(this.id).then((res) => {
        if (res.code == 200) {
          this.data = res.data
        } else {
          this.$message({
            type: "error",
            message: res.msg,
          });
        }
      });
    },
    handlePositiveReview() {
      // 更新好评
      this.data.evaluations += 1;
      this.data.positive += 1;
      this.reviewed=true;
      this.updateReview();
    },

    handleNegativeReview() {
      // 更新差评
      this.data.evaluations += 1;
      this.reviewed=true;
      this.updateReview();
    },
    updateReview() {
      // 更新数据库中的评价数据
      const updatedReview = {
        id: this.id,
        evaluations: this.data.evaluations,
        positive: this.data.positive,
      };
      updateAgencyReview(this.id,updatedReview).then((res) => {
        this.$message({
          type: "success",
          message: "评价已更新",
        });
        if (res.code === 200) {
          // 更新成功
          this.$message({
            type: "success",
            message: "评价已更新",
          });
        } else {
          // 更新失败
          this.$message({
            type: "error",
            message: "评价更新失败",
          });
        }
      });
    },
  },
  created() {
    // 在页面加载的时候拿到数据
    // 拿到从上一个页面传过来的id值
    this.id = this.$route.query.id;
    this.findDetails();
  },
};
</script>

<style scoped lang='scss'>
.details {
  .wrapper {
    font-family: 'Volkhov', serif;
    .name {
      text-align: center;
      font-size: 40px;
      color: #0189ec;
    }
    .img {
      width: 800px;
      height: 500px;
    }
    .oth {
      /*text-align: center;*/
      font-size: 30px;
    }
    .con {
      font-size: 18px;
    }
  }
}

.name2 {
  text-align: center;
}

.titlee {
  font-weight: bold;
}

.intro {
  overflow: hidden;
  text-overflow: ellipsis;
  display: -webkit-box;
  -webkit-box-orient: vertical;
  -webkit-line-clamp: 2;
  padding-top: 20px;
}

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
  .button-container {
    text-align: center;
    margin-top: 20px;
  }

  .button-container {
    display: flex;
    justify-content: center;
    margin-top: 1em;
  }

  .button {
    margin: 0 0.5em;
    padding: 0.5em 1em;
    font-size: 16px;
  }

  [disabled] {
    opacity: 0.5;
    cursor: not-allowed;
  }
}
</style>
