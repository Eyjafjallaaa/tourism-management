<template>
  <div class="main">
    <h2 class="name">{{ detail.name }}</h2>
    <div class="del">
      <div class="fontWeight">相关景点：</div>
      <div>{{ detail.sname }}</div>
    </div>
    <div class="del">
      <div class="fontWeight">套餐类型：</div>
      <div >{{ detail.type }}</div>
    </div>
    <div class="pic">
      <img width="100%" :src="detail.pic" />
    </div>
    <div class="inc">
      <h4>套餐详情：{{ detail.content }}</h4>
    </div>
    <el-button class="btn" type="primary" @click="toApply()">购买</el-button>
    <el-dialog
      title="提示"
      :visible.sync="dialogVisible"
      width="550px"
      :before-close="handleClose"
    >
      <div>
        <el-form
          :model="ruleForm"
          ref="ruleForm"
          label-width="100px"
          class="demo-ruleForm"
        >
          <el-form-item label="预订人" prop="name">
            <el-input-number v-model="ruleForm.num" @change="handleChange" :min="1"  label="预订人"></el-input-number>
            <br/>
            <span>当前总额为：{{this.ruleForm.price*this.ruleForm.num}}</span>
          </el-form-item>
          <el-form-item label="当前积分" prop="name">
            <el-input v-model="ruleForm.integral"   label="当前积分" style="width: 250px"></el-input>
            <br/>
            <label style="font-size: 10px;color: red">提示：积分大于1000可使用积分兑换购买，每1000积分可换10元。</label>
          </el-form-item>
          <el-form-item>
            <el-button type="primary" @click="submitForm('ruleForm')"
              >立即购买</el-button>
            <el-button type="primary" @click="submitForm2('ruleForm')"
            >使用积分兑换购买</el-button>
          </el-form-item>
        </el-form>
      </div>
    </el-dialog>
    <el-dialog title="支付成功" :visible.sync="zhifu">
      <el-table :data="gridData">
        <el-table-column property="sname" label="名称" width="150"></el-table-column>
        <el-table-column property="num" label="数量" width="200"></el-table-column>
        <el-table-column property="danjia" label="单价" width="200"></el-table-column>
        <el-table-column property="price" label="总价"></el-table-column>
      </el-table>
    </el-dialog>
  </div>
</template>

<script>
import { getPackage, addSchedule,addSchedule2, getToken,getIntegral } from "@/utils/request";
export default {
  name: "PackageDetail",
  data() {
    return {
      inTime: [],
      dialogVisible: false,
      id: null,
      detail: {},
      form: {},
        gridData:[],
        zhifu:false,
      ruleForm: {
        num:1,
        sid:'',
        sname:'',
          price:'',
          integral:''
      },
    };
  },
  methods: {
    get() {
        getPackage(this.id).then((res) => {
        if (res.code == 200) {
          this.detail = res.data;
          this.ruleForm.sid = res.data.sid;
          this.ruleForm.sname = res.data.sname;
          this.ruleForm.price=res.data.price
        } else {
          this.$message({
            type: "error",
            message: this.message,
          });
        }
      });
    },
      getViper() {
          getIntegral().then((res) => {
              if (res.code === 200) {
                  this.ruleForm.integral = res.data.integral;
              }
          });
      },
    toApply() {
      this.dialogVisible = true;
    },
    handleClose(done) {
      this.$confirm("确认关闭？")
        .then((_) => {
          done();
        })
        .catch((_) => {});
    },
      handleChange(value) {
          this.ruleForm.num=value
      },
    submitForm(formName) {
      let a = undefined;
      if (a !== getToken()) {
        this.$refs[formName].validate((valid) => {
          if (valid) {
            addSchedule(this.ruleForm).then((res) => {
              if (res.code == 200) {
                this.$refs[formName].resetFields();
                this.inTime = [];
                this.dialogVisible = false;
                  this.zhifu = true;
                  this.gridData=res.data;
              } else {
                this.$message({
                  type: "error",
                  message: "购买失败",
                });
              }
            });
          } else {
            console.log("error submit!!");
            return false;
          }
        });
      } else {
        this.$message({
          type: "error",
          message: "请先登录",
        });
      }
    },
      submitForm2(formName) {
          let a = undefined;
          if (a !== getToken()) {
              this.$refs[formName].validate((valid) => {
                  if (valid) {
                      addSchedule2(this.ruleForm).then((res) => {
                          if (res.code == 200) {
                              this.$refs[formName].resetFields();
                              this.inTime = [];
                              this.dialogVisible = false;
                              this.zhifu = true;
                              this.gridData=res.data;
                          } else {
                              this.$message({
                                  type: "error",
                                  message: "购买失败",
                              });
                          }
                      });
                  } else {
                      console.log("error submit!!");
                      return false;
                  }
              });
          } else {
              this.$message({
                  type: "error",
                  message: "请先登录",
              });
          }
      },
  },
  created() {
    this.id = this.$route.query.id;
    this.get();
    this.getViper()
  },
};
</script>

<style scoped>
.main {
  margin-left: 35%;
}
.name {
  margin-left: 255px;
}
.del {
  display: flex;
}
.pic {
  width: 500px;
  height: 350px;
}
.fontWeight {
  font-weight: bold;
}
.btn {
  margin-left: 420px;
}
.inc {
  width: 80%;
}
</style>
