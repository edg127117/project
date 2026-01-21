package com.cl.dao;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;
import com.cl.entity.QuxiaoyuyueEntity;
import com.cl.entity.view.QuxiaoyuyueView;
import org.apache.ibatis.annotations.Param;

import java.util.List;


/**
 * 取消预约
 *
 * @author
 * @email
 * @date 2025-02-04 11:06:47
 */
public interface QuxiaoyuyueDao extends BaseMapper<QuxiaoyuyueEntity> {

    List<QuxiaoyuyueView> selectListView(@Param("ew") Wrapper<QuxiaoyuyueEntity> wrapper);

    List<QuxiaoyuyueView> selectListView(Pagination page, @Param("ew") Wrapper<QuxiaoyuyueEntity> wrapper);

    QuxiaoyuyueView selectView(@Param("ew") Wrapper<QuxiaoyuyueEntity> wrapper);


}
