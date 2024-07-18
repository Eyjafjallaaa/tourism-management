<template>
    <div class="projects">
        <div style="position: relative;left: 115px">
            <el-form :model="queryParams" ref="queryForm" :inline="true" label-width="120px">
                <el-form-item label="游记标题" prop="address">
                    <el-input
                            v-model="queryParams.name"
                            placeholder="请输入游记标题"
                            clearable
                            size="large"
                    />
                </el-form-item>
                <el-form-item>
                    <el-button type="primary" icon="el-icon-search" size="medium" @click="handleQuery">搜索</el-button>
                    <el-button style="left:500px;" type="primary"  size="medium" @click="goSubmit">发布游记</el-button>
                </el-form-item>
            </el-form>
        </div>
        <div class="wrapper">
            <div class="project" v-for="item in travels" :key="item.id" @click="goDetail(item.id)">
                <div class="left">
                  <div class="intro">
                    <h2>{{item.name}}</h2>
                    <p>{{ truncateText(item.content) }}</p>
                    <button class="explore-button">
                       <label style="font-size: 20px">{{item.goodNum}} </label>LIKES
                    </button>
                    <div  style="margin-top: 100px"></div>
                  </div>
                </div>
                <div class="right">
                  <img
                    width="640px"
                    :src="item.pic"
                    alt=""
                />

                </div>
            </div>
        </div>
        <div class="fr-el-page" style="text-align: center">
            <el-pagination
                    @size-change="handleSizeChange"
                    @current-change="handleCurrentChange"
                    :current-page="queryParams.pageNum"
                    :page-sizes="[4]"
                    :page-size="queryParams.pageSize"
                    layout="total, prev, pager, next"
                    :total="queryParams.total"
            >
            </el-pagination>
        </div>
    </div>

</template>

<script>
    import {listTravels} from "@/utils/request";

    export default {
        name: "travels",
        data() {
            return {
                travels: [],
                queryParams: {
                    pageNum: 1,
                    pageSize: 4,
                    total:0,
                    name:''
                }
            }
        },
        methods: {
            findTravels() {
                listTravels(this.queryParams).then(res => {
                    if (res.code == 200) {
                        this.travels = res.rows;
                        this.queryParams.total=res.total;
                    } else {
                        this.$message({
                            type: 'error',
                            message:res.msg
                        })
                    }
                })
            },
            handleSizeChange(val) {
                this.queryParams.pageSize=val;
                this.queryParams.pageNum=val;
                this.findTravels();
            },
            handleCurrentChange(val) {
                this.queryParams.pageNum=val;
                this.queryParams.pageNum=val;
                this.findTravels();
            },
            goDetail(id){
              // 跳转到详情页面，并且传递id
              this.$router.push({path:'/travelsDetail',query:{id:id}})
            },
            /** 搜索按钮操作 */
            handleQuery() {
                this.queryParams.pageNum = 1;
                this.findTravels();
            },
            goSubmit(){
                // 跳转到详情页面，并且传递id
                this.$router.push({path:'/submitTravels'})
            },
          truncateText(str) {
            if (str.length > 150) {
              return str.slice(0, 150) + '...'; // 截断文本并在末尾添加省略号
            }
            return str;

          }

        },
        created() {
            this.findTravels()
        }
    }
</script>

<style scoped lang='scss'>
.project {
  display: flex;
  align-items: center;
  margin: 20px 0;
  padding-left: 200px;
}
.left::before {
  content: '';
  position: absolute;
  left: 30px;
  top: 50px;
  bottom: 50px;
  width: 1px;
  background-color: #0c0c0c; /* 修改为你需要的颜色 */
}
.left {
  flex: 3;
  padding: 20px;
  position: relative;
}

.intro {
  font-family: 'Lora', serif;
  color: #2c3e50;
  padding-left: 20px;
}

.intro h2 {
  font-size: 28px;
  font-weight: bold;
}

.intro p {
  margin-top: 10px;
  line-height: 1.5;
  font-size: 20px;
}

.explore-button {
  margin-top: 20px;
  padding: 10px 20px;
  width: 160px;
  height: 50px;
  background-color: #C7923E;
  color: #ffffff;
  border: none;
  border-radius: 25px;
  cursor: pointer;
  font-size: 16px;
  font-weight: bold;
  font-family: 'Lora', serif;
}

.right {
  flex: 1;
  padding: 20px;
}

.right img {
  max-width: 640px;
  height: auto;
  border-radius: 20px;
}

</style>
