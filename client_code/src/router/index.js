import { createRouter, createWebHashHistory } from 'vue-router'
import index from '../views'
import home from '../views/pages/home.vue'
import login from '../views/pages/login.vue'
import yonghuList from '@/views/pages/yonghu/list'
import yonghuDetail from '@/views/pages/yonghu/formModel'
import yonghuAdd from '@/views/pages/yonghu/formAdd'
import yonghuRegister from '@/views/pages/yonghu/register'
import yonghuCenter from '@/views/pages/yonghu/center'
import cheliangxinxiList from '@/views/pages/cheliangxinxi/list'
import cheliangxinxiDetail from '@/views/pages/cheliangxinxi/formModel'
import cheliangxinxiAdd from '@/views/pages/cheliangxinxi/formAdd'
import weixiuyuyueList from '@/views/pages/weixiuyuyue/list'
import weixiuyuyueDetail from '@/views/pages/weixiuyuyue/formModel'
import weixiuyuyueAdd from '@/views/pages/weixiuyuyue/formAdd'
import weixiuxinxiList from '@/views/pages/weixiuxinxi/list'
import weixiuxinxiDetail from '@/views/pages/weixiuxinxi/formModel'
import weixiuxinxiAdd from '@/views/pages/weixiuxinxi/formAdd'
import guzhangleixingList from '@/views/pages/guzhangleixing/list'
import guzhangleixingDetail from '@/views/pages/guzhangleixing/formModel'
import guzhangleixingAdd from '@/views/pages/guzhangleixing/formAdd'
import weixiuyuanList from '@/views/pages/weixiuyuan/list'
import weixiuyuanDetail from '@/views/pages/weixiuyuan/formModel'
import weixiuyuanAdd from '@/views/pages/weixiuyuan/formAdd'
import weixiupingjiaList from '@/views/pages/weixiupingjia/list'
import weixiupingjiaDetail from '@/views/pages/weixiupingjia/formModel'
import weixiupingjiaAdd from '@/views/pages/weixiupingjia/formAdd'
import systemNoticeList from '@/views/pages/systemNotice/list'
import systemNoticeDetail from '@/views/pages/systemNotice/formModel'
import systemNoticeAdd from '@/views/pages/systemNotice/formAdd'
import quxiaoyuyueList from '@/views/pages/quxiaoyuyue/list'
import quxiaoyuyueDetail from '@/views/pages/quxiaoyuyue/formModel'
import quxiaoyuyueAdd from '@/views/pages/quxiaoyuyue/formAdd'
import weixiufenpeiList from '@/views/pages/weixiufenpei/list'
import weixiufenpeiDetail from '@/views/pages/weixiufenpei/formModel'
import weixiufenpeiAdd from '@/views/pages/weixiufenpei/formAdd'
import newsList from '@/views/pages/news/list'
import chathelperList from '@/views/pages/chathelper/list'
import chathelperDetail from '@/views/pages/chathelper/formModel'
import chathelperAdd from '@/views/pages/chathelper/formAdd'
import aboutusList from '@/views/pages/aboutus/list'
import aboutusDetail from '@/views/pages/aboutus/formModel'
import aboutusAdd from '@/views/pages/aboutus/formAdd'
import shoufeibiaozhunList from '@/views/pages/shoufeibiaozhun/list'
import shoufeibiaozhunDetail from '@/views/pages/shoufeibiaozhun/formModel'
import shoufeibiaozhunAdd from '@/views/pages/shoufeibiaozhun/formAdd'
import storeupList from '@/views/pages/storeup/list'

const routes = [{
		path: '/',
		redirect: '/index/home'
	},
	{
		path: '/index',
		component: index,
		children: [{
			path: 'home',
			component: home
		}
		, {
			path: 'yonghuList',
			component: yonghuList
		}, {
			path: 'yonghuDetail',
			component: yonghuDetail
		}, {
			path: 'yonghuAdd',
			component: yonghuAdd
		}
		, {
			path: 'yonghuCenter',
			component: yonghuCenter
		}
		, {
			path: 'cheliangxinxiList',
			component: cheliangxinxiList
		}, {
			path: 'cheliangxinxiDetail',
			component: cheliangxinxiDetail
		}, {
			path: 'cheliangxinxiAdd',
			component: cheliangxinxiAdd
		}
		, {
			path: 'weixiuyuyueList',
			component: weixiuyuyueList
		}, {
			path: 'weixiuyuyueDetail',
			component: weixiuyuyueDetail
		}, {
			path: 'weixiuyuyueAdd',
			component: weixiuyuyueAdd
		}
		, {
			path: 'weixiuxinxiList',
			component: weixiuxinxiList
		}, {
			path: 'weixiuxinxiDetail',
			component: weixiuxinxiDetail
		}, {
			path: 'weixiuxinxiAdd',
			component: weixiuxinxiAdd
		}
		, {
			path: 'guzhangleixingList',
			component: guzhangleixingList
		}, {
			path: 'guzhangleixingDetail',
			component: guzhangleixingDetail
		}, {
			path: 'guzhangleixingAdd',
			component: guzhangleixingAdd
		}
		, {
			path: 'weixiuyuanList',
			component: weixiuyuanList
		}, {
			path: 'weixiuyuanDetail',
			component: weixiuyuanDetail
		}, {
			path: 'weixiuyuanAdd',
			component: weixiuyuanAdd
		}
		, {
			path: 'weixiupingjiaList',
			component: weixiupingjiaList
		}, {
			path: 'weixiupingjiaDetail',
			component: weixiupingjiaDetail
		}, {
			path: 'weixiupingjiaAdd',
			component: weixiupingjiaAdd
		}
		, {
			path: 'systemNoticeList',
			component: systemNoticeList
		}, {
			path: 'systemNoticeDetail',
			component: systemNoticeDetail
		}, {
			path: 'systemNoticeAdd',
			component: systemNoticeAdd
		}
		, {
			path: 'quxiaoyuyueList',
			component: quxiaoyuyueList
		}, {
			path: 'quxiaoyuyueDetail',
			component: quxiaoyuyueDetail
		}, {
			path: 'quxiaoyuyueAdd',
			component: quxiaoyuyueAdd
		}
		, {
			path: 'weixiufenpeiList',
			component: weixiufenpeiList
		}, {
			path: 'weixiufenpeiDetail',
			component: weixiufenpeiDetail
		}, {
			path: 'weixiufenpeiAdd',
			component: weixiufenpeiAdd
		}
		, {
			path: 'newsList',
			component: newsList
		}
		, {
			path: 'chathelperList',
			component: chathelperList
		}, {
			path: 'chathelperDetail',
			component: chathelperDetail
		}, {
			path: 'chathelperAdd',
			component: chathelperAdd
		}
		, {
			path: 'aboutusList',
			component: aboutusList
		}, {
			path: 'aboutusDetail',
			component: aboutusDetail
		}, {
			path: 'aboutusAdd',
			component: aboutusAdd
		}
		, {
			path: 'shoufeibiaozhunList',
			component: shoufeibiaozhunList
		}, {
			path: 'shoufeibiaozhunDetail',
			component: shoufeibiaozhunDetail
		}, {
			path: 'shoufeibiaozhunAdd',
			component: shoufeibiaozhunAdd
		}
        , {
            path: 'storeupList',
            component: storeupList
        }
		]
	},
	{
		path: '/login',
		component: login
	}
	,{
		path: '/yonghuRegister',
		component: yonghuRegister
	}
]

const router = createRouter({
  history: createWebHashHistory(process.env.BASE_URL),
  routes
})

export default router
