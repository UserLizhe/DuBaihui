<template>
<div>
	<div :style='{"width":"1200px","padding":"20px","margin":"10px auto","borderRadius":"27px","background":"#03b7ec"}' class="breadcrumb-preview">
		<el-breadcrumb :separator="'Ξ'" :style='{"fontSize":"14px","lineHeight":"1","justifyContent":"center","display":"flex"}'>
			<el-breadcrumb-item>首页</el-breadcrumb-item>
			<el-breadcrumb-item v-for="(item, index) in breadcrumbItem" :key="index">{{item.name}}</el-breadcrumb-item>
		</el-breadcrumb>
	</div>
	
	<div class="detail-preview" :style='{"width":"1200px","margin":"10px auto","position":"relative"}'>
		<div class="attr" :style='{"padding":"20px","position":"relative","flexWrap":"wrap","background":"#f5f5f5","display":"flex"}'>
			<el-carousel :style='{"width":"100%","margin":"0 10px 0 0","height":"400px"}' trigger="click" indicator-position="inside" arrow="always" type="default" direction="horizontal" height="400px" autoplay="false" interval="3000" loop="true">
				<el-carousel-item :style='{"border":"1px solid #707070","width":"100%","borderRadius":"10px","height":"100%"}' v-for="item in detailBanner" :key="item.id">
					<el-image :style='{"objectFit":"cover","width":"100%","height":"100%"}' v-if="item.substr(0,4)=='http'" :src="item" fit="cover" class="image"></el-image
					<el-image :style='{"objectFit":"cover","width":"100%","height":"100%"}' v-else :src="baseUrl + item" fit="cover" class="image"></el-image>
				</el-carousel-item>
			</el-carousel>
	
			
			<div class="info" :style='{"padding":"10px","boxShadow":" 0px 4px 10px 0px rgba(0,0,0,0.302)","margin":"0 10px 0 10px","borderRadius":"20px","alignItems":"center","flexDirection":"column","flex":"1","background":"#ffff","display":"flex","width":"800px"}'>
				<div class="item" :style='{"padding":"10px","margin":"0 0 10px 0","alignItems":"center","background":"#fff","display":"flex","width":"100%","justifyContent":"space-between"}'>
					<div :style='{"color":"#333","fontSize":"16px"}'>
                    {{detail.mingcheng}}
                    </div>
					<div @click="storeup(1)" v-show="!isStoreup" :style='{"padding":"10px","background":"#fff"}'><i v-if="true" :style='{"color":"#999","fontSize":"14px"}' class="el-icon-star-off"></i><span :style='{"color":"#999","fontSize":"14px"}'>点我收藏</span></div>
					<div @click="storeup(-1)" v-show="isStoreup" :style='{"padding":"10px","background":"#fff"}'><i v-if="true" :style='{"color":"#999","fontSize":"14px"}' class="el-icon-star-on"></i><span :style='{"color":"#999","fontSize":"14px"}'>取消收藏</span></div>
				</div>

				<div class="item" :style='{"width":"80%","padding":"10px","margin":"0 0 10px 0","justifyContent":"spaceBetween","display":"flex"}' v-if="detail.price">
					<div class="lable" :style='{"padding":"0 10px","color":"#999","textAlign":"right","width":"110px","fontSize":"14px","lineHeight":"40px","height":"40px"}'>价格</div>
					<div style="font-weight: bold;" :style='{"padding":"0 10px","color":"#666","background":"#e8f9ff","width":"100%","fontSize":"14px","lineHeight":"40px","height":"40px"}'><span :style='{"fontSize":"12px"}'>￥</span>{{detail.price}}</div>
				</div>
				<div class="item" :style='{"width":"80%","padding":"10px","margin":"0 0 10px 0","justifyContent":"spaceBetween","display":"flex"}' v-if="detail.jf">
					<div class="lable" :style='{"padding":"0 10px","color":"#999","textAlign":"right","width":"110px","fontSize":"14px","lineHeight":"40px","height":"40px"}'>积分</div>
					<div style="color: red;font-weight: bold;" :style='{"padding":"0 10px","color":"#666","background":"#e8f9ff","width":"100%","fontSize":"14px","lineHeight":"40px","height":"40px"}'>{{detail.jf}}</div>
				</div>
				<div class="item" :style='{"width":"80%","padding":"10px","margin":"0 0 10px 0","justifyContent":"spaceBetween","display":"flex"}'>
					<div class="lable" :style='{"padding":"0 10px","color":"#999","textAlign":"right","width":"110px","fontSize":"14px","lineHeight":"40px","height":"40px"}'>规模</div>
					<div  :style='{"padding":"0 10px","color":"#666","background":"#e8f9ff","width":"100%","fontSize":"14px","lineHeight":"40px","height":"40px"}'>{{detail.guimo}}</div>
				</div>
				<div class="item" :style='{"width":"80%","padding":"10px","margin":"0 0 10px 0","justifyContent":"spaceBetween","display":"flex"}'>
					<div class="lable" :style='{"padding":"0 10px","color":"#999","textAlign":"right","width":"110px","fontSize":"14px","lineHeight":"40px","height":"40px"}'>设施</div>
					<div  :style='{"padding":"0 10px","color":"#666","background":"#e8f9ff","width":"100%","fontSize":"14px","lineHeight":"40px","height":"40px"}'>{{detail.sheshi}}</div>
				</div>
				<div class="item" :style='{"width":"80%","padding":"10px","margin":"0 0 10px 0","justifyContent":"spaceBetween","display":"flex"}'>
					<div class="lable" :style='{"padding":"0 10px","color":"#999","textAlign":"right","width":"110px","fontSize":"14px","lineHeight":"40px","height":"40px"}'>位置</div>
					<div  :style='{"padding":"0 10px","color":"#666","background":"#e8f9ff","width":"100%","fontSize":"14px","lineHeight":"40px","height":"40px"}'>{{detail.weizhi}}</div>
				</div>
				<div class="item" :style='{"width":"80%","padding":"10px","margin":"0 0 10px 0","justifyContent":"spaceBetween","display":"flex"}'>
					<div class="lable" :style='{"padding":"0 10px","color":"#999","textAlign":"right","width":"110px","fontSize":"14px","lineHeight":"40px","height":"40px"}'>营业时间</div>
					<div  :style='{"padding":"0 10px","color":"#666","background":"#e8f9ff","width":"100%","fontSize":"14px","lineHeight":"40px","height":"40px"}'>{{detail.yingyeshijian}}</div>
				</div>
				<div class="item" :style='{"width":"80%","padding":"10px","margin":"0 0 10px 0","justifyContent":"spaceBetween","display":"flex"}'>
					<div class="lable" :style='{"padding":"0 10px","color":"#999","textAlign":"right","width":"110px","fontSize":"14px","lineHeight":"40px","height":"40px"}'>收费说明</div>
					<div  :style='{"padding":"0 10px","color":"#666","background":"#e8f9ff","width":"100%","fontSize":"14px","lineHeight":"40px","height":"40px"}'>{{detail.shoufeishuoming}}</div>
				</div>
				<div class="item" :style='{"width":"80%","padding":"10px","margin":"0 0 10px 0","justifyContent":"spaceBetween","display":"flex"}'>
					<div class="lable" :style='{"padding":"0 10px","color":"#999","textAlign":"right","width":"110px","fontSize":"14px","lineHeight":"40px","height":"40px"}'>座位总数</div>
					<div  :style='{"padding":"0 10px","color":"#666","background":"#e8f9ff","width":"100%","fontSize":"14px","lineHeight":"40px","height":"40px"}'>{{numberList.length}}</div>
				</div>
				<div class="btn" :style='{"padding":"10px 0","flexWrap":"wrap","display":"flex"}'>
					<el-button :style='{"border":"0","cursor":"pointer","padding":"0 10px","margin":"0 5px 0 0","outline":"none","color":"#fff","borderRadius":"4px","background":"#4c7568","width":"auto","lineHeight":"40px","fontSize":"14px","height":"40px"}' type="warning" size="small" @click="bookClick">立即预订</el-button>
					<el-button :style='{"border":"0","cursor":"pointer","padding":"0 10px","margin":"0 5px 0 0","outline":"none","color":"#fff","borderRadius":"4px","background":"#4c7568","width":"auto","lineHeight":"40px","fontSize":"14px","height":"40px"}' type="warning" size="small" @click="begin_jifei" v-if="!jifei_flag">开始计费</el-button>
					<el-button :style='{"border":"0","cursor":"pointer","padding":"0 10px","margin":"0 5px 0 0","outline":"none","color":"#fff","borderRadius":"4px","background":"#4c7568","width":"auto","lineHeight":"40px","fontSize":"14px","height":"40px"}' type="warning" size="small"  v-else>正在计费</el-button>
				</div>
				<div class="btn" :style='{"padding":"10px 0","flexWrap":"wrap","display":"flex"}'>
				</div>
			</div>
			
		</div>
		
		
		<el-tabs class="detail" :style='{"border":"1px solid #DCDFE6","boxShadow":"0 1px 6px 0 rgba(0, 0, 0, .1)","background":"#FFF"}' v-model="activeName" type="border-card">
			<el-tab-pane label="详情介绍" name="first">
				<div v-html="detail.xiangqingjieshao"></div>
			</el-tab-pane>
			<el-tab-pane label="评论" name="second">
				<el-form class="add comment" :style='{"padding":"15px","margin":"0 0 20px"}' :model="form" :rules="rules" ref="form">
					<el-form-item class="item" :style='{"width":"100%","display":"flex","height":"auto"}' label="评论" prop="content">
						<el-input type="textarea" :rows="5" v-model="form.content" placeholder="请输入内容"></el-input>
					</el-form-item>
					<el-form-item class="btn" :style='{"width":"100%","padding":"0 0 0 80px","margin":"10px 0 0","height":"auto"}'>
						<el-button :style='{"border":"0","cursor":"pointer","padding":"0","margin":"0 20px 0 0","outline":"none","color":"rgba(255, 255, 255, 1)","borderRadius":"4px","background":"rgba(252, 190, 75, 1)","width":"128px","lineHeight":"40px","fontSize":"14px","height":"40px"}' type="primary" @click="submitForm('form')">立即提交</el-button>
						<el-button :style='{"border":"0","cursor":"pointer","padding":"0","margin":"0 20px 0 0","outline":"none","color":"rgba(255, 255, 255, 1)","borderRadius":"4px","background":"#00b9ea","width":"128px","lineHeight":"40px","fontSize":"14px","height":"40px"}' @click="resetForm('form')">重置</el-button>
					</el-form-item>
				</el-form>
				
				<div v-if="infoList.length" :style='{"boxShadow":"0 1px 6px 0 rgba(0, 0, 0, .1)","padding":"15px"}' class="comment">
					<div :style='{"padding":"8px 0","margin":"0 0 20px","borderColor":"#999","alignItems":"center","borderWidth":"0","width":"100%","borderStyle":"solid","height":"auto"}' v-for="item in infoList" :key="item.id">
						<div class="user" :style='{"width":"100%","alignItems":"center","display":"flex","height":"auto"}'>
							<el-image v-if="item.avatarurl" :style='{"width":"40px","margin":"0 10px 0 0","borderRadius":"100%","objectFit":"cover","height":"40px"}' :size="50" :src="baseUrl + item.avatarurl"></el-image>
							<el-image v-if="!item.avatarurl" :style='{"width":"40px","margin":"0 10px 0 0","borderRadius":"100%","objectFit":"cover","height":"40px"}' :size="50" :src="require('@/assets/touxiang.png')"></el-image>
							<div :style='{"color":"#333","fontSize":"16px"}' class="name">{{item.nickname}}</div>
						</div>
						<div :style='{"padding":"8px","boxShadow":"rgb(75 223 201 / 30%) 0px 0px 6px","margin":"10px 0px 0px","color":"#333","borderRadius":"4px","background":"rgba(232, 249, 255, 1)","lineHeight":"30px","fontSize":"14px"}' class="content-block-ask">
							{{item.content}}
						</div>
						<div :style='{"padding":"8px","boxShadow":"rgb(75 223 201 / 30%) 0px 0px 6px","margin":"10px 0px 0px","color":"#333","borderRadius":"4px","background":"rgba(232, 249, 255, 1)","lineHeight":"30px","fontSize":"14px"}' class="content-block-reply" v-if="item.reply">
							回复：{{item.reply}}
						</div>
					</div>
				</div>
				
				<el-pagination
				  background
				  class="pagination"
				  :pager-count="7"
				  :page-size="pageSize"
				  :page-sizes="pageSizes"
				  prev-text="<"
				  next-text=">"
				  :hide-on-single-page="true"
				  :layout='["total","prev","pager","next","sizes","jumper"].join()'
				  :total="total"
				  :style='{"padding":"0","margin":"20px auto","whiteSpace":"nowrap","color":"#333","textAlign":"center","width":"1200px","fontWeight":"500"}'
				  @current-change="curChange"
				  @prev-click="prevClick"
				  @next-click="nextClick"
				></el-pagination>
			</el-tab-pane>
			
			<el-tab-pane label="选座" name="last">
				<div class="seat-list">
					<div v-for="(item, index) in numberList" v-bind:key="index" class="seat-item">
						<img @click="selectTip()" v-if="item.select=='1'" class="seat-icon" src="../../assets/select.png" />
						<img @click="selectSeat(item)" v-else-if="item.active!='1'" class="seat-icon" src="../../assets/unselect.png" />
						<img @click="unselectSeat(item)" v-else class="seat-icon" src="../../assets/select.png" />
						<span>{{item.name}}</span>
					</div>
				</div>
			</el-tab-pane>
		</el-tabs>
	</div>
