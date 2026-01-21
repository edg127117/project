package com.cl.service;

import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.service.IService;
import com.cl.entity.WeixiuyuyueEntity;
import com.cl.entity.view.WeixiuyuyueView;
import com.cl.utils.PageUtils;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;


/**
 * 维修预约
 *
 * @author
 * @email
 * @date 2025-02-04 11:06:46
 */
public interface WeixiuyuyueService extends IService<WeixiuyuyueEntity> {

    PageUtils queryPage(Map<String, Object> params);

    List<WeixiuyuyueView> selectListView(Wrapper<WeixiuyuyueEntity> wrapper);

    WeixiuyuyueView selectView(@Param("ew") Wrapper<WeixiuyuyueEntity> wrapper);

    PageUtils queryPage(Map<String, Object> params, Wrapper<WeixiuyuyueEntity> wrapper);


    List<Map<String, Object>> selectValue(Map<String, Object> params, Wrapper<WeixiuyuyueEntity> wrapper);

    List<Map<String, Object>> selectTimeStatValue(Map<String, Object> params, Wrapper<WeixiuyuyueEntity> wrapper);

    List<Map<String, Object>> selectGroup(Map<String, Object> params, Wrapper<WeixiuyuyueEntity> wrapper);


}

