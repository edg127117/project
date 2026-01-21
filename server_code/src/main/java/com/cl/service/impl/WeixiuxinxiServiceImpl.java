package com.cl.service.impl;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.cl.dao.WeixiuxinxiDao;
import com.cl.entity.WeixiuxinxiEntity;
import com.cl.entity.view.WeixiuxinxiView;
import com.cl.service.WeixiuxinxiService;
import com.cl.utils.PageUtils;
import com.cl.utils.Query;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service("weixiuxinxiService")
public class WeixiuxinxiServiceImpl extends ServiceImpl<WeixiuxinxiDao, WeixiuxinxiEntity> implements WeixiuxinxiService {


    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        Page<WeixiuxinxiEntity> page = this.selectPage(
                new Query<WeixiuxinxiEntity>(params).getPage(),
                new EntityWrapper<WeixiuxinxiEntity>()
        );
        return new PageUtils(page);
    }

    @Override
    public PageUtils queryPage(Map<String, Object> params, Wrapper<WeixiuxinxiEntity> wrapper) {
        Page<WeixiuxinxiView> page = new Query<WeixiuxinxiView>(params).getPage();
        page.setRecords(baseMapper.selectListView(page, wrapper));
        PageUtils pageUtil = new PageUtils(page);
        return pageUtil;
    }

    @Override
    public List<WeixiuxinxiView> selectListView(Wrapper<WeixiuxinxiEntity> wrapper) {
        return baseMapper.selectListView(wrapper);
    }

    @Override
    public WeixiuxinxiView selectView(Wrapper<WeixiuxinxiEntity> wrapper) {
        return baseMapper.selectView(wrapper);
    }


    @Override
    public List<Map<String, Object>> selectValue(Map<String, Object> params, Wrapper<WeixiuxinxiEntity> wrapper) {
        return baseMapper.selectValue(params, wrapper);
    }

    @Override
    public List<Map<String, Object>> selectTimeStatValue(Map<String, Object> params, Wrapper<WeixiuxinxiEntity> wrapper) {
        return baseMapper.selectTimeStatValue(params, wrapper);
    }

    @Override
    public List<Map<String, Object>> selectGroup(Map<String, Object> params, Wrapper<WeixiuxinxiEntity> wrapper) {
        return baseMapper.selectGroup(params, wrapper);
    }


}
