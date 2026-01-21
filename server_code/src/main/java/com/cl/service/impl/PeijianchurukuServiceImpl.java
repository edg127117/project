package com.cl.service.impl;
import org.springframework.stereotype.Service;
import java.util.Map;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.cl.utils.PageUtils;
import com.cl.utils.Query;
import com.cl.dao.PeijianchurukuDao;
import com.cl.entity.PeijianchurukuEntity;
import com.cl.service.PeijianchurukuService;

@Service("peijianchurukuService")
public class PeijianchurukuServiceImpl extends ServiceImpl<PeijianchurukuDao, PeijianchurukuEntity> implements PeijianchurukuService {
    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        Page<PeijianchurukuEntity> page = this.selectPage(
                new Query<PeijianchurukuEntity>(params).getPage(),
                new EntityWrapper<PeijianchurukuEntity>()
        );
        return new PageUtils(page);
    }
}