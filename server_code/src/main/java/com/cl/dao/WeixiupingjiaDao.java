package com.cl.dao;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;
import com.cl.entity.WeixiupingjiaEntity;
import com.cl.entity.view.WeixiupingjiaView;
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
public interface WeixiupingjiaDao extends BaseMapper<WeixiupingjiaEntity> {

    List<WeixiupingjiaView> selectListView(@Param("ew") Wrapper<WeixiupingjiaEntity> wrapper);

    List<WeixiupingjiaView> selectListView(Pagination page, @Param("ew") Wrapper<WeixiupingjiaEntity> wrapper);

    WeixiupingjiaView selectView(@Param("ew") Wrapper<WeixiupingjiaEntity> wrapper);


    List<Map<String, Object>> selectValue(@Param("params") Map<String, Object> params, @Param("ew") Wrapper<WeixiupingjiaEntity> wrapper);

    List<Map<String, Object>> selectTimeStatValue(@Param("params") Map<String, Object> params, @Param("ew") Wrapper<WeixiupingjiaEntity> wrapper);

    List<Map<String, Object>> selectGroup(@Param("params") Map<String, Object> params, @Param("ew") Wrapper<WeixiupingjiaEntity> wrapper);


}
