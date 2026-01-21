package com.cl.dao;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;
import com.cl.entity.WeixiuyuyueEntity;
import com.cl.entity.view.WeixiuyuyueView;
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
public interface WeixiuyuyueDao extends BaseMapper<WeixiuyuyueEntity> {

    List<WeixiuyuyueView> selectListView(@Param("ew") Wrapper<WeixiuyuyueEntity> wrapper);

    List<WeixiuyuyueView> selectListView(Pagination page, @Param("ew") Wrapper<WeixiuyuyueEntity> wrapper);

    WeixiuyuyueView selectView(@Param("ew") Wrapper<WeixiuyuyueEntity> wrapper);


    List<Map<String, Object>> selectValue(@Param("params") Map<String, Object> params, @Param("ew") Wrapper<WeixiuyuyueEntity> wrapper);

    List<Map<String, Object>> selectTimeStatValue(@Param("params") Map<String, Object> params, @Param("ew") Wrapper<WeixiuyuyueEntity> wrapper);

    List<Map<String, Object>> selectGroup(@Param("params") Map<String, Object> params, @Param("ew") Wrapper<WeixiuyuyueEntity> wrapper);


}
