<template>
    <div class="list-page" :style='{}'>
        <div class="breadcrumb-wrapper" style="width: 100%;">
            <div class="bread_view">
                <el-breadcrumb separator="/" class="breadcrumb">
                    <el-breadcrumb-item class="first_breadcrumb" :to="{ path: '/' }">首页</el-breadcrumb-item>
                    <el-breadcrumb-item class="second_breadcrumb" v-for="(item,index) in breadList" :key="index">{{item.name}}</el-breadcrumb-item>
                </el-breadcrumb>
            </div>
            <div class="back_view" v-if="centerType">
                <el-button class="back_btn" @click="backClick" type="primary">返回</el-button>
            </div>
        </div>
        <el-form :inline="true" :model="searchQuery" class="list_search">
            <div class="search_view">
                <div class="search_label">
                    车牌号：
                </div>
                <div class="search_box">
                    <el-input class="search_inp" v-model="searchQuery.chepaihao" placeholder="车牌号"
                        clearable>
                    </el-input>
                </div>
            </div>
            <div class="search_view">
                <div class="search_label">
                    用户账号：
                </div>
                <div class="search_box">
                    <el-input class="search_inp" v-model="searchQuery.yonghuzhanghao" placeholder="用户账号"
                        clearable>
                    </el-input>
                </div>
            </div>
            <div class="search_btn_view">
                <el-button class="search_btn" type="primary" @click="searchClick">搜索</el-button>
                <el-button class="add_btn" type="success" v-if="btnAuth('weixiuxinxi','新增')" @click="addClick">新增</el-button>
            </div>
        </el-form>
        <div class="page_list">
            <div class="data_box">
                <div class="table_view">
                    <el-table v-loading="listLoading" class="data_table" :data="list" border :row-style="{'cursor':'pointer'}"
                        @row-click="tableDetailClick" :stripe='true'>
                        <el-table-column :resizable='true' align="left" header-align="left" type="selection" width="55" />
                        <el-table-column label="序号" width="120" :resizable='true' align="left" header-align="left">
                            <template #default="scope">{{ (listQuery.page-1)*listQuery.limit+scope.$index + 1}}</template>
                        </el-table-column>
                        <el-table-column label="车牌号" :resizable='true' align="left" header-align="left">
                            <template #default="scope">
                                {{scope.row.chepaihao}}
                            </template>
                        </el-table-column>
                        <el-table-column label="车型" :resizable='true' align="left" header-align="left">
                            <template #default="scope">
                                {{scope.row.chexing}}
                            </template>
                        </el-table-column>
                        <el-table-column label="车辆品牌" :resizable='true' align="left" header-align="left">
                            <template #default="scope">
                                {{scope.row.cheliangpinpai}}
                            </template>
                        </el-table-column>
                        <el-table-column label="维修姓名" :resizable='true' align="left" header-align="left">
                            <template #default="scope">
                                {{scope.row.weixiuxingming}}
                            </template>
                        </el-table-column>
                        
                        <!-- 核心字段：维修费用 -->
                        <el-table-column label="维修费用" :resizable='true' align="left" header-align="left">
                            <template #default="scope">
                                <span style="color: red; font-weight: bold;">￥{{scope.row.weixiufeiyong}}</span>
                            </template>
                        </el-table-column>

                        <!-- 核心字段：支付状态与按钮 -->
                        <el-table-column label="是否支付" :resizable='true' align="left" header-align="left">
                            <template #default="scope">
                                <el-tag v-if="scope.row.ispay=='已支付'" type="success">已支付</el-tag>
                                <el-tag v-else type="danger">未支付</el-tag>
                                <!-- 修改支付按钮：增加样式和间距 -->
                                <el-button v-if="scope.row.ispay!='已支付' && btnAuth('weixiuxinxi','支付')" 
                                    type="success" size="small" style="margin-left: 10px;"
                                    @click.stop="payClick(scope.row)">
                                    支付
                                </el-button>
                            </template>
                        </el-table-column>

                        <el-table-column label="维修时间" :resizable='true' align="left" header-align="left">
                            <template #default="scope">
                                {{scope.row.weixiushijian}}
                            </template>
                        </el-table-column>
                        
                        <el-table-column label="操作" width="100" align="center" fixed="right">
                            <template #default="scope">
                                <el-button type="text" size="small" @click.stop="tableDetailClick(scope.row)">详情</el-button>
                            </template>
                        </el-table-column>
                    </el-table>
                </div>
                <el-pagination
                    background 
                    :layout="layouts.join(',')"
                    :total="total" 
                    :page-size="listQuery.limit"
                    v-model:current-page="listQuery.page"
                    prev-text="上一页"
                    next-text="下一页"
                    @size-change="sizeChange"
                    @current-change="currentChange"/>
            </div>
        </div>
        <!-- 保持您原有的弹窗引用 -->
        <payForm ref="pay" @payChange="searchClick()"></payForm>
        <el-dialog v-model="preViewVisible" :title="'查看大图'" width="60%" destroy-on-close>
            <img :src="preViewUrl" style="width: 100%;" alt="">
        </el-dialog>
    </div>
</template>

