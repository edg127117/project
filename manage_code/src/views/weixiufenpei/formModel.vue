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
                    
                    <!-- 分配时间：前端只读，后端自动生成 -->
                    <el-col :span="12">
                        <el-form-item label="分配时间" prop="fenpeishijian">
                            <el-date-picker
                                class="list_date"
                                v-model="form.fenpeishijian"
                                format="YYYY-MM-DD HH:mm:ss"
                                value-format="YYYY-MM-DD HH:mm:ss"
                                type="datetime"
                                :readonly="true" 
                                placeholder="系统自动生成" />
                        </el-form-item>
                    </el-col>
                    
                    <el-col :span="12">
                        <el-form-item label="维修账号" prop="weixiuzhanghao">
                            <el-select
                                class="list_sel"
                                :disabled="!isAdd||disabledForm.weixiuzhanghao?true:false"
                                v-model="form.weixiuzhanghao" 
                                placeholder="请选择维修账号"
                                @change="weixiuzhanghaoChange">
                                <el-option v-for="(item,index) in weixiuzhanghaoLists" :label="item.weixiuzhanghao" :value="item.weixiuzhanghao"></el-option>
                            </el-select>
                        </el-form-item>
                    </el-col>
                    <el-col :span="12">
                        <el-form-item label="维修姓名" prop="weixiuxingming">
                            <el-input class="list_inp" v-model="form.weixiuxingming" placeholder="维修姓名"
                                type="text"
                                :readonly="!isAdd||disabledForm.weixiuxingming?true:false" />
                        </el-form-item>
                    </el-col>
                    
                    <!-- 维修状态：新增时默认待维修 -->
                    <el-col :span="12">
                        <el-form-item label="维修状态" prop="weixiuzhuangtai">
                            <el-select
                                class="list_sel"
                                :disabled="isAdd||disabledForm.weixiuzhuangtai?true:false"
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
    
    // 基础变量定义
    const rules = ref({
        baoxiubianhao: [],
        chepaihao: [],
        chexing: [],
        cheliangpinpai: [],
        cheliangxinghao: [],
        yonghuzhanghao: [],
        yonghuxingming: [],
        guzhangleixing: [],
        baoxiubiaoti: [],
        baoxiuyuanyin: [],
        fenpeishijian: [],
        weixiuzhanghao: [{ required: true, message: '请选择维修员', trigger: 'change' }],
        weixiuxingming: [],
        weixiuzhuangtai: [],
    })
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
        baoxiubiaoti : false,
        baoxiuyuanyin : false,
        fenpeishijian : false,
        weixiuzhanghao : false,
        weixiuxingming : false,
        weixiuzhuangtai : false,
    })
    const formVisible = ref(false)
    const isAdd = ref(false)
    const formTitle = ref('')
    const formRef = ref(null)
    
    // ⬇️⬇️⬇️ 这里的 id 和 type 是 ref 对象，用来存当前记录ID和操作类型 ⬇️⬇️⬇️
    const id = ref(0)
    const type = ref('')
    
    const weixiuzhanghaoLists = ref([])
    const weixiuzhuangtaiLists = ref([])
    
    const resetForm = () => {
        form.value = {
            baoxiubianhao: '',
            chepaihao: '',
            chexing: '',
            cheliangpinpai: '',
            cheliangxinghao: '',
            yonghuzhanghao: '',
            yonghuxingming: '',
            guzhangleixing: '',
            baoxiubiaoti: '',
            baoxiuyuanyin: '',
            fenpeishijian: '',
            weixiuzhanghao: '',
            weixiuxingming: '',
            weixiuzhuangtai: '',
        }
    }
    const weixiuzhanghaoChange = (val)=>{
        if(weixiuzhanghaoLists.value && weixiuzhanghaoLists.value.length > 0){
            let obj = weixiuzhanghaoLists.value.find(item=>item.weixiuzhanghao==val)
            if(obj){
                form.value.weixiuxingming = obj.weixiuyuanxingming || obj.weixiuxingming
            }
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
    const crossRow = ref('')
    const crossTable = ref('')
    const crossTips = ref('')
    const crossColumnName = ref('')
    const crossColumnValue = ref('')
    
    // 🔥🔥🔥 核心修复：参数改名为 rowId 和 optType 🔥🔥🔥
    // 之前的 id 和 type 参数名会遮挡外面的 ref，导致 id.value 报错
    const init = (rowId = null, optType = 'add', formNames = '', row = null, table = null, statusColumnName = null, tips = null, statusColumnValue = null) => {
        console.log("【维修分配Form】Init called with:", rowId, optType); // 调试日志，F12可见
        
        resetForm()
        form.value.fenpeishijian = context?.$toolUtil.getCurDateTime()
        
        if(rowId){
            id.value = rowId  // ✅ 这里现在是安全的，id 指向的是外面的 ref(0)
            type.value = optType
        }
        
        if(optType == 'add'){
            isAdd.value = true
            formTitle.value = '新增' + formName
            formVisible.value = true
            form.value.weixiuzhuangtai = '待维修'
        } else if(optType == 'info'){
            isAdd.value = false
            formTitle.value = '查看' + formName
            getInfo()
        } else if(optType == 'edit'){
            isAdd.value = true
            formTitle.value = '修改' + formName
            getInfo()
        } else if(optType == 'cross'){
            isAdd.value = true
            formTitle.value = formNames
            // 自动回填逻辑
            for(let x in row){
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
                if(x=='weixiuzhanghao'){ form.value.weixiuzhanghao = row[x]; disabledForm.value.weixiuzhanghao = true; continue; }
                if(x=='weixiuxingming'){ form.value.weixiuxingming = row[x]; disabledForm.value.weixiuxingming = true; continue; }
                if(x=='weixiuzhuangtai'){ form.value.weixiuzhuangtai = row[x]; disabledForm.value.weixiuzhuangtai = true; continue; }
            }
            if(row){ crossRow.value = row }
            if(table){ crossTable.value = table }
            if(tips){ crossTips.value = tips }
            if(statusColumnName){ crossColumnName.value = statusColumnName }
            if(statusColumnValue){ crossColumnValue.value = statusColumnValue }
            
            form.value.weixiuzhuangtai='待维修'
            formVisible.value = true
        }
        
        // 获取维修员列表
        context?.$http({
            url: `weixiuyuan/list`,
            method: 'get',
            params: { page: 1, limit: 100 }
        }).then(res=>{
            weixiuzhanghaoLists.value = res.data.data.list
        })
        weixiuzhuangtaiLists.value = "已维修,维修中,待维修".split(',')
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