<template>
    <div class="container">
        <div class="wrapper">
            <el-card class="box-card">
                <div slot="header" class="clearfix" style="text-align: center">
                    <span style="font-size: 30px;color: cornflowerblue">发布游记</span>
                </div>
                <div >
                    <el-form ref="form" :model="form"  label-width="120px">
                        <el-form-item label="游记名称" prop="name">
                            <el-input v-model="form.name" placeholder="请输入游记名称" />
                        </el-form-item>
                        <el-form-item label="游记内容" prop="content">
                            <el-input v-model="form.content" type="textarea" placeholder="请输入游记内容" />
                        </el-form-item>
                        <el-form-item label="图片">
                            <el-upload
                                    class="avatar-uploader"
                                    action="http://localhost:8080/common/upload"
                                    :headers=headers
                                    :show-file-list="false"
                                    :on-success="handleAvatarSuccess">
                                <img v-if="form.picture" :src="form.picture" class="avatar">
                                <i v-else class="el-icon-plus avatar-uploader-icon"></i>
                            </el-upload>
                        </el-form-item>
                    </el-form>
                    <div  style="text-align: center;padding: 10px 0 10px 0">
                        <el-button type="primary" @click="submitForm()">提 交</el-button>
                        <el-button @click="goTravels()">取 消</el-button>
                    </div>
                </div>

            </el-card>
        </div>
    </div>
</template>

<script>
    import { getToken,addTravels} from "@/utils/request";
    export default {
        name: "SubmitTravels",
        data() {
            return {
                form: {
                    picture: '',
                    name:'',
                    content:'',
                },
              headers: {
                Authorization: "Bearer " + getToken(),
              },
            };
        },
        methods: {
            handleAvatarSuccess(res, file) {
                this.form.picture = URL.createObjectURL(file.raw);
                this.form.picture = res.url;
            },
            goTravels(){
                // 跳转到详情页面，并且传递id
                this.$router.push({path:'/travels'})
            },
            submitForm() {
                let a = undefined;
                if (a!==getToken()){
                    this.$refs["form"].validate(valid => {
                        if (valid) {
                            addTravels(this.form).then(response => {
                                this.$message({
                                    message: '新增成功',
                                    type: 'success'
                                });
                                this.goTravels();
                            });

                        }
                    });
                }
                }

        },
    };
</script>

<style scoped lang="scss">
    .container{
        height: 700px;
        width: 100%;
        background-color: #f4f4f4;
        padding: 1em 0;
    }
    .text {
        font-size: 14px;
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
        clear: both
    }

    .box-card {
        width: 1200px;
    }
    .wrapper {
        padding: 40px 0px 0px 100px;
      //我亲爱的宏伟特意写的，不想删
        display: flex;
        justify-content: space-between;
    }
    .avatar-uploader .el-upload {
        border: 1px dashed #d9d9d9;
        border-radius: 6px;
        cursor: pointer;
        position: relative;
        overflow: hidden;
    }
    .avatar-uploader .el-upload:hover {
        border-color: #409EFF;
    }
    .avatar-uploader-icon {
        font-size: 28px;
        color: #8c939d;
        width: 178px;
        height: 178px;
        line-height: 178px;
        text-align: center;
    }
    .avatar {
        width: 178px;
        height: 178px;
        display: block;
    }
</style>

