package com.cl.service.impl;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.cl.dao.WeixiufenpeiDao;
import com.cl.entity.WeixiufenpeiEntity;
import com.cl.entity.view.WeixiufenpeiView;
import com.cl.service.WeixiufenpeiService;
import com.cl.utils.PageUtils;
import com.cl.utils.Query;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service("weixiufenpeiService")
public class WeixiufenpeiServiceImpl extends ServiceImpl<WeixiufenpeiDao, WeixiufenpeiEntity> implements WeixiufenpeiService {


    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        Page<WeixiufenpeiEntity> page = this.selectPage(
                new Query<WeixiufenpeiEntity>(params).getPage(),
                new EntityWrapper<WeixiufenpeiEntity>()
        );
        return new PageUtils(page);
    }

    @Override
    public PageUtils queryPage(Map<String, Object> params, Wrapper<WeixiufenpeiEntity> wrapper) {
        Page<WeixiufenpeiView> page = new Query<WeixiufenpeiView>(params).getPage();
        page.setRecords(baseMapper.selectListView(page, wrapper));
        PageUtils pageUtil = new PageUtils(page);
        return pageUtil;
    }

    @Override
    public List<WeixiufenpeiView> selectListView(Wrapper<WeixiufenpeiEntity> wrapper) {
        return baseMapper.selectListView(wrapper);
    }

    @Override
    public WeixiufenpeiView selectView(Wrapper<WeixiufenpeiEntity> wrapper) {
        return baseMapper.selectView(wrapper);
    }


}
