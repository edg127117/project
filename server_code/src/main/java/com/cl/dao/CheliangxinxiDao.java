package com.cl.dao;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;
import com.cl.entity.CheliangxinxiEntity;
import com.cl.entity.view.CheliangxinxiView;
import org.apache.ibatis.annotations.Param;

import java.util.List;


/**
 * 车辆信息
 *
 * @author
 * @email
 * @date 2025-02-04 11:06:46
 */
public interface CheliangxinxiDao extends BaseMapper<CheliangxinxiEntity> {

    List<CheliangxinxiView> selectListView(@Param("ew") Wrapper<CheliangxinxiEntity> wrapper);

    List<CheliangxinxiView> selectListView(Pagination page, @Param("ew") Wrapper<CheliangxinxiEntity> wrapper);

    CheliangxinxiView selectView(@Param("ew") Wrapper<CheliangxinxiEntity> wrapper);


}
