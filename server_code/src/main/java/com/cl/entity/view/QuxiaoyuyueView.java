package com.cl.entity.view;

import com.baomidou.mybatisplus.annotations.TableName;
import com.cl.entity.QuxiaoyuyueEntity;
import org.apache.commons.beanutils.BeanUtils;

import java.io.Serializable;
import java.lang.reflect.InvocationTargetException;


/**
 * 取消预约
 * 后端返回视图实体辅助类
 * （通常后端关联的表或者自定义的字段需要返回使用）
 *
 * @author
 * @email
 * @date 2025-02-04 11:06:47
 */
@TableName("quxiaoyuyue")
public class QuxiaoyuyueView extends QuxiaoyuyueEntity implements Serializable {
    private static final long serialVersionUID = 1L;

    public QuxiaoyuyueView() {
    }

    public QuxiaoyuyueView(QuxiaoyuyueEntity quxiaoyuyueEntity) {
        try {
            BeanUtils.copyProperties(this, quxiaoyuyueEntity);
        } catch (IllegalAccessException | InvocationTargetException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

    }


}
