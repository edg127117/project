<template>
	<div>
		<div class="center_view">
			<div class="list_search_view">
				<el-form :model="searchQuery" class="search_form" >
					<div class="search_view">
						<div class="search_label">
							车牌号：
						</div>
						<div class="search_box">
							<el-input class="search_inp" v-model="searchQuery.chepaihao" placeholder="车牌号"
								clearable>
							</el-input>
						</div>
					</div>
					<div class="search_view">
						<div class="search_label">
							用户账号：
						</div>
						<div class="search_box">
							<el-input class="search_inp" v-model="searchQuery.yonghuzhanghao" placeholder="用户账号"
								clearable>
							</el-input>
						</div>
					</div>
					<div class="search_view">
						<div class="search_label">
							支付状态：
						</div>
						<div class="search_box">
							<el-select
								class="search_sel"
								clearable
								v-model="searchQuery.ispay"
								placeholder="支付状态"
								>
								<el-option label="已支付" value="已支付"></el-option>
								<el-option label="未支付" value="未支付"></el-option>
							</el-select>
						</div>
					</div>
					<div class="search_btn_view">
						<el-button class="search_btn" type="primary" @click="searchClick()" size="small">搜索</el-button>
					</div>
				</el-form>
				<div class="btn_view">
					<el-button class="add_btn" type="success" @click="addClick" v-if="btnAuth('weixiuxinxi','新增')">
						<i class="iconfont icon-xinzeng2"></i>
						新增
					</el-button>
					<el-button class="del_btn" type="danger" :disabled="selRows.length?false:true" @click="delClick(null)"  v-if="btnAuth('weixiuxinxi','删除')">
						<i class="iconfont icon-shanchu1"></i>
						删除
					</el-button>
					<el-button class="statis_btn" type="warning" @click="echartClick1" v-if="btnAuth('weixiuxinxi','维修收入')">
						<i class="iconfont icon-bar-chart--line"></i>
						维修收入
					</el-button>
					<el-button class="statis_btn" type="warning" @click="echartClick2" v-if="btnAuth('weixiuxinxi','维修次数')">
						<i class="iconfont icon-bar-chart--line"></i>
						维修次数
					</el-button>
				</div>
			</div>
			<el-table
				v-loading="listLoading"
				border
				:stripe='true'
				@selection-change="handleSelectionChange"
				ref="table"
				v-if="btnAuth('weixiuxinxi','查看')"
				:data="list"
				@row-click="listChange">
				<el-table-column :resizable='true' align="left" header-align="left" type="selection" width="55" />
				<el-table-column label="序号" width="70" :resizable='true' align="left" header-align="left">
					<template #default="scope">{{ (listQuery.page-1)*listQuery.limit+scope.$index + 1}}</template>
				</el-table-column>
				<el-table-column min-width="140"
					 :resizable='true'
					 :sortable='true'
					 align="left"
					 header-align="left"
					 prop="chepaihao"
					label="车牌号">
					<template #default="scope">
						{{scope.row.chepaihao}}
					</template>
				</el-table-column>
				<el-table-column min-width="140"
					 :resizable='true'
					 :sortable='true'
					 align="left"
					 header-align="left"
					 prop="chexing"
					label="车型">
					<template #default="scope">
						{{scope.row.chexing}}
					</template>
				</el-table-column>
				<el-table-column min-width="140"
					 :resizable='true'
					 :sortable='true'
					 align="left"
					 header-align="left"
					 prop="cheliangpinpai"
					label="车辆品牌">
					<template #default="scope">
						{{scope.row.cheliangpinpai}}
					</template>
				</el-table-column>
				<el-table-column min-width="140"
					 :resizable='true'
					 :sortable='true'
					 align="left"
					 header-align="left"
					 prop="cheliangxinghao"
					label="车辆型号">
					<template #default="scope">
						{{scope.row.cheliangxinghao}}
					</template>
				</el-table-column>
				<el-table-column min-width="140"
					 :resizable='true'
					 :sortable='true'
					 align="left"
					 header-align="left"
					 prop="yonghuzhanghao"
					label="用户账号">
					<template #default="scope">
						{{scope.row.yonghuzhanghao}}
					</template>
				</el-table-column>
				<el-table-column min-width="140"
					 :resizable='true'
					 :sortable='true'
					 align="left"
					 header-align="left"
					 prop="yonghuxingming"
					label="用户姓名">
					<template #default="scope">
						{{scope.row.yonghuxingming}}
					</template>
				</el-table-column>
				<el-table-column min-width="140"
					 :resizable='true'
					 :sortable='true'
					 align="left"
					 header-align="left"
					 prop="baoxiubiaoti"
					label="报修标题">
					<template #default="scope">
						{{scope.row.baoxiubiaoti}}
					</template>
				</el-table-column>
				<el-table-column min-width="140"
					 :resizable='true'
					 :sortable='true'
					 align="left"
					 header-align="left"
					 prop="weixiuzhanghao"
					label="维修账号">
					<template #default="scope">
						{{scope.row.weixiuzhanghao}}
					</template>
				</el-table-column>
				<el-table-column min-width="140"
					 :resizable='true'
					 :sortable='true'
					 align="left"
					 header-align="left"
					 prop="weixiuxingming"
					label="维修姓名">
					<template #default="scope">
						{{scope.row.weixiuxingming}}
					</template>
				</el-table-column>
				<el-table-column prop="ispay" label="支付状态" min-width="140" :resizable='true' :sortable='true' align="left" header-align="left">
					<template #default="scope">
						<span style="margin-right:10px">{{scope.row.ispay=='已支付'?'已支付':'未支付'}}</span>
						<el-button v-if="scope.row.ispay!='已支付' && btnAuth('weixiuxinxi','支付')" link size="small" @click.stop="payClick(scope.row)">支付</el-button>
					</template>
				</el-table-column>
				<el-table-column min-width="140"
					 :resizable='true'
					 :sortable='true'
					 align="left"
					 header-align="left"
					 prop="guzhangweizhi"
					label="故障位置">
					<template #default="scope">
						{{scope.row.guzhangweizhi}}
					</template>
				</el-table-column>
				<el-table-column min-width="140"
					 :resizable='true'
					 :sortable='true'
					 align="left"
					 header-align="left"
					 prop="guzhangyuanyin"
					label="故障原因">
					<template #default="scope">
						{{scope.row.guzhangyuanyin}}
					</template>
				</el-table-column>
				
				<!-- 🔥 新增列：材料费 -->
				<el-table-column min-width="120" :resizable='true' :sortable='true' align="left" header-align="left" prop="cailiaofei" label="材料费(元)">
					<template #default="scope">{{scope.row.cailiaofei}}</template>
				</el-table-column>
				<!-- 🔥 新增列：工时费 -->
				<el-table-column min-width="120" :resizable='true' :sortable='true' align="left" header-align="left" prop="gongshifei" label="工时费(元)">
					<template #default="scope">{{scope.row.gongshifei}}</template>
				</el-table-column>
				
				<el-table-column min-width="140"
					 :resizable='true'
					 :sortable='true'
					 align="left"
					 header-align="left"
					 prop="weixiufeiyong"
					label="维修总费用">
					<template #default="scope">
						{{scope.row.weixiufeiyong}}
					</template>
				</el-table-column>
				<el-table-column label="检查报告" min-width="140" :resizable='true' :sortable='true' align="left" header-align="left">
					<template #default="scope">
						<el-button v-if="scope.row.jianchabaogao" link size="small" @click="download(scope.row.jianchabaogao)">下载</el-button>
						<el-button v-else disabled link size="small">无</el-button>
					</template>
				</el-table-column>
				<el-table-column min-width="140"
					 :resizable='true'
					 :sortable='true'
					 align="left"
					 header-align="left"
					 prop="jianyixinxi"
					label="建议信息">
					<template #default="scope">
						{{scope.row.jianyixinxi}}
					</template>
				</el-table-column>
				<el-table-column min-width="140"
					 :resizable='true'
					 :sortable='true'
					 align="left"
					 header-align="left"
					 prop="weixiushijian"
					label="维修时间">
					<template #default="scope">
						{{scope.row.weixiushijian}}
					</template>
				</el-table-column>
				<el-table-column label="操作" width="300" :resizable='true' :sortable='true' align="left" header-align="left">
					<template #default="scope">
						<el-button class="view_btn" type="info" v-if=" btnAuth('weixiuxinxi','查看')" @click="infoClick(scope.row.id)">
							详情
						</el-button>
						<el-button class="edit_btn" type="primary" @click="editClick(scope.row.id)" v-if=" btnAuth('weixiuxinxi','修改')">
							修改
						</el-button>
						<el-button class="del_btn" type="danger" @click="delClick(scope.row.id)"  v-if="btnAuth('weixiuxinxi','删除')">
							删除
						</el-button>
						<el-button class="cross_btn" v-if="btnAuth('weixiuxinxi','评价')" type="success" @click="weixiupingjiaCrossAddOrUpdateHandler(scope.row,'cross','否','否','[1]','已评价')">
							评价
						</el-button>
					</template>
				</el-table-column>
			</el-table>
			<el-pagination
				background
				:layout="layouts.join(',')"
				:total="total"
				:page-size="listQuery.limit"
				v-model:current-page="listQuery.page"
				prev-text="上一页"
				next-text="下一页"
				:hide-on-single-page="false"
				:style='{}'
				:page-sizes="[10, 20, 30, 40, 50, 100]"
				@size-change="sizeChange"
				@current-change="currentChange"  />
		</div>
		<formModel ref="formRef" @formModelChange="formModelChange"></formModel>
		<payForm ref="pay" @payChange="searchClick()"></payForm>
		<!-- 统计图弹窗 -->
		<el-dialog v-model="echartVisible" title="统计图" width="70%">
			<el-tabs v-model="echartActive" class="demo-tabs" @tab-change="echartTabClick" type="card">
				<el-tab-pane label="维修收入" name="1" v-if="btnAuth('weixiuxinxi','维修收入')"></el-tab-pane>
				<el-tab-pane label="维修次数" name="2" v-if="btnAuth('weixiuxinxi','维修次数')"></el-tab-pane>
			</el-tabs>
			<div v-if="echartActive==1" id="weixiufeiyongEchart1" style="width:100%;height:600px;"></div>
			<div v-if="echartActive==2" id="weixiucishuEchart2" style="width:100%;height:600px;"></div>
			<template #footer>
				<span class="formModel_btn_box">
					<el-button class="cancel_btn" @click="echartVisible=false">取消</el-button>
				</span>
			</template>
		</el-dialog>
		<weixiupingjiaFormModel ref="weixiupingjiaFormModelRef" @formModelChange="formModelChange"></weixiupingjiaFormModel>
	</div>
