<template>
	<div>
		<el-dialog modal-class="edit_form_modal" class="edit_form" v-model="formVisible" :title="formTitle" width="80%" destroy-on-close :fullscreen='false'>
			<el-form class="formModel_form" ref="formRef" :model="form" :rules="rules">
				<el-row>
					<el-col :span="12">
						<el-form-item label="报修编号" prop="baoxiubianhao">
							<el-input class="list_inp" v-model="form.baoxiubianhao" placeholder="报修编号"
								type="text"
								:readonly="!isAdd||disabledForm.baoxiubianhao?true:false" />
						</el-form-item>
					</el-col>
					<el-col :span="12">
						<el-form-item label="车牌号" prop="chepaihao">
							<el-input class="list_inp" v-model="form.chepaihao" placeholder="车牌号"
								type="text"
								:readonly="!isAdd||disabledForm.chepaihao?true:false" />
						</el-form-item>
					</el-col>
                    <!-- ... 中间字段保持不变 ... -->
					<el-col :span="12">
						<el-form-item label="车型" prop="chexing">
							<el-input class="list_inp" v-model="form.chexing" placeholder="车型"
								type="text"
								:readonly="!isAdd||disabledForm.chexing?true:false" />
						</el-form-item>
					</el-col>
					<el-col :span="12">
						<el-form-item label="车辆品牌" prop="cheliangpinpai">
							<el-input class="list_inp" v-model="form.cheliangpinpai" placeholder="车辆品牌"
								type="text"
								:readonly="!isAdd||disabledForm.cheliangpinpai?true:false" />
						</el-form-item>
					</el-col>
					<el-col :span="12">
						<el-form-item label="车辆型号" prop="cheliangxinghao">
							<el-input class="list_inp" v-model="form.cheliangxinghao" placeholder="车辆型号"
								type="text"
								:readonly="!isAdd||disabledForm.cheliangxinghao?true:false" />
						</el-form-item>
					</el-col>
					<el-col :span="12">
						<el-form-item label="用户账号" prop="yonghuzhanghao">
							<el-input class="list_inp" v-model="form.yonghuzhanghao" placeholder="用户账号"
								type="text"
								:readonly="!isAdd||disabledForm.yonghuzhanghao?true:false" />
						</el-form-item>
					</el-col>
					<el-col :span="12">
						<el-form-item label="用户姓名" prop="yonghuxingming">
							<el-input class="list_inp" v-model="form.yonghuxingming" placeholder="用户姓名"
								type="text"
								:readonly="!isAdd||disabledForm.yonghuxingming?true:false" />
						</el-form-item>
					</el-col>
					<el-col :span="12">
						<el-form-item label="故障类型" prop="guzhangleixing">
							<el-input class="list_inp" v-model="form.guzhangleixing" placeholder="故障类型"
								type="text"
								:readonly="!isAdd||disabledForm.guzhangleixing?true:false" />
						</el-form-item>
					</el-col>
					<el-col :span="12">
						<el-form-item label="报修标题" prop="baoxiubiaoti">
							<el-input class="list_inp" v-model="form.baoxiubiaoti" placeholder="报修标题"
								type="text"
								:readonly="!isAdd||disabledForm.baoxiubiaoti?true:false" />
						</el-form-item>
					</el-col>
					<el-col :span="12">
						<el-form-item label="分配时间" prop="fenpeishijian">
							<el-date-picker
								class="list_date"
								v-model="form.fenpeishijian"
								format="YYYY-MM-DD HH:mm:ss"
								value-format="YYYY-MM-DD HH:mm:ss"
								type="datetime"
								:readonly="!isAdd||disabledForm.fenpeishijian?true:false"
								placeholder="请选择分配时间" />
						</el-form-item>
					</el-col>

                    <!-- 🔥 派单核心：下拉选维修员 -->
					<el-col :span="12">
						<el-form-item label="维修账号" prop="weixiuzhanghao">
                            <!-- 如果是新增状态，显示下拉框 -->
                            <el-select
                                v-if="isAdd && !disabledForm.weixiuzhanghao"
								class="list_sel"
								v-model="form.weixiuzhanghao" 
								placeholder="请指派维修员"
								@change="weixiuzhanghaoChange">
								<el-option v-for="(item,index) in weixiuzhanghaoLists" :label="item.weixiuxingming+' ('+item.weixiuzhanghao+')'" :value="item.weixiuzhanghao"></el-option>
							</el-select>
                            <!-- 否则显示只读框 -->
							<el-input v-else class="list_inp" v-model="form.weixiuzhanghao" placeholder="维修账号" type="text" readonly />
						</el-form-item>
					</el-col>

					<el-col :span="12">
						<el-form-item label="维修姓名" prop="weixiuxingming">
							<el-input class="list_inp" v-model="form.weixiuxingming" placeholder="维修姓名"
								type="text"
								readonly /> <!-- 强制只读 -->
						</el-form-item>
					</el-col>

					<el-col :span="12">
						<el-form-item label="维修状态" prop="weixiuzhuangtai">
							<el-select
								class="list_sel"
								:disabled="!isAdd||disabledForm.weixiuzhuangtai?true:false"
								v-model="form.weixiuzhuangtai" 
								placeholder="请选择维修状态"
								>
								<el-option v-for="(item,index) in weixiuzhuangtaiLists" :label="item" :value="item"></el-option>
							</el-select>
						</el-form-item>
					</el-col>
					<el-col :span="12">
						<el-form-item label="报修原因" prop="baoxiuyuanyin">
							<el-input v-model="form.baoxiuyuanyin" placeholder="报修原因" type="textarea"
							:readonly="!isAdd||disabledForm.baoxiuyuanyin?true:false"
							/>
						</el-form-item>
					</el-col>
				</el-row>
			</el-form>
			<template #footer v-if="isAdd||type=='logistics'||type=='reply'">
				<span class="formModel_btn_box">
					<el-button class="cancel_btn" @click="closeClick">取消</el-button>
					<el-button class="confirm_btn" type="primary" @click="save">提交</el-button>
				</span>
			</template>
		</el-dialog>
	</div>
