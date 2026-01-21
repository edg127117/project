import toolUtil from '@/utils/toolUtil'

const menu = {
    list() {
        let menus = toolUtil.storageGet("menus");
        if (!menus) {
            return null;
        }
        // 1. 解析数据库原本的菜单
        let menuList = eval('(' + menus + ')');
        
        if (menuList && menuList.length > 0) {
            menuList.forEach(roleItem => {
                // =====================================================
                // 🔥 功能一：强制注入“配件管理”菜单 (针对管理员)
                // =====================================================
                if ((roleItem.roleName === '管理员' || roleItem.roleName === 'admin') && roleItem.backMenu) {
                    // 检查是否已经存在，防止重复添加
                    const hasPeijian = roleItem.backMenu.some(m => m.menu === '配件管理' || m.tableName === 'peijian');
                    
                    if (!hasPeijian) {
                        roleItem.backMenu.push({
                            "child": [
                                {
                                    "appFrontIcon": "cuIcon-goods",
                                    "buttons": ["新增","查看","修改","删除","入库","出库"], // 加上入库出库权限
                                    "menu": "配件信息列表",
                                    "menuJump": "列表",
                                    "tableName": "peijian" 
                                }
                            ],
                            "menu": "配件管理", 
                            "fontClass": "el-icon-s-goods" 
                        });
                    }
                }

                // =====================================================
                // 🔥 功能二：强制修改原有菜单名称 (工单派发 & 订单结算)
                // =====================================================
                if(roleItem.backMenu && roleItem.backMenu.length > 0){
                    roleItem.backMenu.forEach(parent => {
                        if(parent.child && parent.child.length > 0){
                            parent.child.forEach(child => {
                                // 1. 改名“维修分配” -> 工单派发 / 进度追踪
                                if(child.tableName === 'weixiufenpei'){
                                    if(roleItem.roleName === '管理员'){
                                        child.menu = '工单派发'; 
                                        parent.menu = '工单管理'; // 连父级菜单名一起改顺口点
                                    } else if(roleItem.roleName === '维修员'){
                                        child.menu = '进度追踪'; 
                                        parent.menu = '维修作业';
                                    }
                                }
                                // 2. 改名“维修信息” -> 订单结算
                                if(child.tableName === 'weixiuxinxi'){
                                    child.menu = '订单结算';
                                }
                            })
                        }
                    })
                }
            });
        }

        return menuList;
    }
}

export default menu;