</div>
</template>

<script>
  import CountDown from '@/components/CountDown';
  export default {
    //数据集合
    data() {
      return {
        tablename: 'zixishi',
        baseUrl: '',
        breadcrumbItem: [
          {
            name: '详情信息'
          }
        ],
        title: '',
        detailBanner: [],
        endTime: 0,
        detail: {},
        activeName: 'first',
        form: {
          content: '',
          userid: localStorage.getItem('userid'),
          nickname: localStorage.getItem('username'),
          avatarurl: '',
        },
        infoList: [],
        total: 1,
        pageSize: 5,
		pageSizes: [10,20,30,50],
        totalPage: 1,
        rules: {
          content: [
            { required: true, message: '请输入内容', trigger: 'blur' }
          ]
        },
        storeupParams: {
          name: '',
          picture: '',
          refid: 0,
          tablename: 'zixishi',
          userid: localStorage.getItem('userid')
        },
        isStoreup: false,
        storeupInfo: {},
        buynumber: 1,
        numberList: [],
		jifei_flag:false,
      }
    },
    created() {
        this.init();
    },
    //方法集合
    methods: {
        init() {
          this.baseUrl = this.$config.baseUrl;
          if(this.$route.query.detailObj) {
            this.detail = JSON.parse(this.$route.query.detailObj);
          }
          if(this.$route.query.storeupObj) {
            this.detail.id = JSON.parse(this.$route.query.storeupObj).refid;
          }
          if(this.$route.query.discussObj) {
            this.detail.id = JSON.parse(this.$route.query.discussObj).goodid;
          }
          this.$http.get(this.tablename + '/detail/'  + this.detail.id, {}).then(res => {
            if (res.data.code == 0) {
              this.detail = res.data.data;
              this.title = this.detail.mingcheng;
              this.detailBanner = this.detail.tupian ? this.detail.tupian.split(",") : [];
			  this.getZhuowei();
              this.$forceUpdate();
            }
          });

          this.getDiscussList(1);
          this.getStoreupStatus();

          let selectArray = this.detail.selected.split(',');
		  
        //   for (let i = 1; i <= this.detail.number; i++) {
        //     this.numberList.push({
        //       name: `${i}号`,
        //       select: false,
        //       active: false
        //     });
        //   }
        //   for (let i = 0; i < this.detail.selected.split(',').length; i++) {
        //     this.numberList[this.detail.selected.split(',')[i]-1].select = true;
        //   }
        },
	getZhuowei(){
		let params = {
			page:1,
			limit:10000,
			zixishi:this.title
		}
		this.$http.post('zhuowei/list', 

		{params: { zixishi:this.title}}

		).then(res => {
            if (res.data.code == 0) {
				this.numberList = [];
				for(let i=0;i<res.data.data.list.length;i++){
					if(res.data.data.list[i].zixishi==this.title){
						this.numberList.push(res.data.data.list[i])
					}
				}
              
            }
        });
	},
    createOrder() {
      let order = '';
      let now = new Date();
      order += now.getFullYear();
      order += now.getMonth() + 1;
      order += now.getDate();
      order += now.getHours();
      order += now.getMinutes();
      order += now.getSeconds();
      order += now.getMilliseconds();
      return order;
    },
	begin_jifei(){
		this.$confirm('开始计费后，是实时计费，确定继续？', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      })
      .then(() => {
		const currentDate = new Date();
		const year = currentDate.getFullYear();
		const month = currentDate.getMonth() + 1;
		const day = currentDate.getDate();
		const hours = currentDate.getHours();
		const minutes = currentDate.getMinutes();
		const seconds = currentDate.getSeconds();
		const currentDateTime = `${year}-${month}-${day} ${hours}:${minutes}:${seconds}`;
		console.log(localStorage.getItem("username"),this.detail.price);
        // 用户点击了确认按钮，执行删除操作
        let data = {
			yonghuming:localStorage.getItem("username"),
			zixishi:this.title,
			price:this.detail.price,
			begintime:currentDateTime
		}
		console.log(data);
		this.$http.post('jifei/add', data).then(res => {
            if (res.data.code == 0) {
              this.$message({
                type: 'success',
                message: '开始计费成功!',
                duration: 1500,
              });
			  this.jifei_flag = true;
            }
          });
      })
      .catch(() => {
        // 用户点击了取消按钮，取消删除操作
        
      });
	},
    bookClick() {
            let activeSeat = [];
			let updatezhuowei = [];
            for(let i=0;i<this.numberList.length;i++){
                if(this.numberList[i].active=='1'){
                    activeSeat.push(this.numberList[i].name.replace('号',''));
					let zhuoweidata = this.numberList[i];
					updatezhuowei.push(zhuoweidata);
                }
            }
            if (activeSeat.length==0) {
                this.$message({
                  type: 'error',
                  message: '请选择要预定的位置!',
                  duration: 1500
                });
                return
            }
            let data = {
                orderid: this.createOrder(),
                tablename: this.tablename,
                userid: localStorage.getItem('userid'),
                goodid: this.detail.id,
                goodname: this.title,
                picture:this.detailBanner[0],
                buynumber: activeSeat.length,
                total: 0,
                discounttotal: 0,
                address: activeSeat.join(','),
                activeSeat: activeSeat.join(','),
                status: '已支付',
                discountprice: this.detail.vipprice,
				updatezhuowei:updatezhuowei
            }
			console.log(data);
            if (this.detail.price) {
                data['status'] = '未支付'
                data['price'] = this.detail.price
                data['total'] = parseFloat(data['price'] * activeSeat.length).toFixed(2)
                localStorage.setItem('orderGoods', JSON.stringify([data]));
                // 跳转到确认下单页面
                let query = {
                    type: 1,
                    seat: 1
                }
                this.$confirm('是否确认预定？')
                  .then(_ => {
                    this.$router.push({path: '/index/shop-order/orderConfirm', query: query});
                  }).catch(_ => {});
            } else {
                //let oldSelectedArray = this.detail.selected?this.detail.selected.split(","):[];
                // 新的预定座位号
                //let newSelectArray = oldSelectedArray.concat(activeSeat);
                // 赋值给参数
                    this.detail.selected = newSelectArray.join(',');
                //data['price'] = 0
                //layui.http.requestJson(`orders/add`, 'post', data, (res) => {
                    // 修改数据被选中座位信息
                 //   layui.http.requestJson(`${this.detailTable}/update`, 'post', this.detail, (res) => {
                  //      layer.msg(`预定成功`, {
                   //         time: 2000,
                    //        icon: 6
                     //   });
                    //});
                //})
            }
      },
      selectTip() {
        this.$message({
          type: 'error',
          message: '该座位已被预定!',
          duration: 1500
        });
      },
      selectSeat(item) {
        item.active = '1';
      },
      unselectSeat(item) {
        item.active = '0';
      },
      storeup(type) {
        if (type == 1 && !this.isStoreup) {
          this.storeupParams.name = this.title;
          this.storeupParams.picture = this.detailBanner[0];
          this.storeupParams.refid = this.detail.id;
          this.storeupParams.type = type;
          this.$http.post('storeup/add', this.storeupParams).then(res => {
            if (res.data.code == 0) {
              this.isStoreup = true;
              this.$message({
                type: 'success',
                message: '收藏成功!',
                duration: 1500,
              });
            }
          });
        }
        if (type == -1 && this.isStoreup) {
          let delIds = new Array();
          delIds.push(this.storeupInfo.id);
          this.$http.post('storeup/delete', delIds).then(res => {
            if (res.data.code == 0) {
              this.isStoreup = false;
              this.$message({
                type: 'success',
                message: '取消成功!',
                duration: 1500,
              });
            }
          });
        }
      },
      getStoreupStatus(){
        if(localStorage.getItem("Token")) {
            this.$http.get('storeup/list', {params: {page: 1, limit: 1, type: 1, refid: this.detail.id, tablename: 'zixishi', userid: localStorage.getItem('userid')}}).then(res => {
              if (res.data.code == 0 && res.data.data.list.length > 0) {
                this.isStoreup = true;
                this.storeupInfo = res.data.data.list[0];
              }
            });
        }
      },
      curChange(page) {
        this.getInfo(page);
      },
      prevClick(page) {
        this.getInfo(page);
      },
      nextClick(page) {
        this.getInfo(page);
      },
      // 下载
      download(file){
        if(!file) {
            this.$message({
              type: 'error',
              message: '文件不存在',
              duration: 1500,
            });
            return;
        }
        window.open(this.baseUrl+file)
      },
      getDiscussList(page) {
        this.$http.get('discusszixishi/list', {params: {page, limit: this.pageSize, refid: this.detail.id}}).then(res => {
          if (res.data.code == 0) {
            this.infoList = res.data.data.list;
            this.total = res.data.data.total;
            this.pageSize = res.data.data.pageSize;this.pageSizes = [this.pageSize, this.pageSize*2, this.pageSize*3, this.pageSize*5];
            this.totalPage = res.data.data.totalPage;
          }
        });
      },
      submitForm(formName) {
        this.$refs[formName].validate((valid) => {
          if (valid) {
            this.$http.get('orders/list', {params: {page: 1, limit: 1, status: '已完成', goodid: this.detail.id, userid: localStorage.getItem('userid')}}).then(res => {
                if (res.data.code == 0 && res.data.data.list.length == 0) {
                  this.$message({
                    type: 'success',
                    message: '请完成订单后再评论!',
                    duration: 1500
                  });
                  return false
                } else {
                    this.form.refid = this.detail.id;
                    this.form.avatarurl = localStorage.getItem('headportrait')?localStorage.getItem('headportrait'):'';
                    this.$http.post('discusszixishi/add', this.form).then(res => {
                      if (res.data.code == 0) {
                        this.form.content = '';
                        this.getDiscussList(1);
                        this.$message({
                          type: 'success',
                          message: '评论成功!',
                          duration: 1500,
                        });
                      }
                    });
                }
            });
          } else {
            return false;
          }
        });
      },
      resetForm(formName) {
        this.$refs[formName].resetFields();
      },
        //立即购买
        buyNow() {
            // 保存到storage中，在确认下单页面中获取要购买的商品
            localStorage.setItem('orderGoods', JSON.stringify([{
                tablename: this.tablename,
                goodid: this.detail.id,
                goodname: this.title,

                picture:this.detailBanner[0],
                buynumber: this.buynumber,
                userid: localStorage.getItem('userid'),
                price: this.detail.price,
                discountprice: this.detail.vipprice ? this.detail.vipprice : 0
            }]));
            // 跳转到确认下单页面
            let query = {
                type: 1,
            }
            this.$router.push({path: '/index/shop-order/orderConfirm', query: query});
        },


    },
    components: {
      CountDown
    }
  }
