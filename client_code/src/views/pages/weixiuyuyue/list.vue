<template>
	<div class="list-page" :style='{}'>
        <div class="breadcrumb-wrapper" style="width: 100%;">
            <div class="bread_view">
                <el-breadcrumb separator="/" class="breadcrumb">
                    <el-breadcrumb-item class="first_breadcrumb" :to="{ path: '/' }">首页</el-breadcrumb-item>
                    <el-breadcrumb-item class="second_breadcrumb" v-for="(item,index) in breadList" :key="index">{{item.name}}</el-breadcrumb-item>
                </el-breadcrumb>
            </div>
            <div class="back_view" v-if="centerType">
                <el-button class="back_btn" @click="backClick" type="primary">返回</el-button>
            </div>
        </div>
		<el-form :inline="true" :model="searchQuery" class="list_search">
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
					分配状态：
				</div>
				<div class="search_box">
					<el-select
						class="search_sel"
						clearable
						v-model="searchQuery.fenpeizhuangtai" 
						placeholder="分配状态"
						>
						<el-option v-for="item in fenpeizhuangtaiLists" :label="item" :value="item"></el-option>
					</el-select>
				</div>
			</div>
			<div class="search_btn_view">
				<el-button class="search_btn" type="primary" @click="searchClick">搜索</el-button>
				<el-button class="add_btn" type="success" v-if="btnAuth('weixiuyuyue','新增')" @click="addClick">新增</el-button>
			</div>
		</el-form>
		<div class="page_list">
			<div class="data_box">
                <div class="table_view">
					<el-table v-loading="listLoading" class="data_table" :data="list" border :row-style="{'cursor':'pointer'}"
						@row-click="tableDetailClick" :stripe='true'>
						<el-table-column :resizable='true' align="left" header-align="left" type="selection" width="55" />
						<el-table-column label="序号" width="120" :resizable='true' align="left" header-align="left">
							<template #default="scope">{{ (listQuery.page-1)*listQuery.limit+scope.$index + 1}}</template>
						</el-table-column>
						<el-table-column label="报修编号" :resizable='true' align="left" header-align="left">
							<template #default="scope">
								{{scope.row.baoxiubianhao}}
							</template>
						</el-table-column>
						<el-table-column label="车牌号" :resizable='true' align="left" header-align="left">
							<template #default="scope">
								{{scope.row.chepaihao}}
							</template>
						</el-table-column>
						<el-table-column label="车型" :resizable='true' align="left" header-align="left">
							<template #default="scope">
								{{scope.row.chexing}}
							</template>
						</el-table-column>
						<el-table-column label="车辆品牌" :resizable='true' align="left" header-align="left">
							<template #default="scope">
								{{scope.row.cheliangpinpai}}
							</template>
						</el-table-column>
						<el-table-column label="车辆型号" :resizable='true' align="left" header-align="left">
							<template #default="scope">
								{{scope.row.cheliangxinghao}}
							</template>
						</el-table-column>
						<el-table-column label="用户账号" :resizable='true' align="left" header-align="left">
							<template #default="scope">
								{{scope.row.yonghuzhanghao}}
							</template>
						</el-table-column>
						<el-table-column label="用户姓名" :resizable='true' align="left" header-align="left">
							<template #default="scope">
								{{scope.row.yonghuxingming}}
							</template>
						</el-table-column>
						<el-table-column label="故障类型" :resizable='true' align="left" header-align="left">
							<template #default="scope">
								{{scope.row.guzhangleixing}}
							</template>
						</el-table-column>
						<el-table-column label="预约次数" :resizable='true' align="left" header-align="left">
							<template #default="scope">
								{{scope.row.yuyuecishu}}
							</template>
						</el-table-column>
						<el-table-column label="报修标题" :resizable='true' align="left" header-align="left">
							<template #default="scope">
								{{scope.row.baoxiubiaoti}}
							</template>
						</el-table-column>
						<el-table-column label="报修原因" :resizable='true' align="left" header-align="left">
							<template #default="scope">
								{{scope.row.baoxiuyuanyin}}
							</template>
						</el-table-column>
						<el-table-column label="预约时间" :resizable='true' align="left" header-align="left">
							<template #default="scope">
								{{scope.row.yuyueshijian}}
							</template>
						</el-table-column>
						<el-table-column label="分配状态" :resizable='true' align="left" header-align="left">
							<template #default="scope">
								{{scope.row.fenpeizhuangtai}}
							</template>
						</el-table-column>
						<el-table-column label="备注" :resizable='true' align="left" header-align="left">
							<template #default="scope">
								{{scope.row.beizhu}}
							</template>
						</el-table-column>
						<el-table-column label="审核回复" v-if="centerType" :resizable='true' align="left" header-align="left">
							<template #default="scope">
								{{scope.row.shhf}}
							</template>
						</el-table-column>
						<el-table-column label="审核状态" v-if="centerType" :resizable='true' align="left" header-align="left">
							<template #default="scope">
								<el-tag type="success" v-if="scope.row.sfsh=='是'">通过</el-tag>
								<el-tag type="danger" v-if="scope.row.sfsh=='否'">未通过</el-tag>
								<el-tag type="warning" v-if="scope.row.sfsh=='待审核'">待审核</el-tag>
							</template>
						</el-table-column>
					</el-table>
                </div>
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
					@size-change="sizeChange"
					@current-change="currentChange"/>
			</div>
		</div>
		<el-dialog v-model="preViewVisible" :title="'查看大图'" width="60%" destroy-on-close>
			<img :src="preViewUrl" style="width: 100%;" alt="">
		</el-dialog>
	</div>
