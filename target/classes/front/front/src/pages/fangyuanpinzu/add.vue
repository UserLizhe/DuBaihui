<template>
<div :style='{"width":"1200px","padding":"20px","boxShadow":"0px 4px 10px 0px rgba(0,0,0,0.302)","margin":"10px auto","position":"relative","background":"#fff"}'>
    <el-form
      class="add-update-preview"
      ref="ruleForm"
      :model="ruleForm"
      :rules="rules"
      label-width="80px"
    >
          <el-form-item :style='{"padding":"10px","margin":"0 0 10px","background":"#fff"}' label="自习室编号" prop="fangwubianhao">
              <el-input v-model="ruleForm.fangwubianhao" placeholder="自习室编号" readonly></el-input>
          </el-form-item>
          <el-form-item :style='{"padding":"10px","margin":"0 0 10px","background":"#fff"}' label="自习室名称" prop="fangwumingcheng">
            <el-input v-model="ruleForm.fangwumingcheng" 
                placeholder="自习室名称" clearable ></el-input>
          </el-form-item>
          <el-form-item :style='{"padding":"10px","margin":"0 0 10px","background":"#fff"}'  label="租金分类" prop="fangwuleixing">
            <el-select v-model="ruleForm.fangwuleixing" placeholder="请选择租金分类"  >
              <el-option
                  v-for="(item,index) in fangwuleixingOptions"
                  :key="index"
                  :label="item"
                  :value="item">
              </el-option>
            </el-select>
          </el-form-item>
          <el-form-item :style='{"padding":"10px","margin":"0 0 10px","background":"#fff"}' label="图片" v-if="type!='cross' || (type=='cross' && !ro.tupian)" prop="tupian">
            <file-upload
            tip="点击上传图片"
            action="file/upload"
            :limit="3"
            :multiple="true"
            :fileUrls="ruleForm.tupian?ruleForm.tupian:''"
            @change="tupianUploadChange"
            ></file-upload>
          </el-form-item>
            <el-form-item :style='{"padding":"10px","margin":"0 0 10px","background":"#fff"}' class="upload" v-else label="图片" prop="tupian">
                <img v-if="ruleForm.tupian.substring(0,4)=='http'" class="upload-img" style="margin-right:20px;" v-bind:key="index" :src="ruleForm.tupian.split(',')[0]" width="100" height="100">
                <img v-else class="upload-img" style="margin-right:20px;" v-bind:key="index" v-for="(item,index) in ruleForm.tupian.split(',')" :src="baseUrl+item" width="100" height="100">
            </el-form-item>
          <el-form-item :style='{"padding":"10px","margin":"0 0 10px","background":"#fff"}' label="楼层" prop="louceng">
            <el-input v-model="ruleForm.louceng" 
                placeholder="楼层" clearable ></el-input>
          </el-form-item>
          <el-form-item :style='{"padding":"10px","margin":"0 0 10px","background":"#fff"}' label="区域" prop="quyu">
            <el-input v-model="ruleForm.quyu" 
                placeholder="区域" clearable ></el-input>
          </el-form-item>
          <el-form-item :style='{"padding":"10px","margin":"0 0 10px","background":"#fff"}' label="面积" prop="mianji">
            <el-input v-model="ruleForm.mianji" 
                placeholder="面积" clearable ></el-input>
          </el-form-item>
          <el-form-item :style='{"padding":"10px","margin":"0 0 10px","background":"#fff"}' label="朝向" prop="chaoxiang">
            <el-input v-model="ruleForm.chaoxiang" 
                placeholder="朝向" clearable ></el-input>
          </el-form-item>
          <el-form-item :style='{"padding":"10px","margin":"0 0 10px","background":"#fff"}'  label="租赁类型" prop="zulinleixing">
            <el-select v-model="ruleForm.zulinleixing" placeholder="请选择租赁类型"  >
              <el-option
                  v-for="(item,index) in zulinleixingOptions"
                  :key="index"
                  :label="item"
                  :value="item">
              </el-option>
            </el-select>
          </el-form-item>
          <el-form-item :style='{"padding":"10px","margin":"0 0 10px","background":"#fff"}' label="详细地址" prop="xiangxidizhi">
            <el-input v-model="ruleForm.xiangxidizhi" 
                placeholder="详细地址" clearable ></el-input>
          </el-form-item>
          <el-form-item :style='{"padding":"10px","margin":"0 0 10px","background":"#fff"}' label="月租（元）" prop="yuezu">
            <el-input v-model="ruleForm.yuezu" 
                placeholder="月租（元）" clearable ></el-input>
          </el-form-item>
          <el-form-item :style='{"padding":"10px","margin":"0 0 10px","background":"#fff"}' label="房东账号" prop="fangdongzhanghao">
            <el-input v-model="ruleForm.fangdongzhanghao" 
                placeholder="房东账号" clearable ></el-input>
          </el-form-item>
          <el-form-item :style='{"padding":"10px","margin":"0 0 10px","background":"#fff"}' label="房东姓名" prop="fangdongxingming">
            <el-input v-model="ruleForm.fangdongxingming" 
                placeholder="房东姓名" clearable ></el-input>
          </el-form-item>
          <el-form-item :style='{"padding":"10px","margin":"0 0 10px","background":"#fff"}' label="配套设施" prop="peitaosheshi">
            <el-input
              type="textarea"
              :rows="8"
              placeholder="配套设施"
              v-model="ruleForm.peitaosheshi">
            </el-input>
          </el-form-item>
          <el-form-item :style='{"padding":"10px","margin":"0 0 10px","background":"#fff"}' label="自习室详情" prop="fangwuxiangqing">
            <editor 
                :style='{"padding":"0","boxShadow":"0px 4px 10px 0px rgba(0,0,0,0.302)","margin":"0","borderColor":"#ccc","backgroundColor":"#fff","borderRadius":"0","borderWidth":"0","width":"100%","borderStyle":"solid","height":"auto"}'
                v-model="ruleForm.fangwuxiangqing" 
                class="editor" 
                action="file/upload">
            </editor>
          </el-form-item>

      <el-form-item :style='{"padding":"0","margin":"0"}'>
        <el-button :style='{"border":"0","cursor":"pointer","padding":"0","margin":"0 20px 0 0","outline":"none","color":"#000","borderRadius":"10px","background":"#99DFE5","width":"128px","lineHeight":"40px","fontSize":"14px","height":"40px"}'  type="primary" @click="onSubmit">提交</el-button>
        <el-button :style='{"border":"0px solid rgba(64, 158, 255, 1)","cursor":"pointer","padding":"0","margin":"0","outline":"none","color":"#000","borderRadius":"10px","background":"#DCDCDC","width":"128px","lineHeight":"40px","fontSize":"14px","height":"40px"}' @click="back()">返回</el-button>
      </el-form-item>
    </el-form>
