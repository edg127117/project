package com.cl.service;

import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.service.IService;
import com.cl.entity.WeixiupingjiaEntity;
import com.cl.entity.view.WeixiupingjiaView;
import com.cl.utils.PageUtils;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;


/**
 * 维修评价
 *
 * @author
 * @email
 * @date 2025-02-04 11:06:47
 */
public interface WeixiupingjiaService extends IService<WeixiupingjiaEntity> {

    PageUtils queryPage(Map<String, Object> params);

    List<WeixiupingjiaView> selectListView(Wrapper<WeixiupingjiaEntity> wrapper);

    WeixiupingjiaView selectView(@Param("ew") Wrapper<WeixiupingjiaEntity> wrapper);

    PageUtils queryPage(Map<String, Object> params, Wrapper<WeixiupingjiaEntity> wrapper);


    List<Map<String, Object>> selectValue(Map<String, Object> params, Wrapper<WeixiupingjiaEntity> wrapper);

    List<Map<String, Object>> selectTimeStatValue(Map<String, Object> params, Wrapper<WeixiupingjiaEntity> wrapper);

    List<Map<String, Object>> selectGroup(Map<String, Object> params, Wrapper<WeixiupingjiaEntity> wrapper);


}