</template>

<script setup>
	import {
		ref,
		getCurrentInstance,
		nextTick,
        computed,
	} from 'vue';
	import {
		useRoute,
		useRouter
	} from 'vue-router';
    import {
        useStore
    } from 'vuex';
    const store = useStore()
    const user = computed(()=>store.getters['user/session'])
	const context = getCurrentInstance()?.appContext.config.globalProperties;
	const router = useRouter()
	const route = useRoute()
	//基础信息
	const tableName = 'weixiuyuyue'
	const formName = '维修预约'
	//基础信息
	const breadList = ref([{
		name: formName
	}])
	const list = ref([])
	const listQuery = ref({
		page: 1,
		limit: 20,
	})
	const total = ref(0)
	const listLoading = ref(false)
	//权限验证
	const btnAuth = (e,a)=>{
		if(centerType.value){
			return context?.$toolUtil.isBackAuth(e,a)
		}else{
			return context?.$toolUtil.isAuth(e,a)
		}
	}
	const addClick = () => {
		router.push('/index/weixiuyuyueAdd')
	}
	//判断是否从个人中心跳转
	const centerType = ref(false)
	//返回
	const backClick = () => {
		router.push(`/index/${context?.$toolUtil.storageGet('frontSessionTable')}Center`)
	}
	//搜索
	const searchQuery = ref({})
	//下拉列表
	const fenpeizhuangtaiLists = ref([])
	const getfenpeizhuangtaiLists = () => {
		fenpeizhuangtaiLists.value = '已分配,未分配'.split(',')
	}
	getfenpeizhuangtaiLists()
	const searchClick = () => {
		listQuery.value.page = 1
		getList()
	}
	//分页
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
	//列表
	const getList = () => {
		listLoading.value = true
		let params = JSON.parse(JSON.stringify(listQuery.value))
		if(searchQuery.value.chepaihao&&searchQuery.value.chepaihao!=''){
			params.chepaihao = '%' + searchQuery.value.chepaihao + '%'
		}
		if(searchQuery.value.yonghuzhanghao&&searchQuery.value.yonghuzhanghao!=''){
			params.yonghuzhanghao = '%' + searchQuery.value.yonghuzhanghao + '%'
		}
		if(searchQuery.value.fenpeizhuangtai&&searchQuery.value.fenpeizhuangtai!=''){
			params.fenpeizhuangtai = searchQuery.value.fenpeizhuangtai
		}
		if(!centerType.value){
			params['sfsh'] = '是';
		} 
		context?.$http({
			url: `${tableName}/${centerType.value?'page':'list'}`,
			method: 'get',
			params: params
		}).then(res => {
			listLoading.value = false
			list.value = res.data.data.list
			total.value = Number(res.data.data.total)
		})
	}
	const tableDetailClick = (row) => {
		router.push(`${tableName}Detail?id=` + row.id + (centerType.value?'&&centerType=1':''))
	}
	//下载文件
	const download = (file) =>{
		if(!file){
			context?.$toolUtil.message('文件不存在','error')
		}
		const a = document.createElement('a');
		a.style.display = 'none';
		a.setAttribute('target', '_blank');
		file && a.setAttribute('download', file);
		a.href = context?.$config.url + file;
		document.body.appendChild(a);
		a.click();
		document.body.removeChild(a);
	}
	// 查看大图
	const preViewUrl = ref('')
	const preViewVisible = ref(false)
	const preViewClick = (url) =>{
		preViewUrl.value = url
		preViewVisible.value = true
	}
	const init = () => {
		if(route.query.centerType){
			centerType.value = true
		}
		fenpeizhuangtaiLists.value = '已分配,未分配'.split(',')
		getList()
	}
	init()
