	import {
		createRouter,
		createWebHashHistory
	} from 'vue-router'
	import news from '@/views/news/list'
	import aboutus from '@/views/aboutus/list'
	import guzhangleixing from '@/views/guzhangleixing/list'
	import weixiufenpei from '@/views/weixiufenpei/list'
	import weixiuxinxi from '@/views/weixiuxinxi/list'
	import storeup from '@/views/storeup/list'
	import users from '@/views/users/list'
	import weixiuyuan from '@/views/weixiuyuan/list'
	import quxiaoyuyue from '@/views/quxiaoyuyue/list'
	import chathelper from '@/views/chathelper/list'
	import yonghu from '@/views/yonghu/list'
	import chat from '@/views/chat/list'
	import systemNotice from '@/views/systemNotice/list'
	import weixiuyuyue from '@/views/weixiuyuyue/list'
	import shoufeibiaozhun from '@/views/shoufeibiaozhun/list'
	import cheliangxinxi from '@/views/cheliangxinxi/list'
	import config from '@/views/config/list'
	import weixiupingjia from '@/views/weixiupingjia/list'
	import usersCenter from '@/views/users/center'
	import weixiuyuanRegister from '@/views/weixiuyuan/register'
	import weixiuyuanCenter from '@/views/weixiuyuan/center'
	import peijian from '@/views/peijian/list.vue'

export const routes = [{
		path: '/login',
		name: 'login',
		component: () => import('../views/login.vue')
	},{
		path: '/',
		name: '首页',
		component: () => import('../views/index'),
		children: [{
			path: '/',
			name: '首页1',
			component: () => import('../views/HomeView.vue'),
			meta: {
				affix: true
			}
		}, {
			path: '/updatepassword',
			name: '修改密码',
			component: () => import('../views/updatepassword.vue')
		},
		{
        path: '/peijian', 
        name: '配件管理',
        component: peijian
        }
		,{
			path: '/usersCenter',
			name: '管理员个人中心',
			component: usersCenter
		}
		,{
			path: '/weixiuyuanCenter',
			name: '维修员个人中心',
			component: weixiuyuanCenter
		}
		,{
			path: '/news',
			name: '汽车资讯',
			component: news
		}
		,{
			path: '/aboutus',
			name: '发展历程',
			component: aboutus
		}
		,{
			path: '/guzhangleixing',
			name: '故障类型',
			component: guzhangleixing
		}
		,{
			path: '/weixiufenpei',
			name: '维修分配',
			component: weixiufenpei
		}
		,{
			path: '/weixiuxinxi',
			name: '维修信息',
			component: weixiuxinxi
		}
		,{
			path: '/storeup',
			name: '我的收藏',
			component: storeup
		}
		,{
			path: '/users',
			name: '管理员',
			component: users
		}
		,{
			path: '/weixiuyuan',
			name: '维修员',
			component: weixiuyuan
		}
		,{
			path: '/quxiaoyuyue',
			name: '取消预约',
			component: quxiaoyuyue
		}
		,{
			path: '/chathelper',
			name: '聊天助手',
			component: chathelper
		}
		,{
			path: '/yonghu',
			name: '用户',
			component: yonghu
		}
		,{
			path: '/chat',
			name: '客服聊天',
			component: chat
		}
		,{
			path: '/systemNotice',
			name: '系统公告',
			component: systemNotice
		}
		,{
			path: '/weixiuyuyue',
			name: '维修预约',
			component: weixiuyuyue
		}
		,{
			path: '/shoufeibiaozhun',
			name: '收费标准',
			component: shoufeibiaozhun
		}
		,{
			path: '/cheliangxinxi',
			name: '车辆信息',
			component: cheliangxinxi
		}
		,{
			path: '/config',
			name: '轮播图',
			component: config
		}
		,{
			path: '/weixiupingjia',
			name: '维修评价',
			component: weixiupingjia
		}
		]
	},
	{
		path: '/weixiuyuanRegister',
		name: '维修员注册',
		component: weixiuyuanRegister
	},
]

const router = createRouter({
	history: createWebHashHistory(process.env.BASE_URL),
	routes
})

export default router
