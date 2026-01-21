package com.cl.dao;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;
import com.cl.entity.AboutusEntity;
import com.cl.entity.view.AboutusView;
import org.apache.ibatis.annotations.Param;

import java.util.List;


/**
 * 发展历程
 *
 * @author
 * @email
 * @date 2025-02-04 11:06:47
 */
public interface AboutusDao extends BaseMapper<AboutusEntity> {

    List<AboutusView> selectListView(@Param("ew") Wrapper<AboutusEntity> wrapper);

    List<AboutusView> selectListView(Pagination page, @Param("ew") Wrapper<AboutusEntity> wrapper);

    AboutusView selectView(@Param("ew") Wrapper<AboutusEntity> wrapper);


}