</script>
<style lang="scss" scoped>
	// 返回盒子
	.back_view {
		border-radius: 4px;
		padding: 10px 0px;
		margin: 10px auto;
		z-index: 999;
		background: none;
		width: 100%;
		text-align: right;
		// 返回按钮
		.back_btn {
			border: 1px solid #0076ca50;
			cursor: pointer;
			border-radius: 4px;
			padding: 0 24px;
			color: #0076ca;
			background: #fff;
			width: auto;
			font-size: 14px;
			height: 34px;
		}
		// 返回按钮-悬浮
		.back_btn:hover {
		}
	}
	.bread_view {
		:deep(.breadcrumb) {
			.el-breadcrumb__separator {
			}
			.first_breadcrumb {
				.el-breadcrumb__inner {
				}
			}
			.second_breadcrumb {
				.el-breadcrumb__inner {
				}
			}
		}
	}
	// 分类盒子
	.category_view {
		// 分类item
		.category {
		}
		// item-悬浮
		.category:hover {
		}
		// item-选中
		.categoryActive {
		}
	}

	//搜索
	.list_search {
		.search_view {
			.search_label {
			}
			.search_box {
				// 输入框
				:deep(.search_inp) {
					.is-focus {
						box-shadow: none !important;
					}
				}
				// 下拉框
				:deep(.search_sel) {
					//去掉默认样式
					.select-trigger{
						height: 100%;
						.el-input{
							height: 100%;
							.is-focus {
								box-shadow: none !important;
							}
						}
					}
				}
			}
		}
		.search_btn_view {
			// 搜索按钮
			.search_btn {
			}
			// 搜索按钮-悬浮
			.search_btn:hover {
			}
			// 新增按钮
			.add_btn {
			}
			// 新增按钮-悬浮
			.add_btn:hover {
			}
		}
	}

	// 数据盒子
	.page_list {
		//列表
		.data_box {
			.data_view {
				// 表格样式
				.el-table {
					padding: 0;
					background: #fff;
					width: 100%;
					border-color: #eee;
					border-width: 1px 0 0 1px;
					border-style: solid;
					:deep(.el-table__header-wrapper) {
						thead {
							width: 100%;
							tr {
								background: #fff;
								th {
									padding: 10px 0;
									border-color: #eee;
									border-width: 0 1px 1px 0;
									border-style: solid;
									text-align: left;
									.cell {
										padding: 0 10px;
										word-wrap: normal;
										color: #666;
										white-space: normal;
										font-weight: bold;
										display: inline-block;
										vertical-align: middle;
										font-size: 15px;
										line-height: 24px;
										text-overflow: ellipsis;
										word-break: break-all;
										width: 100%;
										position: relative;
										//未选中样式
										.el-checkbox {
											//复选框
											.el-checkbox__inner {
												background: #fff;
												border-color: #999;
											}
										}
										//选中样式
										.is-checked {
											//复选框
											.el-checkbox__inner {
												background: #55ffff;
												border-color: #55ffff;
											}
										}
									}
								}
							}
						}
					}
					:deep(.el-table__body-wrapper) {
						tbody {
							width: 100%;
							tr {
								background: #fff;
								td {
									padding: 10px 0 0;
									color: #666;
									background: #fff;
									border-color: #eee;
									border-width: 0 1px 1px 0;
									border-style: solid;
									text-align: left;
									.cell {
										padding: 0 10px;
										overflow: hidden;
										word-break: break-all;
										white-space: normal;
										line-height: 24px;
										text-overflow: ellipsis;
										//未选中样式
										.el-checkbox {
											//复选框
											.el-checkbox__inner {
												background: #fff;
												border-color: #999;
											}
										}
										//选中样式
										.is-checked {
											//复选框
											.el-checkbox__inner {
												background: #55ffff;
												border-color: #55ffff;
											}
										}
									}
								}
							}
							tr.el-table__row--striped {
								td {
									background: #FAFAFA !important;
								}
							}
							tr:hover {
								td {
									padding: 10px 0 0;
									color: #333;
									background: #f6f6f6;
									border-color: #eee;
									border-width: 0 1px 1px 0;
									border-style: solid;
									text-align: left;
								}
							}
						}
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
			.el-select {
				//去掉默认样式
				.select-trigger{
					height: 100%;
					.el-input{
						height: 100%;
						.is-focus {
							box-shadow: none !important;
						}
					}
				}
			}
		}
		// 跳页
		:deep(.el-pagination__jump) {
			// 输入框
			.el-input {
				.is-focus {
					box-shadow: none !important;
				}
			}
		}
	}
	
	// 热门信息盒子
	.hot_view {
		// 标题
		.hot_title {
		}

		.hot_list {
			// item
			.hot {
				//图片盒子
				.hot_img_view {
					// 图片
					.hot_img {
					}
				}
				// 内容盒子
				.hot_content {
					// 名称
					.hot_text {
					}
				}
			}
		}
	}
</style>