</template>
<script setup>
	import axios from 'axios'
	import {
		reactive,
		ref,
		getCurrentInstance,
		nextTick,
		onMounted,
		watch,
		computed,
		inject
	} from 'vue'
	import {
		useRoute,
		useRouter
	} from 'vue-router'
	import {
		ElMessageBox
	} from 'element-plus'
	import {
		useStore
	} from 'vuex';
	const store = useStore()
	const user = computed(()=>store.getters['user/session'])
	const avatar = ref(store.state.user.avatar)
	const context = getCurrentInstance()?.appContext.config.globalProperties;
	import formModel from './formModel.vue'
	//基础信息

	const tableName = 'weixiuxinxi'
	const formName = '维修信息'
	const route = useRoute()
	//基础信息
	onMounted(()=>{
	})
	//列表数据
	const list = ref(null)
	const table = ref(null)
	const listQuery = ref({
		page: 1,
		limit: 10,
		sort: 'id',
		order: 'desc'
	})
	const searchQuery = ref({})
	const selRows = ref([])
	const listLoading = ref(false)
	const listChange = (row) =>{
		nextTick(()=>{
			//table.value.clearSelection()
			table.value.toggleRowSelection(row)
		})
	}
	//列表
	const getList = () => {
		listLoading.value = true
		let params = JSON.parse(JSON.stringify(listQuery.value))
		params['sort'] = 'id'
		params['order'] = 'desc'
		if(searchQuery.value.chepaihao&&searchQuery.value.chepaihao!=''){
			params['chepaihao'] = '%' + searchQuery.value.chepaihao + '%'
		}
		if(searchQuery.value.yonghuzhanghao&&searchQuery.value.yonghuzhanghao!=''){
			params['yonghuzhanghao'] = '%' + searchQuery.value.yonghuzhanghao + '%'
		}
		if(searchQuery.value.ispay && searchQuery.value.ispay!=''){
			params['ispay'] = searchQuery.value.ispay
		}
		context.$http({
			url: `${tableName}/page`,
			method: 'get',
			params: params
		}).then(res => {
			listLoading.value = false
			list.value = res.data.data.list
			total.value = Number(res.data.data.total)
		})
	}
	//删
	const delClick = (id) => {
		let ids = ref([])
		if (id) {
			ids.value = [id]
		} else {
			if (selRows.value.length) {
				for (let x in selRows.value) {
					ids.value.push(selRows.value[x].id)
				}
			} else {
				return false
			}
		}
		ElMessageBox.confirm(`是否删除选中${formName}`, '提示', {
			confirmButtonText: '是',
			cancelButtonText: '否',
			type: 'warning',
		}).then(() => {
			context.$http({
				url: `${tableName}/delete`,
				method: 'post',
				data: ids.value
			}).then(res => {
				context?.$toolUtil.message('删除成功', 'success',()=>{
					getList()
				})
			})
		})
	}
	//多选
	const handleSelectionChange = (e) => {
		selRows.value = e
	}
	//列表数据
	//分页
	const total = ref(0)
	const layouts = ref(["total","prev","pager","next","sizes","jumper"])
	const sizeChange = (size) => {
		listQuery.value.limit = size
		getList()
	}
	const currentChange = (page) => {
		listQuery.value.page = page
		getList()
	}
	//分页
	//权限验证
	const btnAuth = (e,a)=>{
		return context?.$toolUtil.isAuth(e,a)
	}
	//搜索
	const searchClick = () => {
		listQuery.value.page = 1
		getList()
	}
	//表单
	const formRef = ref(null)
	const formModelChange=()=>{
		searchClick()
	}
	const addClick = ()=>{
		formRef.value.init()
	}
	const editClick = (id=null)=>{
		if(id){
			formRef.value.init(id,'edit')
			return
		}
		if(selRows.value.length){
			formRef.value.init(selRows.value[0].id,'edit')
		}
	}

	const infoClick = (id=null)=>{
		if(id){
			formRef.value.init(id,'info')
		}
		else if(selRows.value.length){
			formRef.value.init(selRows.value[0].id,'info')
		}
	}
	// 表单
	// 预览文件
	const preClick = (file) =>{
		if(!file){
			context?.$toolUtil.message('文件不存在','error')
		}
		window.open(context?.$config.url + file)
	}
	// 下载文件
	const download = (file) => {
		if(!file){
			context?.$toolUtil.message('文件不存在','error')
		}
		let arr = file.replace(new RegExp('file/', "g"), "")
		axios.get((location.href.split(context?.$config.name).length>1 ? location.href.split(context?.$config.name)[0] :'') + context?.$config.name + '/file/download?fileName=' + arr, {
			headers: {
				token: context?.$toolUtil.storageGet('Token')
			},
			responseType: "blob"
		}).then(({
			data
		}) => {
			const binaryData = [];
			binaryData.push(data);
			const objectUrl = window.URL.createObjectURL(new Blob(binaryData, {
				type: 'application/pdf;chartset=UTF-8'
			}))
			const a = document.createElement('a')
			a.href = objectUrl
			a.download = arr
			// a.click()
			// 下面这个写法兼容火狐
			a.dispatchEvent(new MouseEvent('click', {
				bubbles: true,
				cancelable: true,
				view: window
			}))
			window.URL.revokeObjectURL(data)
		})
	}
	// 统计图1
	const echarts = inject("echarts")
	const echartVisible = ref(false)
	const echartClick1 = ()=>{
		echartActive.value = '1'
		echartVisible.value = true
		nextTick(()=>{
			var weixiufeiyongEchart1 = echarts.init(document.getElementById("weixiufeiyongEchart1"),'theme');
			context.$http({
				url: `${tableName}/value/weixiushijian/weixiufeiyong/日`,
				method: 'get'
			}).then(res=>{
				let obj = res.data.data
				let xAxis = [];
				let yAxis = [];
				let dataList = []
				for(let i=0;i<obj.length;i++){
					xAxis.push(obj[i].weixiushijian);
					yAxis.push(parseFloat((obj[i].total)));
					dataList.push({
						value: parseFloat((obj[i].total)),
						name: obj[i].weixiushijian
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
				// 使用刚指定的配置项和数据显示图表。
				weixiufeiyongEchart1.setOption(option);
				  //根据窗口的大小变动图表
				window.onresize = function() {
					weixiufeiyongEchart1.resize();
				};
			})
		})
	}
	// 统计图2
	const echartActive = ref('1')
	const echartTabClick = () =>{
		if(echartActive.value==1){
			echartClick1()
		}
		else if(echartActive.value==2){
			echartClick2()
		}
	}
	const echartClick2 = ()=>{
		echartActive.value = '2'
		echartVisible.value = true
		nextTick(()=>{
			var weixiucishuEchart2 = echarts.init(document.getElementById("weixiucishuEchart2"),'theme');
			context.$http({
				url: `${tableName}/value/weixiuzhanghao/weixiucishu`,
				method: 'get'
			}).then(res=>{
				let obj = res.data.data
				let xAxis = [];
				let yAxis = [];
				let dataList = []
				for(let i=0;i<obj.length;i++){
					xAxis.push(obj[i].weixiuzhanghao);
					yAxis.push(parseFloat((obj[i].total)));
					dataList.push({
						value: parseFloat((obj[i].total)),
						name: obj[i].weixiuzhanghao
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
				// 使用刚指定的配置项和数据显示图表。
				weixiucishuEchart2.setOption(option);
				  //根据窗口的大小变动图表
				window.onresize = function() {
					weixiucishuEchart2.resize();
				};
			})
		})
	}
	import payForm from '@/components/common/payForm'
	const pay = ref(null)
	const payClick = (row)=>{
		pay.value.payClick(tableName,row)
	}
	import weixiupingjiaFormModel from '@/views/weixiupingjia/formModel'
	const weixiupingjiaFormModelRef = ref(null)
	const weixiupingjiaCrossAddOrUpdateHandler = (row,type,crossOptAudit,crossOptPay,statusColumnName,tips,statusColumnValue) => {
		if(crossOptPay=='是'&&row.ispay!='已支付'){
			context.$toolUtil.message("请支付完成再操作",'error');
			return
		}
		if(statusColumnName!=''&&!statusColumnName.startsWith("[")) {
			var obj = row
			for (var o in obj){
				if(o==statusColumnName && obj[o]==statusColumnValue){
					context?.$toolUtil.message(tips,'error')
					return;
				}
			}
		}
		nextTick(()=>{
			weixiupingjiaFormModelRef.value.init(row.id,'cross','评价',row,'weixiuxinxi',statusColumnName,tips,statusColumnValue)
		})
	}
	//初始化
	const init = () => {
		getList()
	}
	init()
</script>
<style lang="scss" scoped>

	// 操作盒子
	.list_search_view {
		// 搜索盒子
		.search_form {
			// 子盒子
			.search_view {
				// 搜索label
				.search_label {
				}
				// 搜索item
				.search_box {
					// 输入框
					:deep(.search_inp) {
					}
					// 下拉框
					:deep(.search_sel) {
						//去掉默认样式
						.select-trigger{
							height: 100%;
							.el-input{
								height: 100%;
							}
						}
					}
				}
			}
			// 搜索按钮盒子
			.search_btn_view {
				// 搜索按钮
				.search_btn {
				}
				// 搜索按钮-悬浮
				.search_btn:hover {
				}
			}
		}
		//头部按钮盒子
		.btn_view {
			// 其他
			:deep(.el-button--default){
			}
			// 其他-悬浮
			:deep(.el-button--default:hover){
			}
			// 新增
			:deep(.el-button--success){
			}
			// 新增-悬浮
			:deep(.el-button--success:hover){
			}
			// 删除
			:deep(.el-button--danger){
			}
			// 删除-悬浮
			:deep(.el-button--danger:hover){
			}
			// 统计
			:deep(.el-button--warning){
			}
			// 统计-悬浮
			:deep(.el-button--warning:hover){
			}
		}
	}
	// 表格样式
	.el-table {
		:deep(.el-table__header-wrapper) {
			thead {
				tr {
					th {
						.cell {
						}
					}
				}
			}
		}
		:deep(.el-table__body-wrapper) {
			tbody {
				tr {
					td {
						.cell {
							// 编辑
							.el-button--primary {
							}
							// 编辑-悬浮
							.el-button--primary:hover {
							}
							// 详情
							.el-button--info {
							}
							// 详情-悬浮
							.el-button--info:hover {
							}
							// 删除
							.el-button--danger {
							}
							// 删除-悬浮
							.el-button--danger:hover {
							}
							// 跨表
							.el-button--success {
							}
							// 跨表-悬浮
							.el-button--success:hover {
							}
							// 操作
							.el-button--warning {
							}
							// 操作-悬浮
							.el-button--warning:hover {
							}
						}
					}
				}
				tr.el-table__row--striped {
					td {
						background: rgba(223, 246, 244, 0.6);
					}
				}
				tr:hover {
					td {
					}
				}
			}
		}
	}
	// 分页器
	.el-pagination {
		// 总页码
		:deep(.el-pagination__total) {
		}
		// 上一页
		:deep(.btn-prev) {
		}
		// 下一页
		:deep(.btn-next) {
		}
		// 上一页禁用
		:deep(.btn-prev:disabled) {
		}
		// 下一页禁用
		:deep(.btn-next:disabled) {
		}
		// 页码
		:deep(.el-pager) {
			// 数字
			.number {
			}
			// 数字悬浮
			.number:hover {
			}
			// 选中
			.number.is-active {
			}
		}
		// sizes
		:deep(.el-pagination__sizes) {
			display: inline-block;
			vertical-align: top;
			font-size: 13px;
			line-height: 28px;
			height: 28px;
			.el-select {
			}
		}
		// 跳页
		:deep(.el-pagination__jump) {
			// 输入框
			.el-input {
			}
		}
	}
</style>