<template>
	<el-dialog v-model="visible" :title="form.id ? '修改配件信息' : '新增配件信息'" width="800px" destroy-on-close :close-on-click-modal="false">
		<!-- 使用 add-update-preview 类名，配合下面的样式模拟表格效果 -->
		<el-form :model="form" ref="formRef" :rules="rules" class="add-update-preview" label-width="120px">
			<el-row>
				<!-- 第一行 -->
				<el-col :span="12">
					<el-form-item label="配件名称" prop="peijianmingcheng">
						<el-input v-model="form.peijianmingcheng" placeholder="请输入配件名称" clearable></el-input>
					</el-form-item>
				</el-col>
				<el-col :span="12">
					<el-form-item label="配件类型" prop="peijianleixing">
						<el-input v-model="form.peijianleixing" placeholder="请输入配件类型" clearable></el-input>
					</el-form-item>
				</el-col>

				<!-- 第二行 -->
				<el-col :span="12">
					<el-form-item label="规格参数" prop="guige">
						<el-input v-model="form.guige" placeholder="请输入规格参数" clearable></el-input>
					</el-form-item>
				</el-col>
				<el-col :span="12">
					<el-form-item label="单价(元)" prop="danjia">
						<el-input v-model="form.danjia" placeholder="请输入单价" type="number"></el-input>
					</el-form-item>
				</el-col>

				<!-- 第三行 -->
				<el-col :span="12">
					<el-form-item label="库存数量" prop="shuliang">
						<el-input-number v-model="form.shuliang" :min="0" :controls="false" style="width: 100%"></el-input-number>
					</el-form-item>
				</el-col>

				<!-- 图片上传 -->
				<el-col :span="24">
					<el-form-item label="配件图片" prop="tupian">
						<uploads 
							v-if="visible"
							v-model="form.tupian" 
							action="file/upload" 
							tip="点击上传图片" 
							@change="tupianUploadChange">
						</uploads>
					</el-form-item>
				</el-col>

				<!-- 备注 -->
				<el-col :span="24">
					<el-form-item label="备注说明" prop="beizhu">
						<el-input v-model="form.beizhu" type="textarea" :rows="3" placeholder="请输入备注说明"></el-input>
					</el-form-item>
				</el-col>
			</el-row>
		</el-form>
		<template #footer>
			<div class="dialog-footer">
				<el-button @click="visible = false">取消</el-button>
				<el-button type="primary" @click="onSubmit">确定</el-button>
			</div>
		</template>
	</el-dialog>
</template>

<script setup>
import { ref, getCurrentInstance } from 'vue';
import uploads from '@/components/common/upload.vue';

const context = getCurrentInstance()?.appContext.config.globalProperties;
const visible = ref(false);
const formRef = ref(null);
const form = ref({});

const rules = {
	peijianmingcheng: [{ required: true, message: '配件名称不能为空', trigger: 'blur' }],
	shuliang: [{ required: true, message: '库存数量不能为空', trigger: 'blur' }]
};

const emit = defineEmits(['formModelChange']);

const init = (id) => {
	visible.value = true;
	form.value = { 
		id: null,
		peijianmingcheng: '', 
		peijianleixing: '', 
		guige: '', 
		shuliang: 0, 
		danjia: 0, 
		tupian: '', 
		beizhu: '' 
	};
	if (id) {
		context?.$http({
			url: `peijian/info/${id}`,
			method: 'get'
		}).then(res => {
			if(res.data && res.data.code == 0){
				form.value = res.data.data;
			}
		});
	}
};

const tupianUploadChange = (fileUrl) => {
    form.value.tupian = fileUrl;
};

const onSubmit = () => {
	formRef.value.validate((valid) => {
		if (valid) {
			const method = form.value.id ? 'update' : 'save';
			context?.$http({
				url: `peijian/${method}`,
				method: 'post',
				data: form.value
			}).then(res => {
				if(res.data && res.data.code == 0){
					context?.$toolUtil.message('操作成功', 'success');
					visible.value = false;
					emit('formModelChange');
				}
			});
		}
	});
};

defineExpose({ init });
</script>

<style lang="scss" scoped>
// 核心样式：模拟表格边框风格
.add-update-preview {
	border: 1px solid #ddd;
	border-bottom: none;
	border-right: none;
	margin: 10px;

	:deep(.el-form-item) {
		margin-bottom: 0; // 清除默认间距
		display: flex;
		align-items: center; // 垂直居中
		border-bottom: 1px solid #ddd;
		border-right: 1px solid #ddd;

		// 标签样式：灰色背景，固定宽度，右边框
		.el-form-item__label {
			width: 140px !important; // 强制宽度
			background-color: #f5f5f5;
			color: #606266;
			font-weight: 700;
			text-align: center;
			line-height: 40px; // 与高度一致
			padding: 0;
			height: 100%;
			min-height: 50px;
			display: flex;
			align-items: center;
			justify-content: center;
			border-right: 1px solid #ddd;
		}

		// 内容区域：白色背景，填满剩余空间
		.el-form-item__content {
			flex: 1;
			background-color: #fff;
			padding: 0 15px;
			min-height: 50px; // 保证高度
			margin-left: 0 !important; // 强制清除 Element 的 margin-left
			display: flex;
			align-items: center;

			// 输入框去边框化（融入表格）
			.el-input__wrapper {
				box-shadow: none !important; // 去掉输入框自带的边框
				padding: 0;
				background: transparent;
			}
			.el-textarea__inner {
				box-shadow: none !important;
				padding: 10px 0;
			}
		}
	}
}

.dialog-footer {
	text-align: center;
	padding-bottom: 20px;
}
</style>