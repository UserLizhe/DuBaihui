<template>
<div class="home-preview" :style='{"width":"100%","margin":"10px auto"}'>


		
	
	<el-row type="flex" :gutter="5" justify="center" style="width: 100%">
		<el-col :span="3" v-if="queryList.length>1">
			<el-select v-model="queryIndex">
				<el-option
				  v-for="(item,index) in queryList"
				  :key="index"
				  :label="item.queryName"
				  :value="index"
				></el-option>
			</el-select>
		</el-col>
		<el-col :span="3" v-if="queryIndex==0">
			<el-input v-model="zixishimingcheng" placeholder="名称"></el-input>
		</el-col>
		<el-col :span="3" v-if="queryIndex==0">
			<el-button type="primary" @click="search('zixishi')">搜索</el-button>
		</el-col>
	</el-row>
	<div class="lists" :style='{"margin":"0 0 10px","background":"#fff"}'>
		<el-row type="flex" :gutter="5" justify="center" style="width: 100%">
			<span :style='{"color":"#000","fontSize":"28px","textAlign":"center","":"0 0 10px","width":"100%","background":"rgba(233, 242, 255, 1)"}'>自习室介绍视频</span>
		</el-row>
	<el-row type="flex" :gutter="5" justify="center" style="width: 100%">
		
	<video muted="muted" :id="startvideo+i" class="video" src="./video.mp4" type="video/mp4" poster="false.png" autoplay="autoplay" controls="controls" loop="-1" :style='{"width":"100%","height":"800px","padding":"20px 260px","margin":"0 0 10px","background":"rgba(233, 242, 255, 1)"}'>
                      <p>你的浏览器不支持video标签.</p>
    </video>
	</el-row>
	</div>
		
	

	
