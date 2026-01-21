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
							维修状态：
						</div>
						<div class="search_box">
							<el-select
								class="search_sel"
								clearable
								v-model="searchQuery.weixiuzhuangtai"
								placeholder="维修状态"
								>
								<el-option v-for="item in weixiuzhuangtaiLists" :label="item" :value="item"></el-option>
							</el-select>
						</div>
					</div>
					<div class="search_btn_view">
						<el-button class="search_btn" type="primary" @click="searchClick()" size="small">搜索</el-button>
					</div>
				</el-form>
				<div class="btn_view">
                    <!-- 🔥 改名为工单派发 -->
					<el-button class="add_btn" type="success" @click="addClick" v-if="btnAuth('weixiufenpei','新增')">
						<i class="iconfont icon-xinzeng2"></i>
						工单派发
					</el-button>
					<el-button class="del_btn" type="danger" :disabled="selRows.length?false:true" @click="delClick(null)"  v-if="btnAuth('weixiufenpei','删除')">
						<i class="iconfont icon-shanchu1"></i>
						删除
					</el-button>
				</div>
			</div>
			<el-table
				v-loading="listLoading"
				border
				:stripe='true'
				@selection-change="handleSelectionChange"
				ref="table"
				v-if="btnAuth('weixiufenpei','查看')"
				:data="list"
				@row-click="listChange">
				<el-table-column :resizable='true' align="left" header-align="left" type="selection" width="55" />
				<el-table-column label="序号" width="70" :resizable='true' align="left" header-align="left">
					<template #default="scope">{{ (listQuery.page-1)*listQuery.limit+scope.$index + 1}}</template>
				</el-table-column>
				<el-table-column min-width="140" prop="baoxiubianhao" label="报修编号" align="left" header-align="left"></el-table-column>
				<el-table-column min-width="140" prop="chepaihao" label="车牌号" align="left" header-align="left"></el-table-column>
				<el-table-column min-width="140" prop="cheliangpinpai" label="车辆品牌" align="left" header-align="left"></el-table-column>
				<el-table-column min-width="140" prop="yonghuxingming" label="用户姓名" align="left" header-align="left"></el-table-column>
				<el-table-column min-width="140" prop="guzhangleixing" label="故障类型" align="left" header-align="left"></el-table-column>
				<el-table-column min-width="140" prop="weixiuxingming" label="维修姓名" align="left" header-align="left"></el-table-column>
				<el-table-column min-width="140" prop="weixiuzhuangtai" label="维修状态" align="left" header-align="left">
                    <template #default="scope">
                        <el-tag :type="scope.row.weixiuzhuangtai=='已完成'?'success':(scope.row.weixiuzhuangtai=='维修中'?'warning':'info')">{{scope.row.weixiuzhuangtai}}</el-tag>
                    </template>
                </el-table-column>
				<el-table-column min-width="140" prop="fenpeishijian" label="分配时间" align="left" header-align="left"></el-table-column>
				<el-table-column label="操作" width="350" :resizable='true' :sortable='true' align="left" header-align="left">
					<template #default="scope">
                        <!-- 🔥 维修员进度操作 -->
                        <el-button class="view_btn" type="warning" size="small" @click="updateStatus(scope.row, '维修中')" v-if="roleName=='维修员' && (scope.row.weixiuzhuangtai=='待维修'||scope.row.weixiuzhuangtai=='未维修')">开始维修</el-button>
                        <el-button class="view_btn" type="success" size="small" @click="updateStatus(scope.row, '已完成')" v-if="roleName=='维修员' && scope.row.weixiuzhuangtai=='维修中'">完成维修</el-button>

						<el-button class="view_btn" type="info" v-if=" btnAuth('weixiufenpei','查看')" @click="infoClick(scope.row.id)">
							详情
						</el-button>
						<el-button class="edit_btn" type="primary" @click="editClick(scope.row.id)" v-if=" btnAuth('weixiufenpei','修改')">
							修改
						</el-button>
						<el-button class="del_btn" type="danger" @click="delClick(scope.row.id)"  v-if="btnAuth('weixiufenpei','删除')">
							删除
						</el-button>
						<el-button class="cross_btn" v-if="btnAuth('weixiufenpei','维修')" type="success" @click="weixiuxinxiCrossAddOrUpdateHandler(scope.row,'cross','','','weixiuzhuangtai','已维修','已维修,未维修'.split(',')[0])">
							结算
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
		<weixiuxinxiFormModel ref="weixiuxinxiFormModelRef" @formModelChange="formModelChange"></weixiuxinxiFormModel>
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

	const tableName = 'weixiufenpei'
	const formName = '维修分配'
	const route = useRoute()
    const roleName = ref('')

	//基础信息
	onMounted(()=>{
        roleName.value = context?.$toolUtil.storageGet("role")
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
		if(searchQuery.value.weixiuzhuangtai&&searchQuery.value.weixiuzhuangtai!=''){
			params['weixiuzhuangtai'] = searchQuery.value.weixiuzhuangtai
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

    // 🔥 进度更新逻辑
    const updateStatus = (row, status) => {
        ElMessageBox.confirm(`确认工单已进入【${status}】状态吗?`, '提示', { confirmButtonText: "确定", cancelButtonText: "取消", type: "warning" }).then(() => {
            context.$http({ url: `${tableName}/update`, method: 'post', data: { id: row.id, weixiuzhuangtai: status } }).then(() => {
                context?.$toolUtil.message('进度更新成功', 'success', () => getList())
            })
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
	const weixiuzhuangtaiLists = ref([])
	const getweixiuzhuangtaiLists = () => {
		weixiuzhuangtaiLists.value = '待维修,维修中,已完成'.split(',')
	}
	getweixiuzhuangtaiLists()
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
	import weixiuxinxiFormModel from '@/views/weixiuxinxi/formModel'
	const weixiuxinxiFormModelRef = ref(null)
	const weixiuxinxiCrossAddOrUpdateHandler = (row,type,crossOptAudit,crossOptPay,statusColumnName,tips,statusColumnValue) => {
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
			weixiuxinxiFormModelRef.value.init(row.id,'cross','维修',row,'weixiufenpei',statusColumnName,tips,statusColumnValue)
		})
	}
	//初始化
	const init = () => {
		getweixiuzhuangtaiLists()
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