package com.cl.service;
import com.baomidou.mybatisplus.service.IService;
import com.cl.utils.PageUtils;
import com.cl.entity.PeijianchurukuEntity;
import java.util.Map;

public interface PeijianchurukuService extends IService<PeijianchurukuEntity> {
    PageUtils queryPage(Map<String, Object> params);
}