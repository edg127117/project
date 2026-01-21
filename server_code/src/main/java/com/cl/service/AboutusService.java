package com.cl.service;

import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.service.IService;
import com.cl.entity.AboutusEntity;
import com.cl.entity.view.AboutusView;
import com.cl.utils.PageUtils;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;


/**
 * 发展历程
 *
 * @author
 * @email
 * @date 2025-02-04 11:06:47
 */
public interface AboutusService extends IService<AboutusEntity> {

    PageUtils queryPage(Map<String, Object> params);

    List<AboutusView> selectListView(Wrapper<AboutusEntity> wrapper);

    AboutusView selectView(@Param("ew") Wrapper<AboutusEntity> wrapper);

    PageUtils queryPage(Map<String, Object> params, Wrapper<AboutusEntity> wrapper);


}

