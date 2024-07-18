<template>
  <div class="projects">
    <el-row>
      <el-col :span="6">
      </el-col>
      <el-col :span="18">
        <div class="wrapper">
          <div style="position: relative;left: 50px" >
            <el-form :model="queryParams" ref="queryForm" :inline="true" >
              <el-form-item label="旅行社名" prop="name" >
                <el-input
                    v-model="queryParams.name"
                    placeholder="请输入旅行社名称"
                    clearable
                    size="large"
                />
              </el-form-item>
            <el-form-item>
              <el-button type="primary" icon="el-icon-search" size="medium" @click="listDataApi()">搜索</el-button>
            </el-form-item>
            </el-form>
          </div>
          <div class="wrapper">
            <div class="art">
              <el-row class="spot" gutter="20" justify="center">
                <el-col
                    v-for="item in agencyList"
                    :key="item.id"
                    :span="6"
                >
                  <div class="grid-content bg-purple" @click="goDetail(item.id)">
                    <div class="left">
                      <img width="100%" :src="item.pic" alt="" />
                    </div>
                    <div class="right">
                      <div class="intro" style="text-align: center; font-size: 20px;font-family: 'Volkhov', serif">
                        <div class="name" style="font-weight: bold">{{ item.name }}</div>
                        <div class="phone">电话：{{ item.phone }}</div>
                        <div class="address">地址：{{ item.location }}</div>
                        <div class="scenic">好评率：{{ (item.positive / item.evaluations * 100).toFixed(1) }}%</div>
                      </div>
                      <div class="top"></div>
                    </div>
                  </div>
                </el-col>
              </el-row>
            </div>
          </div>
        </div>
      </el-col>
    </el-row>

    <div class="fr-el-page" style="padding-left: 370px">
      <el-pagination
          @size-change="handleSizeChange"
          @current-change="handleCurrentChange"
          :current-page="queryParams.pageNum"
          :page-sizes="[5]"
          :page-size="queryParams.pageSize"
          layout=" prev, pager, next"
          :total="queryParams.total"
          size="larger"
      >
      </el-pagination>
    </div>
    </div>
</template>

<script>
import {findAgency,updateAgencyReview} from "@/utils/request";
export default {
  name: "Agency",
  data(){
    return{
      agencyList:[],
      queryParams: {
        name:null,
        phone:null,
        location:null,
        picture:null,
        positive:null,
        evaluations:null,
        pageNum: 1,
        pageSize: 5,
        total:0
      }
    }
  },
  methods:{
    // 查询全部数据
    listDataApi(){
      findAgency(this.queryParams).then(res => {
        if(res.code == 200){
          console.log(res);
          this.agencyList = res.rows;
          this.queryParams.total=res.total;
          res.rows.forEach(item => {
            console.log(item.picture); // 打印每个项目的图片URL
          });
        }else{
          this.$message({
            type:'error',
            message:res.msg
          })
        }
      })
    },
    handleSizeChange(val) {
      this.queryParams.pageSize=val;
      this.queryParams.pageNum=val;
      this.listDataApi();
    },
    handleCurrentChange(val) {
      this.queryParams.pageNum=val;
      this.queryParams.pageNum=val;
      this.listDataApi();
    },
    goDetail(id){
      // 跳转到详情页面，并且传递id
      this.$router.push({path:'/agencyDetail',query:{id:id}})
    },
  },
  created() {
    this.listDataApi();
  }
}

</script>

<style scoped lang="scss">
.wrapper {
  width: 1240px;
  padding-left: 80px;
}
.title {
  font-size: 20px;
  line-height: 80px;
  border-bottom: 1px solid #f4f4f4;
}
.project {
  display: flex;
  padding: 1em 0;
  border-bottom: 1px solid #f4f4f4;
}
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
}
.name {
  font-weight: bolder;
  font-size: 1em;
}
.date {
  margin: 1em 0;
}
.intro {
  text-align: center;
  font-size: 20px;
}
</style>

