<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="投诉名" prop="name">
        <el-input
          v-model="queryParams.name"
          placeholder="请输入投诉名"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="类型" prop="type">
        <el-input
          v-model="queryParams.type"
          placeholder="请输入类型"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['system:complain:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['system:complain:remove']"
        >删除</el-button>
      </el-col>
    </el-row>

    <el-table v-loading="loading" :data="complainList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="投诉名" align="center" prop="name" />
      <el-table-column label="投诉图片证据" align="center" prop="picture" width="100">
        <template slot-scope="scope">
          <imend_time-preview :src="scope.row.picture" :width="50" :height="50"/>
        </template>
      </el-table-column>
      <el-table-column label="投诉内容" align="center" prop="description">
        <template slot-scope="scope">
          <el-tooltip class="item" effect="dark" :content="scope.row.description" placement="top">
            <div v-html="scope.row.description.length > 25 ? scope.row.description.substring(0,24)+'...' :scope.row.description"></div>
          </el-tooltip>
        </template>
      </el-table-column>

      <el-table-column label="投诉类型" align="center" prop="type" />
      <el-table-column label="投诉时间" align="center" prop="create_time" />
      <el-table-column label="投诉状态" align="center" prop="status" />
      <el-table-column label="修改时间" align="center" prop="end_time" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['system:complain:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['system:complain:remove']"
          >删除</el-button>
        </template>
      </el-table-column>
    </el-table>

    <pagination
      v-show="total>0"
      :total="total"
      :pend_time.sync="queryParams.pend_timeNum"
      :limit.sync="queryParams.pend_timeSize"
      @pagination="getList"
    />

    <!-- 添加或修改投诉对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">

        <el-form-item label="投诉状态" prop="status">
          <el-select v-model="nowstatus" placeholder="请选择投诉状态" @change="handleStatusChange">
            <!-- 添加一个默认选项 -->
            <el-option label="未解决" value="未解决"></el-option>
            <el-option label="已解决" value="已解决"></el-option>
          </el-select>
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
import { listComplain, getComplain, delComplain, addComplain, updateComplain } from "@/api/system/complain";

export default {
  name: "Complain",
  data() {
    return {
      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 投诉表格数据
      complainList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      nowstatus:null,
      // 查询参数
      queryParams: {
        pend_timeNum: 1,
        pend_timeSize: 10,
        name: null,
        type: null
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询投诉列表 */
    getList() {
      this.loading = true;
      listComplain(this.queryParams).then(response => {
        this.complainList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        id: null,
        name: null,
        picture: null,
        type: null,
        description:null,
        status:null,
        scenic:null,
        end_time:null,
        create_time:null
      };
      this.resetForm("form");
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pend_timeNum = 1;
      this.getList();
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.resetForm("queryForm");
      this.handleQuery();
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.id)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加投诉";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids
      getComplain(id).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改投诉信息";
      });
    },
    handleStatusChange(){
      if(this.nowstatus==="未解决"){
        this.form.status=0;
      }
      else if(this.nowstatus==="已解决"){
        this.form.status=1;
      }
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updateComplain(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addComplain(this.form).then(response => {
              this.$modal.msgSuccess("新增成功");
              this.open = false;
              this.getList();
            });
          }
        }
      });
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const ids = row.id || this.ids;
      this.$modal.confirm('是否确认删除投诉编号为"' + ids + '"的数据项？').then(function() {
        return delComplain(ids);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
  }
};
</script>
<style lang="scss">
.el-tooltip__popper {
  max-width: 30%!important;  //宽度可根据自己需要进行设置
}
</style>
