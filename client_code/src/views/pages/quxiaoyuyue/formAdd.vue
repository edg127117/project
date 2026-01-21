
<template>
	<div class="edit_view" :style='{}'>
        <div class="breadcrumb-wrapper" style="width: 100%;">
            <div class="bread_view">
                <el-breadcrumb separator="/" class="breadcrumb">
                    <el-breadcrumb-item class="first_breadcrumb" :to="{ path: '/' }">首页</el-breadcrumb-item>
                    <el-breadcrumb-item class="second_breadcrumb" v-for="(item,index) in breadList" :key="index">{{item.name}}</el-breadcrumb-item>
                </el-breadcrumb>
            </div>
        </div>
		<el-form ref="formRef" :model="form" class="add_form" label-width="120px" :rules="rules">
			<el-row>
				<el-col :span="24">
					<el-form-item label="报修编号" prop="baoxiubianhao">
						<el-input class="list_inp" v-model="form.baoxiubianhao" placeholder="报修编号"
							 type="text" 							:readonly="!isAdd||disabledForm.baoxiubianhao?true:false" />
					</el-form-item>
				</el-col>

				<el-col :span="24">
					<el-form-item label="车牌号" prop="chepaihao">
						<el-input class="list_inp" v-model="form.chepaihao" placeholder="车牌号"
							 type="text" 							:readonly="!isAdd||disabledForm.chepaihao?true:false" />
					</el-form-item>
				</el-col>

				<el-col :span="24">
					<el-form-item label="车型" prop="chexing">
						<el-input class="list_inp" v-model="form.chexing" placeholder="车型"
							 type="text" 							:readonly="!isAdd||disabledForm.chexing?true:false" />
					</el-form-item>
				</el-col>

				<el-col :span="24">
					<el-form-item label="车辆品牌" prop="cheliangpinpai">
						<el-input class="list_inp" v-model="form.cheliangpinpai" placeholder="车辆品牌"
							 type="text" 							:readonly="!isAdd||disabledForm.cheliangpinpai?true:false" />
					</el-form-item>
				</el-col>

				<el-col :span="24">
					<el-form-item label="车辆型号" prop="cheliangxinghao">
						<el-input class="list_inp" v-model="form.cheliangxinghao" placeholder="车辆型号"
							 type="text" 							:readonly="!isAdd||disabledForm.cheliangxinghao?true:false" />
					</el-form-item>
				</el-col>

				<el-col :span="24">
					<el-form-item label="用户账号" prop="yonghuzhanghao">
						<el-input class="list_inp" v-model="form.yonghuzhanghao" placeholder="用户账号"
							 type="text" 							:readonly="!isAdd||disabledForm.yonghuzhanghao?true:false" />
					</el-form-item>
				</el-col>

				<el-col :span="24">
					<el-form-item label="用户姓名" prop="yonghuxingming">
						<el-input class="list_inp" v-model="form.yonghuxingming" placeholder="用户姓名"
							 type="text" 							:readonly="!isAdd||disabledForm.yonghuxingming?true:false" />
					</el-form-item>
				</el-col>

				<el-col :span="24">
					<el-form-item label="故障类型" prop="guzhangleixing">
						<el-input class="list_inp" v-model="form.guzhangleixing" placeholder="故障类型"
							 type="text" 							:readonly="!isAdd||disabledForm.guzhangleixing?true:false" />
					</el-form-item>
				</el-col>

				<el-col :span="24">
					<el-form-item label="报修标题" prop="baoxiubiaoti">
						<el-input class="list_inp" v-model="form.baoxiubiaoti" placeholder="报修标题"
							 type="text" 							:readonly="!isAdd||disabledForm.baoxiubiaoti?true:false" />
					</el-form-item>
				</el-col>

				<el-col :span="24">
					<el-form-item label="取消原因" prop="quxiaoyuanyin">
						<el-input class="list_inp" v-model="form.quxiaoyuanyin" placeholder="取消原因"
							 type="text" 							:readonly="!isAdd||disabledForm.quxiaoyuanyin?true:false" />
					</el-form-item>
				</el-col>

				<el-col :span="24">
					<el-form-item label="取消时间" prop="quxiaoshijian">
						<el-date-picker
							class="list_date"
							v-model="form.quxiaoshijian"
							format="YYYY-MM-DD HH:mm:ss"
							value-format="YYYY-MM-DD HH:mm:ss"
							type="datetime"
							style="width:100%;"
							:readonly="!isAdd||disabledForm.quxiaoshijian?true:false"
							placeholder="请选择取消时间" />
					</el-form-item>
				</el-col>
			</el-row>
			<div class="formModel_btn_box">
				<el-button class="formModel_cancel" @click="backClick">取消</el-button>
				<el-button class="formModel_confirm"
                           @click="save"
                           type="success"
				>
					保存
				</el-button>
			</div>
		</el-form>
	</div>
