<template>
  <div class="projects">

    <el-row>
      <el-col :span="6">
      </el-col>
      <el-col :span="18">
        <div class="wrapper">
          <div style="position: relative;left: 50px" >
            <el-form :model="queryParams" ref="queryForm" :inline="true" >
              <el-form-item label="导游姓名" prop="name" >
                <el-input
                    v-model="queryParams.name"
                    placeholder="请输入导游姓名"
                    clearable
                    size="lager"
                />
              </el-form-item>
              <el-form-item label="导游所在城市" prop="name">
                <el-input
                    v-model="queryParams.address"
                    placeholder="请输入城市"
                    clearable
                    size="larger"
                />
              </el-form-item>
              <el-form-item label="景点" prop="name">
              <el-input
                  v-model="queryParams.scenic"
                  placeholder="请输入导游所在景点"
                  clearable
                  size="larger"
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
                    v-for="item in guideList"
                    :key="item.id"
                    :span="6"
                >
                  <div class="grid-content bg-purple" @click="goDetail(item.id)">
                    <div class="left">
                      <img width="100%" :src="item.pic" alt="" />
                    </div>
                    <div class="right">
                      <div class="intro" style="text-align: center; font-size: 20px;font-family: 'Volkhov', serif">
                        <div class="name" style="font-weight: bold">姓名：{{ item.name }}</div>
                        <div class="phone">电话：{{ item.phone }}</div>
                        <div class="address">所在地：{{ item.address }}</div>
                        <div class="scenic">所属景区：{{ item.scenic }}</div>
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
import {getGuide} from "@/utils/request";
export default {
  name: "Guide",
  data(){
    return{
      guideList:[],
      queryParams: {
        name:null,
        city:null,
        scenic:null,
        phone:null,
        address:null,
        pageNum: 1,
        pageSize: 5,
        total:0
      }
    }
  },
  methods:{
    // 查询全部数据
    listDataApi(){
      getGuide(this.queryParams).then(res => {
        if(res.code == 200){
          console.log(res);
          this.guideList = res.rows;
          this.queryParams.total=res.total;
          res.rows.forEach(item => {
            console.log(item.pic); // 打印每个项目的图片URL
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
      this.$router.push({path:'/guideDetail',query:{id:id}})
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
