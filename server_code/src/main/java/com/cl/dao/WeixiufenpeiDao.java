package com.cl.dao;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;
import com.cl.entity.WeixiufenpeiEntity;
import com.cl.entity.view.WeixiufenpeiView;
import org.apache.ibatis.annotations.Param;

import java.util.List;


/**
 * 维修分配
 *
 * @author
 * @email
 * @date 2025-02-04 11:06:47
 */
public interface WeixiufenpeiDao extends BaseMapper<WeixiufenpeiEntity> {

    List<WeixiufenpeiView> selectListView(@Param("ew") Wrapper<WeixiufenpeiEntity> wrapper);

    List<WeixiufenpeiView> selectListView(Pagination page, @Param("ew") Wrapper<WeixiufenpeiEntity> wrapper);

    WeixiufenpeiView selectView(@Param("ew") Wrapper<WeixiufenpeiEntity> wrapper);


}
