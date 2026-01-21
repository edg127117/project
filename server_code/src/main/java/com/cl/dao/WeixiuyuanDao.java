package com.cl.dao;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;
import com.cl.entity.WeixiuyuanEntity;
import com.cl.entity.view.WeixiuyuanView;
import org.apache.ibatis.annotations.Param;

import java.util.List;


/**
 * 维修员
 *
 * @author
 * @email
 * @date 2025-02-04 11:06:47
 */
public interface WeixiuyuanDao extends BaseMapper<WeixiuyuanEntity> {

    List<WeixiuyuanView> selectListView(@Param("ew") Wrapper<WeixiuyuanEntity> wrapper);

    List<WeixiuyuanView> selectListView(Pagination page, @Param("ew") Wrapper<WeixiuyuanEntity> wrapper);

    WeixiuyuanView selectView(@Param("ew") Wrapper<WeixiuyuanEntity> wrapper);


}
