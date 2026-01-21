package com.cl.controller;

import java.util.Arrays;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.cl.entity.PeijianchurukuEntity;
import com.cl.entity.PeijianEntity;
import com.cl.service.PeijianchurukuService;
import com.cl.service.PeijianService;
import com.cl.utils.PageUtils;
import com.cl.utils.R;

@RestController
@RequestMapping("/peijianchuruku")
public class PeijianchurukuController {
    @Autowired
    private PeijianchurukuService peijianchurukuService;

    @Autowired
    private PeijianService peijianService;

    @RequestMapping("/page")
    public R page(@RequestParam Map<String, Object> params, PeijianchurukuEntity peijianchuruku){
        EntityWrapper<PeijianchurukuEntity> ew = new EntityWrapper<PeijianchurukuEntity>();
        PageUtils page = peijianchurukuService.queryPage(params);
        return R.ok().put("data", page);
    }

    /**
     * 新增出入库记录，并自动更新库存
     */
    @RequestMapping("/save")
    public R save(@RequestBody PeijianchurukuEntity peijianchuruku){
        // 1. 保存记录
        peijianchurukuService.insert(peijianchuruku);

        // 2. 更新库存逻辑
        // 根据名称找到对应的配件（真实项目建议用ID，这里为了简化操作直接匹配名称）
        PeijianEntity peijian = peijianService.selectOne(new EntityWrapper<PeijianEntity>().eq("peijianmingcheng", peijianchuruku.getPeijianmingcheng()));

        if(peijian != null) {
            int currentStock = peijian.getShuliang();
            int changeNum = peijianchuruku.getShuliang();

            if("入库".equals(peijianchuruku.getCaozuoleixing())) {
                peijian.setShuliang(currentStock + changeNum);
            } else if("出库".equals(peijianchuruku.getCaozuoleixing())) {
                if(currentStock < changeNum) {
                    return R.error("库存不足，无法出库！");
                }
                peijian.setShuliang(currentStock - changeNum);
            }
            peijianService.updateById(peijian);
        }

        return R.ok();
    }
}