</div>
</template>

<script>
  export default {
    data() {
      return {
        id: '',
        baseUrl: '',
        ro:{
            fangwubianhao : false,
            fangwumingcheng : false,
            fangwuleixing : false,
            tupian : false,
            louceng : false,
            quyu : false,
            mianji : false,
            chaoxiang : false,
            zulinleixing : false,
            xiangxidizhi : false,
            yuezu : false,
            peitaosheshi : false,
            fangwuxiangqing : false,
            fangdongzhanghao : false,
            fangdongxingming : false,
            sfsh : false,
            shhf : false,
            clicktime : false,
            clicknum : false,
        },
        type: '',
        userTableName: localStorage.getItem('UserTableName'),
        ruleForm: {
          fangwubianhao: this.getUUID(),
          fangwumingcheng: '',
          fangwuleixing: '',
          tupian: '',
          louceng: '',
          quyu: '',
          mianji: '',
          chaoxiang: '',
          zulinleixing: '',
          xiangxidizhi: '',
          yuezu: '',
          peitaosheshi: '',
          fangwuxiangqing: '',
          fangdongzhanghao: '',
          fangdongxingming: '',
          clicktime: '',
          clicknum: '',
        },
        fangwuleixingOptions: [],
        zulinleixingOptions: [],
        rules: {
          fangwubianhao: [
          ],
          fangwumingcheng: [
          ],
          fangwuleixing: [
          ],
          tupian: [
          ],
          louceng: [
          ],
          quyu: [
          ],
          mianji: [
          ],
          chaoxiang: [
          ],
          zulinleixing: [
          ],
          xiangxidizhi: [
          ],
          yuezu: [
            { validator: this.$validate.isIntNumer, trigger: 'blur' },
          ],
          peitaosheshi: [
          ],
          fangwuxiangqing: [
          ],
          fangdongzhanghao: [
          ],
          fangdongxingming: [
          ],
          sfsh: [
          ],
          shhf: [
          ],
          clicktime: [
          ],
          clicknum: [
            { validator: this.$validate.isIntNumer, trigger: 'blur' },
          ],
        },
      };
    },
    computed: {



    },
    created() {
	  //this.bg();
      let type = this.$route.query.type ? this.$route.query.type : '';
      this.init(type);
      this.baseUrl = this.$config.baseUrl;
    },
    methods: {
      getMakeZero(s) {
          return s < 10 ? '0' + s : s;
      },
      // 下载
      download(file){
        window.open(`${file}`)
      },
      // 初始化
      init(type) {
        this.type = type;
        if(type=='cross'){
          var obj = JSON.parse(localStorage.getItem('crossObj'));
          for (var o in obj){
            if(o=='fangwubianhao'){
              this.ruleForm.fangwubianhao = obj[o];
              this.ro.fangwubianhao = true;
              continue;
            }
            if(o=='fangwumingcheng'){
              this.ruleForm.fangwumingcheng = obj[o];
              this.ro.fangwumingcheng = true;
              continue;
            }
            if(o=='fangwuleixing'){
              this.ruleForm.fangwuleixing = obj[o];
              this.ro.fangwuleixing = true;
              continue;
            }
            if(o=='tupian'){
              this.ruleForm.tupian = obj[o].split(",")[0];
              this.ro.tupian = true;
              continue;
            }
            if(o=='louceng'){
              this.ruleForm.louceng = obj[o];
              this.ro.louceng = true;
              continue;
            }
            if(o=='quyu'){
              this.ruleForm.quyu = obj[o];
              this.ro.quyu = true;
              continue;
            }
            if(o=='mianji'){
              this.ruleForm.mianji = obj[o];
              this.ro.mianji = true;
              continue;
            }
            if(o=='chaoxiang'){
              this.ruleForm.chaoxiang = obj[o];
              this.ro.chaoxiang = true;
              continue;
            }
            if(o=='zulinleixing'){
              this.ruleForm.zulinleixing = obj[o];
              this.ro.zulinleixing = true;
              continue;
            }
            if(o=='xiangxidizhi'){
              this.ruleForm.xiangxidizhi = obj[o];
              this.ro.xiangxidizhi = true;
              continue;
            }
            if(o=='yuezu'){
              this.ruleForm.yuezu = obj[o];
              this.ro.yuezu = true;
              continue;
            }
            if(o=='peitaosheshi'){
              this.ruleForm.peitaosheshi = obj[o];
              this.ro.peitaosheshi = true;
              continue;
            }
            if(o=='fangwuxiangqing'){
              this.ruleForm.fangwuxiangqing = obj[o];
              this.ro.fangwuxiangqing = true;
              continue;
            }
            if(o=='fangdongzhanghao'){
              this.ruleForm.fangdongzhanghao = obj[o];
              this.ro.fangdongzhanghao = true;
              continue;
            }
            if(o=='fangdongxingming'){
              this.ruleForm.fangdongxingming = obj[o];
              this.ro.fangdongxingming = true;
              continue;
            }
            if(o=='clicktime'){
              this.ruleForm.clicktime = obj[o];
              this.ro.clicktime = true;
              continue;
            }
            if(o=='clicknum'){
              this.ruleForm.clicknum = obj[o];
              this.ro.clicknum = true;
              continue;
            }
          }
        }
        // 获取用户信息
        this.$http.get(this.userTableName + '/session', {emulateJSON: true}).then(res => {
          if (res.data.code == 0) {
            var json = res.data.data;
            if(json.fangdongzhanghao!=''&&json.fangdongzhanghao){
                this.ruleForm.fangdongzhanghao = json.fangdongzhanghao
            }
            if(json.fangdongxingming!=''&&json.fangdongxingming){
                this.ruleForm.fangdongxingming = json.fangdongxingming
            }
          }
        });
        this.$http.get('option/fangwuleixing/fangwuleixing', {emulateJSON: true}).then(res => {
          if (res.data.code == 0) {
            this.fangwuleixingOptions = res.data.data;
          }
        });
        this.zulinleixingOptions = "整租,合租".split(',')
      },

    // 多级联动参数
      // 多级联动参数
      info(id) {
        this.$http.get('fangyuanpinzu/detail/${id}', {emulateJSON: true}).then(res => {
          if (res.data.code == 0) {
            this.ruleForm = res.data.data;
          }
        });
      },
      // 提交
      onSubmit() {

        //更新跨表属性
        var crossuserid;
        var crossrefid;
        var crossoptnum;
        this.$refs["ruleForm"].validate(valid => {
          if(valid) {
            if(this.type=='cross'){
                 var statusColumnName = localStorage.getItem('statusColumnName');
                 var statusColumnValue = localStorage.getItem('statusColumnValue');
                 if(statusColumnName && statusColumnName!='') {
                     var obj = JSON.parse(localStorage.getItem('crossObj'));
                     if(!statusColumnName.startsWith("[")) {
                         for (var o in obj){
                             if(o==statusColumnName){
                                 obj[o] = statusColumnValue;
                             }
                         }
                         var table = localStorage.getItem('crossTable');
                         this.$http.post(table+'/update', obj).then(res => {});
                     } else {
                            crossuserid=Number(localStorage.getItem('userid'));
                            crossrefid=obj['id'];
                            crossoptnum=localStorage.getItem('statusColumnName');
                            crossoptnum=crossoptnum.replace(/\[/,"").replace(/\]/,"");
                     }
                 }
            }
            if(crossrefid && crossuserid) {
                 this.ruleForm.crossuserid=crossuserid;
                 this.ruleForm.crossrefid=crossrefid;
                 var params = {
                     page: 1,
                     limit: 10,
                     crossuserid:crossuserid,
                     crossrefid:crossrefid,
                 }
                 this.$http.get('fangyuanpinzu/list', {
                  params: params
                 }).then(res => {
                     if(res.data.data.total>=crossoptnum) {
                         this.$message({
                          message: localStorage.getItem('tips'),
                          type: 'success',
                          duration: 1500,
                         });
                          return false;
                     } else {
                         // 跨表计算


                          this.$http.post('fangyuanpinzu/add', this.ruleForm).then(res => {
                              if (res.data.code == 0) {
                                  this.$message({
                                      message: '操作成功',
                                      type: 'success',
                                      duration: 1500,
                                      onClose: () => {
                                          this.$router.go(-1);
                                      }
                                  });
                              } else {
                                  this.$message({
                                      message: res.data.msg,
                                      type: 'error',
                                      duration: 1500
                                  });
                              }
                          });
                     }
                 });
             } else {


                  this.$http.post('fangyuanpinzu/add', this.ruleForm).then(res => {
                     if (res.data.code == 0) {
                          this.$message({
                              message: '操作成功',
                              type: 'success',
                              duration: 1500,
                              onClose: () => {
                                  this.$router.go(-1);
                              }
                          });
                      } else {
                          this.$message({
                              message: res.data.msg,
                              type: 'error',
                              duration: 1500
                          });
                      }
                  });
             }
          }
        });
      },
      // 获取uuid
      getUUID () {
        return new Date().getTime();
      },
      // 返回
      back() {
        this.$router.go(-1);
      },
      tupianUploadChange(fileUrls) {
          this.ruleForm.tupian = fileUrls.replace(new RegExp(this.$config.baseUrl,"g"),"");;
      },
    }
  };
