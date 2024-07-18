<template>
    <div class="projects">
        <el-row>
            <el-col :span="18">
                <div class="wrapper">
                    <div style="position: relative;left: 215px" >
                        <el-form :model="queryParams" ref="queryForm" :inline="true" label-width="68px">
                            <el-form-item label="景点名字" prop="name" >
                                <el-input
                                        v-model="queryParams.name"
                                        placeholder="请输入景点名字"
                                        clearable
                                        size="lager"
                                />
                            </el-form-item>
                            <el-form-item label="城市" prop="name">
                                <el-input
                                        v-model="queryParams.city"
                                        placeholder="请输入城市"
                                        clearable
                                        size="larger"
                                />
                            </el-form-item>
                            <el-form-item>
                                <el-button type="primary" icon="el-icon-search" size="medium" @click="listDataApi()">搜索</el-button>
                            </el-form-item>
                        </el-form>
                    </div>
                  <div class="project" v-for="item in scenicList" :key="item.id" @click="goDetail(item.id)" style="position: relative;left: 200px">
                    <div class="left">
                      <img width="100%" :src="item.pic" alt="" />
                    </div>
                    <div class="right">
                      <div class="tag">OUTDOOR ACTIVITIES</div>
                      <div class="title">{{ item.name }}</div>
                      <div class="rating">
                        <span class="stars">★★★★☆</span>
                        <span class="reviews">({{item.score}} points)</span>
                      </div>
                      <div class="details">
                        <span class="duration">2 hours</span>
                        <span class="transport">Transport</span>
                        <span class="plan">Family Plan</span>
                      </div>
                      <div class="price">$35.00 per person</div>
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
    import { getScenic,getToken} from "@/utils/request";
    export default {
        name: "Scenic",
        data(){
            return{
                scenicList:[],
                queryParams: {
                    name:null,
                    city:null,
                    pageNum: 1,
                    pageSize: 5,
                    total:0,
                }
            }
        },
        methods:{
            // 查询全部数据
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
                this.$router.push({path:'/scenicDetail',query:{id:id}})
            },

        },
        created() {
            this.listDataApi();
        },

    }

</script>

<style scoped lang="scss">
.project {
  display: flex;
  align-items: center;
  margin: 20px 0;
  padding: 10px;
  background: #fff;
  border-radius: 10px;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
  font-family: 'Volkhov', serif;
}

.left {
  flex: 1;
  margin-right: 20px;
}

.right {
  flex: 2;
  display: flex;
  flex-direction: column;
}

.tag {
  background: #d1e7dd;
  color: #0f5132;
  padding: 5px 10px;
  border-radius: 5px;
  font-size: 14px;
  display: inline-block;
  margin-bottom: 10px;
}

.title {
  font-size: 20px;
  font-weight: bold;
  margin-bottom: 10px;
}

.rating {
  display: flex;
  align-items: center;
  margin-bottom: 10px;
}

.stars {
  color: #ffc107;
  margin-right: 5px;
}

.reviews {
  color: #6c757d;
  font-size: 14px;
}

.details {
  display: flex;
  align-items: center;
  margin-bottom: 20px;
}

.details span {
  display: flex;
  align-items: center;
  margin-right: 20px;
  font-size: 14px;
  color: #6c757d;
}

.price {
  font-size: 20px;
  font-weight: bold;
  color: #20c997;
  margin-top: auto;
}

</style>
