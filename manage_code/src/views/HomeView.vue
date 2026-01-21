<template>
	<div class="home_view">
		<div class="projectTitle">欢迎使用 {{projectName}}</div>
		<div class="count_list">
			<el-collapse-transition v-if="btnAuth('weixiuyuyue','首页总数')">
				<el-card v-show="countTypeList.closeweixiuyuyueCountType" class="card_view count-item">
					<template #header>
						<div class="index_card_head">
							<div class="card_head_title">
								维修预约
							</div>
							<div class="card_head_right">
								<el-icon @click="countTypeClick('hiddenweixiuyuyueCountType')" class="showIcons"
									:class="countTypeList.hiddenweixiuyuyueCountType?'showIcons1':''">
									<ArrowUpBold />
								</el-icon>
								<el-icon @click="countTypeClick('closeweixiuyuyueCountType')" class="closeIcons">
									<CloseBold />
								</el-icon>
							</div>
						</div>
					</template>
					<el-collapse-transition>
						<div class="count_item" v-show="countTypeList.hiddenweixiuyuyueCountType">
							<div class="count_title">维修预约总数</div>
							<div class="count_num">{{weixiuyuyueCount}}</div>
						</div>
					</el-collapse-transition>
				</el-card>
			</el-collapse-transition>
			<el-collapse-transition v-if="btnAuth('weixiuxinxi','首页总数')">
				<el-card v-show="countTypeList.closeweixiuxinxiCountType" class="card_view count-item">
					<template #header>
						<div class="index_card_head">
							<div class="card_head_title">
								维修信息
							</div>
							<div class="card_head_right">
								<el-icon @click="countTypeClick('hiddenweixiuxinxiCountType')" class="showIcons"
									:class="countTypeList.hiddenweixiuxinxiCountType?'showIcons1':''">
									<ArrowUpBold />
								</el-icon>
								<el-icon @click="countTypeClick('closeweixiuxinxiCountType')" class="closeIcons">
									<CloseBold />
								</el-icon>
							</div>
						</div>
					</template>
					<el-collapse-transition>
						<div class="count_item" v-show="countTypeList.hiddenweixiuxinxiCountType">
							<div class="count_title">维修信息总数</div>
							<div class="count_num">{{weixiuxinxiCount}}</div>
						</div>
					</el-collapse-transition>
				</el-card>
			</el-collapse-transition>
			<el-collapse-transition v-if="btnAuth('weixiupingjia','首页总数')">
				<el-card v-show="countTypeList.closeweixiupingjiaCountType" class="card_view count-item">
					<template #header>
						<div class="index_card_head">
							<div class="card_head_title">
								维修评价
							</div>
							<div class="card_head_right">
								<el-icon @click="countTypeClick('hiddenweixiupingjiaCountType')" class="showIcons"
									:class="countTypeList.hiddenweixiupingjiaCountType?'showIcons1':''">
									<ArrowUpBold />
								</el-icon>
								<el-icon @click="countTypeClick('closeweixiupingjiaCountType')" class="closeIcons">
									<CloseBold />
								</el-icon>
							</div>
						</div>
					</template>
					<el-collapse-transition>
						<div class="count_item" v-show="countTypeList.hiddenweixiupingjiaCountType">
							<div class="count_title">维修评价总数</div>
							<div class="count_num">{{weixiupingjiaCount}}</div>
						</div>
					</el-collapse-transition>
				</el-card>
			</el-collapse-transition>
		</div>
		<div class="card_list">
			<el-collapse-transition v-if="btnAuth('weixiuyuyue','首页统计')">
				<el-card v-show="cardTypeList.closeweixiuyuyueChartType1" class="card_view chart-item">
					<template #header>
						<div class="index_card_head">
							<div class="card_head_title">
								维修预约
							</div>
							<div class="card_head_right">
								<el-icon @click="cardTypeClick('hiddenweixiuyuyueChartType1')" class="showIcons"
										 :class="cardTypeList.hiddenweixiuyuyueChartType1?'showIcons1':''">
									<ArrowUpBold />
								</el-icon>
								<el-icon @click="cardTypeClick('closeweixiuyuyueChartType1')" class="closeIcons">
									<CloseBold />
								</el-icon>
							</div>
						</div>
					</template>
					<el-collapse-transition>
						<div class="card_item" v-show="cardTypeList.hiddenweixiuyuyueChartType1">
							<div id="weixiuyuyueyuyuecishuEchart1" class="Echart" style="width: 100%;height: 400px;"></div>
						</div>
					</el-collapse-transition>
				</el-card>
			</el-collapse-transition>
			<el-collapse-transition v-if="btnAuth('weixiuxinxi','首页统计')">
				<el-card v-show="cardTypeList.closeweixiuxinxiChartType1" class="card_view chart-item">
					<template #header>
						<div class="index_card_head">
							<div class="card_head_title">
								维修信息
							</div>
							<div class="card_head_right">
								<el-icon @click="cardTypeClick('hiddenweixiuxinxiChartType1')" class="showIcons"
										 :class="cardTypeList.hiddenweixiuxinxiChartType1?'showIcons1':''">
									<ArrowUpBold />
								</el-icon>
								<el-icon @click="cardTypeClick('closeweixiuxinxiChartType1')" class="closeIcons">
									<CloseBold />
								</el-icon>
							</div>
						</div>
					</template>
					<el-collapse-transition>
						<div class="card_item" v-show="cardTypeList.hiddenweixiuxinxiChartType1">
							<div id="weixiuxinxiweixiufeiyongEchart1" class="Echart" style="width: 100%;height: 400px;"></div>
						</div>
					</el-collapse-transition>
				</el-card>
			</el-collapse-transition>
			<el-collapse-transition v-if="btnAuth('weixiuxinxi','首页统计')">
				<el-card v-show="cardTypeList.closeweixiuxinxiChartType2" class="card_view chart-item">
					<template #header>
						<div class="index_card_head">
							<div class="card_head_title">
								维修信息
							</div>
							<div class="card_head_right">
								<el-icon @click="cardTypeClick('hiddenweixiuxinxiChartType2')" class="showIcons"
										 :class="cardTypeList.hiddenweixiuxinxiChartType2?'showIcons2':''">
									<ArrowUpBold />
								</el-icon>
								<el-icon @click="cardTypeClick('closeweixiuxinxiChartType2')" class="closeIcons">
									<CloseBold />
								</el-icon>
							</div>
						</div>
					</template>
					<el-collapse-transition>
						<div class="card_item" v-show="cardTypeList.hiddenweixiuxinxiChartType2">
							<div id="weixiuxinxiweixiucishuEchart2" class="Echart" style="width: 100%;height: 400px;"></div>
						</div>
					</el-collapse-transition>
				</el-card>
			</el-collapse-transition>
			<el-collapse-transition v-if="btnAuth('weixiupingjia','首页统计')">
				<el-card v-show="cardTypeList.closeweixiupingjiaChartType1" class="card_view chart-item">
					<template #header>
						<div class="index_card_head">
							<div class="card_head_title">
								维修评价
							</div>
							<div class="card_head_right">
								<el-icon @click="cardTypeClick('hiddenweixiupingjiaChartType1')" class="showIcons"
										 :class="cardTypeList.hiddenweixiupingjiaChartType1?'showIcons1':''">
									<ArrowUpBold />
								</el-icon>
								<el-icon @click="cardTypeClick('closeweixiupingjiaChartType1')" class="closeIcons">
									<CloseBold />
								</el-icon>
							</div>
						</div>
					</template>
					<el-collapse-transition>
						<div class="card_item" v-show="cardTypeList.hiddenweixiupingjiaChartType1">
							<div id="weixiupingjiapingfenEchart1" class="Echart" style="width: 100%;height: 400px;"></div>
						</div>
					</el-collapse-transition>
				</el-card>
			</el-collapse-transition>
		</div>
	</div>
