import Vue from 'vue';
//配置路由
import VueRouter from 'vue-router'
Vue.use(VueRouter);
//1.创建组件
import Index from '@/views/index'
import Home from '@/views/home'
import Login from '@/views/login'
import NotFound from '@/views/404'
import UpdatePassword from '@/views/update-password'
import pay from '@/views/pay'
import register from '@/views/register'
import center from '@/views/center'
    import news from '@/views/modules/news/list'
    import discusszixishi from '@/views/modules/discusszixishi/list'
    import zixishi from '@/views/modules/zixishi/list'
    import zhuowei from '@/views/modules/zhuowei/list'
    import yonghu from '@/views/modules/yonghu/list'
    import jifei from '@/views/modules/jifei/list'
    import chat from '@/views/modules/chat/list'
    import orders from '@/views/modules/orders/list'
    import config from '@/views/modules/config/list'
    import messages from '@/views/modules/messages/list'
    import fangyuanpinzu from '@/views/modules/fangyuanpinzu/list'
    import jiankong from '@/views/modules/jiankong/list'
    import fangwuleixing from '@/views/modules/fangwuleixing/list'
//2.配置路由   注意：名字
const routes = [{
    path: '/index',
    name: '首页',
    component: Index,
    children: [{
      // 这里不设置值，是把main作为默认页面
      path: '/',
      name: '首页',
      component: Home,
      meta: {icon:'', title:'center'}
    }, {
      path: '/updatePassword',
      name: '修改密码',
      component: UpdatePassword,
      meta: {icon:'', title:'updatePassword'}
    }
     
    , {
      path: '/pay',
      name: '支付',
      component: pay,
      meta: {icon:'', title:'pay'}
    }, {
      path: '/center',
      name: '个人信息',
      component: center,
      meta: {icon:'', title:'center'}
    }
      ,{
	path: '/news',
        name: '公告',
        component: news
      }
      ,{
	path: '/discusszixishi',
        name: '自习室评论',
        component: discusszixishi
      }
      ,{
        path: '/jifei',
              name: '计费',
              component: jifei
            }
      ,{
	path: '/zixishi',
        name: '自习室',
        component: zixishi
      }
      ,{
        path: '/zhuowei',
              name: '座位',
              component: zhuowei
            }
      ,{
	path: '/yonghu',
        name: '用户',
        component: yonghu
      }
      ,{
        path: '/fangwuleixing',
        name: '租金分类',
        component: fangwuleixing
      }
      ,{
        path: '/jiankong',
        name: '实时监控',
        component: jiankong
      }
      ,{
        path: '/fangyuanpinzu',
        name: '租金',
        component: fangyuanpinzu
      }
      ,{
        path: '/messages',
        name: '留言反馈',
        component: messages
      }
      ,{
	path: '/chat',
        name: '咨询',
        component: chat
      }
      ,{
        path: '/orders/:status',
        name: '订单管理',
        component: orders
      }
      ,{
	path: '/config',
        name: '轮播图管理',
        component: config
      }
    ]
  },
  {
    path: '/login',
    name: 'login',
    component: Login,
    meta: {icon:'', title:'login'}
  },
  {
    path: '/register',
    name: 'register',
    component: register,
    meta: {icon:'', title:'register'}
  },
  {
    path: '/',
    name: '首页',
    redirect: '/index'
  }, /*默认跳转路由*/
  {
    path: '*',
    component: NotFound
  }
]
//3.实例化VueRouter  注意：名字
const router = new VueRouter({
  mode: 'hash',
  /*hash模式改为history*/
  routes // （缩写）相当于 routes: routes
})
const originalPush = VueRouter.prototype.push
//修改原型对象中的push方法
VueRouter.prototype.push = function push(location) {
   return originalPush.call(this, location).catch(err => err)
}
export default router;