</template>
<script setup>
	import {
		ref,
		getCurrentInstance,
		watch,
		onUnmounted,
		onMounted,
		nextTick,
		computed
	} from 'vue';
	import {
		useRoute,
		useRouter
	} from 'vue-router';
	const context = getCurrentInstance()?.appContext.config.globalProperties;
	const route = useRoute()
	const router = useRouter()
	//基础信息
	const tableName = 'quxiaoyuyue'
	const formName = '取消预约'
	//基础信息
	const breadList = ref([{
		name: formName
	}])
	//获取唯一标识
	const getUUID =()=> {
      return new Date().getTime();
    }
	//form表单
	const form = ref({
		baoxiubianhao: '',
		chepaihao: '',
		chexing: '',
		cheliangpinpai: '',
		cheliangxinghao: '',
		yonghuzhanghao: '',
		yonghuxingming: '',
		guzhangleixing: '',
		baoxiubiaoti: '',
		quxiaoyuanyin: '',
		quxiaoshijian: '',
	})
	const formRef = ref(null)
	const id = ref(0)
	const type = ref('')
	const disabledForm = ref({
		baoxiubianhao : false,
		chepaihao : false,
		chexing : false,
		cheliangpinpai : false,
		cheliangxinghao : false,
		yonghuzhanghao : false,
		yonghuxingming : false,
		guzhangleixing : false,
		baoxiubiaoti : false,
		quxiaoyuanyin : false,
		quxiaoshijian : false,
	})
	const isAdd = ref(false)
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
		baoxiubiaoti: [
		],
		quxiaoyuanyin: [
		],
		quxiaoshijian: [
		],
	})
	//methods

	//methods
	//获取info
	const getInfo = ()=>{
		context?.$http({
			url: `${tableName}/info/${id.value}`,
			method: 'get'
		}).then(res => {
			let reg=new RegExp('../../../file','g')
			form.value = res.data.data
		})
	}
	const crossRow = ref('')
	const crossTable = ref('')
	const crossTips = ref('')
	const crossColumnName = ref('')
	const crossColumnValue = ref('')
	//初始化
	const init = (formId=null,formType='add',formNames='',row=null,table=null,statusColumnName=null,tips=null,statusColumnValue=null) => {
			form.value.quxiaoshijian = context?.$toolUtil.getCurDateTime()
		if(formId){
			id.value = formId
			type.value = formType
		}
		if(formType == 'add'){
			isAdd.value = true
		}else if(formType == 'info'){
			isAdd.value = false
			getInfo()
		}else if(formType == 'edit'){
			isAdd.value = true
			getInfo()
		}
		else if(formType == 'cross'){
			isAdd.value = true
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
				if(x=='baoxiubiaoti'){
					form.value.baoxiubiaoti = row[x];
					disabledForm.value.baoxiubiaoti = true;
					continue;
				}
				if(x=='quxiaoyuanyin'){
					form.value.quxiaoyuanyin = row[x];
					disabledForm.value.quxiaoyuanyin = true;
					continue;
				}
				if(x=='quxiaoshijian'){
					form.value.quxiaoshijian = row[x];
					disabledForm.value.quxiaoshijian = true;
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
		}
		context?.$http({
			url: `${context?.$toolUtil.storageGet('frontSessionTable')}/session`,
			method: 'get'
		}).then(res => {
			var json = res.data.data
            if (localStorage.getItem('autoSave')) {
                localStorage.removeItem('autoSave')
                save()
            }
		})
	}
	//初始化
	//取消
	const backClick = () => {
		history.back()
	}
	//提交
	const save=()=>{
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
					crossUserId = context?.$toolUtil.storageGet('userid')
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
							}).then(res=>{
                                context?.$toolUtil.message(`操作成功`,'success')
                                history.back()
							})
						}
					})
				}else{
					context?.$http({
						url: `${tableName}/${!form.value.id ? "save" : "update"}`,
						method: 'post', 
						data: form.value 
					}).then(res=>{
                        context?.$toolUtil.message(`操作成功`,'success')
                        history.back()
					})
				}
			}
		})
	}
	//修改跨表数据
	const changeCrossData=(row)=>{
        if(type.value == 'cross'){
            context?.$http({
                url: `${crossTable.value}/update`,
                method: 'post',
                data: row
            }).then(res=>{})
        }
	}
	onMounted(()=>{
		type.value = route.query.type?route.query.type:'add'
		let row = null
		let table = null
		let statusColumnName = null
		let tips = null
		let statusColumnValue = null
		if(type.value == 'cross'){
			row = context?.$toolUtil.storageGet('crossObj')?JSON.parse(context?.$toolUtil.storageGet('crossObj')):{}
			table = context?.$toolUtil.storageGet('crossTable')
			statusColumnName = context?.$toolUtil.storageGet('crossStatusColumnName')
			tips = context?.$toolUtil.storageGet('crossTips')
			statusColumnValue = context?.$toolUtil.storageGet('crossStatusColumnValue')
		}
		init(route.query.id?route.query.id:null, type.value,'', row, table, statusColumnName, tips, statusColumnValue)
	})
    onUnmounted(()=>{
        Object.keys(localStorage).map(item=>{
            if(item.startsWith('cross')){
                localStorage.removeItem(item)
            }
        })
    })