</template>

<script setup>
	import {
		inject,
		nextTick,
		ref,
		getCurrentInstance
	} from 'vue';
	const context = getCurrentInstance()?.appContext.config.globalProperties;
	const projectName = context.$project.projectName
	const countTypeList = ref({
	})
	const getCountList=()=>{
		countTypeList.value.closeweixiuyuyueCountType = true
		countTypeList.value.hiddenweixiuyuyueCountType = true
		if(btnAuth('weixiuyuyue','首页总数')){
			getweixiuyuyueCount()
		}
		countTypeList.value.closeweixiuxinxiCountType = true
		countTypeList.value.hiddenweixiuxinxiCountType = true
		if(btnAuth('weixiuxinxi','首页总数')){
			getweixiuxinxiCount()
		}
		countTypeList.value.closeweixiupingjiaCountType = true
		countTypeList.value.hiddenweixiupingjiaCountType = true
		if(btnAuth('weixiupingjia','首页总数')){
			getweixiupingjiaCount()
		}
	}
	const weixiuyuyueCount = ref(0)
	const getweixiuyuyueCount = () => {
		context?.$http({
			url:'weixiuyuyue/count',
			method: 'get'
		}).then(res=>{
			weixiuyuyueCount.value = res.data.data
		})
	}
	const weixiuxinxiCount = ref(0)
	const getweixiuxinxiCount = () => {
		context?.$http({
			url:'weixiuxinxi/count',
			method: 'get'
		}).then(res=>{
			weixiuxinxiCount.value = res.data.data
		})
	}
	const weixiupingjiaCount = ref(0)
	const getweixiupingjiaCount = () => {
		context?.$http({
			url:'weixiupingjia/count',
			method: 'get'
		}).then(res=>{
			weixiupingjiaCount.value = res.data.data
		})
	}
	const countTypeClick = (e) => {
		countTypeList.value[e] = !countTypeList.value[e]
	}
	//权限验证
	const btnAuth = (e,a)=>{
		return context?.$toolUtil.isAuth(e,a)
	}
	let echarts = inject("echarts")
	const cardTypeClick = (e) =>{
		cardTypeList.value[e] = !cardTypeList.value[e]
		setTimeout(()=>{
			getCardList()
		},1000)
	}
	const cardTypeList = ref({
		closeweixiuyuyueChartType1: true,
		hiddenweixiuyuyueChartType1: true,
		closeweixiuxinxiChartType1: true,
		hiddenweixiuxinxiChartType1: true,
		closeweixiuxinxiChartType2: true,
		hiddenweixiuxinxiChartType2: true,
		closeweixiupingjiaChartType1: true,
		hiddenweixiupingjiaChartType1: true,
	})
	const getCardList = () => {
		if(btnAuth('weixiuyuyue','首页统计')){
			getweixiuyuyueChart1()
		}
		if(btnAuth('weixiuxinxi','首页统计')){
			getweixiuxinxiChart1()
		}
		if(btnAuth('weixiuxinxi','首页统计')){
			getweixiuxinxiChart2()
		}
		if(btnAuth('weixiupingjia','首页统计')){
			getweixiupingjiaChart1()
		}
	}
	import '@/assets/js/echarts-theme'
	const getweixiuyuyueChart1 = () => {
		nextTick(()=>{
			var yuyuecishuEchart1 = echarts.init(document.getElementById("weixiuyuyueyuyuecishuEchart1"),'theme');
			context?.$http({
				url: `weixiuyuyue/value/yuyueshijian/yuyuecishu/日`,
				method: "get",
			}).then(obj=>{
				let res = obj.data.data
				let xAxis = [];
				let yAxis = [];
				let dataList = []
				for(let i=0;i<res.length;i++){
				    xAxis.push(res[i].yuyueshijian);
				    yAxis.push(parseFloat((res[i].total)));
					dataList.push({
				        value: parseFloat((res[i].total)),
				        name: res[i].yuyueshijian
				    })
				}
				var option = {};
				option = {
    title: {
        text: '预约次数',
        left: 'center'
    },
    tooltip: {
        trigger: 'item',
        formatter: '{b} : {c}'
    },
    xAxis: {
        data: xAxis,
        type: 'category',
    },
    yAxis: {
        type: 'value'
    },
    series:{
        data: yAxis,
        type: 'bar'
    }
}

				yuyuecishuEchart1.clear()
				// 使用刚指定的配置项和数据显示图表。
				yuyuecishuEchart1.setOption(option);
				//根据窗口的大小变动图表
				yuyuecishuEchart1.resize();
			})
		})
	}
	const getweixiuxinxiChart1 = () => {
		nextTick(()=>{
			var weixiufeiyongEchart1 = echarts.init(document.getElementById("weixiuxinxiweixiufeiyongEchart1"),'theme');
			context?.$http({
				url: `weixiuxinxi/value/weixiushijian/weixiufeiyong/日`,
				method: "get",
			}).then(obj=>{
				let res = obj.data.data
				let xAxis = [];
				let yAxis = [];
				let dataList = []
				for(let i=0;i<res.length;i++){
				    xAxis.push(res[i].weixiushijian);
				    yAxis.push(parseFloat((res[i].total)));
					dataList.push({
				        value: parseFloat((res[i].total)),
				        name: res[i].weixiushijian
				    })
				}
				var option = {};
				option = {
    title: {
        text: '维修收入',
        left: 'center'
    },
    tooltip: {
        trigger: 'item',
        formatter: '{b} : {c}'
    },
    xAxis: {
        data: xAxis,
        type: 'category',
    },
    yAxis: {
        type: 'value'
    },
    series:{
        data: yAxis,
        type: 'bar'
    }
}

				weixiufeiyongEchart1.clear()
				// 使用刚指定的配置项和数据显示图表。
				weixiufeiyongEchart1.setOption(option);
				//根据窗口的大小变动图表
				weixiufeiyongEchart1.resize();
			})
		})
	}
	const getweixiuxinxiChart2 = () => {
		nextTick(()=>{
			var weixiucishuEchart2 = echarts.init(document.getElementById("weixiuxinxiweixiucishuEchart2"),'theme');
			context?.$http({
				url: `weixiuxinxi/value/weixiuzhanghao/weixiucishu`,
				method: "get",
			}).then(obj=>{
				let res = obj.data.data
				let xAxis = [];
				let yAxis = [];
				let dataList = []
				for(let i=0;i<res.length;i++){
				    xAxis.push(res[i].weixiuzhanghao);
				    yAxis.push(parseFloat((res[i].total)));
					dataList.push({
				        value: parseFloat((res[i].total)),
				        name: res[i].weixiuzhanghao
				    })
				}
				var option = {};
				option = {
    title: {
        text: '维修次数',
        left: 'center'
    },
    tooltip: {
        trigger: 'item',
        formatter: '{b} : {c}'
    },
    xAxis: {
        data: xAxis,
        type: 'category',
    },
    yAxis: {
        type: 'value'
    },
    series:{
        data: yAxis,
        type: 'line'
    }
}
				weixiucishuEchart2.clear()
				// 使用刚指定的配置项和数据显示图表。
				weixiucishuEchart2.setOption(option);
				//根据窗口的大小变动图表
				weixiucishuEchart2.resize();
			})
		})
	}
	const getweixiupingjiaChart1 = () => {
		nextTick(()=>{
			var pingfenEchart1 = echarts.init(document.getElementById("weixiupingjiapingfenEchart1"),'theme');
			context?.$http({
				url: "weixiupingjia/group/pingfen",
				method: "get",
			}).then(obj=>{
				let res = obj.data.data
				let xAxis = [];
				let yAxis = [];
				let dataList = []
				for(let i=0;i<res.length;i++){
				    xAxis.push(res[i].pingfen);
				    yAxis.push(parseFloat((res[i].total)));
					dataList.push({
				        value: parseFloat((res[i].total)),
				        name: res[i].pingfen
				    })
				}
				var option = {};
				option = {
    title:{
        text: '客户满意度',
        left: 'center'
    },
    legend: {
        orient: 'vertical',
        left: 'left'
    },
    tooltip: {
        trigger: 'item',
        formatter: '{b} : {c} ({d}%)'
    },
    series: [
        {
            type: 'pie',
            radius: '55%',
            center: ['50%', '60%'],
            data: dataList,
            emphasis: {
                itemStyle: {
                  shadowBlur: 10,
                  shadowOffsetX: 0,
                  shadowColor: 'rgba(0, 0, 0, 0.5)'
                }
            }
        }
    ]
}
				pingfenEchart1.clear()
				// 使用刚指定的配置项和数据显示图表。
				pingfenEchart1.setOption(option);
				//根据窗口的大小变动图表
				pingfenEchart1.resize();
			})
		})
	}

	const init=()=>{
		getCountList()
		getCardList()
	}
	init()
