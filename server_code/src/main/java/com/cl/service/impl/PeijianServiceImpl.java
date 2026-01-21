package com.cl.service.impl;

import org.springframework.stereotype.Service;
import java.util.Map;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.cl.utils.PageUtils;
import com.cl.utils.Query;

import com.cl.dao.PeijianDao;
import com.cl.entity.PeijianEntity;
import com.cl.service.PeijianService;

@Service("peijianService")
public class PeijianServiceImpl extends ServiceImpl<PeijianDao, PeijianEntity> implements PeijianService {

    @Override
    public PageUtils queryPage(Map<String, Object> params, EntityWrapper<PeijianEntity> wrapper) {
        Page<PeijianEntity> page = this.selectPage(
                new Query<PeijianEntity>(params).getPage(),
                wrapper // 使用传入的查询条件
        );
        return new PageUtils(page);
    }
}
