
<template>
  <div class="details">
    <div class="wrapper">
      <h2 class="name">{{ data.name }}</h2>
      <img class="img" :src="data.pic"/>
      <div >
        <span class="con">{{data.content}}</span>
      </div>
    </div>
    <el-button type="success" style="position: relative;left: 93%;font-family: 'Volkhov', serif" @click="good()" v-show="goodSize"><span>点赞</span></el-button>
    <el-button type="success" style="position: relative;left: 93%;font-family: 'Volkhov', serif" @click="cancelGood()" v-show="!goodSize"><span>取消点赞</span></el-button>
  </div>
</template>
<script>
import { getTravels,addGood,canGood,listGoodSize } from "@/utils/request";
export default {
  name: "TravelsDetail",
  data() {
    return {
      id: "",
      data: {},
      goodSize:false,
    };
  },
  methods: {
    // 查询项目的详细信息
    findDetails() {
      // 数据交互
      getTravels(this.id).then((res) => {
        if (res.code == 200) {
          this.data = res.data;
        } else {
          this.$message({
            type: "error",
            message: res.msg,
          });
        }
      });
    },good(){
      const data={
        tid:this.id,
        tname:this.data.name
      }
      addGood(data).then((res)=>{
        this.$message({
          type: "success",
          message: "点赞成功",
        });
        this.getSize()
      });
    },
    cancelGood(){
      const data={
        tid:this.id,
      }
      canGood(data).then((res)=>{
        this.$message({
          type: "success",
          message: "取消点赞成功",
        });
        this.getSize()
      })
    },getSize(){
      const data={
        tid:this.id,
      }
      listGoodSize(data).then((res)=>{
        if (res.data==1){
          this.goodSize=false
        } else {
          this.goodSize=true
        }
      })
    }
  },
  created() {
    // 在页面加载的时候拿到数据
    // 拿到从上一个页面传过来的id值
    this.id = this.$route.query.id;
    this.findDetails();
    this.getSize()
  },
};
</script>

<style scoped lang='scss'>
.details {
  .wrapper{
    .name {
      text-align: center;
      font-size: 50px;
      color: #0189ec;
      font-family: 'Lora', serif;
    }
    .img{
      width: 100%;
      height: auto;
      border-radius: 35px;
    }
    .oth {
      /*text-align: center;*/
      font-size: 30px;
    }
    .con {
      font-size: 28px;
      font-family: 'Volkhov', serif;
    }
  }
}
</style>
