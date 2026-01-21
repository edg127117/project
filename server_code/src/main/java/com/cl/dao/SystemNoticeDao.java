package com.cl.dao;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;
import com.cl.entity.SystemNoticeEntity;
import com.cl.entity.view.SystemNoticeView;
import org.apache.ibatis.annotations.Param;

import java.util.List;


/**
 * 系统公告
 *
 * @author
 * @email
 * @date 2025-02-04 11:06:47
 */
public interface SystemNoticeDao extends BaseMapper<SystemNoticeEntity> {

    List<SystemNoticeView> selectListView(@Param("ew") Wrapper<SystemNoticeEntity> wrapper);

    List<SystemNoticeView> selectListView(Pagination page, @Param("ew") Wrapper<SystemNoticeEntity> wrapper);

    SystemNoticeView selectView(@Param("ew") Wrapper<SystemNoticeEntity> wrapper);


}
