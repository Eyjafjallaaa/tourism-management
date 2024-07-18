<template>
    <div class="details">
        <div class="wrapper">
            <h2 class="name" style="font-family: 'Volkhov', serif">{{ data.name }}</h2>
          <el-row class="title" gutter="20" style="padding-top: 20px; padding-bottom: 20px;font-family: 'Lora', serif;" >
            <el-col class="oth" span="5" >
               {{data.address}}
            </el-col>
            <el-col class="oth" span="16" >
               评分：{{data.score}}
            </el-col>
          </el-row>
          <div> <img class="img" :src="data.pic"/> </div>


            <div>
                <h2 class="oth" style="padding-left: 100px" >景区简介</h2>
                <p class="con" >{{data.introduction}}</p>
            </div>
            <div>
                <h2 class="oth" style="padding-left: 100px">景区票价</h2>
                <p class="con">{{data.price}}</p>
            </div>
        </div>
      <div class="wrapper">
        <h2 class="name">热门饭店</h2>
        <div class="art">
          <el-row :gutter="20">
            <div
                class="left"
                v-for="item in findRestaurants"
                :key="item.id"
                @click="gorestDetail(item.id)"
            >
              <el-col :span="6" class="restaurant-card"
              >
                <div class="grid-content bg-purple">
                  <div class="pic"><img width="100%" :src="item.pic" class="restaurant-pic"/></div>
                  <div class="text">
                    <div class="name2">饭店名：{{ item.name }}</div>
                    <div class="name2">地址：{{ item.location }}</div>
                  </div>
                  <div class="top"></div>
                </div
                >
              </el-col>
            </div>
          </el-row>

        </div>
      </div>
      <div class="wrapper">
        <h2 class="name">旅游套餐</h2>
        <div class="art">
          <el-row :gutter="20">
            <div
                class="left"
                v-for="item in packages"
                :key="item.id"
                @click="goDetail(item.id)"
            >
              <el-col :span="6" class="restaurant-card"
              >
                <div class="grid-content bg-purple">
                  <div class="pic"><img width="100%" :src="item.pic" class="package-pic"/></div>
                  <div class="text">
                    <div class="name2">套餐名：{{item.name}}</div>
                    <div class="name2">套餐类型：{{item.type}}</div>
                    <div class="name2">套餐详情：{{item.content}}</div>
                    <div class="name2">套餐价格：{{item.price}}元</div>
                  </div>
                  <div class="top"></div>
                </div
                >
              </el-col>
            </div>
          </el-row>

        </div>
      </div>

        <div class="comment">
          <h2 class="name">用户评价</h2>
          <el-button type="primary" @click="handleAdd()">我要评价</el-button>
          <div class="average-rating">4.0 <span class="stars">★★★★★</span> Average Points</div>
          <div class="reviews">
            <div class="review" v-for="item in eva" :key="item.id">
              <div class="left">
                <img :src="defaultAvatar" class="avatar" alt="">
                <div class="reviewer-info">
                  <div class="reviewer-name">{{item.name}}</div>
                  <div class="review-date">{{item.createTime}}</div>
                </div>
              </div>
              <div class="right">
                <div class="review-content">{{item.content}}</div>
              </div>
            </div>
          </div>
        </div>


        <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
            <el-form ref="form" :model="form" label-width="80px">
                <el-form-item label="评分" prop="score">
                    <el-select v-model="form.score"
                               placeholder="请选择评分"
                               clearable
                               size="small">
                        <el-option value="1" label="1">1</el-option>
                        <el-option value="2" label="2">2</el-option>
                        <el-option value="3" label="3">3</el-option>
                        <el-option value="4" label="4">4</el-option>
                        <el-option value="5" label="5">5</el-option>
                    </el-select>
                </el-form-item>
                <el-form-item label="评价内容" prop="content">
                    <el-input v-model="form.content" type="textarea" placeholder="请输入评价内容"/>
                </el-form-item>
            </el-form>
            <div slot="footer" class="dialog-footer">
                <el-button type="primary" @click="submitForm">确 定</el-button>
                <el-button @click="cancel">取 消</el-button>
            </div>
        </el-dialog>
    </div>


</template>