</script>
<style lang="scss">
	// 首页盒子
	.home_view {
        background-image: url("http://clfile.zggen.cn/20241106/54b33f39571b43e0b0aebf1b9a1dfa47.png");
	}
	.home_view .projectTitle{
	}

	.showIcons {
		transition: transform 0.3s;
		margin-right: 10px;
	}

	.showIcons1 {
		transform: rotate(-180deg);
	}
	
	// 总数盒子
	.count_list{
		// 总数card
		.card_view {
			// card头部
			.el-card__header {
				// 头部盒子
				.index_card_head {
					// 标题
					.card_head_title {
					}
					// 按钮盒子
					.card_head_right {
						// 按钮
						.el-icon {
						}
					}
				}
			}
			// body
			.el-card__body {
				// body盒子
				.count_item{
					// 总数标题
					.count_title{
					}
					// 总数数字
					.count_num{
					}
				}
			}
		}
	}

	// 统计图盒子
	.card_list {
		// 统计图card
		.card_view {
			// 头部
			.el-card__header {
				// 头部盒子
				.index_card_head {
					// 标题
					.card_head_title {
					}
					// 按钮盒子
					.card_head_right {
						// 按钮
						.el-icon{
						}
					}
				}
			}
			// body
			.el-card__body {
				// body盒子
				.card_item{
				}
			}
		}
	}
