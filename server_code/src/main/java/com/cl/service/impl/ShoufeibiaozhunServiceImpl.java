package com.cl.service.impl;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.cl.dao.ShoufeibiaozhunDao;
import com.cl.entity.ShoufeibiaozhunEntity;
import com.cl.entity.view.ShoufeibiaozhunView;
import com.cl.service.ShoufeibiaozhunService;
import com.cl.utils.PageUtils;
import com.cl.utils.Query;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service("shoufeibiaozhunService")
public class ShoufeibiaozhunServiceImpl extends ServiceImpl<ShoufeibiaozhunDao, ShoufeibiaozhunEntity> implements ShoufeibiaozhunService {


    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        Page<ShoufeibiaozhunEntity> page = this.selectPage(
                new Query<ShoufeibiaozhunEntity>(params).getPage(),
                new EntityWrapper<ShoufeibiaozhunEntity>()
        );
        return new PageUtils(page);
    }

    @Override
    public PageUtils queryPage(Map<String, Object> params, Wrapper<ShoufeibiaozhunEntity> wrapper) {
        Page<ShoufeibiaozhunView> page = new Query<ShoufeibiaozhunView>(params).getPage();
        page.setRecords(baseMapper.selectListView(page, wrapper));
        PageUtils pageUtil = new PageUtils(page);
        return pageUtil;
    }

    @Override
    public List<ShoufeibiaozhunView> selectListView(Wrapper<ShoufeibiaozhunEntity> wrapper) {
        return baseMapper.selectListView(wrapper);
    }

    @Override
    public ShoufeibiaozhunView selectView(Wrapper<ShoufeibiaozhunEntity> wrapper) {
        return baseMapper.selectView(wrapper);
    }


}
