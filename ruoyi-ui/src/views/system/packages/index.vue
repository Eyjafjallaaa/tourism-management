<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="景点名" prop="sname">
        <el-input
          v-model="queryParams.sname"
          placeholder="请输入景点名"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="套餐名" prop="name">
        <el-input
          v-model="queryParams.name"
          placeholder="请输入套餐名"
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
          type="primary"
          plain
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
          v-hasPermi="['system:packages:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['system:packages:edit']"
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
          v-hasPermi="['system:packages:remove']"
        >删除</el-button>
      </el-col>
    </el-row>

    <el-table v-loading="loading" :data="packagesList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="景点名" align="center" prop="sname" />
      <el-table-column label="套餐名" align="center" prop="name" />
      <el-table-column label="套餐类型" align="center" prop="type" />
      <el-table-column label="套餐详情" align="center" prop="content">
        <template slot-scope="scope">
          <el-tooltip class="item" effect="dark" :content="scope.row.content" placement="top">
            <div v-html="scope.row.content.length > 25 ? scope.row.content.substring(0,24)+'...' :scope.row.content"></div>
          </el-tooltip>
        </template>
      </el-table-column>
      <el-table-column label="照片" align="center" prop="picture" width="100">
        <template slot-scope="scope">
          <image-preview :src="scope.row.picture" :width="50" :height="50"/>
        </template>
      </el-table-column>
      <el-table-column label="套餐价格" align="center" prop="price" />
      <el-table-column label="是否已删除" align="center" prop="isDeleted">
        <template slot-scope="scope">
          <span v-if="scope.row.isDeleted===0">未删除</span>
          <span v-if="scope.row.isDeleted===1">已删除</span>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['system:packages:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['system:packages:remove']"
          >删除</el-button>
        </template>
      </el-table-column>
    </el-table>

    <pagination
      v-show="total>0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- 添加或修改旅游套餐对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="景点名" prop="sid">
          <el-select v-model="form.sid" multiple placeholder="请选择景点名">
            <el-option v-for="(item,index) in scenicList"  :label="item.name" :key="index" :value="item.id"></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="套餐类型" prop="type">
          <el-select v-model="form.type" placeholder="请选择套餐类型">
            <el-option label="景区内部套票" value="景区内部套票"></el-option>
            <el-option label="相关景点套餐" value="相关景点套餐"></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="套餐名" prop="name">
          <el-input v-model="form.name" placeholder="请输入套餐名" />
        </el-form-item>
        <el-form-item label="套餐详情" prop="content">
          <el-input v-model="form.content" type="textarea" placeholder="请输入内容" />
        </el-form-item>
        <el-form-item label="照片">
          <image-upload v-model="form.picture"/>
        </el-form-item>
        <el-form-item label="套餐价格" prop="price">
          <el-input v-model="form.price" placeholder="请输入套餐价格" />
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
import { listPackages, getPackages, delPackages, addPackages, updatePackages,getScenic } from "@/api/system/packages";

export default {
  name: "Packages",
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
      // 旅游套餐表格数据
      packagesList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        sname: null,
        name: null,
        type: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
      },
      scenicList:[]
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询旅游套餐列表 */
    getList() {
      this.loading = true;
      listPackages(this.queryParams).then(response => {
        this.packagesList = response.rows;
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
        sid: null,
        sname: null,
        name: null,
        type: null,
        content: null,
        price: null,
        createTime: null,
        createUser: null,
        updateTime: null,
        updateUser: null,
        isDeleted: null
      };
      this.resetForm("form");
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1;
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
      this.title = "添加旅游套餐";
      this.getAll();
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids
      getPackages(id).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改旅游套餐";
      });
      this.getAll();
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updatePackages(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            this.form.sid=this.form.sid+""
            addPackages(this.form).then(response => {
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
      this.$modal.confirm('是否确认删除旅游套餐编号为"' + ids + '"的数据项？').then(function() {
        return delPackages(ids);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    getAll(){
      getScenic().then(response => {
        this.scenicList=response
        console.log(this.scenicList)
      });
    }
  }
};
</script>
<style lang="scss">
  .el-tooltip__popper {
    max-width: 30%!important;  //宽度可根据自己需要进行设置
  }
</style>
