const config = {
    get() {
        return {
            url : process.env.VUE_APP_BASE_API_URL + process.env.VUE_APP_BASE_API + '/',
            name: process.env.VUE_APP_BASE_API,
			menuList:[
				{
					name: '收费标准管理',
					icon: '',
					child:[

						{
							name:'收费标准',
							url:'/index/shoufeibiaozhunList'
						},
					]
				},
				{
					name: '新闻资讯管理',
					icon: '',
					child:[

						{
							name:'汽车资讯',
							url:'/index/newsList'
						},
					]
				},
			]
        }
    },
    getProjectName(){
        return {
            projectName: "新能源车辆维修管理系统"
        } 
    }
}
export default config