<div class="news" :style='{"padding":"20px 260px","margin":"0 0 10px","background":"rgba(233, 242, 255, 1)"}'>
	<div v-if="false" class="idea newsIdea" :style='{"padding":"20px","flexWrap":"wrap","background":"#efefef","justifyContent":"space-between","display":"flex"}'>
		<div class="box1" :style='{"width":"20%","background":"#fff","height":"80px"}'></div>
		<div class="box2" :style='{"width":"20%","background":"#fff","height":"80px"}'></div>
		<div class="box3" :style='{"width":"20%","background":"#fff","height":"80px"}'></div>
		<div class="box4" :style='{"width":"20%","background":"#fff","height":"80px"}'></div>
		<div class="box5" :style='{"width":"20%","background":"#fff","display":"none","height":"80px"}'></div>
		<div class="box6" :style='{"width":"20%","background":"#fff","display":"none","height":"80px"}'></div>
		<div class="box7" :style='{"width":"20%","background":"#fff","display":"none","height":"80px"}'></div>
		<div class="box8" :style='{"width":"20%","background":"#fff","display":"none","height":"80px"}'></div>
		<div class="box9" :style='{"width":"20%","background":"#fff","display":"none","height":"80px"}'></div>
		<div class="box10" :style='{"width":"20%","background":"#fff","display":"none","height":"80px"}'></div>
	</div>
	
	<div class="title" :style='{"width":"200px","margin":"10px auto 20px","lineHeight":"54px","textAlign":"center"}'>
		<span :style='{"color":"#000","fontSize":"28px"}'>公告</span>
	</div>
	
	
	
	
	
	<!-- 样式四 -->
	<div v-if="newsList.length" class="list list4 index-pv1" :style='{"width":"100%","padding":"10px","flexWrap":"wrap","justifyContent":"center","display":"flex","height":"auto"}'>
	    <div @click="toDetail('newsDetail', newsList[0])" v-if="newsList.length>0" class="new-list-item animation-box" :style='{"width":"390px","padding":"20px","height":"300px"}'>
			<div :style='{"margin":"0 0 10px","overflow":"hidden","color":"rgba(0, 0, 0, 1)","textAlign":"center","fontSize":"16px","lineHeight":"25px","height":"50px"}' class="new-list-item-title line1">{{newsList[0].title}}</div>
			<div :style='{"padding":"0 20px","margin":"0 0 10px","overflow":"hidden","color":"#666","fontSize":"14px","lineHeight":"25px","height":"125px"}' class="descript  line3">{{newsList[0].introduction}}</div>
			<div :style='{"width":"100%","padding":"10px","fontSize":"12px","color":"#000","textAlign":"center","background":"rgba(252, 190, 75, 1)"}' class="time">{{newsList[0].addtime}}</div>
	    </div>
	    <div @click="toDetail('newsDetail', newsList[0])" v-if="newsList.length>0" class="new-list-item animation-box" :style='{"width":"390px","background":"#fcbe4b","height":"300px"}'>
			<img :style='{"objectFit":"cover","width":"100%","height":"100%"}' :src="baseUrl + newsList[0].picture" alt="">
	    </div>
	    <div @click="toDetail('newsDetail', newsList[1])" v-if="newsList.length>1" class="new-list-item animation-box" :style='{"width":"390px","padding":"20px","height":"300px"}'>
			<div :style='{"margin":"0 0 10px","overflow":"hidden","color":"#000","textAlign":"center","fontSize":"16px","lineHeight":"25px","height":"50px"}' class="new-list-item-title line1">{{newsList[1].title}}</div>
			<div :style='{"margin":"0 0 10px","fontSize":"14px","lineHeight":"25px","overflow":"hidden","color":"#666","height":"125px"}' class="descript  line3">{{newsList[1].introduction}}</div>
			<div :style='{"padding":"10px","fontSize":"12px","color":"#000","textAlign":"center","background":"#fcbe4b"}' class="time">{{newsList[1].addtime}}</div>
	    </div>
	    <div @click="toDetail('newsDetail', newsList[1])" v-if="newsList.length>1" class="new-list-item animation-box" :style='{"width":"390px","background":"#fcbe4b","height":"300px"}'>
			<img :style='{"objectFit":"cover","width":"100%","height":"100%"}' :src="baseUrl + newsList[1].picture" alt="">
	    </div>
	    <div @click="toDetail('newsDetail', newsList[2])" v-if="newsList.length>2" class="new-list-item animation-box" :style='{"width":"390px","padding":"20px","height":"300px"}'>
			<div :style='{"margin":"0 0 10px","overflow":"hidden","color":"#000","textAlign":"center","fontSize":"16px","lineHeight":"25px","height":"50px"}' class="new-list-item-title  line1">{{newsList[2].title}}</div>
			<div :style='{"margin":"0 0 10px","fontSize":"14px","lineHeight":"25px","overflow":"hidden","color":"#666","height":"125px"}' class="descript  line3">{{newsList[2].introduction}}</div>
			<div :style='{"padding":"10px","fontSize":"12px","color":"#000","textAlign":"center","background":"#fcbe4b"}' class="time">{{newsList[2].addtime}}</div>
	    </div>
	    <div @click="toDetail('newsDetail', newsList[2])" v-if="newsList.length>2" class="new-list-item animation-box" :style='{"width":"390px","background":"#fcbe4b","height":"300px"}'>
			<img :style='{"objectFit":"cover","width":"100%","height":"100%"}' :src="baseUrl + newsList[2].picture" alt="">
	    </div>
	</div>
	
	
	
	
	
	
	
	<div @click="moreBtn('news')" :style='{"border":"0","margin":"10px auto","borderRadius":"10px","textAlign":"center","background":"#fcbe4b","display":"block","width":"100px","lineHeight":"32px"}'>
		<span :style='{"color":"#000","fontSize":"12px"}'>查看更多</span>
		<i v-if="true" :style='{"color":"#000","fontSize":"12px"}' class="el-icon-d-arrow-right"></i>
	</div>
	
</div>