</style>
<style>
/*总盒子*/
.home_view{
    padding: 20px 30px 20px 40px;
    margin: 0px;
    height: auto;
    min-height: 100vh;
    background: url(http://clfile.zggen.cn/20241106/54b33f39571b43e0b0aebf1b9a1dfa47.png) no-repeat center top / cover;
    width: 100%;
    border-radius: 0px;
    display:flex;
    flex-wrap:wrap;
    align-items:flex-start;
}
.home_view .projectTitle{
    width: 100%;
    font-size: 26px;
    font-weight: bold;
    padding: 40px 0px 20px;
    height: auto;
    display: flex;
    align-items: center;
    justify-content: center;
    margin: 0px 0px 20px;
    color: rgb(55, 55, 55);
}

/*总数*/
/*总盒子*/
.home_view .count_list {
    display:flex;
    flex-wrap:wrap;
    justify-content:center;
    padding:0px 0px 20px;
    width:100%;
    align-items:flex-start;
}
/*卡片盒子*/
.home_view .count_list .card_view {
    width:23%;
    height:auto;
    margin:0px 1% 20px;
    box-sizing:border-box;
    border-width:10px 1px 1px;
    border-style:solid;
    border-color:rgba(42,219,203,.6) rgba(42,219,203,.3) rgba(42,219,203,.3);
    border-radius:0px;
    flex: 1;
    padding:0 1%;
    box-shadow: none;
    background:linear-gradient(180deg, rgba(42,219,203,.3) 0%, rgba(152,122,222,.3) 100%),#fff;
}

.home_view .count_list .card_view:nth-child(1) {
}
.home_view .count_list .card_view:nth-child(2) {
}
.home_view .count_list .card_view:nth-child(3) {
}
.home_view .count_list .card_view:nth-child(4) {
}
.home_view .count_list .card_view:nth-child(2n+5) {
}
.home_view .count_list .card_view:nth-child(2n+6) {
}
.home_view .count_list .card_view:nth-child(1):hover {
}
.home_view .count_list .card_view:nth-child(2):hover {
}
.home_view .count_list .card_view:nth-child(3):hover {
}
.home_view .count_list .card_view:nth-child(4):hover {
}
.home_view .count_list .card_view:nth-child(2n+5):hover {
}
.home_view .count_list .card_view:nth-child(2n+6):hover {
}

/*head 总盒子*/
.home_view .count_list .card_view .el-card__header{
     width: 100%;
    border: 0px solid rgb(238, 238, 238);
    display: none;
}
/*item*/
.home_view .count_list .card_view .el-card__header .index_card_head{
    display: flex;
    align-items: center;
    justify-content: space-between;
    width: 100%;
    height: 10px;
}
/*标题*/
.home_view .count_list .card_view .el-card__header .index_card_head .card_head_title{
    font-size: 14px;
    color: rgb(51, 51, 51);
}
/*按钮盒子*/
.home_view .count_list .card_view .el-card__header .index_card_head .card_head_right{
    display: flex;
    align-items: center;
}
/*按钮*/
.home_view .count_list .card_view .el-card__header .index_card_head .card_head_right .showIcons{
    color: rgb(102, 102, 102);
    font-size: 20px;
    cursor: pointer;
}
/*body 总盒子*/
.home_view .count_list .card_view .el-card__body{
    padding: 0px;
    background: none;
}
/*item*/
.home_view .count_list .card_view .el-card__body .count_item{
    padding: 10px;
    text-align: left;
    display: flex;
    align-items: flex-start;
    justify-content: flex-start;
    flex-direction: column;
}
/*标题*/
.home_view .count_list .card_view .el-card__body .count_item .count_title{
    font-size: 18px;
    color: rgb(0, 0, 0);
    line-height: 2;
    display: inline-block;
    margin: 0px 10px 0px 0px;
    font-weight: 500;
    width: 100%;
    text-align:center;
}
/*数字*/
.home_view .count_list .card_view .el-card__body .count_item .count_num{
    width: 100%;
    font-size: 30px;
    color: #4555f3;
    line-height: 2;
    display: inline-block;
    font-weight: 600;
    text-align:center;
}

/*图表*/
/*总盒子*/
.home_view .card_list{
    width: 100%;
    display: flex;
    flex-wrap: wrap;
    padding: 0px 0px 20px;
    align-items: flex-start;
    order:11;
}
/*卡片 总盒子*/
.home_view .card_list .card_view{
    width: 48%;
    height: auto;
    margin: 0px 1% 30px;
    box-sizing: border-box;
    border: 1px solid rgba(42,219,203,.3);
    border-radius: 0px;
    padding: 20px 0px 0px;
    box-shadow: 0 0px 0px 0 rgba(0,0,0,.1);
}
/*head 总盒子*/
.home_view .card_list .card_view .el-card__header{
    width: 100%;
    border: 0px solid rgb(238, 238, 238);
    background: rgb(255, 255, 255);
    display: none;
}
/*item*/
.home_view .card_list .card_view .el-card__header .index_card_head{
    display: flex;
    align-items: center;
    justify-content: space-between;
    width: 100%;
    height: 10px;
}
/*标题*/
.home_view .card_list .card_view .el-card__header .index_card_head .card_head_title{
    color: rgb(33, 33, 33);
}
/*按钮盒子*/
.home_view .card_list .card_view .el-card__header .index_card_head .card_head_right{
    display: none;
}
/*按钮*/
.home_view .card_list .card_view .el-card__header .index_card_head .card_head_right .showIcons{
    color: rgb(238, 238, 238);
    font-size: 20px;
    cursor: pointer;
}

/*body 总盒子*/
.home_view .card_list .card_view .el-card__body{
    padding: 0px;
    background: rgb(255, 255, 255);
}
.home_view .card_list .card_view .el-card__body .card_item{
    padding: 10px;
    text-align: center;
}

.home-calendar{
  border: 1px solid rgba(42,219,203,.3);
  box-shadow: rgba(0, 0, 0, 0.1) 0px 0px 0px;
  margin: 0px auto 30px;
  border-radius: 0px;
  color: rgb(102, 102, 102);
  background: #fff;
  width: calc(100% - 30px);
  font-size: inherit;
  height: auto;
  padding:0 0 10px;
  order:2;
}
.home-calendar .header{
  padding: 17px 40px;
  border-color: rgba(42,219,203,.3);
  flex-wrap: wrap;
  background: rgba(42,219,203,.3);
  border-width: 0px 0px 1px;
  display: flex;
  width: 100%;
  border-style: solid;
  justify-content: space-between;
  height: auto;
}
.home-calendar .header .btn{
  cursor: pointer;
  border: 0px solid rgb(153, 153, 153);
  padding: 0px 0px 0px 12px;
  align-items: center;
  color: #333;
  border-radius: 4px;
  display: flex;
  width: auto;
  font-size: 16px;
  justify-content: center;
}
.home-calendar .header .title{
  padding: 0px 10px;
  font-size: 24px;
  align-items: center;
  justify-content: center;
  display: flex;
  color: #333;
}
.home-calendar table{
  width: 100%;
  padding: 0px 0px 20px;
  height: auto;
}
.home-calendar tbody,thead{
  width: 100%;
}
.home-calendar tr{
  width: 100%;
  align-items: center;
  justify-content: center;
  display: flex;
}
.home-calendar th{
  align-items: center;
  flex: 1;
  display: flex;
  line-height: 50px;
  justify-content: center;
}
.home-calendar td{
  cursor: pointer;
  padding: 6px 12px 6px;
  flex: 1;
  display: flex;
  justify-content: center;
  text-align: center;
}
.home-calendar td.today .text{
  width: 80%;
  height: 80%;
  padding:5px 0;
  background:rgba(42,219,203,.8) !important;
  color:#fff;
  border-radius:0px;
}
.home-calendar td.festival .text{
  width: 80%;
  height: 80%;
  padding:5px 0;
  background: rgba(42,219,203,.1);
  border-radius:0px;
}

</style>
