package com.cl.service;

import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.service.IService;
import com.cl.entity.SystemNoticeEntity;
import com.cl.entity.view.SystemNoticeView;
import com.cl.utils.PageUtils;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;


/**
 * 系统公告
 *
 * @author
 * @email
 * @date 2025-02-04 11:06:47
 */
public interface SystemNoticeService extends IService<SystemNoticeEntity> {

    PageUtils queryPage(Map<String, Object> params);

    List<SystemNoticeView> selectListView(Wrapper<SystemNoticeEntity> wrapper);

    SystemNoticeView selectView(@Param("ew") Wrapper<SystemNoticeEntity> wrapper);

    PageUtils queryPage(Map<String, Object> params, Wrapper<SystemNoticeEntity> wrapper);


}

