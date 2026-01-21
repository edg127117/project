<template>
	<div class="main-content">
		<div class="center_view">
			<div class="list_search_view">
				<el-form :inline="true" :model="searchForm" class="search_form">
					<el-form-item label="配件名称">
						<el-input v-model="searchForm.peijianmingcheng" placeholder="配件名称" clearable></el-input>
					</el-form-item>
					<el-form-item>
						<el-button class="search_btn" type="primary" @click="searchClick">查询</el-button>
						<el-button class="reset_btn" @click="resetClick">重置</el-button>
					</el-form-item>
				</el-form>
				<div class="btn_view">
					<el-button class="add_btn" type="success" @click="addClick" v-if="btnAuth('peijian','新增')">新增</el-button>
					<el-button class="del_btn" type="danger" :disabled="selRows.length==0" @click="delClick()" v-if="btnAuth('peijian','删除')">批量删除</el-button>
				</div>
			</div>

			<div class="list_table_view">
				<el-table 
					:data="tableData" 
					border 
					style="width: 100%" 
					@selection-change="handleSelectionChange"
					:header-cell-style="{'background':'#f5f7fa','color':'#606266','fontWeight':'500','textAlign':'center'}"
					:cell-style="{'textAlign':'center','verticalAlign':'middle'}">
					
					<el-table-column type="selection" width="55" align="center"></el-table-column>
					<el-table-column type="index" label="序号" width="60" align="center"></el-table-column>
					<el-table-column prop="peijianmingcheng" label="配件名称" align="center"></el-table-column>
					
					<el-table-column label="图片" width="100" align="center">
						<template #default="scope">
							<div v-if="scope.row.tupian">
								<el-image class="list_img" :src="scope.row.tupian.split(',')[0].startsWith('http') ? scope.row.tupian.split(',')[0] : context.$config.url + scope.row.tupian.split(',')[0]" :preview-src-list="[scope.row.tupian.split(',')[0].startsWith('http') ? scope.row.tupian.split(',')[0] : context.$config.url + scope.row.tupian.split(',')[0]]" fit="cover"></el-image>
							</div>
							<div v-else>无</div>
						</template>
					</el-table-column>
					
					<el-table-column prop="peijianleixing" label="类型" align="center"></el-table-column>
					
					<!-- 库存预警逻辑 -->
					<el-table-column prop="shuliang" label="库存" align="center" sortable>
						<template #default="scope">
							<span v-if="scope.row.shuliang < 10" style="color: red; font-weight: bold;">
                                {{ scope.row.shuliang }} (库存不足)
                            </span>
							<span v-else style="color: green;">{{ scope.row.shuliang }}</span>
						</template>
					</el-table-column>
					
					<el-table-column prop="danjia" label="单价" align="center"></el-table-column>
					
					<el-table-column label="操作" width="280" align="center" fixed="right">
						<template #default="scope">
                            <!-- 新增的出入库按钮 -->
                            <el-button type="primary" size="small" plain @click="stockClick(scope.row, '入库')">入库</el-button>
                            <el-button type="warning" size="small" plain @click="stockClick(scope.row, '出库')">出库</el-button>
                            
							<el-button class="edit_btn" type="text" size="small" @click="editClick(scope.row.id)" v-if="btnAuth('peijian','修改')">修改</el-button>
							<el-button class="del_btn" type="text" size="small" @click="delClick(scope.row.id)" v-if="btnAuth('peijian','删除')">删除</el-button>
						</template>
					</el-table-column>
				</el-table>
			</div>

			<el-pagination background class="pagination_view" @current-change="handleCurrentChange" :current-page="pageIndex" :page-size="pageSize" :total="total" layout="total, prev, pager, next, jumper"></el-pagination>
		</div>

		<formModel ref="formRef" @formModelChange="getList"></formModel>
        <!-- 引入库存操作弹窗 -->
        <stockModel ref="stockRef" @updateSuccess="getList"></stockModel>
	</div>
</template>

<script setup>
import { ref, getCurrentInstance, nextTick } from 'vue'
import formModel from './formModel.vue'
import stockModel from './stockModel.vue'

const context = getCurrentInstance()?.appContext.config.globalProperties;
const tableData = ref([])
const total = ref(0)
const pageIndex = ref(1)
const pageSize = ref(10)
const searchForm = ref({ peijianmingcheng: '' })
const selRows = ref([])
const formRef = ref(null)
const stockRef = ref(null) // 库存弹窗引用

const btnAuth = (table, btn) => { return context?.$toolUtil.isAuth(table, btn); }

const getList = () => {
	context.$http({
		url: 'peijian/page',
		method: 'get',
		params: {
			page: pageIndex.value,
			limit: pageSize.value,
			peijianmingcheng: searchForm.value.peijianmingcheng
		}
	}).then(res => {
		if (res.data && res.data.code === 0) {
			tableData.value = res.data.data.list;
			total.value = res.data.data.total;
		}
	})
}

const searchClick = () => { pageIndex.value = 1; getList(); }
const resetClick = () => { searchForm.value = { peijianmingcheng: '' }; getList(); }
const addClick = () => { nextTick(() => { formRef.value.init() }) }
const editClick = (id) => { nextTick(() => { formRef.value.init(id) }) }

// 打开出入库弹窗
const stockClick = (row, type) => {
    nextTick(() => {
        stockRef.value.init(row, type);
    })
}

const delClick = (id) => {
	let ids = id ? [id] : selRows.value.map(item => item.id);
	context.$confirm(`确定进行删除操作吗?`, "提示", { confirmButtonText: "确定", cancelButtonText: "取消", type: "warning" }).then(() => {
		context.$http({ url: 'peijian/delete', method: 'post', data: ids }).then(res => {
			if (res.data.code === 0) {
				context.$toolUtil.message('操作成功', 'success');
				getList();
			}
		})
	})
}

const handleSelectionChange = (val) => { selRows.value = val; }
const handleCurrentChange = (val) => { pageIndex.value = val; getList(); }

getList()
</script>

<style scoped lang="scss">
.main-content { padding: 20px; background: #f0f2f5; min-height: 100vh; }
.center_view { background: #fff; padding: 24px; border-radius: 4px; }
.list_search_view { display: flex; justify-content: space-between; align-items: center; margin-bottom: 20px;
	.search_form .el-form-item { margin-bottom: 0; }
	.btn_view .el-button { margin-left: 10px; }
}
.list_img { width: 80px; height: 80px; border-radius: 4px; border: 1px solid #eee; }
.pagination_view { margin-top: 20px; display: flex; justify-content: flex-end; }
.edit_btn { color: #409EFF; }
.del_btn { color: #F56C6C; }
</style>