<div class="lists" :style='{"margin":"0 0 10px","background":"#fff"}'>
	<div v-if="false" class="idea" :style='{"padding":"20px","flexWrap":"wrap","background":"#efefef","justifyContent":"space-between","display":"flex"}'>
		<div class="box1" :style='{"width":"20%","background":"#fff","height":"80px"}'></div>
		<div class="box2" :style='{"width":"20%","background":"#fff","height":"80px"}'></div>
		<div class="box3" :style='{"width":"20%","background":"#fff","height":"80px"}'></div>
		<div class="box4" :style='{"width":"20%","background":"#fff","height":"80px"}'></div>
		<div class="box5" :style='{"width":"20%","background":"#fff","display":"none","height":"80px"}'></div>
		<div class="box6" :style='{"width":"20%","background":"#fff","display":"none","height":"80px"}'></div>
		<div class="box7" :style='{"width":"20%","background":"#fff","display":"none","height":"80px"}'></div>
		<div class="box8" :style='{"width":"20%","background":"#fff","display":"none","height":"80px"}'></div>
		<div class="box9" :style='{"width":"20%","background":"#fff","display":"none","height":"80px"}'></div>
		<div class="box10" :style='{"width":"20%","background":"#fff","display":"none","height":"80px"}'></div>
	</div>
	
	<div class="title" :style='{"width":"200px","margin":"20px auto","lineHeight":"54px","textAlign":"center"}'>
	  <span :style='{"color":"#000","fontSize":"28px"}'>自习室展示</span>
	</div>
	
	
	<!-- 样式一 -->
	<div class="list list1 index-pv1" :style='{"width":"100%","padding":"0 10px","background":"#fff","height":"auto"}'>
		<div :style='{"border":"1px solid #707070","margin":"0 0.8%","background":"#f5f5f5","display":"inline-block","width":"15%","position":"relative","height":"auto"}' v-for="(item,index) in zixishiList" :key="index" @click="toDetail('zixishiDetail', item)" class="list-item animation-box">
			<img :style='{"width":"100%","objectFit":"cover","display":"block","height":"500px"}' v-if="item.tupian.substr(0,4)=='http'" :src="item.tupian.split(',')[0]" alt="" />
			<img :style='{"width":"100%","objectFit":"cover","display":"block","height":"500px"}' v-else :src="baseUrl + (item.tupian?item.tupian.split(',')[0]:'')" alt="" />
			<div class="name line1" :style='{"padding":"10px","lineHeight":"32px","fontSize":"14px","color":"#000","textAlign":"center","background":"rgba(233, 242, 255, 1)"}'>{{item.mingcheng}}</div>
			<div class="name line1" :style='{"padding":"10px","lineHeight":"32px","fontSize":"14px","color":"#000","textAlign":"center","background":"rgba(233, 242, 255, 1)"}'>规模:{{item.guimo}}</div>
		</div>
	</div>
	
	
	
	
	
	
	
	
	
	<div @click="moreBtn('zixishi')" :style='{"border":"0","margin":"40px auto","borderRadius":"10px","textAlign":"center","background":"#00b9ea","display":"block","width":"100px","lineHeight":"32px"}'>
		<span :style='{"color":"#f5f5f5","fontSize":"12px"}'>查看更多</span>
		<i v-if="true" :style='{"color":"#f5f5f5","fontSize":"12px"}' class="el-icon-d-arrow-right"></i>
	</div>
	

</div>


</div>
</template>

<script>
  export default {
    //数据集合
    data() {
      return {
        baseUrl: '',
        queryList:[
          {
              queryName:"名称",
          },
        ],
        queryIndex: 0,
        zixishimingcheng: '',
        newsList: [],
		jiankongList: [],
        zixishiList: [],
      }
    },
    created() {
      this.baseUrl = this.$config.baseUrl;
      this.getNewsList();
      this.getList();
	  this.getList1();
    },
    //方法集合
    methods: {
      search(tablename) {
        if (this.queryIndex == 0 && this.zixishimingcheng) {
          this.$router.push({path: '/index/' + tablename, query: {indexQueryCondition: this.zixishimingcheng}});
        }
      },
		getNewsList() {
			this.$http.get('news/list', {params: {
				page: 1,
				limit: 6,
			order: 'desc'}}).then(res => {
				if (res.data.code == 0) {
					this.newsList = res.data.data.list;
					
					
				}
			});
		},
		getList() {
          let autoSortUrl = "";
			
			this.$http.get('zixishi/list', {params: {
				page: 1,
				limit: 6,
			}}).then(res => {
				if (res.data.code == 0) {
					this.zixishiList = res.data.data.list;
					
					// 商品列表样式五
					
				}
			});
		},
		getList1() {
          let autoSortUrl = "";
			
			this.$http.get('jiankong/list', {params: {
				page: 1,
				limit: 6,
			}}).then(res => {
				if (res.data.code == 0) {
					this.jiankongList = res.data.data.list;
					
					// 商品列表样式五
					
				}
			});
		},
		toDetail(path, item) {
			this.$router.push({path: '/index/' + path, query: {detailObj: JSON.stringify(item)}});
		},
		moreBtn(path) {
			this.$router.push({path: '/index/' + path});
		}
    }
  }
</script>

