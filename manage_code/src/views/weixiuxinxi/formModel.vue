<template>
	<div>
		<el-dialog modal-class="edit_form_modal" class="edit_form" v-model="formVisible" :title="formTitle" width="80%" destroy-on-close :fullscreen='false'>
			<el-form class="formModel_form" ref="formRef" :model="form" :rules="rules">
				<el-row>
                    <!-- 原有车牌号、车型等字段 -->
					<el-col :span="12"><el-form-item label="车牌号" prop="chepaihao"><el-input class="list_inp" v-model="form.chepaihao" :readonly="!isAdd||disabledForm.chepaihao" /></el-form-item></el-col>
					<el-col :span="12"><el-form-item label="车型" prop="chexing"><el-input class="list_inp" v-model="form.chexing" :readonly="!isAdd||disabledForm.chexing" /></el-form-item></el-col>
					<el-col :span="12"><el-form-item label="车辆品牌" prop="cheliangpinpai"><el-input class="list_inp" v-model="form.cheliangpinpai" :readonly="!isAdd||disabledForm.cheliangpinpai" /></el-form-item></el-col>
					<el-col :span="12"><el-form-item label="车辆型号" prop="cheliangxinghao"><el-input class="list_inp" v-model="form.cheliangxinghao" :readonly="!isAdd||disabledForm.cheliangxinghao" /></el-form-item></el-col>
					<el-col :span="12"><el-form-item label="用户账号" prop="yonghuzhanghao"><el-input class="list_inp" v-model="form.yonghuzhanghao" :readonly="!isAdd||disabledForm.yonghuzhanghao" /></el-form-item></el-col>
					<el-col :span="12"><el-form-item label="用户姓名" prop="yonghuxingming"><el-input class="list_inp" v-model="form.yonghuxingming" :readonly="!isAdd||disabledForm.yonghuxingming" /></el-form-item></el-col>
					<el-col :span="12"><el-form-item label="报修标题" prop="baoxiubiaoti"><el-input class="list_inp" v-model="form.baoxiubiaoti" :readonly="!isAdd||disabledForm.baoxiubiaoti" /></el-form-item></el-col>
					<el-col :span="12"><el-form-item label="维修账号" prop="weixiuzhanghao"><el-input class="list_inp" v-model="form.weixiuzhanghao" :readonly="!isAdd||disabledForm.weixiuzhanghao" /></el-form-item></el-col>
					<el-col :span="12"><el-form-item label="维修姓名" prop="weixiuxingming"><el-input class="list_inp" v-model="form.weixiuxingming" :readonly="!isAdd||disabledForm.weixiuxingming" /></el-form-item></el-col>
					<el-col :span="12"><el-form-item label="故障位置" prop="guzhangweizhi"><el-input class="list_inp" v-model="form.guzhangweizhi" :readonly="!isAdd||disabledForm.guzhangweizhi" /></el-form-item></el-col>
					<el-col :span="12"><el-form-item label="故障原因" prop="guzhangyuanyin"><el-input class="list_inp" v-model="form.guzhangyuanyin" :readonly="!isAdd||disabledForm.guzhangyuanyin" /></el-form-item></el-col>

					<!-- 🔥 注入：材料费 (自动计算源) -->
					<el-col :span="12">
						<el-form-item label="材料费" prop="cailiaofei">
							<el-input class="list_inp" v-model="form.cailiaofei" type="number" placeholder="请输入材料费" @input="calcTotal" />
						</el-form-item>
					</el-col>
                    
                    <!-- 🔥 注入：工时费 (自动计算源) -->
					<el-col :span="12">
						<el-form-item label="工时费" prop="gongshifei">
							<el-input class="list_inp" v-model="form.gongshifei" type="number" placeholder="请输入工时费" @input="calcTotal" />
						</el-form-item>
					</el-col>

                    <!-- 🔥 修改：总费用 (只读，自动计算结果) -->
					<el-col :span="12">
						<el-form-item label="维修费用" prop="weixiufeiyong">
							<el-input class="list_inp" v-model="form.weixiufeiyong" placeholder="自动计算" type="number" readonly />
						</el-form-item>
					</el-col>

					<el-col :span="12"><el-form-item label="维修时间" prop="weixiushijian"><el-date-picker class="list_date" v-model="form.weixiushijian" type="datetime" format="YYYY-MM-DD HH:mm:ss" value-format="YYYY-MM-DD HH:mm:ss" :readonly="!isAdd||disabledForm.weixiushijian" /></el-form-item></el-col>
					<el-col :span="12"><el-form-item label="维修次数" prop="weixiucishu"><el-input class="list_inp" v-model="form.weixiucishu" :readonly="!isAdd||disabledForm.weixiucishu" /></el-form-item></el-col>
					<el-col :span="24"><el-form-item label="维修内容" prop="weixiuneirong"><el-input class="list_inp" v-model="form.weixiuneirong" type="textarea" /></el-form-item></el-col>
                    <el-col :span="24"><el-form-item label="检查报告" prop="jianchabaogao"><uploads action="file/upload" :fileUrls="form.jianchabaogao" @change="jianchabaogaoUploadSuccess"></uploads></el-form-item></el-col>
                    <el-col :span="24"><el-form-item label="建议信息" prop="jianyixinxi"><el-input class="list_inp" v-model="form.jianyixinxi" :readonly="!isAdd||disabledForm.jianyixinxi" /></el-form-item></el-col>
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
	import { reactive, ref, getCurrentInstance, nextTick, computed, defineEmits, defineExpose } from 'vue'
	import { useStore } from 'vuex';
	const store = useStore()
	const context = getCurrentInstance()?.appContext.config.globalProperties; 	
	const emit = defineEmits(['formModelChange'])
	const tableName = 'weixiuxinxi'
	const formName = '维修信息'
	const form = ref({ cailiaofei:0, gongshifei:0, weixiufeiyong:0 }) // 初始化费用
	const disabledForm = ref({ chepaihao:false, weixiufeiyong:false, cailiaofei:false, gongshifei:false })
	const formVisible = ref(false)
	const isAdd = ref(false)
	const formTitle = ref('')
	
    // 验证规则
    const validateNumber = (rule, value, callback) => {
		if(!value) callback(); else if (!context?.$toolUtil.isNumber(value)) callback(new Error("请输入数字")); else callback();
	}
	const rules = ref({
		weixiufeiyong: [{ validator: validateNumber, trigger: 'blur' }],
		cailiaofei: [{ validator: validateNumber, trigger: 'blur' }], // 🔥 增加校验
		gongshifei: [{ validator: validateNumber, trigger: 'blur' }], // 🔥 增加校验
	})
	
	const formRef = ref(null)
	const id = ref(0)
	const type = ref('')

    // 🔥 核心计算逻辑
    const calcTotal = () => {
        let c = parseFloat(form.value.cailiaofei) || 0
        let g = parseFloat(form.value.gongshifei) || 0
        form.value.weixiufeiyong = (c + g).toFixed(2)
    }

    const resetForm = () => {
		form.value = {
			chepaihao: '', chexing: '', cheliangpinpai: '', yonghuxingming: '', weixiuxingming: '',
			baoxiubiaoti: '', cailiaofei: 0, gongshifei: 0, weixiufeiyong: 0, // 🔥 重置费用
			weixiuneirong: '', weixiushijian: '', ispay: '未支付'
		}
	}

	const init=(formId=null,formType='add',formNames='',row=null)=>{
		resetForm()
		if(formId){ id.value = formId; type.value = formType }
		if(formType == 'add'){ isAdd.value = true; formTitle.value = '新增' + formName; formVisible.value = true }
		else if(formType == 'info'){ isAdd.value = false; formTitle.value = '查看' + formName; getInfo() }
		else if(formType == 'edit'){ isAdd.value = true; formTitle.value = '修改' + formName; getInfo() }
		else if(formType == 'cross'){
			isAdd.value = true; formTitle.value = formNames
			for(let x in row){
				if(x=='chepaihao'){ form.value.chepaihao = row[x]; disabledForm.value.chepaihao = true; continue; }
                // ... 省略其他 cross 赋值 ...
			}
            form.value.weixiucishu='1'
            formVisible.value = true
		}
	}
    
    // ... 其他方法保持原样 (getInfo, save, jianchabaogaoUploadSuccess) ...
    const getInfo = ()=>{
		context?.$http({ url: `${tableName}/info/${id.value}`, method: 'get' }).then(res => { form.value = res.data.data; formVisible.value = true })
	}
    const jianchabaogaoUploadSuccess=(e)=>{ form.value.jianchabaogao = e }
    const closeClick = () => { formVisible.value = false }
    const save= async ()=>{
        formRef.value.validate((valid)=>{
            if(valid){
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
    }

	defineExpose({ init })
</script>
<style lang="scss" scoped>
    /* CSS 原封不动 */
	.formModel_form{
		:deep(.el-form-item) {
			.el-form-item__label { }
			.el-form-item__content {
				.list_inp { } .list_date { } .list_sel { .select-trigger{ height: 100%; .el-input{ height: 100%; } } }
				.el-textarea__inner { } .upload-demo { width: 100%; }
			}
		}
	}
	.formModel_btn_box { .cancel_btn { } .confirm_btn { } }
</style>