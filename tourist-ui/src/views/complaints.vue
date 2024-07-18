<template>
  <div class="container">
    <el-container>
      <el-aside width="200px" style="border-radius: 5px">
        <el-menu
            default-active="1"
            class="el-menu-vertical-demo"
            @select="handleSelect"
            background-color="#d1e7dd"
            text-color="#fff"
            active-text-color="#304f47">
          <el-menu-item index="1">
            <i class="el-icon-document" style="color:#FFFFFF"></i>
            <span slot="title">申请投诉</span>
          </el-menu-item>
          <el-menu-item index="2" @click="findPageQueryComplains">
            <i class="el-icon-menu" style="color:#FFFFFF"></i>
            <span slot="title">投诉查看</span>
          </el-menu-item>
        </el-menu>
      </el-aside>

      <el-container>
        <el-header v-if="showHeader" class="step">
          <el-steps :active="active" space="300px">
            <el-step title="投诉申请" icon="el-icon-edit"></el-step>
            <el-step title="提交处理" icon="el-icon-refresh"></el-step>
            <el-step title="完成提交" icon="el-icon-s-opportunity"></el-step>
          </el-steps>
        </el-header>

        <el-main style="width: 620px;height: 538px">
          <div v-show="active === 1">
            <el-form class="form" ref="form" :model="form" label-width="120px">
              <el-form-item label="投诉人姓名">
                <el-input v-model="form.name"></el-input>
              </el-form-item>
              <el-form-item label="联系方式">
                <el-input v-model="form.contact"></el-input>
              </el-form-item>
              <el-form-item label="投诉对象">
                <el-select v-model="form.type"  placeholder="请选择投诉对象">
                  <el-option label="导游" value="0"></el-option>
                  <el-option label="饭店" value="1"></el-option>
                  <el-option label="旅行社" value="2"></el-option>
                  <el-option label="其他" value="3"></el-option>
                </el-select>
              </el-form-item>
              <el-form-item label="投诉内容">
                <el-input type="textarea" v-model="form.description"></el-input>
              </el-form-item>
              <el-form-item class="upload-container" label="投诉证据">
                <el-upload action="#" list-type="picture-card" :auto-upload="false">
                  <i slot="default" class="el-icon-plus"></i>
                  <div slot="file" slot-scope="{ file }">
                    <img class="el-upload-list__item-thumbnail" :src="file.url" alt="">
                    <span class="el-upload-list__item-actions">
                      <span class="el-upload-list__item-preview" @click="handlePictureCardPreview(file)">
                        <i class="el-icon-zoom-in"></i>
                      </span>
                      <span v-if="!disabled" class="el-upload-list__item-delete" @click="handleDownload(file)">
                        <i class="el-icon-download"></i>
                      </span>
                      <span v-if="!disabled" class="el-upload-list__item-delete" @click="handleRemove(file)">
                        <i class="el-icon-delete"></i>
                      </span>
                    </span>
                  </div>
                </el-upload>
                <el-dialog :visible.sync="dialogVisible">
                  <img width="100%" :src="dialogImageUrl" alt="">
                </el-dialog>
              </el-form-item>
              <el-form-item>
                <el-button type="primary" @click="onSubmit">提交</el-button>
                <el-button>取消</el-button>
              </el-form-item>
            </el-form>
          </div>
          <div v-show="active === 2">
            <el-form class="form" ref="form" :model="form" label-width="120px">
              <div class="loading-container">
                <i class="el-icon-loading" style="margin-left: 5vh;margin-bottom: 1vh"></i>
                <div class="buffer-text">提交中，请稍候...</div>
              </div>
            </el-form>
          </div>
          <div v-show="active === 3" class="ok">
            <el-form class="form" ref="form" :model="form" label-width="120px">
              <el-form-item class="loading" icon="el-icon-loading"></el-form-item>
              <i class="el-icon-success" style="font-size: 100px;color: #157a0c"></i>
              <h1>您已经完成提交</h1>
              <div style="margin-left: -8vh">感谢您的支持，处理结果会第一时间通知您</div>
            </el-form>
          </div>
          <div v-show="active === 4" >
            <el-table :data="tableData" >
              <el-table-column prop="create_time" label="投诉日期" width="150"></el-table-column>
              <el-table-column prop="id" label="投诉序号" width="80"></el-table-column>
              <el-table-column prop="description" label="投诉内容" width="200"></el-table-column>
              <el-table-column label="投诉状态">
                <template slot-scope="scope">
                  <span v-if="scope.row.status === 1">已处理</span>
                  <span v-else>未处理</span>
                </template>
              </el-table-column>
            </el-table>
          </div>
        </el-main>
      </el-container>
    </el-container>
  </div>
</template>

<script>
import {findComplain,addComplain} from "@/utils/request";

export default {
  data() {
    return {
      form: {
        name: '',
        type: '',
        description: '',
        status: '0',
        picture: '',
        dialogVisible: false,
        disabled: false
      },
      queryParams: {
        pageNum: 1,
        pageSize: 4,
        name: null,
      },
      active: 1,
      showHeader: true,
      tableData: [ // 模拟表格数据

      ]
    };
  },
  methods: {
    findPageQueryComplains() {
      findComplain(this.queryParams).then((res) => {
        if (res.code == 200) {
          this.tableData = res.rows;
          this.page.total = res.total;
        } else {
          this.$message({
            type: "error",
            message: this.message,
          });
        }
      });
    },
    onSubmit() {
      console.log('提交表单数据:', this.form);
      addComplain(this.form).then((res)=>{
        if (res.code==200){
          if (this.active++ > 2) this.active = 1;
          setTimeout(() => {
            this.active = 3;
          }, 3000); // 假设提交操作需要20秒钟
        } else {
          this.$message({
            type: "error",
            message: "购买失败",
          })}
      })


    },
    handleRemove(file) {
      console.log(file);
    },
    handlePictureCardPreview(file) {
      this.dialogImageUrl = file.url;
      this.dialogVisible = true;
    },
    handleDownload(file) {
      console.log(file);
    },
    handleSelect(index) {
      if (index === "2") {
        // 处理投诉查看菜单项被点击的逻辑
        console.log("投诉查看菜单项被点击");
        // 您可以在这里执行导航或者其他操作
        this.active = 4;
        this.showHeader = false; // 隐藏el-header
      }else if(index==="1"){
        console.log("投诉查看菜单项被点击");
        this.active = 1;
        this.showHeader = true; // 隐藏el-header
      }

    }
  }
};
</script>

<style scoped>
.container {
  margin-left: 36vh;
}
.loading-container {
  margin-left: 32vh;
  margin-top: 18vh;
}
.ok {
  margin-left: 32vh;
  margin-top: 4vh;
}
</style>
