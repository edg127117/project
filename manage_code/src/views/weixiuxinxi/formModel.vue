<template>
    <div>
        <el-dialog modal-class="edit_form_modal" class="edit_form" v-model="formVisible" :title="formTitle" width="80%" destroy-on-close :fullscreen='false'>
            <el-form class="formModel_form" ref="formRef" :model="form" :rules="rules">
                <el-row>
                    <el-col :span="12">
                        <el-form-item label="维修单号" prop="weixiudanhao">
                            <el-input class="list_inp" v-model="form.weixiudanhao" placeholder="维修单号"
                                type="text"
                                :readonly="!isAdd||disabledForm.weixiudanhao?true:false" />
                        </el-form-item>
                    </el-col>
                    <el-col :span="12">
                        <el-form-item label="维修员账号" prop="weixiuzhanghao">
                            <el-input class="list_inp" v-model="form.weixiuzhanghao" placeholder="维修员账号"
                                type="text"
                                :readonly="!isAdd||disabledForm.weixiuzhanghao?true:false" />
                        </el-form-item>
                    </el-col>
                    <el-col :span="12">
                        <el-form-item label="维修员姓名" prop="weixiuyuanxingming">
                            <el-input class="list_inp" v-model="form.weixiuyuanxingming" placeholder="维修员姓名"
                                type="text"
                                :readonly="!isAdd||disabledForm.weixiuyuanxingming?true:false" />
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
                        <el-form-item label="车辆图片" prop="cheliangtupian">
                            <uploads
                                :disabled="!isAdd||disabledForm.cheliangtupian?true:false"
                                action="file/upload" 
                                tip="请上传车辆图片" 
                                :limit="3" 
                                style="width: 100%;text-align: left;"
                                :fileUrls="form.cheliangtupian?form.cheliangtupian:''" 
                                @change="cheliangtupianUploadSuccess">
                            </uploads>
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
                        <el-form-item label="故障图片" prop="guzhangtupian">
                            <uploads
                                :disabled="!isAdd||disabledForm.guzhangtupian?true:false"
                                action="file/upload" 
                                tip="请上传故障图片" 
                                :limit="3" 
                                style="width: 100%;text-align: left;"
                                :fileUrls="form.guzhangtupian?form.guzhangtupian:''" 
                                @change="guzhangtupianUploadSuccess">
                            </uploads>
                        </el-form-item>
                    </el-col>
                    <el-col :span="12">
                        <el-form-item label="维修日期" prop="weixiuriqi">
                            <el-date-picker
                                class="list_date"
                                v-model="form.weixiuriqi"
                                format="YYYY-MM-DD HH:mm:ss"
                                value-format="YYYY-MM-DD HH:mm:ss"
                                type="datetime"
                                :readonly="!isAdd||disabledForm.weixiuriqi?true:false"
                                placeholder="请选择维修日期" />
                        </el-form-item>
                    </el-col>
                    
                    <!-- 费用部分：自动计算 -->
                    <el-col :span="12">
                        <el-form-item label="材料费" prop="cailiaofei">
                            <el-input-number class="list_inp" v-model="form.cailiaofei" :min="0" :precision="2" :step="10" placeholder="材料费" style="width:100%" />
                        </el-form-item>
                    </el-col>
                    <el-col :span="12">
                        <el-form-item label="工时费" prop="gongshifei">
                            <el-input-number class="list_inp" v-model="form.gongshifei" :min="0" :precision="2" :step="10" placeholder="工时费" style="width:100%" />
                        </el-form-item>
                    </el-col>
                    <el-col :span="12">
                        <el-form-item label="维修费用" prop="weixiufeiyong">
                            <el-input class="list_inp" v-model="form.weixiufeiyong" placeholder="系统自动计算"
                                type="number"
                                readonly />
                        </el-form-item>
                    </el-col>
                    
                    <el-col :span="12">
                        <el-form-item label="支付状态" prop="ispay">
                            <el-select
                                class="list_sel"
                                :disabled="!isAdd||disabledForm.ispay?true:false"
                                v-model="form.ispay" 
                                placeholder="请选择支付状态"
                                >
                                <el-option v-for="(item,index) in ispayLists" :label="item" :value="item"></el-option>
                            </el-select>
                        </el-form-item>
                    </el-col>
                    <el-col :span="24">
                        <el-form-item label="维修内容" prop="weixiuneirong">
                            <el-input v-model="form.weixiuneirong" placeholder="维修内容" type="textarea"
                            :readonly="!isAdd||disabledForm.weixiuneirong?true:false"
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
    import { ref, getCurrentInstance, computed, defineEmits, defineExpose, watch } from 'vue'
    import { useStore } from 'vuex';
    const store = useStore()
    const user = computed(()=>store.getters['user/session'])
    const context = getCurrentInstance()?.appContext.config.globalProperties;   
    const emit = defineEmits(['formModelChange'])
    const tableName = 'weixiuxinxi'
    const formName = '维修信息'
    
    const rules = ref({
        weixiudanhao: [],
        weixiuzhanghao: [],
        weixiuyuanxingming: [],
        yonghuzhanghao: [],
        yonghuxingming: [],
        chepaihao: [],
        chexing: [],
        cheliangpinpai: [],
        cheliangxinghao: [],
        cheliangtupian: [],
        guzhangleixing: [],
        guzhangtupian: [],
        weixiuneirong: [],
        weixiuriqi: [],
        cailiaofei: [{ required: true, message: '请输入材料费', trigger: 'blur' }],
        gongshifei: [{ required: true, message: '请输入工时费', trigger: 'blur' }],
        weixiufeiyong: [],
        ispay: [],
    })
    const form = ref({})
    const disabledForm = ref({
        weixiudanhao : false,
        weixiuzhanghao : false,
        weixiuyuanxingming : false,
        yonghuzhanghao : false,
        yonghuxingming : false,
        chepaihao : false,
        chexing : false,
        cheliangpinpai : false,
        cheliangxinghao : false,
        cheliangtupian : false,
        guzhangleixing : false,
        guzhangtupian : false,
        weixiuneirong : false,
        weixiuriqi : false,
        cailiaofei : false,
        gongshifei : false,
        weixiufeiyong : false,
        ispay : false,
    })
    const formVisible = ref(false)
    const isAdd = ref(false)
    const formTitle = ref('')
    const formRef = ref(null)
    
    // ⬇️ 全局 ID 变量
    const id = ref(0)
    const type = ref('')
    
    const ispayLists = ref([])
    
    // 自动计算监听
    watch([() => form.value.cailiaofei, () => form.value.gongshifei], ([c, g]) => {
        const cailiao = Number(c) || 0
        const gongshi = Number(g) || 0
        form.value.weixiufeiyong = (cailiao + gongshi).toFixed(2)
    })

    const resetForm = () => {
        form.value = {
            weixiudanhao: '',
            weixiuzhanghao: '',
            weixiuyuanxingming: '',
            yonghuzhanghao: '',
            yonghuxingming: '',
            chepaihao: '',
            chexing: '',
            cheliangpinpai: '',
            cheliangxinghao: '',
            cheliangtupian: '',
            guzhangleixing: '',
            guzhangtupian: '',
            weixiuneirong: '',
            weixiuriqi: '',
            cailiaofei: 0,
            gongshifei: 0,
            weixiufeiyong: 0,
            ispay: '未支付',
        }
    }
    const getInfo = ()=>{
        context?.$http({
            url: `${tableName}/info/${id.value}`,
            method: 'get'
        }).then(res => {
            form.value = res.data.data
            formVisible.value = true
        })
    }
    const cheliangtupianUploadSuccess=(e)=>{
        form.value.cheliangtupian = e
    }
    const guzhangtupianUploadSuccess=(e)=>{
        form.value.guzhangtupian = e
    }
    const crossRow = ref('')
    const crossTable = ref('')
    const crossTips = ref('')
    const crossColumnName = ref('')
    const crossColumnValue = ref('')
    
    // 🔥🔥🔥 核心修复：参数改为 formId 和 formType，避免冲突 🔥🔥🔥
    const init=(formId=null,formType='add',formNames='',row=null,table=null,statusColumnName=null,tips=null,statusColumnValue=null)=>{
        resetForm()
        // 🔥🔥🔥 核心修复2：替换 getUUID 为 new Date().getTime() 🔥🔥🔥
        form.value.weixiudanhao = new Date().getTime()
        
        form.value.weixiuriqi = context?.$toolUtil.getCurDateTime()
        if(formId){
            id.value = formId // 安全赋值
            type.value = formType
        }
        if(formType == 'add'){
            isAdd.value = true
            formTitle.value = '新增' + formName
            formVisible.value = true
        } else if(formType == 'info'){
            isAdd.value = false
            formTitle.value = '查看' + formName
            getInfo()
        } else if(formType == 'edit'){
            isAdd.value = true
            formTitle.value = '修改' + formName
            getInfo()
        } else if(formType == 'cross'){
            isAdd.value = true
            formTitle.value = formNames
            for(let x in row){
                if(x=='weixiudanhao'){ form.value.weixiudanhao = row[x]; disabledForm.value.weixiudanhao = true; continue; }
                if(x=='weixiuzhanghao'){ form.value.weixiuzhanghao = row[x]; disabledForm.value.weixiuzhanghao = true; continue; }
                if(x=='weixiuyuanxingming'){ form.value.weixiuyuanxingming = row[x]; disabledForm.value.weixiuyuanxingming = true; continue; }
                if(x=='yonghuzhanghao'){ form.value.yonghuzhanghao = row[x]; disabledForm.value.yonghuzhanghao = true; continue; }
                if(x=='yonghuxingming'){ form.value.yonghuxingming = row[x]; disabledForm.value.yonghuxingming = true; continue; }
                if(x=='chepaihao'){ form.value.chepaihao = row[x]; disabledForm.value.chepaihao = true; continue; }
                if(x=='chexing'){ form.value.chexing = row[x]; disabledForm.value.chexing = true; continue; }
                if(x=='cheliangpinpai'){ form.value.cheliangpinpai = row[x]; disabledForm.value.cheliangpinpai = true; continue; }
                if(x=='cheliangxinghao'){ form.value.cheliangxinghao = row[x]; disabledForm.value.cheliangxinghao = true; continue; }
                if(x=='cheliangtupian'){ form.value.cheliangtupian = row[x]; disabledForm.value.cheliangtupian = true; continue; }
                if(x=='guzhangleixing'){ form.value.guzhangleixing = row[x]; disabledForm.value.guzhangleixing = true; continue; }
                if(x=='guzhangtupian'){ form.value.guzhangtupian = row[x]; disabledForm.value.guzhangtupian = true; continue; }
                if(x=='weixiuneirong'){ form.value.weixiuneirong = row[x]; disabledForm.value.weixiuneirong = true; continue; }
                if(x=='weixiuriqi'){ form.value.weixiuriqi = row[x]; disabledForm.value.weixiuriqi = true; continue; }
                if(x=='cailiaofei'){ form.value.cailiaofei = row[x]; disabledForm.value.cailiaofei = true; continue; }
                if(x=='gongshifei'){ form.value.gongshifei = row[x]; disabledForm.value.gongshifei = true; continue; }
                if(x=='weixiufeiyong'){ form.value.weixiufeiyong = row[x]; disabledForm.value.weixiufeiyong = true; continue; }
                if(x=='ispay'){ form.value.ispay = row[x]; disabledForm.value.ispay = true; continue; }
            }
            if(row){ crossRow.value = row }
            if(table){ crossTable.value = table }
            if(tips){ crossTips.value = tips }
            if(statusColumnName){ crossColumnName.value = statusColumnName }
            if(statusColumnValue){ crossColumnValue.value = statusColumnValue }
            
            form.value.ispay='未支付'
            formVisible.value = true
        }
        ispayLists.value = "已支付,未支付".split(',')
    }
    const closeClick = () => { formVisible.value = false }
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
    const changeCrossData = async (row)=>{
        if(type.value == 'cross'){
            await context?.$http({
                url: `${crossTable.value}/update`,
                method: 'post',
                data: row
            }).then(res=>{})
        }
    }

    defineExpose({
        init
    })
