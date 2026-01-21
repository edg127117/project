package com.cl.dao;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;
import com.cl.entity.GuzhangleixingEntity;
import com.cl.entity.view.GuzhangleixingView;
import org.apache.ibatis.annotations.Param;

import java.util.List;


/**
 * 故障类型
 *
 * @author
 * @email
 * @date 2025-02-04 11:06:47
 */
public interface GuzhangleixingDao extends BaseMapper<GuzhangleixingEntity> {

    List<GuzhangleixingView> selectListView(@Param("ew") Wrapper<GuzhangleixingEntity> wrapper);

    List<GuzhangleixingView> selectListView(Pagination page, @Param("ew") Wrapper<GuzhangleixingEntity> wrapper);

    GuzhangleixingView selectView(@Param("ew") Wrapper<GuzhangleixingEntity> wrapper);


}
