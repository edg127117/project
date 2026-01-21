package com.cl.service;

import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.service.IService;
import com.cl.entity.GuzhangleixingEntity;
import com.cl.entity.view.GuzhangleixingView;
import com.cl.utils.PageUtils;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;


/**
 * 故障类型
 *
 * @author
 * @email
 * @date 2025-02-04 11:06:47
 */
public interface GuzhangleixingService extends IService<GuzhangleixingEntity> {

    PageUtils queryPage(Map<String, Object> params);

    List<GuzhangleixingView> selectListView(Wrapper<GuzhangleixingEntity> wrapper);

    GuzhangleixingView selectView(@Param("ew") Wrapper<GuzhangleixingEntity> wrapper);

    PageUtils queryPage(Map<String, Object> params, Wrapper<GuzhangleixingEntity> wrapper);


}