</script>

<style rel="stylesheet/scss" lang="scss" scoped>
	.detail-preview {
	
	  .attr {
	    .el-carousel /deep/ .el-carousel__indicator button {
	      width: 0;
	      height: 0;
	      display: none;
	    }
	
	    .el-input-number__decrease:hover:not(.is-disabled)~.el-input .el-input__inner:not(.is-disabled), .el-input-number__increase:hover:not(.is-disabled)~.el-input .el-input__inner:not(.is-disabled) {
	      border-color: none;
	    }
	  }
	
	  .detail {
	    & /deep/ .el-tabs__header .el-tabs__nav-wrap {
	      margin-bottom: 0;
	    }
	
	    & .add .el-textarea {
	      width: auto;
	    }
	  }
	}
	
	.attr .el-carousel /deep/ .el-carousel__container .el-carousel__arrow--left {
		width: 36px;
		font-size: 12px;
		height: 36px;
	}
	
	.attr .el-carousel /deep/ .el-carousel__container .el-carousel__arrow--left:hover {
		background: #03b7ec;
	}
	
	.attr .el-carousel /deep/ .el-carousel__container .el-carousel__arrow--right {
		width: 36px;
		font-size: 12px;
		height: 36px;
	}
	
	.attr .el-carousel /deep/ .el-carousel__container .el-carousel__arrow--right:hover {
		background: #03b7ec;
	}

	.attr .el-carousel /deep/ .el-carousel__indicators {
		padding: 0;
		margin: 0 0 10px;
		z-index: 2;
		position: absolute;
		list-style: none;
	}
	
	.attr .el-carousel /deep/ .el-carousel__indicators li {
		border-radius: 10px;
		padding: 0;
		margin: 0 4px;
		background: #fff;
		display: inline-block;
		width: 12px;
		opacity: 0.4;
		transition: 0.3s;
		height: 12px;
	}
	
	.attr .el-carousel /deep/ .el-carousel__indicators li:hover {
		padding: 0;
		margin: 0 4px;
		background: #fff;
		display: inline-block;
		width: 24px;
		opacity: 0.7;
		height: 12px;
	}
	
	.attr .el-carousel /deep/ .el-carousel__indicators li.is-active {
		padding: 0;
		margin: 0 4px;
		background: #fff;
		display: inline-block;
		width: 24px;
		opacity: 1;
		height: 12px;
	}
	
	.attr .el-input-number /deep/ .el-input-number__decrease {
		cursor: pointer;
		z-index: 1;
		display: flex;
		border-color: #DCDFE6;
		border-radius: 4px 0 0 4px;
		top: 1px;
		left: 1px;
		background: #f5f5f5;
		width: 40px;
		justify-content: center;
		border-width: 0 1px 0 0;
		align-items: center;
		position: absolute;
		border-style: solid;
		text-align: center;
		height: 38px;
	}
	
	.attr .el-input-number /deep/ .el-input-number__decrease i {
		color: #666;
		font-size: 14px;
	}

	.attr .el-input-number /deep/ .el-input-number__increase {
		cursor: pointer;
		z-index: 1;
		display: flex;
		border-color: #DCDFE6;
		right: 1px;
		border-radius: 0 4px 4px 0;
		top: 1px;
		background: #f5f5f5;
		width: 40px;
		justify-content: center;
		border-width: 0 0 0 1px;
		align-items: center;
		position: absolute;
		border-style: solid;
		text-align: center;
		height: 38px;
	}
	
	.attr .el-input-number /deep/ .el-input-number__increase i {
		color: #666;
		font-size: 14px;
	}
	
	.attr .el-input-number /deep/ .el-input .el-input__inner {
		border: 1px solid #DCDFE6;
		border-radius: 4px;
		padding: 0 40px;
		outline: none;
		color: #666;
		background: #FFF;
		display: inline-block;
		width: 100%;
		font-size: 14px;
		line-height: 40px;
		text-align: center;
		height: 40px;
	}
	
	.detail-preview .detail.el-tabs /deep/ .el-tabs__header {
		margin: 0;
		background: rgba(232, 249, 255, 1);
		border-color: #E4E7ED;
		border-width: 0 0 1px 0;
		border-style: solid;
	}
	
	.detail-preview .detail.el-tabs /deep/ .el-tabs__header .el-tabs__item {
		border: 0;
		padding: 0 20px;
		margin: 10px;
		background-size: 100% 100%;
		color: #fff;
		font-weight: 500;
		display: inline-block;
		font-size: 14px;
		line-height: 40px;
		background: transparent;
		background-image: url(http://codegen.caihongy.cn/20221023/35857a97d2674d73a8e11bc19c3a1f1b.png);
		position: relative;
		list-style: none;
		height: 40px;
	}
	
	.detail-preview .detail.el-tabs /deep/ .el-tabs__header .el-tabs__item:hover {
		border: 0;
		margin: 10px;
		background-size: 100% 100%;
		color: #fff;
		background: #e8f9ff;
		background-image: url(http://codegen.caihongy.cn/20221023/d95ee3c6ef834960887b0a9b8248ad66.png);
	}
	
	.detail-preview .detail.el-tabs /deep/ .el-tabs__header .el-tabs__item.is-active {
		border: 0;
		margin: 10px;
		background-size: 100% 100%;
		color: #fff;
		background: #e8f9ff;
		background-image: url(http://codegen.caihongy.cn/20221023/d95ee3c6ef834960887b0a9b8248ad66.png);
	}
	
	.detail-preview .detail.el-tabs /deep/ .el-tabs__content {
		padding: 15px;
	}
	
	.detail-preview .detail.el-tabs .add /deep/ .el-form-item__label {
		padding: 0 10px 0 0;
		color: #666;
		width: 80px;
		font-size: 14px;
		line-height: 40px;
		text-align: right;
	}
	
	.detail-preview .detail.el-tabs .add /deep/ .el-textarea__inner {
		border: 0;
		border-radius: 4px;
		padding: 0 12px;
		outline: none;
		color: #000;
		background: rgba(232, 249, 255, 1);
		width: 900px;
		font-size: 14px;
		line-height: 32px;
		height: 120px;
	}
	
	.breadcrumb-preview .el-breadcrumb /deep/ .el-breadcrumb__separator {
		margin: 0 9px;
		color: #fff;
		font-weight: 500;
	}
	
	.breadcrumb-preview .el-breadcrumb /deep/ .el-breadcrumb__inner a {
		color: #fff;
		display: inline-block;
	}

	.breadcrumb-preview .el-breadcrumb /deep/ .el-breadcrumb__inner {
		color: #fff;
		display: inline-block;
	}
	
	.el-pagination /deep/ .el-pagination__total {
		margin: 0 10px 0 0;
		color: #666;
		font-weight: 400;
		display: inline-block;
		vertical-align: top;
		font-size: 13px;
		line-height: 28px;
		height: 28px;
	}
	
	.el-pagination /deep/ .btn-prev {
		border: none;
		border-radius: 2px;
		padding: 0;
		margin: 0 5px;
		color: #666;
		background: #f4f4f5;
		display: inline-block;
		vertical-align: top;
		font-size: 13px;
		line-height: 28px;
		min-width: 35px;
		height: 28px;
	}
	
	.el-pagination /deep/ .btn-next {
		border: none;
		border-radius: 2px;
		padding: 0;
		margin: 0 5px;
		color: #666;
		background: #f4f4f5;
		display: inline-block;
		vertical-align: top;
		font-size: 13px;
		line-height: 28px;
		min-width: 35px;
		height: 28px;
	}
	
	.el-pagination /deep/ .btn-prev:disabled {
		border: none;
		cursor: not-allowed;
		border-radius: 2px;
		padding: 0;
		margin: 0 5px;
		color: #C0C4CC;
		background: #f4f4f5;
		display: inline-block;
		vertical-align: top;
		font-size: 13px;
		line-height: 28px;
		height: 28px;
	}
	
	.el-pagination /deep/ .btn-next:disabled {
		border: none;
		cursor: not-allowed;
		border-radius: 2px;
		padding: 0;
		margin: 0 5px;
		color: #C0C4CC;
		background: #f4f4f5;
		display: inline-block;
		vertical-align: top;
		font-size: 13px;
		line-height: 28px;
		height: 28px;
	}
	
	.el-pagination /deep/ .el-pager {
		padding: 0;
		margin: 0;
		display: inline-block;
		vertical-align: top;
	}
	
	.el-pagination /deep/ .el-pager .number {
		cursor: pointer;
		padding: 0 4px;
		margin: 0 5px;
		color: #666;
		display: inline-block;
		vertical-align: top;
		font-size: 13px;
		line-height: 28px;
		border-radius: 2px;
		background: #f4f4f5;
		text-align: center;
		min-width: 30px;
		height: 28px;
	}
	
	.el-pagination /deep/ .el-pager .number:hover {
		cursor: pointer;
		padding: 0 4px;
		margin: 0 5px;
		color: #fcbe4b;
		display: inline-block;
		vertical-align: top;
		font-size: 13px;
		line-height: 28px;
		border-radius: 2px;
		background: #f4f4f5;
		text-align: center;
		min-width: 30px;
		height: 28px;
}

.el-pagination /deep/ .el-pager .number.active {
		cursor: default;
		padding: 0 4px;
		margin: 0 5px;
		color: #FFF;
		display: inline-block;
		vertical-align: top;
		font-size: 13px;
		line-height: 28px;
		border-radius: 2px;
		background: #fcbe4b;
		text-align: center;
		min-width: 30px;
		height: 28px;
	}
	
	.el-pagination /deep/ .el-pagination__sizes {
		display: inline-block;
		vertical-align: top;
		font-size: 13px;
		line-height: 28px;
		height: 28px;
	}
	
	.el-pagination /deep/ .el-pagination__sizes .el-input {
		margin: 0 5px;
		width: 100px;
		position: relative;
	}
	
	.el-pagination /deep/ .el-pagination__sizes .el-input .el-input__inner {
		border: 1px solid #DCDFE6;
		cursor: pointer;
		padding: 0 25px 0 8px;
		color: #606266;
		display: inline-block;
		font-size: 13px;
		line-height: 28px;
		border-radius: 3px;
		outline: 0;
		background: #FFF;
		width: 100%;
		text-align: center;
		height: 28px;
	}
	
	.el-pagination /deep/ .el-pagination__sizes .el-input span.el-input__suffix {
		top: 0;
		position: absolute;
		right: 0;
		height: 100%;
	}
	
	.el-pagination /deep/ .el-pagination__sizes .el-input .el-input__suffix .el-select__caret {
		cursor: pointer;
		color: #C0C4CC;
		width: 25px;
		font-size: 14px;
		line-height: 28px;
		text-align: center;
	}

	.el-pagination /deep/ .el-pagination__jump {
		margin: 0 0 0 24px;
		color: #606266;
		display: inline-block;
		vertical-align: top;
		font-size: 13px;
		line-height: 28px;
		height: 28px;
	}
	
	.el-pagination /deep/ .el-pagination__jump .el-input {
		border-radius: 3px;
		padding: 0 2px;
		margin: 0 2px;
		display: inline-block;
		width: 50px;
		font-size: 14px;
		line-height: 18px;
		position: relative;
		text-align: center;
		height: 28px;
	}
	
	.el-pagination /deep/ .el-pagination__jump .el-input .el-input__inner {
		border: 1px solid #DCDFE6;
		cursor: pointer;
		padding: 0 3px;
		color: #606266;
		display: inline-block;
		font-size: 14px;
		line-height: 28px;
		border-radius: 3px;
		outline: 0;
		background: #FFF;
		width: 100%;
		text-align: center;
		height: 28px;
	}
    .seat-list{
        display: flex;
        align-items: center;
        flex-wrap: wrap;
        .seat-item{
            width: 20%;
            display: flex;
            flex-direction: column;
            align-items: center;
            span{
                line-height: 3;
            }
        }
    }
</style>
