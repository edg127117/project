<template>
	<el-dialog v-model="visible" :title="title" width="600px" destroy-on-close class="add_update_dialog">
		<el-form :model="form" ref="formRef" :rules="rules" label-width="120px" class="add-update-preview">
			<el-row>
				<el-col :span="24">
					<el-form-item label="配件名称">
						<el-input v-model="form.peijianmingcheng" readonly disabled></el-input>
					</el-form-item>
				</el-col>
				<el-col :span="24">
					<el-form-item label="当前库存">
						<el-input v-model="currentStock" readonly disabled style="width: 100px;"></el-input>
					</el-form-item>
				</el-col>
				<el-col :span="24">
					<el-form-item :label="type + '数量'" prop="shuliang">
						<el-input-number v-model="form.shuliang" :min="1" :controls="false" style="width: 100%"></el-input-number>
					</el-form-item>
				</el-col>
				<el-col :span="24">
					<el-form-item label="备注说明">
						<el-input type="textarea" v-model="form.beizhu" placeholder="请输入备注"></el-input>
					</el-form-item>
				</el-col>
			</el-row>
		</el-form>
		<template #footer>
			<div class="dialog-footer">
				<el-button @click="visible = false">取消</el-button>
				<el-button type="primary" @click="onSubmit">确认{{type}}</el-button>
			</div>
		</template>
	</el-dialog>
</template>

<script setup>
import { ref, getCurrentInstance } from 'vue';

const context = getCurrentInstance()?.appContext.config.globalProperties;
const visible = ref(false);
const formRef = ref(null);
const title = ref('');
const type = ref('');
const currentStock = ref(0);
const form = ref({});

const rules = {
	shuliang: [{ required: true, message: '请输入数量', trigger: 'blur' }]
};

const emit = defineEmits(['updateSuccess']);

const init = (row, actionType) => {
	visible.value = true;
	type.value = actionType; // '入库' 或 '出库'
	title.value = `配件${actionType}操作`;
	currentStock.value = row.shuliang;
	
	form.value = {
		peijianmingcheng: row.peijianmingcheng,
		peijianleixing: row.peijianleixing,
		caozuoleixing: actionType,
		shuliang: 1,
		beizhu: '',
		caozuoren: context?.$toolUtil.storageGet('adminName') || '管理员'
	};
};

const onSubmit = () => {
	formRef.value.validate((valid) => {
		if (valid) {
			context?.$http({
				url: 'peijianchuruku/save',
				method: 'post',
				data: form.value
			}).then(res => {
				if(res.data && res.data.code == 0){
					context?.$toolUtil.message(`${type.value}成功`, 'success');
					visible.value = false;
					emit('updateSuccess');
				} else {
                    context?.$toolUtil.message(res.data.msg, 'error');
                }
			});
		}
	});
};

defineExpose({ init });
</script>

<style lang="scss" scoped>
/* 复用之前的表格风格样式 */
.add-update-preview {
	border: 1px solid #ddd;
	border-bottom: none;
	border-right: none;
	margin: 10px;
	:deep(.el-form-item) {
		margin-bottom: 0;
		display: flex;
		align-items: center;
		border-bottom: 1px solid #ddd;
		border-right: 1px solid #ddd;
		.el-form-item__label {
			width: 120px !important;
			background-color: #f5f5f5;
			color: #333;
			font-weight: 700;
			text-align: center;
			height: 100%;
			min-height: 50px;
			display: flex;
			align-items: center;
			justify-content: center;
			border-right: 1px solid #ddd;
		}
		.el-form-item__content {
			flex: 1;
			padding: 0 15px;
			min-height: 50px;
			margin-left: 0 !important;
			display: flex;
			align-items: center;
            .el-input__wrapper { box-shadow: none !important; }
		}
	}
}
.dialog-footer { text-align: center; padding-bottom: 20px; }
</style>