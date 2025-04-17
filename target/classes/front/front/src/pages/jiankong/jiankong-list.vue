<template>
<div>
	<div :style='{"padding":"20px","margin":"10px auto","borderColor":"#99DFE5","borderRadius":"0","background":"linear-gradient(270deg, rgba(119,217,221,0) 0%, #77D9DD 47%, rgba(149,221,226,0) 100%)","borderWidth":"0 4px","width":"1200px","borderStyle":"solid"}' class="breadcrumb-preview">
		<el-breadcrumb :separator="'Ξ'" :style='{"fontSize":"14px","lineHeight":"1"}'>
			<el-breadcrumb-item>首页</el-breadcrumb-item>
			<el-breadcrumb-item v-for="(item, index) in breadcrumbItem" :key="index">{{item.name}}</el-breadcrumb-item>
		</el-breadcrumb>
	</div>
	<div :style='{"padding":"20px","margin":"10px auto","borderColor":"#99DFE5","borderRadius":"0","background":"linear-gradient(270deg, rgba(119,217,221,0) 0%, #77D9DD 47%, rgba(149,221,226,0) 100%)","borderWidth":"0 4px","width":"1200px","borderStyle":"solid"}' class="breadcrumb-preview">
        <el-form :inline="true" :model="formSearch" class="list-form-pv" style="justify-content: center;display: flex;">
            <div class="section-btn">
                <el-form-item>
                  <el-input v-model="title" placeholder="标题"></el-input>
                </el-form-item>
              <el-button type="primary" @click="getJiankongList(1)"><i class="el-icon-search"></i>查询</el-button>
            </div>
        </el-form>
	</div>
	
	<div class="jiankong-preview" :style='{"width":"1200px","margin":"10px auto","position":"relative","background":"transparent"}'>
				
				
				
				
				
				<!-- 样式六 -->
		<div class="list6 index-pv1" :style='{"padding":"0 10px","boxShadow":"0px 4px 10px 0px rgba(0,0,0,0.302)","alignItems":"flex-start","flexWrap":"wrap","background":"linear-gradient(180deg, #FFFFFF 0%, rgba(73,214,205,0.4) 100%)","display":"flex","width":"100%","height":"auto"}'>
			<div :style='{"margin":"10px auto","borderColor":"#000","background":"transparent","borderWidth":"4px 0","display":"flex","width":"49%","borderStyle":"solid","height":"auto"}' v-for="item in jiankongList" :key="item.id" @click="toJiankongDetail(item)" class="list-item animation-box">
				<el-image :style='{"width":"150px","margin":"20px 0 20px 20px","objectFit":"cover","borderRadius":"15px","height":"140px"}' :src="baseUrl + item.picture" :fit="fill"></el-image>
				<div class="item-info" :style='{"width":"860px","padding":"10px","margin":"10px 0","position":"relative","display":"inline-block","height":"auto"}'>
					<div :style='{"overflow":"hidden","color":"#000","display":"-webkit-box","lineHeight":"1.5","fontSize":"14px","-webkit-box-orient":"vertical","-webkit-line-clamp":"2","fontWeight":"bold"}' class="title ">{{item.title}}</div>
					<div :style='{"padding":"10px 0 0","overflow":"hidden","color":"#9E9E9E","display":"-webkit-box","lineHeight":"21px","fontSize":"14px","-webkit-box-orient":"vertical","-webkit-line-clamp":"2"}' class="introduction ">{{item.introduction}}</div>
					<div :style='{"padding":"0 20px","color":"#fff","bottom":"-10px","background":"#000","lineHeight":"32px","fontSize":"12px","position":"absolute","right":"10px"}' class="time ">{{item.addtime}}</div>
					<div :style='{"padding":"","fontSize":"0","lineHeight":"32px","color":"#fff","background":"#333","display":"inline-block"}' class="tags"></div>
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
		  :layout='["pager"].join()'
		  :total="total"
		  :style='{"padding":"0","margin":"10px auto","whiteSpace":"nowrap","color":"#333","textAlign":"center","width":"1200px","fontWeight":"500"}'
		  @current-change="curChange"
		  @prev-click="prevClick"
		  @next-click="nextClick"
		></el-pagination>
	</div>
</div>
</template>