</script>

<style rel="stylesheet/scss" lang="scss" scoped>
	.el-date-editor.el-input {
		width: auto;
	}
	
	.add-update-preview .el-form-item /deep/ .el-form-item__label {
	  padding: 0 10px 0 0;
	  color: #000;
	  font-weight: 500;
	  width: 80px;
	  font-size: 14px;
	  line-height: 40px;
	  text-align: right;
	}
	
	.add-update-preview .el-form-item /deep/ .el-form-item__content {
	  margin-left: 80px;
	}
	
	.add-update-preview .el-input /deep/ .el-input__inner {
	  border: 0;
	  border-radius: 0;
	  padding: 0 12px;
	  box-shadow: 0px 4px 10px 0px rgba(0,0,0,0.302);
	  outline: none;
	  color: #000;
	  width: 400px;
	  font-size: 14px;
	  height: 40px;
	}
	
	.add-update-preview .el-select /deep/ .el-input__inner {
	  border: 0;
	  border-radius: 0;
	  padding: 0 10px;
	  box-shadow: 0px 4px 10px 0px rgba(0,0,0,0.302);
	  outline: none;
	  color: #000;
	  width: 200px;
	  font-size: 14px;
	  height: 40px;
	}
	
	.add-update-preview .el-date-editor /deep/ .el-input__inner {
	  border: 0;
	  border-radius: 0;
	  padding: 0 10px 0 30px;
	  box-shadow: 0px 4px 10px 0px rgba(0,0,0,0.302);
	  outline: none;
	  color: #000;
	  width: 200px;
	  font-size: 14px;
	  height: 40px;
	}
	
	.add-update-preview /deep/ .el-upload--picture-card {
		background: transparent;
		border: 0;
		border-radius: 0;
		width: auto;
		height: auto;
		line-height: initial;
		vertical-align: middle;
	}
	
	.add-update-preview /deep/ .upload .upload-img {
	  border: 1px dashed #000;
	  cursor: pointer;
	  border-radius: 6px;
	  box-shadow: 0px 4px 10px 0px rgba(0,0,0,0.302);
	  color: #000;
	  width: 100px;
	  font-size: 32px;
	  line-height: 100px;
	  text-align: center;
	  height: 100px;
	}
	
	.add-update-preview /deep/ .el-upload-list .el-upload-list__item {
	  border: 1px dashed #000;
	  cursor: pointer;
	  border-radius: 6px;
	  box-shadow: 0px 4px 10px 0px rgba(0,0,0,0.302);
	  color: #000;
	  width: 100px;
	  font-size: 32px;
	  line-height: 100px;
	  text-align: center;
	  height: 100px;
	}
	
	.add-update-preview /deep/ .el-upload .el-icon-plus {
	  border: 1px dashed #000;
	  cursor: pointer;
	  border-radius: 6px;
	  box-shadow: 0px 4px 10px 0px rgba(0,0,0,0.302);
	  color: #000;
	  width: 100px;
	  font-size: 32px;
	  line-height: 100px;
	  text-align: center;
	  height: 100px;
	}
	
	.add-update-preview .el-textarea /deep/ .el-textarea__inner {
	  border: 0;
	  border-radius: 0;
	  padding: 12px;
	  box-shadow: 0px 4px 10px 0px rgba(0,0,0,0.302);
	  outline: none;
	  color: #000;
	  width: 400px;
	  font-size: 14px;
	  height: 120px;
	}
</style>