<script>
    import {getScenicDetail, getList, addEvaluate, getToken, findRestaurant, listPackages} from "@/utils/request";

    export default {
        name: "ScenicDetail",
        data() {
            return {
                id: "",
                data: {},
                findRestaurants: [],
                eva: [],
                packages: [],
                open: false,
                title: '',
                city: '',
                form: {
                    sid: "",
                    content: '',
                    scenic: '',
                    score: ""
                },
                scenic: '',
                page: {
                    size: 8,
                    currentPage: 1,
                    total: 0,
                },
                datas: {
                    pageNum: 1,
                    pageSize: 8,

                },
                defaultAvatar: '/Users/vincent/Documents/GitHub/tourism-manage/tourist-ui/src/img/profile.jpg'
            };
        },
        methods: {
            handleAdd() {
                this.open = true;
                this.title = "添加景点评价";
            },
            findPageQueryRestaurant() {
              this.datas.location = this.data.city;
                findRestaurant(this.datas).then((res) => {
                    if (res.code == 200) {
                        this.findRestaurants = res.rows;
                        this.page.total = res.total;
                    } else {
                        this.$message({
                            type: "error",
                            message: this.message,
                        });
                    }
                });
            },
            findPackage() {
                const datas={
                    pageNum:1,
                    pageSize:100,
                    sid:this.id
                }
                listPackages(datas).then((res) => {
                    if (res.code == 200) {
                        this.packages = res.rows;
                    } else {
                        this.$message({
                            type: "error",
                            message: this.message,
                        });
                    }
                });
            },
            handleSizeChange(val) {
                this.page.size = val;
                this.queryParams.pageNum = val;
                this.findPageQueryRestaurant();
            },
            handleCurrentChange(val) {
                this.page.currentPage = val;
                this.queryParams.pageNum = val;
                this.findPageQueryRestaurant();
            },
            /** 提交按钮 */
            submitForm() {
                this.$refs["form"].validate(valid => {
                    if (valid) {
                        let a = undefined;
                        if (a !== getToken()) {
                            addEvaluate(this.form.score, this.form.content, this.id, this.scenic).then(response => {
                                this.$message({
                                    type: "success",
                                    message: "评价成功",
                                });
                                this.open = false;
                                this.findDetails();
                            });
                        } else {
                            this.$message({
                                type: "error",
                                message: "请先登录",
                            });
                        }

                    }
                });
            },
            // 取消按钮
            cancel() {
                this.open = false;
            },
            // 查询项目的详细信息
            findDetails() {
                // 数据交互
                getScenicDetail(this.id).then((res) => {
                    if (res.code == 200) {
                        this.data = res.data;
                        this.scenic = res.data.name;
                        this.datas.city = res.data.city
                        this.findPageQueryRestaurant()
                    } else {
                        this.$message({
                            type: "error",
                            message: res.msg,
                        });
                    }
                });
            },
            getEvaList() {
                getList(this.id).then(res => {
                    if (res.code == 200) {
                        res.data.forEach(i => {
                            i.name = i.name.substring(0, 1) + "****"
                        })
                        this.eva = res.data;
                    } else {
                        this.$message({
                            type: "error",
                            message: res.msg,
                        });
                    }
                })
            },
            goDetail(id){
                // 跳转到详情页面，并且传递id
                this.$router.push({path:'/packageDetail',query:{id:id}})
            },

      gorestDetail(id){
        // 跳转到详情页面，并且传递id
        this.$router.push({path:'/restaurantDetail',query:{id:id}})
      }

        },
        created() {
            // 在页面加载的时候拿到数据
            // 拿到从上一个页面传过来的id值
            this.id = this.$route.query.id;
            this.findDetails();
            this.getEvaList();
            this.findPackage()
        },
    };
</script>

<style scoped lang='scss'>
.wrapper{
  padding-left: 300px;
        .name {
          font-size: 54px;
          font-weight: bold;
          margin-bottom: 10px;
          font-family: 'Lora', serif;
        }

        .img {
          width: 1080px;
          height: auto;

        }

        .oth {
          display: flex;
          align-items: center;
          font-size: 25px;
          margin-bottom: 10px;
          font-family: 'Volkhov', serif;
        }

        .con {
          max-width: 860px; /* 设置最大宽度为860px */
             /* 上下边距为0，左右边距自动，实现水平居中 */
          margin: 0 auto;
          font-size: 20px;
          padding-right: 320px;
          font-family: 'Volkhov', serif
        }
}
    .restaurant-card, .package-card {
      border: 1px solid #ddd;
      border-radius: 5px;
      overflow: hidden;
      margin-bottom: 20px;
      cursor: pointer;
      transition: transform 0.3s;
      font-family: 'Volkhov', serif
    }

    .restaurant-card:hover, .package-card:hover {
      transform: scale(1.05);
    }

    .restaurant-pic, .package-pic {
      height: 150px;
      object-fit: cover;
    }

    .name2 {
      font-size: 16px;
      margin-bottom: 5px;
    }

.comment{
  margin-bottom: 20px;
  padding-left: 300px;
  font-family: 'Volkhov', serif;
  .name {
    font-size: 40px;
    font-weight: bold;
    margin-bottom: 10px;
  }

  .el-button {
    margin-bottom: 20px;
  }

  .average-rating {
    font-size: 24px;
    font-weight: bold;
    margin-bottom: 20px;

  }

  .stars {
    color: #FFD700;
    margin-left: 5px;
  }

  .reviews {
    border-top: 1px solid #ddd;
    padding-top: 20px;
  }

  .review {
    display: flex;
    padding: 20px 0;
    border-bottom: 1px solid #ddd;
  }

  .left {
    width: 15%;
    display: flex;
    flex-direction: column;
    align-items: center;
    margin-right: 20px;
  }

  .avatar {
    width: 60px;
    height: 60px;
    border-radius: 50%;
    margin-bottom: 10px;
  }

  .reviewer-info {
    text-align: center;
  }

  .reviewer-name {
    font-size: 20px;
    font-weight: bold;
  }

  .review-date {
    font-size: 18px;
    color: #888;
  }

  .right {
    width: 85%;
  }

  .review-content {
    font-size: 26px;
  }
}
</style>