</script>
<style lang="scss" scoped>
	// 面包屑盒子
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
	// 表单
	.add_form{
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
			}
		}
	}
	// 按钮盒子
	.formModel_btn_box {
		.formModel_cancel {
		}
		.formModel_cancel:hover {
		}
		
		.formModel_confirm {
		}
		.formModel_confirm:hover {
		}
	}
</style>
<style>
.edit_view {
    width: 1200px;
    margin: 20px auto;
    padding: 0px ;
    background: #fff;
    overflow: hidden;
    font-size: 16px;
    color:#666;
}
.edit_view .add_form{
    width: 100%;
    padding: 30px;
    border:0px solid #eee
}
.edit_view .add_form .el-form-item{
    margin: 0px 0px 20px;
    display: flex;
}
.edit_view .add_form .el-form-item .el-form-item__label{
    width: 150px;
    background: none;
    text-align: right;
    display: block;
    font-size: 16px;
    color: rgb(51, 51, 51);
    font-weight: 500;
}
.edit_view .add_form .el-form-item .el-form-item__content{
    display: flex;
    justify-content: flex-start;
    align-items: center;
    flex-wrap: wrap;
    width: calc(100% - 120px);
}
.edit_view .add_form .el-form-item .el-form-item__content .list_inp{
    height: 36px;
    line-height: 36px;
    border: 1px solid rgb(221, 221, 221);
    padding: 0px 10px;
    width: 100%;
    box-sizing: border-box;
    background: rgb(255, 255, 255);
    font-size: 16px;
}


.edit_view .add_form .el-form-item .el-form-item__content .list_date{
    line-height: 36px;
    border: 1px solid rgb(221, 221, 221);
    box-sizing: border-box;
    width: 100%;
    border-radius: 0px;
    background: rgb(255, 255, 255);
    font-size: 16px;
}








</style>