package com.cl.service.impl;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.cl.dao.WeixiupingjiaDao;
import com.cl.entity.WeixiupingjiaEntity;
import com.cl.entity.view.WeixiupingjiaView;
import com.cl.service.WeixiupingjiaService;
import com.cl.utils.PageUtils;
import com.cl.utils.Query;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service("weixiupingjiaService")
public class WeixiupingjiaServiceImpl extends ServiceImpl<WeixiupingjiaDao, WeixiupingjiaEntity> implements WeixiupingjiaService {


    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        Page<WeixiupingjiaEntity> page = this.selectPage(
                new Query<WeixiupingjiaEntity>(params).getPage(),
                new EntityWrapper<WeixiupingjiaEntity>()
        );
        return new PageUtils(page);
    }

    @Override
    public PageUtils queryPage(Map<String, Object> params, Wrapper<WeixiupingjiaEntity> wrapper) {
        Page<WeixiupingjiaView> page = new Query<WeixiupingjiaView>(params).getPage();
        page.setRecords(baseMapper.selectListView(page, wrapper));
        PageUtils pageUtil = new PageUtils(page);
        return pageUtil;
    }

    @Override
    public List<WeixiupingjiaView> selectListView(Wrapper<WeixiupingjiaEntity> wrapper) {
        return baseMapper.selectListView(wrapper);
    }

    @Override
    public WeixiupingjiaView selectView(Wrapper<WeixiupingjiaEntity> wrapper) {
        return baseMapper.selectView(wrapper);
    }


    @Override
    public List<Map<String, Object>> selectValue(Map<String, Object> params, Wrapper<WeixiupingjiaEntity> wrapper) {
        return baseMapper.selectValue(params, wrapper);
    }

    @Override
    public List<Map<String, Object>> selectTimeStatValue(Map<String, Object> params, Wrapper<WeixiupingjiaEntity> wrapper) {
        return baseMapper.selectTimeStatValue(params, wrapper);
    }

    @Override
    public List<Map<String, Object>> selectGroup(Map<String, Object> params, Wrapper<WeixiupingjiaEntity> wrapper) {
        return baseMapper.selectGroup(params, wrapper);
    }


}
