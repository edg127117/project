package com.cl.service.impl;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.cl.dao.GuzhangleixingDao;
import com.cl.entity.GuzhangleixingEntity;
import com.cl.entity.view.GuzhangleixingView;
import com.cl.service.GuzhangleixingService;
import com.cl.utils.PageUtils;
import com.cl.utils.Query;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service("guzhangleixingService")
public class GuzhangleixingServiceImpl extends ServiceImpl<GuzhangleixingDao, GuzhangleixingEntity> implements GuzhangleixingService {


    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        Page<GuzhangleixingEntity> page = this.selectPage(
                new Query<GuzhangleixingEntity>(params).getPage(),
                new EntityWrapper<GuzhangleixingEntity>()
        );
        return new PageUtils(page);
    }

    @Override
    public PageUtils queryPage(Map<String, Object> params, Wrapper<GuzhangleixingEntity> wrapper) {
        Page<GuzhangleixingView> page = new Query<GuzhangleixingView>(params).getPage();
        page.setRecords(baseMapper.selectListView(page, wrapper));
        PageUtils pageUtil = new PageUtils(page);
        return pageUtil;
    }

    @Override
    public List<GuzhangleixingView> selectListView(Wrapper<GuzhangleixingEntity> wrapper) {
        return baseMapper.selectListView(wrapper);
    }

    @Override
    public GuzhangleixingView selectView(Wrapper<GuzhangleixingEntity> wrapper) {
        return baseMapper.selectView(wrapper);
    }


}
