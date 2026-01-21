package com.cl.dao;

import com.cl.entity.PeijianEntity;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import java.util.List;
import java.util.Map;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import com.cl.entity.view.PeijianView; // 注意：虽然我们没创建View类，但通常MyBatisPlus通用逻辑会用到，如果报错可以先删掉这个引用和下面的selectListView方法，或者你也创建一个空的PeijianView继承Entity

/**
 * 配件Dao
 */
@Mapper
public interface PeijianDao extends BaseMapper<PeijianEntity> {

}