<template>
    <div class="container">
        <div class="wrapper">
            <el-card class="box-card">
                <div slot="header" class="clearfix">
                    <span style="font-size: 30px; color: #C7923E;margin-left: 12px;">个人中心</span>
                </div>
                <el-tabs v-model="activeTab">
                    <el-tab-pane label="基本资料" name="userinfo">
                        <el-form ref="form" :model="user" :rules="rules" label-width="80px">
                            <el-form-item label="用户昵称" prop="nickName">
                                <el-input v-model="user.nickName" maxlength="30"/>
                            </el-form-item>
                            <el-form-item label="手机号码" prop="phonenumber">
                                <el-input v-model="user.phonenumber" maxlength="11"/>
                            </el-form-item>
                            <el-form-item label="性别">
                                <el-radio-group v-model="user.sex">
                                    <el-radio label="0">男</el-radio>
                                    <el-radio label="1">女</el-radio>
                                </el-radio-group>
                            </el-form-item>
                            <el-form-item>
                                <el-button type="primary" size="medium" @click="submit"
                                >保存
                                </el-button
                                >
                            </el-form-item>
                        </el-form>
                    </el-tab-pane>
                    <el-tab-pane label="修改密码" name="resetPwd" >
                        <el-form
                                ref="pwdForm"
                                :model="pwdUser"
                                :rules="pwdRules"
                                label-width="80px"
                        >
                            <el-form-item label="旧密码" prop="oldPassword">
                                <el-input
                                        v-model="pwdUser.oldPassword"
                                        placeholder="请输入旧密码"
                                        type="password"
                                        show-password
                                />
                            </el-form-item>
                            <el-form-item label="新密码" prop="newPassword">
                                <el-input
                                        v-model="pwdUser.newPassword"
                                        placeholder="请输入新密码"
                                        type="password"
                                        show-password
                                />
                            </el-form-item>
                            <el-form-item label="确认密码" prop="confirmPassword">
                                <el-input
                                        v-model="pwdUser.confirmPassword"
                                        placeholder="请确认密码"
                                        type="password"
                                        show-password
                                />
                            </el-form-item>
                            <el-form-item>
                                <el-button type="primary" size="medium" @click="submit2"
                                >保存
                                </el-button
                                >
                            </el-form-item>
                        </el-form>
                    </el-tab-pane>
                    <el-tab-pane label="我的订单" name="hotelInfo">
                        <el-table :data="tableData" style="width: 100%" stripe>
                            <el-table-column prop="sname" label="景点名称" width="320">
                            </el-table-column>
                            <el-table-column prop="num" label="出行人数" width="80">
                            </el-table-column>
                            <el-table-column prop="price" label="价格" width="80">
                            </el-table-column>
                            <el-table-column prop="status" label="出行状态"></el-table-column>
                            <el-table-column label="操作" >
                                <template slot-scope="scope">
                                    <el-button
                                            size="mini"
                                            type="primary"
                                            @click="handleUpdate(scope.row)"
                                            v-if="scope.row.status==='未出行'"
                                    >出行
                                    </el-button>
                                    <el-button
                                            size="mini"
                                            type="primary"
                                            @click="handleUpdate2(scope.row)"
                                            v-if="scope.row.status==='未出行'"
                                    >取消
                                    </el-button>
                                </template>
                            </el-table-column>
                        </el-table>
                    </el-tab-pane>
                    <el-tab-pane label="我的评论" name="evaluateInfo">
                        <el-table :data="evaluateData" style="width: 100%" stripe>
                            <el-table-column prop="sname" label="景点名称" width="320">
                            </el-table-column>
                            <el-table-column prop="content" label="评论内容" width="240">
                            </el-table-column>
                            <el-table-column prop="createTime" label="评论时间" width="240">
                            </el-table-column>
                            <el-table-column label="操作">
                                <template slot-scope="scope">
                                    <el-button
                                            size="mini"
                                            type="primary"
                                            @click="handleDelete(scope.row)"
                                    >删除
                                    </el-button>
                                </template>
                            </el-table-column>
                        </el-table>
                    </el-tab-pane>
                    <el-tab-pane label="我的游记" name="travelsInfo">
                        <el-table :data="travelsData" style="width: 100%" stripe>
                            <el-table-column prop="name" label="游记标题" width="320">
                            </el-table-column>
                            <el-table-column prop="content" label="游记内容" width="240">
                                <template slot-scope="scope">
                                    <el-tooltip class="item" effect="dark" :content="scope.row.content" placement="top">
                                        <div v-html="scope.row.content.length > 25 ? scope.row.content.substring(0,24)+'...' :scope.row.content"></div>
                                    </el-tooltip>
                                </template>
                            </el-table-column>
                            <el-table-column prop="createTime" label="发布时间" width="240">
                            </el-table-column>
                            <el-table-column label="操作">
                                <template slot-scope="scope">
                                    <el-button
                                            size="mini"
                                            type="primary"
                                            @click="handleDelete2(scope.row)"
                                    >删除
                                    </el-button>
                                </template>
                            </el-table-column>
                        </el-table>
                    </el-tab-pane>
