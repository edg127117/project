<template>
	<div>
		<el-dialog modal-class="edit_form_modal" class="edit_form" v-model="formVisible" :title="formTitle" width="80%" destroy-on-close :fullscreen='false'>
			<el-form class="formModel_form" ref="formRef" :model="form" :rules="rules">
				<el-row>
					<el-col :span="12">
						<el-form-item label="报修编号" prop="baoxiubianhao">
							<el-input class="list_inp" v-model="form.baoxiubianhao" :readonly="true" placeholder="报修编号" />
						</el-form-item>
					</el-col>
					<el-col :span="12">
						<el-form-item label="车牌号" prop="chepaihao">
							<el-input class="list_inp" v-model="form.chepaihao" placeholder="车牌号"
                                type="text"
								:readonly="!isAdd||disabledForm.chepaihao?true:false" />
						</el-form-item>
					</el-col>

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
							<el-select
								class="list_sel"
								:disabled="!isAdd||disabledForm.guzhangleixing?true:false"
								v-model="form.guzhangleixing" 
								placeholder="请选择故障类型"
								>
								<el-option v-for="(item,index) in guzhangleixingLists" :label="item"
									:value="item"
									>
								</el-option>
							</el-select>
						</el-form-item>
					</el-col>
					<el-col :span="12">
						<el-form-item label="预约次数" prop="yuyuecishu">
							<el-input class="list_inp" v-model.number="form.yuyuecishu" placeholder="预约次数"
                                type="text"
								:readonly="!isAdd||disabledForm.yuyuecishu?true:false" />
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
						<el-form-item label="报修原因" prop="baoxiuyuanyin">
							<el-input class="list_inp" v-model="form.baoxiuyuanyin" placeholder="报修原因"
                                type="text"
								:readonly="!isAdd||disabledForm.baoxiuyuanyin?true:false" />
						</el-form-item>
					</el-col>

					<el-col :span="12">
						<el-form-item label="预约时间" prop="yuyueshijian">
							<el-date-picker
								class="list_date"
								v-model="form.yuyueshijian"
								format="YYYY-MM-DD HH:mm:ss"
								value-format="YYYY-MM-DD HH:mm:ss"
								type="datetime"
								:readonly="!isAdd||disabledForm.yuyueshijian?true:false"
								placeholder="请选择预约时间" />
						</el-form-item>
					</el-col>
					<el-col :span="12">
						<el-form-item label="分配状态" prop="fenpeizhuangtai">
							<el-select
								class="list_sel"
								:disabled="!isAdd||disabledForm.fenpeizhuangtai?true:false"
								v-model="form.fenpeizhuangtai" 
								placeholder="请选择分配状态"
								>
								<el-option v-for="(item,index) in fenpeizhuangtaiLists" :label="item"
									:value="item"
									>
								</el-option>
							</el-select>
						</el-form-item>
					</el-col>
					<el-col :span="12">
						<el-form-item label="备注" prop="beizhu">
							<el-input class="list_inp" v-model="form.beizhu" placeholder="备注"
                                type="text"
								:readonly="!isAdd||disabledForm.beizhu?true:false" />
						</el-form-item>
					</el-col>

				</el-row>
			</el-form>
			<template #footer v-if="isAdd||type=='logistics'||type=='reply'">
				<span class="formModel_btn_box">
					<el-button class="cancel_btn" @click="closeClick">取消</el-button>
					<el-button class="confirm_btn" type="primary" @click="save"
						>
						提交
					</el-button>
				</span>
			</template>
		</el-dialog>
	</div>
