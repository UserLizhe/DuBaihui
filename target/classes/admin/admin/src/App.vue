<template>
	<div id="app" class="">
	  <router-view></router-view>
	</div>
  </template>
  
  <script>
  export default {
	name: "app",
  };
  </script>
  
  <style lang="scss">
  *{
	padding: 0;
	margin:0;
	box-sizing: border-box;
  }
  html,body{
	width: 100%;
	height: 100%;
  }
  #app{
	height:100%;
  }
  body {
	padding: 0;
	margin: 0;
	
  }
.navbar,.menu-preview{
	background: #f8f6f0 !important;
}
.el-scrollbar{
	width: 200px !important;
}
  </style>
  