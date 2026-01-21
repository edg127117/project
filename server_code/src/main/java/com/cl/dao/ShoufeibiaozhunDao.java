package com.cl.dao;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;
import com.cl.entity.ShoufeibiaozhunEntity;
import com.cl.entity.view.ShoufeibiaozhunView;
import org.apache.ibatis.annotations.Param;

import java.util.List;


/**
 * 收费标准
 *
 * @author
 * @email
 * @date 2025-02-04 11:06:47
 */
public interface ShoufeibiaozhunDao extends BaseMapper<ShoufeibiaozhunEntity> {

    List<ShoufeibiaozhunView> selectListView(@Param("ew") Wrapper<ShoufeibiaozhunEntity> wrapper);

    List<ShoufeibiaozhunView> selectListView(Pagination page, @Param("ew") Wrapper<ShoufeibiaozhunEntity> wrapper);

    ShoufeibiaozhunView selectView(@Param("ew") Wrapper<ShoufeibiaozhunEntity> wrapper);


}