<!--                    <el-tab-pane label="成为会员" name="memberInfo">-->
<!--                        <el-form :model="member" label-width="80px">-->
<!--                            <el-form-item label="会员套餐" prop="name">-->
<!--                                <el-input v-model="member.name" disabled=""/>-->
<!--                            </el-form-item>-->
<!--                            <el-form-item label="会员特权" prop="content">-->
<!--                                <el-input v-model="member.content" disabled=""/>-->
<!--                            </el-form-item>-->
<!--                            <el-form-item>-->
<!--                                <el-button type="primary" size="medium" @click="submit3()" v-show="!isVip"-->
<!--                                >开通会员-->
<!--                                </el-button-->
<!--                                >-->
<!--                            </el-form-item>-->
<!--                        </el-form>-->
<!--                    </el-tab-pane>-->
<!--                    <el-tab-pane label="我的积分" name="viperInfo">-->
<!--                        <el-form :model="viper" label-width="80px">-->
<!--                            <el-form-item label="会员套餐" prop="name">-->
<!--                                <el-input v-model="viper.integral" disabled=""/>-->
<!--                            </el-form-item>-->
<!--                        </el-form>-->
<!--                    </el-tab-pane>-->
                </el-tabs>
            </el-card>
        </div>
        <el-dialog title="开通成功" :visible.sync="kthy" append-to-body>
            <el-table :data="memberData">
                <el-table-column property="name" label="会员套餐" width="200"></el-table-column>
                <el-table-column property="content" label="会员特权"></el-table-column>
            </el-table>
        </el-dialog>
        <el-dialog title="取消成功" :visible.sync="quxiao">
            <el-table :data="gridData">
                <el-table-column property="sname" label="名称" width="150"></el-table-column>
                <el-table-column property="num" label="数量" width="200"></el-table-column>
                <el-table-column property="price" label="花费金额" width="200"></el-table-column>
                <el-table-column property="cancelMoney" label="退费金额"></el-table-column>
            </el-table>
        </el-dialog>
    </div>

</template>

