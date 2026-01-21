package com.cl.entity.view;

import com.baomidou.mybatisplus.annotations.TableName;
import com.cl.entity.WeixiufenpeiEntity;
import org.apache.commons.beanutils.BeanUtils;

import java.io.Serializable;
import java.lang.reflect.InvocationTargetException;


/**
 * 维修分配
 * 后端返回视图实体辅助类
 * （通常后端关联的表或者自定义的字段需要返回使用）
 *
 * @author
 * @email
 * @date 2025-02-04 11:06:47
 */
@TableName("weixiufenpei")
public class WeixiufenpeiView extends WeixiufenpeiEntity implements Serializable {
    private static final long serialVersionUID = 1L;

    public WeixiufenpeiView() {
    }

    public WeixiufenpeiView(WeixiufenpeiEntity weixiufenpeiEntity) {
        try {
            BeanUtils.copyProperties(this, weixiufenpeiEntity);
        } catch (IllegalAccessException | InvocationTargetException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

    }


}
