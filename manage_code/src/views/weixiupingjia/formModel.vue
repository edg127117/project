<template>
	<div>
		<el-dialog modal-class="edit_form_modal" class="edit_form" v-model="formVisible" :title="formTitle" width="80%" destroy-on-close :fullscreen='false'>
			<el-form class="formModel_form" ref="formRef" :model="form" :rules="rules">
				<el-row>
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
						<el-form-item label="报修标题" prop="baoxiubiaoti">
							<el-input class="list_inp" v-model="form.baoxiubiaoti" placeholder="报修标题"
                                type="text"
								:readonly="!isAdd||disabledForm.baoxiubiaoti?true:false" />
						</el-form-item>
					</el-col>

					<el-col :span="12">
						<el-form-item label="维修账号" prop="weixiuzhanghao">
							<el-input class="list_inp" v-model="form.weixiuzhanghao" placeholder="维修账号"
                                type="text"
								:readonly="!isAdd||disabledForm.weixiuzhanghao?true:false" />
						</el-form-item>
					</el-col>

					<el-col :span="12">
						<el-form-item label="维修姓名" prop="weixiuxingming">
							<el-input class="list_inp" v-model="form.weixiuxingming" placeholder="维修姓名"
                                type="text"
								:readonly="!isAdd||disabledForm.weixiuxingming?true:false" />
						</el-form-item>
					</el-col>

					<el-col :span="12">
						<el-form-item label="评分" prop="pingfen">
							<el-select
								class="list_sel"
								:disabled="!isAdd||disabledForm.pingfen?true:false"
								v-model="form.pingfen" 
								placeholder="请选择评分"
								>
								<el-option v-for="(item,index) in pingfenLists" :label="item"
									:value="item"
									>
								</el-option>
							</el-select>
						</el-form-item>
					</el-col>
					<el-col :span="12">
						<el-form-item label="评价时间" prop="pingjiashijian">
							<el-date-picker
								class="list_date"
								v-model="form.pingjiashijian"
								format="YYYY-MM-DD HH:mm:ss"
								value-format="YYYY-MM-DD HH:mm:ss"
								type="datetime"
								:readonly="!isAdd||disabledForm.pingjiashijian?true:false"
								placeholder="请选择评价时间" />
						</el-form-item>
					</el-col>
					<el-col :span="12">
						<el-form-item label="评语" prop="pingyu">
							<el-input v-model="form.pingyu" placeholder="评语" type="textarea"
							:readonly="!isAdd||disabledForm.pingyu?true:false"
							/>
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
	const tableName = 'weixiupingjia'
	const formName = '维修评价'
	//基础信息
	//form表单
	const form = ref({})
	const disabledForm = ref({
        chepaihao : false,
        chexing : false,
        cheliangpinpai : false,
        cheliangxinghao : false,
        yonghuzhanghao : false,
        yonghuxingming : false,
        baoxiubiaoti : false,
        weixiuzhanghao : false,
        weixiuxingming : false,
        pingfen : false,
        pingyu : false,
        pingjiashijian : false,
        crossuserid : false,
        crossrefid : false,
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
		baoxiubiaoti: [
		],
		weixiuzhanghao: [
		],
		weixiuxingming: [
		],
		pingfen: [
		],
		pingyu: [
		],
		pingjiashijian: [
		],
		crossuserid: [
		],
		crossrefid: [
		],
	})
	//表单验证
	
	const formRef = ref(null)
	const id = ref(0)
	const type = ref('')
	//评分列表
	const pingfenLists = ref([])

	//获取唯一标识
	const getUUID =()=> {
      return new Date().getTime();
    }
	//重置
	const resetForm = () => {
		form.value = {
			chepaihao: '',
			chexing: '',
			cheliangpinpai: '',
			cheliangxinghao: '',
			yonghuzhanghao: '',
			yonghuxingming: '',
			baoxiubiaoti: '',
			weixiuzhanghao: '',
			weixiuxingming: '',
			pingfen: '',
			pingyu: '',
			pingjiashijian: '',
			crossuserid: '',
			crossrefid: '',
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
			form.value.pingjiashijian = context?.$toolUtil.getCurDateTime()
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
				if(x=='baoxiubiaoti'){
					form.value.baoxiubiaoti = row[x];
					disabledForm.value.baoxiubiaoti = true;
					continue;
				}
				if(x=='weixiuzhanghao'){
					form.value.weixiuzhanghao = row[x];
					disabledForm.value.weixiuzhanghao = true;
					continue;
				}
				if(x=='weixiuxingming'){
					form.value.weixiuxingming = row[x];
					disabledForm.value.weixiuxingming = true;
					continue;
				}
				if(x=='pingfen'){
					form.value.pingfen = row[x];
					disabledForm.value.pingfen = true;
					continue;
				}
				if(x=='pingyu'){
					form.value.pingyu = row[x];
					disabledForm.value.pingyu = true;
					continue;
				}
				if(x=='pingjiashijian'){
					form.value.pingjiashijian = row[x];
					disabledForm.value.pingjiashijian = true;
					continue;
				}
				if(x=='crossuserid'){
					form.value.crossuserid = row[x];
					disabledForm.value.crossuserid = true;
					continue;
				}
				if(x=='crossrefid'){
					form.value.crossrefid = row[x];
					disabledForm.value.crossrefid = true;
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
			formVisible.value = true
		}

		context?.$http({
			url: `${context?.$toolUtil.storageGet('sessionTable')}/session`,
			method: 'get'
		}).then(res => {
			var json = res.data.data
			if(json.hasOwnProperty('weixiuzhanghao')&& context?.$toolUtil.storageGet("role")!="管理员"){
				form.value.weixiuzhanghao = json.weixiuzhanghao
				disabledForm.value.weixiuzhanghao = true;
			}
			if(json.hasOwnProperty('weixiuxingming')&& context?.$toolUtil.storageGet("role")!="管理员"){
				form.value.weixiuxingming = json.weixiuxingming
				disabledForm.value.weixiuxingming = true;
			}
		})
		pingfenLists.value = "1,2,3,4,5".split(',')
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
				// 长文本
				.el-textarea__inner {
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
