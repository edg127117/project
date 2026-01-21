package com.cl.dao;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;
import com.cl.entity.WeixiuxinxiEntity;
import com.cl.entity.view.WeixiuxinxiView;
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
public interface WeixiuxinxiDao extends BaseMapper<WeixiuxinxiEntity> {

    List<WeixiuxinxiView> selectListView(@Param("ew") Wrapper<WeixiuxinxiEntity> wrapper);

    List<WeixiuxinxiView> selectListView(Pagination page, @Param("ew") Wrapper<WeixiuxinxiEntity> wrapper);

    WeixiuxinxiView selectView(@Param("ew") Wrapper<WeixiuxinxiEntity> wrapper);


    List<Map<String, Object>> selectValue(@Param("params") Map<String, Object> params, @Param("ew") Wrapper<WeixiuxinxiEntity> wrapper);

    List<Map<String, Object>> selectTimeStatValue(@Param("params") Map<String, Object> params, @Param("ew") Wrapper<WeixiuxinxiEntity> wrapper);

    List<Map<String, Object>> selectGroup(@Param("params") Map<String, Object> params, @Param("ew") Wrapper<WeixiuxinxiEntity> wrapper);


}