<script>
    import {
        getUserProfile,
        updateUserProfile,
        updateUserPwd,
        removeToken,
        orderInfo,
        changeStatus,
        evaluateInfo,
        travelsInfo,
        delEvaluate,
        delTravels,
        getMember,
        addViper,cancel,getIntegral
    } from "@/utils/request";

    export default {
        name: "Person",
        data() {
            const equalToPassword = (rule, value, callback) => {
                if (this.pwdUser.newPassword !== value) {
                    callback(new Error("两次输入的密码不一致"));
                } else {
                    callback();
                }
            };
            return {
                tableData: [],
                evaluateData: [],
                travelsData: [],
                user: {
                    nickName: "",
                    phonenumber: "",
                    sex: "",
                },
                memberData:[],
                gridData:[],
                quxiao:false,
                kthy:false,
                isVip:false,
                member: {
                    name: '',
                    content: ''
                },
                viper:{
                    "integral":"0"
                },
                activeTab: "userinfo",
                // 表单校验
                rules: {
                    nickName: [
                        {required: true, message: "用户昵称不能为空", trigger: "blur"},
                    ],
                    phonenumber: [
                        {required: true, message: "手机号码不能为空", trigger: "blur"},
                        {
                            pattern: /^1[3|4|5|6|7|8|9][0-9]\d{8}$/,
                            message: "请输入正确的手机号码",
                            trigger: "blur",
                        },
                    ],
                },
                pwdUser: {
                    oldPassword: "",
                    newPassword: "",
                    confirmPassword: "",
                },
                // 表单校验
                pwdRules: {
                    oldPassword: [
                        {required: true, message: "旧密码不能为空", trigger: "blur"},
                    ],
                    newPassword: [
                        {required: true, message: "新密码不能为空", trigger: "blur"},
                        {
                            min: 6,
                            max: 20,
                            message: "长度在 6 到 20 个字符",
                            trigger: "blur",
                        },
                    ],
                    confirmPassword: [
                        {required: true, message: "确认密码不能为空", trigger: "blur"},
                        {required: true, validator: equalToPassword, trigger: "blur"},
                    ],
                },
            };
        },
        methods: {
            getUser() {
                getUserProfile().then((res) => {
                    if (res.code === 200) {
                        this.user.nickName = res.data.nickName;
                        this.user.phonenumber = res.data.phonenumber;
                        this.user.sex = res.data.sex;
                        this.isVip = "会员"===res.data.remark
                    }
                });
            },
            submit() {
                this.$refs["form"].validate((valid) => {
                    if (valid) {
                        updateUserProfile(this.user).then((response) => {
                            this.$message({
                                message: "修改成功",
                                type: "success",
                            });
                        });
                    }
                });
            },
            submit2() {
                this.$refs["pwdForm"].validate((valid) => {
                    if (valid) {
                        updateUserPwd(
                            this.pwdUser.oldPassword,
                            this.pwdUser.newPassword
                        ).then((response) => {
                            this.$message({
                                message: "修改成功",
                                type: "success",
                            });
                        this.exit()
                        });
                    }
                });
            },
            exit(){
                this.$router.push({path: '/login'});
                removeToken();
            },
            submit3(){
                const data={}
                this.kthy=true;
                addViper(data).then(res =>{
                    if (res.code==200){
                        this.memberData=res.data
                        this.getUser();
                    } else {
                        this.$message({
                            message: "开通失败",
                            type: "error",
                        });
                    }
                })
            },
            getOrderInfo() {
                orderInfo().then((res) => {
                    if (res.code === 200) {
                        this.tableData = res.data;
                    }
                });
            },
            getEvaluateInfo() {
                evaluateInfo().then((res) => {
                    if (res.code === 200) {
                        this.evaluateData = res.data;
                    }
                });
            },
            getTravelsInfo() {
                travelsInfo().then((res) => {
                    if (res.code === 200) {
                        this.travelsData = res.data;
                    }
                });
            },
            getViper() {
                getIntegral().then((res) => {
                    if (res.code === 200) {
                        this.viper = res.data;
                    }
                });
            },
            handleUpdate(row) {
                const id = row.id
                changeStatus(id).then((response) => {
                    this.$message({
                        message: "修改成功",
                        type: "success",
                    });
                });
            },
            handleUpdate2(row) {
                const id = row.id
                cancel(id).then((response) => {
                    if (response.code==200){
                        this.quxiao=true;
                        this.gridData=response.data
                        this.getOrderInfo()
                    } else {
                        this.$message({
                            message: "取消失败",
                            type: "error",
                        });
                    }

                });
            },
            handleDelete(row) {
                const ids = row.id
                delEvaluate(ids).then(() => {
                    this.$message({
                        message: "删除成功",
                        type: "success",
                    });
                }).catch(() => {
                });
            },
            handleDelete2(row) {
                const ids = row.id
                delTravels(ids).then(() => {
                    this.$message({
                        message: "删除成功",
                        type: "success",
                    });
                }).catch(() => {
                });
            },
            getMem() {
                getMember(1).then(response => {
                    this.member = response.data;
                });
            },

        },
        created() {
            this.getUser();
            this.getOrderInfo();
            this.getEvaluateInfo();
            this.getTravelsInfo();
            this.getMem();
            this.getViper()
        },
    };
</script>

<style scoped lang="scss">
    .text {
        font-size: 14px;
    }

    .container {
        height: 500px;
        width: 100%;
        background-color: #f4f4f4;
        padding: 1em 0;
    }

    .wrapper {
        padding: 40px 0px 0px 200px;
    }

    .item {
        margin-bottom: 18px;
    }

    .clearfix:before,
    .clearfix:after {
        display: table;
        content: "";
    }

    .clearfix:after {
        clear: both;
    }

    .box-card {
        margin-left: 110px;
        border-radius: 15px;
        width: 1000px;
    }
    .el-tooltip__popper {
        max-width: 30%!important;
    }
    .el-tab-pane{
      font-size: 15px;
    }


</style>
