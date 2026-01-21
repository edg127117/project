package com.cl.service;

import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.service.IService;
import com.cl.entity.WeixiuxinxiEntity;
import com.cl.entity.view.WeixiuxinxiView;
import com.cl.utils.PageUtils;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;


/**
 * 维修信息
 *
 * @author
 * @email
 * @date 2025-02-04 11:06:46
 */
public interface WeixiuxinxiService extends IService<WeixiuxinxiEntity> {

    PageUtils queryPage(Map<String, Object> params);

    List<WeixiuxinxiView> selectListView(Wrapper<WeixiuxinxiEntity> wrapper);

    WeixiuxinxiView selectView(@Param("ew") Wrapper<WeixiuxinxiEntity> wrapper);

    PageUtils queryPage(Map<String, Object> params, Wrapper<WeixiuxinxiEntity> wrapper);


    List<Map<String, Object>> selectValue(Map<String, Object> params, Wrapper<WeixiuxinxiEntity> wrapper);

    List<Map<String, Object>> selectTimeStatValue(Map<String, Object> params, Wrapper<WeixiuxinxiEntity> wrapper);

    List<Map<String, Object>> selectGroup(Map<String, Object> params, Wrapper<WeixiuxinxiEntity> wrapper);


}

