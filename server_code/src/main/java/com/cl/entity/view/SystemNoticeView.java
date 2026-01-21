package com.cl.entity.view;

import com.baomidou.mybatisplus.annotations.TableName;
import com.cl.entity.SystemNoticeEntity;
import org.apache.commons.beanutils.BeanUtils;

import java.io.Serializable;
import java.lang.reflect.InvocationTargetException;


/**
 * 系统公告
 * 后端返回视图实体辅助类
 * （通常后端关联的表或者自定义的字段需要返回使用）
 *
 * @author
 * @email
 * @date 2025-02-04 11:06:47
 */
@TableName("system_notice")
public class SystemNoticeView extends SystemNoticeEntity implements Serializable {
    private static final long serialVersionUID = 1L;

    public SystemNoticeView() {
    }

    public SystemNoticeView(SystemNoticeEntity systemNoticeEntity) {
        try {
            BeanUtils.copyProperties(this, systemNoticeEntity);
        } catch (IllegalAccessException | InvocationTargetException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

    }


}
