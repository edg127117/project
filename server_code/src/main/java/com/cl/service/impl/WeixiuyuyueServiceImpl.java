package com.cl.service.impl;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.cl.dao.WeixiuyuyueDao;
import com.cl.entity.WeixiuyuyueEntity;
import com.cl.entity.view.WeixiuyuyueView;
import com.cl.service.WeixiuyuyueService;
import com.cl.utils.PageUtils;
import com.cl.utils.Query;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service("weixiuyuyueService")
public class WeixiuyuyueServiceImpl extends ServiceImpl<WeixiuyuyueDao, WeixiuyuyueEntity> implements WeixiuyuyueService {


    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        Page<WeixiuyuyueEntity> page = this.selectPage(
                new Query<WeixiuyuyueEntity>(params).getPage(),
                new EntityWrapper<WeixiuyuyueEntity>()
        );
        return new PageUtils(page);
    }

    @Override
    public PageUtils queryPage(Map<String, Object> params, Wrapper<WeixiuyuyueEntity> wrapper) {
        Page<WeixiuyuyueView> page = new Query<WeixiuyuyueView>(params).getPage();
        page.setRecords(baseMapper.selectListView(page, wrapper));
        PageUtils pageUtil = new PageUtils(page);
        return pageUtil;
    }

    @Override
    public List<WeixiuyuyueView> selectListView(Wrapper<WeixiuyuyueEntity> wrapper) {
        return baseMapper.selectListView(wrapper);
    }

    @Override
    public WeixiuyuyueView selectView(Wrapper<WeixiuyuyueEntity> wrapper) {
        return baseMapper.selectView(wrapper);
    }


    @Override
    public List<Map<String, Object>> selectValue(Map<String, Object> params, Wrapper<WeixiuyuyueEntity> wrapper) {
        return baseMapper.selectValue(params, wrapper);
    }

    @Override
    public List<Map<String, Object>> selectTimeStatValue(Map<String, Object> params, Wrapper<WeixiuyuyueEntity> wrapper) {
        return baseMapper.selectTimeStatValue(params, wrapper);
    }

    @Override
    public List<Map<String, Object>> selectGroup(Map<String, Object> params, Wrapper<WeixiuyuyueEntity> wrapper) {
        return baseMapper.selectGroup(params, wrapper);
    }


}