<script>
  export default {
    //数据集合
    data() {
      return {
        baseUrl: this.$config.baseUrl,
        breadcrumbItem: [
          {
            name: '实时监控'
          }
        ],
        jiankongList: [],
        total: 1,
        pageSize: 10,pageSizes: [10,20,30,50],
        totalPage: 1,
		layouts: '',
        title: '',
      }
    },
    created() {
		this.getJiankongList(1);
    },
    //方法集合
    methods: {
      getJiankongList(page) {
        let params = {page, limit: this.pageSize};
        let searchWhere = {};
        if(this.title != '') searchWhere.title = '%' + this.title + '%';
        this.$http.get('jiankong/list', {params: Object.assign(params, searchWhere)}).then(res => {
          if (res.data.code == 0) {
            this.jiankongList = res.data.data.list;
            this.total = res.data.data.total;
            this.pageSize = res.data.data.pageSize;this.pageSizes = [this.pageSize, this.pageSize*2, this.pageSize*3, this.pageSize*5];
            this.totalPage = res.data.data.totalPage;
          }
        });
      },
      curChange(page) {
        this.getJiankongList(page);
      },
      prevClick(page) {
        this.getJiankongList(page);
      },
      nextClick(page) {
        this.getJiankongList(page);
      },
      toJiankongDetail(item) {
        this.$router.push({path: '/index/jiankongDetail', query: {detailObj: JSON.stringify(item)}});
      }
    }
  }
</script>

<style rel="stylesheet/scss" lang="scss" scoped>
	.jiankong-wrap {
	  width: 1000px;
	  margin: 0 auto;
	}
	.jiankong-item {
	  height: 200px;
	  width: auto;
	  margin-bottom: 30px;
	  cursor: pointer;
	}
	.jiankong-item-text {
	  width: calc(100% - 215px);
	  display: inline-block;
	  vertical-align: top;
	  margin-left: 15px;
	}
	.jiankong-item-text-title {
	  font-size: 16px;
	  margin-bottom: 15px;
	}
	.jiankong-item-text-intro {
	  font-size: 14px;
	  color: #666;
	}
	
	.hide1 {
		text-overflow: ellipsis;
		display: -webkit-box;
		-webkit-line-clamp: 1;
		-webkit-box-orient: vertical;
		overflow:hidden;
		text-overflow:ellipsis;
	}
	.hide2 {
		text-overflow: ellipsis;
		display: -webkit-box;
		-webkit-line-clamp: 2;
		-webkit-box-orient: vertical;
		overflow:hidden;
		text-overflow:ellipsis;
	}
	.hide3 {
		text-overflow: ellipsis;
		display: -webkit-box;
		-webkit-line-clamp: 3;
		-webkit-box-orient: vertical;
		overflow:hidden;
		text-overflow:ellipsis;
	}
	
	.index-pv1 .animation-box {
		transform: rotate(0deg) scale(1) skew(0deg, 0deg) translate3d(0px, 0px, 0px);
		z-index: initial;
	}
	
	.index-pv1 .animation-box:hover {
				transform: rotate(0deg) scale(1.2) skew(10deg, 0deg) translate3d(30px, 30px, 30px);
				-webkit-perspective: 1000px;
				perspective: 1000px;
				transition: 0.3s;
				z-index: 1;
	}
	
	.index-pv1 .animation-box img {
		transform: rotate(0deg) scale(1) skew(0deg, 0deg) translate3d(0px, 0px, 0px);
	}
	
	.index-pv1 .animation-box img:hover {
				transform: rotate(0deg) scale(0.8) skew(-10deg, 0deg) translate3d(-30px, -30px, -30px);
				-webkit-perspective: 1000px;
				perspective: 1000px;
				transition: 0.3s;
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
				border-radius: 48px;
				box-shadow: 0 4px 0 #000;
				background: #E2F0F0;
				text-align: center;
				min-width: 40px;
				height: 28px;
			}
	
	.el-pagination /deep/ .el-pager .number:hover {
				cursor: pointer;
				padding: 0 4px;
				margin: 0 5px;
				color: #fff;
				display: inline-block;
				vertical-align: top;
				font-size: 13px;
				line-height: 28px;
				border-radius: 48px;
				box-shadow: 0 4px 0 #000;
				background: #87D0D0;
				text-align: center;
				min-width: 40px;
				height: 28px;
			}
	
	.el-pagination /deep/ .el-pager .number.active {
				cursor: default;
				padding: 0 10px;
				margin: 0 5px;
				color: #FFF;
				display: inline-block;
				vertical-align: top;
				font-size: 13px;
				line-height: 28px;
				border-radius: 48px;
				box-shadow: 0 4px 0 #000;
				background: #87D0D0;
				text-align: center;
				min-width: 40px;
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
</style>
