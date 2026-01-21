package com.cl.controller;

import java.util.Arrays;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.cl.entity.PeijianEntity;
import com.cl.service.PeijianService;
import com.cl.utils.PageUtils;
import com.cl.utils.R;

/**
 * 配件管理后端接口
 */
@RestController
@RequestMapping("/peijian")
public class PeijianController {
    @Autowired
    private PeijianService peijianService;

    /**
     * 列表查询
     */
    @RequestMapping("/page")
    public R page(@RequestParam Map<String, Object> params, PeijianEntity peijian){
        EntityWrapper<PeijianEntity> ew = new EntityWrapper<PeijianEntity>();
        // 修正：支持配件名称模糊查询
        if(peijian.getPeijianmingcheng() != null && !peijian.getPeijianmingcheng().equals("")) {
            ew.like("peijianmingcheng", peijian.getPeijianmingcheng());
        }
        // 修正：调用带 wrapper 的查询方法
        PageUtils page = peijianService.queryPage(params, ew);
        return R.ok().put("data", page);
    }

    /**
     * 详情
     */
    @RequestMapping("/info/{id}")
    public R info(@PathVariable("id") Long id){
        PeijianEntity peijian = peijianService.selectById(id);
        return R.ok().put("data", peijian);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    public R save(@RequestBody PeijianEntity peijian){
        peijianService.insert(peijian);
        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    public R update(@RequestBody PeijianEntity peijian){
        peijianService.updateById(peijian);
        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    public R delete(@RequestBody Long[] ids){
        peijianService.deleteBatchIds(Arrays.asList(ids));
        return R.ok();
    }

    /**
     * 全部列表（供下拉框使用）
     */
    @RequestMapping("/list")
    public R list(@RequestParam Map<String, Object> params, PeijianEntity peijian){
        EntityWrapper<PeijianEntity> ew = new EntityWrapper<PeijianEntity>();
        return R.ok().put("data", peijianService.selectList(ew));
    }
}