<style rel="stylesheet/scss" lang="scss" scoped>
	.home-preview {
	
		.recommend {
			.list3 .swiper-button-prev {
				left: 10px;
				right: auto;
			}
			
			.list3 .swiper-button-prev::after {
				color: rgb(64, 158, 255);
			}
			
			.list3 .swiper-button-next {
				left: auto;
				right: 10px;
			}
			
			.list3 .swiper-button-next::after {
				color: rgb(64, 158, 255);
			}
			
			.list5 .swiper-button-prev {
				left: 10px;
				right: auto;
			}
			
			.list5 .swiper-button-prev::after {
				color: rgb(64, 158, 255);
				
        }
        
        .list5 .swiper-button-next {
				left: auto;
				right: 10px;
			}
			
			.list5 .swiper-button-next::after {
				color: rgb(64, 158, 255);
			}
			
			.list5 {
				.swiper-slide-prev {
					position: relative;
					z-index: 3;
				}
		
				.swiper-slide-next {
					position: relative;
					z-index: 3;
				}
		
				.swiper-slide-active {
					position: relative;
					z-index: 5;
				}
			}
			
			.index-pv1 .animation-box {
				transform: rotate(0deg) scale(1) skew(0deg, 0deg) translate3d(0px, 0px, 0px);
				z-index: initial;
			}
			
			.index-pv1 .animation-box:hover {
				transform: scale(1.02) skew(0deg, 0deg) translate3d(0px, 0px, 0px);
				-webkit-perspective: 1000px;
				perspective: 1000px;
				transition: 0.3s;
				z-index: 1;
			}
			
			.index-pv1 .animation-box img {
				transform: rotate(0deg) scale(1) skew(0deg, 0deg) translate3d(0px, 0px, 0px);
			}
			
			.index-pv1 .animation-box img:hover {
				transform: skew(0deg, 0deg) translate3d(0px, 0px, 0px);
				-webkit-perspective: 1000px;
				perspective: 1000px;
				transition: 0.3s;
			}
		}
		
		.news {
			.list3 .swiper-button-prev {
				left: 10px;
				right: auto;
			}
			
			.list3 .swiper-button-prev::after {
				color: rgb(64, 158, 255);
			}
			
			.list3 .swiper-button-next {
				left: auto;
				right: 10px;
			}
			
			.list3 .swiper-button-next::after {
				color: rgb(64, 158, 255);
			}
			
			.list6 .swiper-button-prev {
				left: 10px;
				right: auto;
			}
			
			.list6 .swiper-button-prev::after {
				color: rgb(64, 158, 255);
			}
			
			.list6 .swiper-button-next {
				left: auto;
				right: 10px;
			}
			
			.list6 .swiper-button-next::after {
				color: rgb(64, 158, 255);
			}
			
			.index-pv1 .animation-box {
				transform: rotate(0deg) scale(1) skew(0deg, 0deg) translate3d(0px, 0px, 0px);
				z-index: initial;
			}
			
			.index-pv1 .animation-box:hover {
				transform: scale(1) skew(0deg, 0deg) translate3d(0px, 0px, 0px);
				-webkit-perspective: 1000px;
				perspective: 1000px;
				transition: 0.3s;
				z-index: 1;
			}
			
			.index-pv1 .animation-box img {
				transform: rotate(0deg) scale(1) skew(0deg, 0deg) translate3d(0px, 0px, 0px);
			}
			
			.index-pv1 .animation-box img:hover {
				transform: scale(0.9) skew(0deg, 0deg) translate3d(0px, 0px, 0px);
				-webkit-perspective: 1000px;
				perspective: 1000px;
				transition: 0.3s;
			}
		}
	
		.lists {
			.list3 .swiper-button-prev {
				left: 10px;
				right: auto;
			}
			
			.list3 .swiper-button-prev::after {
				color: rgb(64, 158, 255);
			}
			
			.list3 .swiper-button-next {
				left: auto;
				right: 10px;
        }
        
        .list3 .swiper-button-next::after {
				color: rgb(64, 158, 255);
			}
			
			.list5 .swiper-button-prev {
				left: 10px;
				right: auto;
			}
			
			.list5 .swiper-button-prev::after {
				color: rgb(64, 158, 255);
			}
			
			.list5 .swiper-button-next {
            left: auto;
            right: 10px;
			}
			
			.list5 .swiper-button-next::after {
				color: rgb(64, 158, 255);
			}
			
			.list5 {
				.swiper-slide-prev {
					position: relative;
					z-index: 3;
				}
		
				.swiper-slide-next {
					position: relative;
					z-index: 3;
				}
		
				.swiper-slide-active {
					position: relative;
					z-index: 5;
				}
			}
			
			.index-pv1 .animation-box {
				transform: rotate(0deg) scale(1) skew(0deg, 0deg) translate3d(0px, 0px, 0px);
				z-index: initial;
			}
			
			.index-pv1 .animation-box:hover {
				transform: scale(1) skew(0deg, 0deg) translate3d(0px, -30px, 0px);
				-webkit-perspective: 1000px;
				perspective: 1000px;
				transition: 0.3s;
				z-index: 1;
			}
			
			.index-pv1 .animation-box img {
				transform: rotate(0deg) scale(1) skew(0deg, 0deg) translate3d(0px, 0px, 0px);
			}
			
			.index-pv1 .animation-box img:hover {
				transform: skew(0deg, 0deg) translate3d(0px, 0px, 0px);
				-webkit-perspective: 1000px;
				perspective: 1000px;
				transition: 0.3s;
			}
		}
	}
</style>