</template>
<script setup>
	import {
		reactive,
		ref,
		getCurrentInstance,
		nextTick,
		computed,
		defineEmits
	} from 'vue'
    import {
        useStore
    } from 'vuex';
    const store = useStore()
    const user = computed(()=>store.getters['user/session'])
	const context = getCurrentInstance()?.appContext.config.globalProperties;	
	const emit = defineEmits(['formModelChange'])
	//基础信息
	const tableName = 'weixiuyuyue'
	const formName = '维修预约'
	//基础信息
	//form表单
	const form = ref({})
	const disabledForm = ref({
        baoxiubianhao : false,
        chepaihao : false,
        chexing : false,
        cheliangpinpai : false,
        cheliangxinghao : false,
        yonghuzhanghao : false,
        yonghuxingming : false,
        guzhangleixing : false,
        yuyuecishu : false,
        baoxiubiaoti : false,
        baoxiuyuanyin : false,
        yuyueshijian : false,
        sfsh : false,
        shhf : false,
        fenpeizhuangtai : false,
        beizhu : false,
	})
	const formVisible = ref(false)
	const isAdd = ref(false)
	const formTitle = ref('')
	//表单验证
	//匹配整数
	const validateIntNumber = (rule, value, callback) => {
		if (!value) {
			callback();
		} else if (!context?.$toolUtil.isIntNumer(value)) {
			callback(new Error("请输入整数"));
		} else {
			callback();
		}
	}
	//匹配数字
	const validateNumber = (rule, value, callback) => {
		if(!value){
			callback();
		} else if (!context?.$toolUtil.isNumber(value)) {
			callback(new Error("请输入数字"));
		} else {
			callback();
		}
	}
	//匹配手机号码
	const validateMobile = (rule, value, callback) => {
		if(!value){
			callback();
		} else if (!context?.$toolUtil.isMobile(value)) {
			callback(new Error("请输入正确的手机号码"));
		} else {
			callback();
		}
	}
	//匹配电话号码
	const validatePhone = (rule, value, callback) => {
		if(!value){
			callback();
		} else if (!context?.$toolUtil.isPhone(value)) {
			callback(new Error("请输入正确的电话号码"));
		} else {
			callback();
		}
	}
	//匹配邮箱
	const validateEmail = (rule, value, callback) => {
		if(!value){
			callback();
		} else if (!context?.$toolUtil.isEmail(value)) {
			callback(new Error("请输入正确的邮箱地址"));
		} else {
			callback();
		}
	}
	//匹配身份证
	const validateIdCard = (rule, value, callback) => {
		if(!value){
			callback();
		} else if (!context?.$toolUtil.checkIdCard(value)) {
			callback(new Error("请输入正确的身份证号码"));
		} else {
			callback();
		}
	}
	//匹配网站地址
	const validateUrl = (rule, value, callback) => {
		if(!value){
			callback();
		} else if (!context?.$toolUtil.isURL(value)) {
			callback(new Error("请输入正确的URL地址"));
		} else {
			callback();
		}
	}
	const rules = ref({
		baoxiubianhao: [
		],
		chepaihao: [
		],
		chexing: [
		],
		cheliangpinpai: [
		],
		cheliangxinghao: [
		],
		yonghuzhanghao: [
		],
		yonghuxingming: [
		],
		guzhangleixing: [
		],
		yuyuecishu: [
			{ validator: validateIntNumber, trigger: 'blur' },
		],
		baoxiubiaoti: [
		],
		baoxiuyuanyin: [
		],
		yuyueshijian: [
		],
		sfsh: [
		],
		shhf: [
		],
		fenpeizhuangtai: [
		],
		beizhu: [
		],
	})
	//表单验证
	
	const formRef = ref(null)
	const id = ref(0)
	const type = ref('')
	//故障类型列表
	const guzhangleixingLists = ref([])
	//分配状态列表
	const fenpeizhuangtaiLists = ref([])

	//获取唯一标识
	const getUUID =()=> {
      return new Date().getTime();
    }
	//重置
	const resetForm = () => {
		form.value = {
			baoxiubianhao: getUUID(),
			chepaihao: '',
			chexing: '',
			cheliangpinpai: '',
			cheliangxinghao: '',
			yonghuzhanghao: '',
			yonghuxingming: '',
			guzhangleixing: '',
			yuyuecishu: '1',
			baoxiubiaoti: '',
			baoxiuyuanyin: '',
			yuyueshijian: '',
			sfsh: '待审核',
			shhf: '',
			fenpeizhuangtai: '未分配',
			beizhu: '',
		}
	}
	//获取info
	const getInfo = ()=>{
		context?.$http({
			url: `${tableName}/info/${id.value}`,
			method: 'get'
		}).then(res => {
			let reg=new RegExp('../../../file','g')
			form.value = res.data.data
			formVisible.value = true
		})
	}
	const crossRow = ref('')
	const crossTable = ref('')
	const crossTips = ref('')
	const crossColumnName = ref('')
	const crossColumnValue = ref('')
	//初始化
	const init=(formId=null,formType='add',formNames='',row=null,table=null,statusColumnName=null,tips=null,statusColumnValue=null)=>{
		resetForm()
			form.value.yuyueshijian = context?.$toolUtil.getCurDateTime()
		if(formId){
			id.value = formId
			type.value = formType
		}
		if(formType == 'add'){
			isAdd.value = true
			formTitle.value = '新增' + formName
			formVisible.value = true
		}else if(formType == 'info'){
			isAdd.value = false
			formTitle.value = '查看' + formName
			getInfo()
		}else if(formType == 'edit'){
			isAdd.value = true
			formTitle.value = '修改' + formName
			getInfo()
		}
		else if(formType == 'cross'){
			isAdd.value = true
			formTitle.value = formNames
			// getInfo()
			for(let x in row){
				if(x=='baoxiubianhao'){
					form.value.baoxiubianhao = row[x];
					disabledForm.value.baoxiubianhao = true;
					continue;
				}
				if(x=='chepaihao'){
					form.value.chepaihao = row[x];
					disabledForm.value.chepaihao = true;
					continue;
				}
				if(x=='chexing'){
					form.value.chexing = row[x];
					disabledForm.value.chexing = true;
					continue;
				}
				if(x=='cheliangpinpai'){
					form.value.cheliangpinpai = row[x];
					disabledForm.value.cheliangpinpai = true;
					continue;
				}
				if(x=='cheliangxinghao'){
					form.value.cheliangxinghao = row[x];
					disabledForm.value.cheliangxinghao = true;
					continue;
				}
				if(x=='yonghuzhanghao'){
					form.value.yonghuzhanghao = row[x];
					disabledForm.value.yonghuzhanghao = true;
					continue;
				}
				if(x=='yonghuxingming'){
					form.value.yonghuxingming = row[x];
					disabledForm.value.yonghuxingming = true;
					continue;
				}
				if(x=='guzhangleixing'){
					form.value.guzhangleixing = row[x];
					disabledForm.value.guzhangleixing = true;
					continue;
				}
				if(x=='yuyuecishu'){
					form.value.yuyuecishu = row[x];
					disabledForm.value.yuyuecishu = true;
					continue;
				}
				if(x=='baoxiubiaoti'){
					form.value.baoxiubiaoti = row[x];
					disabledForm.value.baoxiubiaoti = true;
					continue;
				}
				if(x=='baoxiuyuanyin'){
					form.value.baoxiuyuanyin = row[x];
					disabledForm.value.baoxiuyuanyin = true;
					continue;
				}
				if(x=='yuyueshijian'){
					form.value.yuyueshijian = row[x];
					disabledForm.value.yuyueshijian = true;
					continue;
				}
				if(x=='fenpeizhuangtai'){
					form.value.fenpeizhuangtai = row[x];
					disabledForm.value.fenpeizhuangtai = true;
					continue;
				}
				if(x=='beizhu'){
					form.value.beizhu = row[x];
					disabledForm.value.beizhu = true;
					continue;
				}
			}
			if(row){
				crossRow.value = row
			}
			if(table){
				crossTable.value = table
			}
			if(tips){
				crossTips.value = tips
			}
			if(statusColumnName){
				crossColumnName.value = statusColumnName
			}
			if(statusColumnValue){
				crossColumnValue.value = statusColumnValue
			}
			form.value.yuyuecishu='1'
			form.value.sfsh='待审核'
			form.value.fenpeizhuangtai='未分配'
			formVisible.value = true
		}

		context?.$http({
			url: `${context?.$toolUtil.storageGet('sessionTable')}/session`,
			method: 'get'
		}).then(res => {
			var json = res.data.data
			if(context?.$toolUtil.storageGet("role")!="管理员" && !context?.$toolUtil.storageGet("isAdmin")) {
				disabledForm.value.yuyuecishu = true;
			}
		})
		context?.$http({
			url: `option/guzhangleixing/guzhangleixing`,
			method: 'get'
		}).then(res=>{
			guzhangleixingLists.value = res.data.data
		})
		fenpeizhuangtaiLists.value = "已分配,未分配".split(',')
	}
	//初始化
	//声明父级调用
	defineExpose({
		init
	})
	//关闭
	const closeClick = () => {
		formVisible.value = false
	}
	//富文本
	const editorChange = (e,name) =>{
		form.value[name] = e
	}
	//提交
	const save= async ()=>{
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
					//修改跨表数据
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
						page: 1,
						limit: 1000, 
						crossuserid:form.value.crossuserid,
						crossrefid:form.value.crossrefid,
					}
					context?.$http({
						url: `${tableName}/page`,
						method: 'get', 
						params: params 
					}).then(res=>{
						if(res.data.data.total>=crossOptNum){
							context?.$toolUtil.message(`${crossTips.value}`,'error')
							return false
						}else{
							context?.$http({
								url: `${tableName}/${!form.value.id ? "save" : "update"}`,
								method: 'post', 
								data: form.value 
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
						method: 'post', 
						data: form.value 
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
	//修改跨表数据
	const changeCrossData = async (row)=>{
        if(type.value == 'cross'){
            await context?.$http({
                url: `${crossTable.value}/update`,
                method: 'post',
                data: row
            }).then(res=>{})
        }
	}
</script>
<style lang="scss" scoped>
	// 表单
	.formModel_form{
		// form item
		:deep(.el-form-item) {
			//label
			.el-form-item__label {
			}
			// 内容盒子
			.el-form-item__content {
				// 输入框
				.list_inp {
				}
				//日期选择器
				.list_date {
				}
				// 下拉框
				.list_sel {
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
	}
	// 按钮盒子
	.formModel_btn_box {
		.cancel_btn {
		}
		.cancel_btn:hover {
		}
		
		.confirm_btn {
		}
		.confirm_btn:hover {
		}
	}
</style>