</template>
<script setup>
	import { ref, getCurrentInstance, computed, defineEmits, defineExpose } from 'vue'
	import { useStore } from 'vuex';
	const store = useStore()
	const user = computed(()=>store.getters['user/session'])
	const context = getCurrentInstance()?.appContext.config.globalProperties; 	
	const emit = defineEmits(['formModelChange'])
	const tableName = 'weixiufenpei'
	const formName = '维修分配'
	
    // ... 验证规则保持原样 ...
    //匹配整数
    const validateIntNumber = (rule, value, callback) => {
		if (!value) { callback(); } else if (!context?.$toolUtil.isIntNumer(value)) { callback(new Error("请输入整数")); } else { callback(); }
	}
    //匹配数字
	const validateNumber = (rule, value, callback) => {
		if(!value){ callback(); } else if (!context?.$toolUtil.isNumber(value)) { callback(new Error("请输入数字")); } else { callback(); }
	}

    // 保留原有的 rules，只为维修账号加上必填
	const rules = ref({
		baoxiubianhao: [], chepaihao: [], chexing: [], cheliangpinpai: [], cheliangxinghao: [],
		yonghuzhanghao: [], yonghuxingming: [], guzhangleixing: [], baoxiubiaoti: [], baoxiuyuanyin: [],
		fenpeishijian: [], weixiuxingming: [], weixiuzhuangtai: [],
		weixiuzhanghao: [{ required: true, message: '请选择维修员', trigger: 'change' }],
	})
	
	const form = ref({})
	const disabledForm = ref({
		baoxiubianhao : false, chepaihao : false, chexing : false, cheliangpinpai : false, cheliangxinghao : false,
		yonghuzhanghao : false, yonghuxingming : false, guzhangleixing : false, baoxiubiaoti : false, baoxiuyuanyin : false,
		fenpeishijian : false, weixiuzhanghao : false, weixiuxingming : false, weixiuzhuangtai : false,
	})
	const formVisible = ref(false)
	const isAdd = ref(false)
	const formTitle = ref('')
	const formRef = ref(null)
	const id = ref(0)
	const type = ref('')
	const weixiuzhanghaoLists = ref([])
	const weixiuzhuangtaiLists = ref([])

	const resetForm = () => {
		form.value = {
			baoxiubianhao: '', chepaihao: '', chexing: '', cheliangpinpai: '', cheliangxinghao: '',
			yonghuzhanghao: '', yonghuxingming: '', guzhangleixing: '', baoxiubiaoti: '', baoxiuyuanyin: '',
			fenpeishijian: '', weixiuzhanghao: '', weixiuxingming: '',
			weixiuzhuangtai: '待维修', // 默认为待维修
		}
	}
    
    // 🔥 联动逻辑：选账号填姓名
    const weixiuzhanghaoChange = (val) => {
        let obj = weixiuzhanghaoLists.value.find(item => item.weixiuzhanghao === val)
        if(obj) form.value.weixiuxingming = obj.weixiuxingming
    }

	const getInfo = ()=>{
		context?.$http({ url: `${tableName}/info/${id.value}`, method: 'get' }).then(res => {
			form.value = res.data.data
			formVisible.value = true
		})
	}
    
    // 原有的 cross 变量保持
    const crossRow = ref('')
	const crossTable = ref('')
	const crossTips = ref('')
	const crossColumnName = ref('')
	const crossColumnValue = ref('')

	const init=(formId=null,formType='add',formNames='',row=null,table=null,statusColumnName=null,tips=null,statusColumnValue=null)=>{
		resetForm()
		form.value.fenpeishijian = context?.$toolUtil.getCurDateTime()
		if(formId){ id.value = formId; type.value = formType }
		if(formType == 'add'){ isAdd.value = true; formTitle.value = '新增' + formName; formVisible.value = true }
		else if(formType == 'info'){ isAdd.value = false; formTitle.value = '查看' + formName; getInfo() }
		else if(formType == 'edit'){ isAdd.value = true; formTitle.value = '修改' + formName; getInfo() }
		else if(formType == 'cross'){
			isAdd.value = true
			formTitle.value = formNames
			for(let x in row){
                // ... 保持原有 cross 赋值逻辑，此处简略，实际代码中需保留 ...
				if(x=='baoxiubianhao'){ form.value.baoxiubianhao = row[x]; disabledForm.value.baoxiubianhao = true; continue; }
				if(x=='chepaihao'){ form.value.chepaihao = row[x]; disabledForm.value.chepaihao = true; continue; }
				if(x=='chexing'){ form.value.chexing = row[x]; disabledForm.value.chexing = true; continue; }
				if(x=='cheliangpinpai'){ form.value.cheliangpinpai = row[x]; disabledForm.value.cheliangpinpai = true; continue; }
				if(x=='cheliangxinghao'){ form.value.cheliangxinghao = row[x]; disabledForm.value.cheliangxinghao = true; continue; }
				if(x=='yonghuzhanghao'){ form.value.yonghuzhanghao = row[x]; disabledForm.value.yonghuzhanghao = true; continue; }
				if(x=='yonghuxingming'){ form.value.yonghuxingming = row[x]; disabledForm.value.yonghuxingming = true; continue; }
				if(x=='guzhangleixing'){ form.value.guzhangleixing = row[x]; disabledForm.value.guzhangleixing = true; continue; }
				if(x=='baoxiubiaoti'){ form.value.baoxiubiaoti = row[x]; disabledForm.value.baoxiubiaoti = true; continue; }
				if(x=='baoxiuyuanyin'){ form.value.baoxiuyuanyin = row[x]; disabledForm.value.baoxiuyuanyin = true; continue; }
				if(x=='fenpeishijian'){ form.value.fenpeishijian = row[x]; disabledForm.value.fenpeishijian = true; continue; }
			}
            if(row) crossRow.value = row
            if(table) crossTable.value = table
            if(tips) crossTips.value = tips
            if(statusColumnName) crossColumnName.value = statusColumnName
            if(statusColumnValue) crossColumnValue.value = statusColumnValue
            form.value.weixiuzhuangtai='待维修'
            formVisible.value = true
		}
        
        // 🔥 注入：获取维修员列表
		context?.$http({ url: `weixiuyuan/list`, method: 'get' }).then(res=>{ weixiuzhanghaoLists.value = res.data.data })
        
		disabledForm.value.weixiuxingming = true;
		weixiuzhuangtaiLists.value = "已维修,维修中,待维修".split(',')
	}
	defineExpose({ init })
	const closeClick = () => { formVisible.value = false }
	const save= async ()=>{
        // ... 保持原有 save 逻辑 ...
		var table = crossTable.value
		var objcross = JSON.parse(JSON.stringify(crossRow.value))
		let crossUserId = ''
		let crossRefId = ''
		let crossOptNum = ''
		if(type.value == 'cross'){
			if(crossColumnName.value!=''){
				if(!crossColumnName.value.startsWith('[')){
					for(let o in objcross){
						if(o == crossColumnName.value){
							objcross[o] = crossColumnValue.value
						}
					}
					changeCrossData(objcross)
				}else{
					crossUserId = user.value.id
					crossRefId = objcross['id']
					crossOptNum = crossColumnName.value.replace(/\[/,"").replace(/\]/,"")
				}
			}
		}
		formRef.value.validate((valid)=>{
			if(valid){
				if(crossUserId&&crossRefId){
					form.value.crossuserid = crossUserId
					form.value.crossrefid = crossRefId
					let params = {
						page: 1, limit: 1000, crossuserid:form.value.crossuserid, crossrefid:form.value.crossrefid,
					}
					context?.$http({ url: `${tableName}/page`, method: 'get', params: params }).then(res=>{
						if(res.data.data.total>=crossOptNum){
							context?.$toolUtil.message(`${crossTips.value}`,'error')
							return false
						}else{
							context?.$http({
								url: `${tableName}/${!form.value.id ? "save" : "update"}`,
								method: 'post', data: form.value 
							}).then(async res=>{
								emit('formModelChange')
								context?.$toolUtil.message(`操作成功`,'success')
								formVisible.value = false
							})
						}
					})
				}else{
					context?.$http({
						url: `${tableName}/${!form.value.id ? "save" : "update"}`,
						method: 'post', data: form.value 
					}).then(async (res)=>{
						emit('formModelChange')
						context?.$toolUtil.message(`操作成功`,'success')
						formVisible.value = false
					})
				}
			}else{
				context.$message.error('请完善信息')
			}
		})
	}
	const changeCrossData = async (row)=>{
		if(type.value == 'cross'){
			await context?.$http({ url: `${crossTable.value}/update`, method: 'post', data: row }).then(res=>{})
		}
	}
</script>
<style lang="scss" scoped>
    /* 原样式保持不变 */
	.formModel_form{
		:deep(.el-form-item) {
			.el-form-item__label { }
			.el-form-item__content {
				.list_inp { }
				.list_date { }
				.list_sel { .select-trigger{ height: 100%; .el-input{ height: 100%; } } }
				.el-textarea__inner { }
			}
		}
	}
	.formModel_btn_box {
		.cancel_btn { } .cancel_btn:hover { } .confirm_btn { } .confirm_btn:hover { }
	}
</style>