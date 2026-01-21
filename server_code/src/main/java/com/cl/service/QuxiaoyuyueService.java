package com.cl.service;

import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.service.IService;
import com.cl.entity.QuxiaoyuyueEntity;
import com.cl.entity.view.QuxiaoyuyueView;
import com.cl.utils.PageUtils;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;


/**
 * 取消预约
 *
 * @author
 * @email
 * @date 2025-02-04 11:06:47
 */
public interface QuxiaoyuyueService extends IService<QuxiaoyuyueEntity> {

    PageUtils queryPage(Map<String, Object> params);

    List<QuxiaoyuyueView> selectListView(Wrapper<QuxiaoyuyueEntity> wrapper);

    QuxiaoyuyueView selectView(@Param("ew") Wrapper<QuxiaoyuyueEntity> wrapper);

    PageUtils queryPage(Map<String, Object> params, Wrapper<QuxiaoyuyueEntity> wrapper);


}

