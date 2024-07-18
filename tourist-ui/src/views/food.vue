<template>
  <div class="article">
    <div class="wrapper">
      <div class="top" style="position: relative;left: 115px">
        <el-form
          :model="queryParams"
          ref="queryForm"
          :inline="true"
          v-show="showSearch"
          label-width="68px"
        >
          <el-form-item label="饭店名称" prop="name">
            <el-input
              v-model="queryParams.name"
              placeholder="请输入饭店名称"
              clearable
              size="large"
              @keyup.enter.native="handleQuery"
            />
          </el-form-item>
          <el-form-item label="所属城市" prop="city">
            <el-input
              v-model="queryParams.city"
              placeholder="请输入所属城市"
              clearable
              size="large"
              @keyup.enter.native="handleQuery"
            />
          </el-form-item>
          <el-form-item>
            <el-button
              type="primary"
              icon="el-icon-search"
              size="medium"
              @click="handleQuery"
              >搜索</el-button
            >
          </el-form-item>
        </el-form>
      </div>
      <div class="art">
        <div class="left"
             v-for="item in findFoods"
             :key="item.id"
             @click="goDetail(item.id)">
        <el-row :gutter="30" >

          <el-col span="23"
              ><div class="grid-content bg-purple">
                <div class="pic"><img width="100%" :src="item.pic" /></div>
                <div class="text">
                  <div class="name">饭店名：{{ item.name }}</div>
                  <div class="name">地址：{{ item.city }}</div>
                </div>
                <div class="top"></div></div
            ></el-col>

        </el-row>
        </div>
      </div>
        <div class="page" style="padding-left: 130px">
          <el-pagination
            @size-change="handleSizeChange"
            @current-change="handleCurrentChange"
            :current-page="page.currentPage"
            :page-sizes="[8, 12, 16]"
            :page-size="page.size"
            layout="total,prev, pager, next"
            :total="page.total"
          >
          </el-pagination>
      </div>
<!--      <div class="art">-->
<!--        <el-row :gutter="20">-->
<!--          <el-col-->
<!--              v-for="item in findFoods"-->
<!--              :key="item.id"-->
<!--              :span="4"-->
<!--              @click="goDetail(item.id)"-->
<!--          >-->
<!--            <div class="grid-content">-->
<!--              <div class="pic">-->
<!--                <img width="100%" :src="item.pic" />-->
<!--              </div>-->
<!--              <div class="text">-->
<!--                <div class="name">{{ item.name }}</div>-->
<!--                <div class="city">{{ item.city }}</div>-->
<!--                <div class="description">-->
<!--                  Lorem ipsum dolor sit amet, consectetur adipiscing elit. Volutpat elit sed pretium, egestas sed sit.-->
<!--                </div>-->
<!--              </div>-->
<!--            </div>-->
<!--          </el-col>-->
<!--        </el-row>-->
<!--        <div class="page">-->
<!--          <el-pagination-->
<!--              @size-change="handleSizeChange"-->
<!--              @current-change="handleCurrentChange"-->
<!--              :current-page="page.currentPage"-->
<!--              :page-sizes="[8, 12, 16]"-->
<!--              :page-size="page.size"-->
<!--              layout="total, sizes, prev, pager, next"-->
<!--              :total="page.total"-->
<!--          >-->
<!--          </el-pagination>-->
<!--        </div>-->
<!--      </div>-->
    </div>
  </div>
</template>

<script>
import { findFood } from "@/utils/request";
export default {
  name: "Food",
  data() {
    return {
        findFoods: [],
      // 显示搜索条件
      showSearch: true,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 4,
        name: null,
        city: null,
      },
      // 表单参数
      form: {},
      // 分页
      page: {
        size: 8,
        currentPage: 1,
        total: 0,
      },
    };
  },
  methods: {
    findPageQueryFood() {
      findFood(this.queryParams).then((res) => {
        if (res.code == 200) {
          this.findFoods = res.rows;
          this.page.total = res.total;
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
      this.findPageQueryFood();
    },
    handleCurrentChange(val) {
      this.page.currentPage = val;
      this.queryParams.pageNum = val;
      this.findPageQueryFood();
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1;
      this.findPageQueryFood();
    },
      goDetail(id){
          // 跳转到详情页面，并且传递id
          this.$router.push({path:'/foodDetail',query:{id:id}})
      },
  },
  created() {
      this.findPageQueryFood();
  },
};
</script>

<style scoped lang='scss'>
.top {
  height: 40px;
  margin: 8px 0 50px 0;
}
.name {
  text-align: center;
}
.page {
  margin-left: 480px;
}
.art {
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

.text {
  padding: 10px;
}

.name {
  font-size: 20px;
  font-weight: bold;
  margin-bottom: 5px;
}

.city {
  font-size: 16px;
  color: #6c757d;
  margin-bottom: 10px;
}

.description {
  font-size: 14px;
  color: #6c757d;
}
</style>
