package com.cl.service;

import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.service.IService;
import com.cl.entity.WeixiufenpeiEntity;
import com.cl.entity.view.WeixiufenpeiView;
import com.cl.utils.PageUtils;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;


/**
 * 维修分配
 *
 * @author
 * @email
 * @date 2025-02-04 11:06:47
 */
public interface WeixiufenpeiService extends IService<WeixiufenpeiEntity> {

    PageUtils queryPage(Map<String, Object> params);

    List<WeixiufenpeiView> selectListView(Wrapper<WeixiufenpeiEntity> wrapper);

    WeixiufenpeiView selectView(@Param("ew") Wrapper<WeixiufenpeiEntity> wrapper);

    PageUtils queryPage(Map<String, Object> params, Wrapper<WeixiufenpeiEntity> wrapper);


}

