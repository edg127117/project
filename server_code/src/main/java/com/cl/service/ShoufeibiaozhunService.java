package com.cl.service;

import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.service.IService;
import com.cl.entity.ShoufeibiaozhunEntity;
import com.cl.entity.view.ShoufeibiaozhunView;
import com.cl.utils.PageUtils;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;


/**
 * 收费标准
 *
 * @author
 * @email
 * @date 2025-02-04 11:06:47
 */
public interface ShoufeibiaozhunService extends IService<ShoufeibiaozhunEntity> {

    PageUtils queryPage(Map<String, Object> params);

    List<ShoufeibiaozhunView> selectListView(Wrapper<ShoufeibiaozhunEntity> wrapper);

    ShoufeibiaozhunView selectView(@Param("ew") Wrapper<ShoufeibiaozhunEntity> wrapper);

    PageUtils queryPage(Map<String, Object> params, Wrapper<ShoufeibiaozhunEntity> wrapper);


}