<script setup>
    import { ref, getCurrentInstance, nextTick, computed } from 'vue';
    import { useRoute, useRouter } from 'vue-router';
    import { useStore } from 'vuex';
    import { ElMessageBox } from 'element-plus'; // 引入弹窗组件

    const store = useStore()
    const user = computed(()=>store.getters['user/session'])
    const context = getCurrentInstance()?.appContext.config.globalProperties;
    const router = useRouter()
    const route = useRoute()
    
    const tableName = 'weixiuxinxi'
    const formName = '维修信息'
    const breadList = ref([{ name: formName }])
    const list = ref([])
    const listQuery = ref({ page: 1, limit: 20 })
    const total = ref(0)
    const listLoading = ref(false)

    const btnAuth = (e,a)=>{
        return centerType.value ? context?.$toolUtil.isBackAuth(e,a) : context?.$toolUtil.isAuth(e,a)
    }

    const addClick = () => { router.push('/index/weixiuxinxiAdd') }
    const centerType = ref(false)
    const backClick = () => {
        router.push(`/index/${context?.$toolUtil.storageGet('frontSessionTable')}Center`)
    }
    
    const searchQuery = ref({})
    const searchClick = () => {
        listQuery.value.page = 1
        getList()
    }
    
    const layouts = ref(["total","prev","pager","next","sizes","jumper"])
    const sizeChange = (size) => { listQuery.value.limit = size; getList() }
    const currentChange = (page) => { listQuery.value.page = page; getList() }

    const getList = () => {
        listLoading.value = true
        let params = JSON.parse(JSON.stringify(listQuery.value))
        if(searchQuery.value.chepaihao) params.chepaihao = '%' + searchQuery.value.chepaihao + '%'
        if(searchQuery.value.yonghuzhanghao) params.yonghuzhanghao = '%' + searchQuery.value.yonghuzhanghao + '%'
        
        // 🔥 修改：强制使用 page 接口，确保后端根据登录 session 过滤数据，这样用户才能看到自己的结算单
        context?.$http({
            url: `${tableName}/page`, 
            method: 'get',
            params: params
        }).then(res => {
            listLoading.value = false
            list.value = res.data.data.list
            total.value = Number(res.data.data.total)
        })
    }

    const tableDetailClick = (row) => {
        router.push(`${tableName}Detail?id=` + row.id + (centerType.value?'&&centerType=1':''))
    }

    // 🔥🔥🔥 核心逻辑：模拟在线支付操作 🔥🔥🔥
    const payClick = (row)=>{
        ElMessageBox.confirm(`确定支付维修费用：${row.weixiufeiyong} 元吗？`, '在线支付', {
            confirmButtonText: '立即支付',
            cancelButtonText: '取消',
            type: 'success'
        }).then(() => {
            // 构造需要更新的数据对象
            let data = JSON.parse(JSON.stringify(row))
            data.ispay = '已支付' // 修改状态
            
            // 调用后端的 update 接口更新数据库
            context?.$http({
                url: `${tableName}/update`,
                method: 'post',
                data: data
            }).then(res => {
                if(res.data.code == 0){
                    context?.$toolUtil.message('支付成功！', 'success')
                    getList() // 重新拉取列表，按钮会自动消失
                }else{
                    context?.$toolUtil.message(res.data.msg, 'error')
                }
            })
        }).catch(() => {
            // 用户取消支付，不做处理
        })
    }

    const init = () => {
        if(route.query.centerType) centerType.value = true
        getList()
    }
    init()
</script>
<style lang="scss" scoped>
	// 返回盒子
	.back_view {
		border-radius: 4px;
		padding: 10px 0px;
		margin: 10px auto;
		z-index: 999;
		background: none;
		width: 100%;
		text-align: right;
		// 返回按钮
		.back_btn {
			border: 1px solid #0076ca50;
			cursor: pointer;
			border-radius: 4px;
			padding: 0 24px;
			color: #0076ca;
			background: #fff;
			width: auto;
			font-size: 14px;
			height: 34px;
		}
		// 返回按钮-悬浮
		.back_btn:hover {
		}
	}
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

	.detail_view{
		// 轮播图
		.swiper_view {
		}
		// 文字区
		.info_view {

			.title_view {

				.detail_title {
				}
				.collect_view {
					border: 0px solid #eee;
					cursor: pointer;
					border-radius: 10px;
					padding: 10px 0px;
					color: #eee;
					background: none;
					display: flex;
					width: auto;
					line-height: 1;
					justify-content: center;
					align-items: center;
					.iconfont {
						margin: 0 5px 0 0;
						color: #eee;
					}
					.iconfontActive {
						margin: 0 5px 0 0;
						color: #fcaaa8;
					}
					span {
						color: #eee;
					}
					.textActive {
						color: #fcaaa8;
					}
				}
				.collect_view:hover {
				}
				.collect_view:active {
					transform: scale(0.8);
				}
			}

			.info_item {

				.info_label {
				}
				.info_text {
				}
			}
			.btn_view {
				// 跨表-按钮
				.cross_btn {
				}
				// 悬浮
				.cross_btn:hover {
				}
				// 审核-按钮
				.approval_btn {
				}
				// 悬浮
				.approval_btn:hover {
				}
				// 修改-按钮
				.edit_btn {
				}
				// 悬浮
				.edit_btn:hover {
				}
				// 删除-按钮
				.del_btn {
				}
				// 悬浮
				.del_btn:hover {
				}
			}
		}
	}

	//底部盒子
	.tabs_view {
		:deep(.el-tabs__header) {
			background: transparent;
			border: none;
		}
		// 头部
		:deep(.el-tabs__nav-scroll) {
			.el-tabs__nav {
				.el-tabs__item {
				}
				.el-tabs__item:hover {
				}
				.is-active {
				}
			}
		}
		// 内容区
		:deep(.el-tabs__content) {
		}
	}
</style>