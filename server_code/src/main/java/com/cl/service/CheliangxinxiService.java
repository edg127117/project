package com.cl.service;

import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.service.IService;
import com.cl.entity.CheliangxinxiEntity;
import com.cl.entity.view.CheliangxinxiView;
import com.cl.utils.PageUtils;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;


/**
 * 车辆信息
 *
 * @author
 * @email
 * @date 2025-02-04 11:06:46
 */
public interface CheliangxinxiService extends IService<CheliangxinxiEntity> {

    PageUtils queryPage(Map<String, Object> params);

    List<CheliangxinxiView> selectListView(Wrapper<CheliangxinxiEntity> wrapper);

    CheliangxinxiView selectView(@Param("ew") Wrapper<CheliangxinxiEntity> wrapper);

    PageUtils queryPage(Map<String, Object> params, Wrapper<CheliangxinxiEntity> wrapper);


}

