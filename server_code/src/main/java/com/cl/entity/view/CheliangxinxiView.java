package com.cl.entity.view;

import com.baomidou.mybatisplus.annotations.TableName;
import com.cl.entity.CheliangxinxiEntity;
import org.apache.commons.beanutils.BeanUtils;

import java.io.Serializable;
import java.lang.reflect.InvocationTargetException;


/**
 * 车辆信息
 * 后端返回视图实体辅助类
 * （通常后端关联的表或者自定义的字段需要返回使用）
 *
 * @author
 * @email
 * @date 2025-02-04 11:06:46
 */
@TableName("cheliangxinxi")
public class CheliangxinxiView extends CheliangxinxiEntity implements Serializable {
    private static final long serialVersionUID = 1L;

    public CheliangxinxiView() {
    }

    public CheliangxinxiView(CheliangxinxiEntity cheliangxinxiEntity) {
        try {
            BeanUtils.copyProperties(this, cheliangxinxiEntity);
        } catch (IllegalAccessException | InvocationTargetException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

    }


}
