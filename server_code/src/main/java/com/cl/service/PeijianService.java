package com.cl.service;

import com.baomidou.mybatisplus.service.IService;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.cl.utils.PageUtils;
import com.cl.entity.PeijianEntity;
import java.util.Map;

public interface PeijianService extends IService<PeijianEntity> {
    // 增加 Wrapper 参数支持
    PageUtils queryPage(Map<String, Object> params, EntityWrapper<PeijianEntity> wrapper);
}