</script>
<style lang="scss" scoped>
    /* CSS 原样保留 */
    .formModel_form{
        :deep(.el-form-item) {
            .el-form-item__label { color: #666; font-weight: 500; width: 110px; font-size: 14px; line-height: 40px; text-align: right; }
            .el-form-item__content { margin-left: 110px; line-height: 40px; position: relative;
                .list_inp { border: 1px solid #ddd; border-radius: 4px; padding: 0 10px; box-shadow: 0 0 0px rgba(85, 255, 255, 0.5); outline: none; width: 100%; line-height: 36px; box-sizing: border-box; height: 36px;
                    .el-input__inner { color: #666; font-size: 14px; border-color: #ddd; border-radius: 4px; padding: 0 10px; box-shadow: 0 0 0px rgba(85, 255, 255, 0.5); outline: none; width: 100%; background: #fff; border-width: 0; line-height: 36px; box-sizing: border-box; height: 36px; }
                    .el-input__inner:focus { border: 0; padding: 0 10px; box-shadow: 0 0 0px rgba(85, 255, 255, 0.5); outline: none; color: #666; background: #fff; width: 100%; line-height: 36px; box-sizing: border-box; height: 36px; }
                }
                .list_date { border: 1px solid #ddd; border-radius: 4px; box-shadow: 0 0 0px rgba(85, 255, 255, 0.5); outline: none; width: 100%; line-height: 36px; box-sizing: border-box; height: 36px; }
                .list_sel { border: 1px solid #ddd; border-radius: 4px; box-shadow: 0 0 0px rgba(85, 255, 255, 0.5); outline: none; width: 100%; line-height: 36px; box-sizing: border-box; height: 36px;
                    .select-trigger{ height: 100%; .el-input{ height: 100%; .el-input__wrapper{ border: none; box-shadow: none; background: none; border-radius: 0; height: 100%; } .is-focus{ box-shadow: none !important; } } }
                }
                .el-textarea__inner { border: 1px solid #ddd; border-radius: 4px; padding: 12px; box-shadow: 0 0 0px rgba(85, 255, 255, 0.5); outline: none; color: #666; width: 100%; font-size: 14px; min-height: 120px; line-height: 32px; box-sizing: border-box; height: auto; }
            }
        }
    }
    .formModel_btn_box { display: flex; width: 100%; justify-content: center; align-items: center;
        .cancel_btn { border: 0; cursor: pointer; border-radius: 4px; padding: 0 24px; margin: 0 10px 0 0; outline: none; color: #fff; background: rgba(166, 172, 184, 1); width: auto; font-size: 14px; height: 32px; }
        .cancel_btn:hover { opacity: 0.8; }
        .confirm_btn { border: 0; cursor: pointer; border-radius: 4px; padding: 0 24px; margin: 0 0 0 10px; outline: none; color: #fff; background: rgba(64, 158, 255, 1); width: auto; font-size: 14px; height: 32px; }
        .confirm_btn:hover { opacity: 0.8; }
    }
</style>