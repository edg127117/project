package com.cl.controller;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.cl.annotation.IgnoreAuth;
import com.cl.entity.ShoufeibiaozhunEntity;
import com.cl.entity.view.ShoufeibiaozhunView;
import com.cl.service.ShoufeibiaozhunService;
import com.cl.service.StoreupService;
import com.cl.utils.MPUtil;
import com.cl.utils.PageUtils;
import com.cl.utils.R;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.Arrays;
import java.util.Map;

/**
 * 收费标准
 * 后端接口
 *
 * @author
 * @email
 * @date 2025-02-04 11:06:47
 */
@RestController
@RequestMapping("/shoufeibiaozhun")
public class ShoufeibiaozhunController {
    @Autowired
    private ShoufeibiaozhunService shoufeibiaozhunService;

    @Autowired
    private StoreupService storeupService;


    /**
     * 后台列表
     */
    @RequestMapping("/page")
    public R page(@RequestParam Map<String, Object> params, ShoufeibiaozhunEntity shoufeibiaozhun,
                  HttpServletRequest request) {
        EntityWrapper<ShoufeibiaozhunEntity> ew = new EntityWrapper<ShoufeibiaozhunEntity>();


        PageUtils page = shoufeibiaozhunService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, shoufeibiaozhun), params), params));
        return R.ok().put("data", page);
    }


    /**
     * 前端列表
     */
    @IgnoreAuth
    @RequestMapping("/list")
    public R list(@RequestParam Map<String, Object> params, ShoufeibiaozhunEntity shoufeibiaozhun,
                  HttpServletRequest request) {
        EntityWrapper<ShoufeibiaozhunEntity> ew = new EntityWrapper<ShoufeibiaozhunEntity>();

        PageUtils page = shoufeibiaozhunService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, shoufeibiaozhun), params), params));
        return R.ok().put("data", page);
    }

    /**
     * 列表
     */
    @RequestMapping("/lists")
    public R list(ShoufeibiaozhunEntity shoufeibiaozhun) {
        EntityWrapper<ShoufeibiaozhunEntity> ew = new EntityWrapper<ShoufeibiaozhunEntity>();
        ew.allEq(MPUtil.allEQMapPre(shoufeibiaozhun, "shoufeibiaozhun"));
        return R.ok().put("data", shoufeibiaozhunService.selectListView(ew));
    }

    /**
     * 查询
     */
    @RequestMapping("/query")
    public R query(ShoufeibiaozhunEntity shoufeibiaozhun) {
        EntityWrapper<ShoufeibiaozhunEntity> ew = new EntityWrapper<ShoufeibiaozhunEntity>();
        ew.allEq(MPUtil.allEQMapPre(shoufeibiaozhun, "shoufeibiaozhun"));
        ShoufeibiaozhunView shoufeibiaozhunView = shoufeibiaozhunService.selectView(ew);
        return R.ok("查询收费标准成功").put("data", shoufeibiaozhunView);
    }

    /**
     * 后端详情
     */
    @RequestMapping("/info/{id}")
    public R info(@PathVariable("id") Long id) {
        ShoufeibiaozhunEntity shoufeibiaozhun = shoufeibiaozhunService.selectById(id);
        shoufeibiaozhun = shoufeibiaozhunService.selectView(new EntityWrapper<ShoufeibiaozhunEntity>().eq("id", id));
        return R.ok().put("data", shoufeibiaozhun);
    }

    /**
     * 前端详情
     */
    @IgnoreAuth
    @RequestMapping("/detail/{id}")
    public R detail(@PathVariable("id") Long id) {
        ShoufeibiaozhunEntity shoufeibiaozhun = shoufeibiaozhunService.selectById(id);
        shoufeibiaozhun = shoufeibiaozhunService.selectView(new EntityWrapper<ShoufeibiaozhunEntity>().eq("id", id));
        return R.ok().put("data", shoufeibiaozhun);
    }


    /**
     * 后端保存
     */
    @RequestMapping("/save")
    public R save(@RequestBody ShoufeibiaozhunEntity shoufeibiaozhun, HttpServletRequest request) {
        //ValidatorUtils.validateEntity(shoufeibiaozhun);
        shoufeibiaozhunService.insert(shoufeibiaozhun);
        return R.ok();
    }

    /**
     * 前端保存
     */
    @RequestMapping("/add")
    public R add(@RequestBody ShoufeibiaozhunEntity shoufeibiaozhun, HttpServletRequest request) {
        //ValidatorUtils.validateEntity(shoufeibiaozhun);
        shoufeibiaozhunService.insert(shoufeibiaozhun);
        return R.ok();
    }


    /**
     * 修改
     */
    @RequestMapping("/update")
    @Transactional
    public R update(@RequestBody ShoufeibiaozhunEntity shoufeibiaozhun, HttpServletRequest request) {
        //ValidatorUtils.validateEntity(shoufeibiaozhun);
        shoufeibiaozhunService.updateById(shoufeibiaozhun);//全部更新
        return R.ok();
    }


    /**
     * 删除
     */
    @RequestMapping("/delete")
    public R delete(@RequestBody Long[] ids) {
        shoufeibiaozhunService.deleteBatchIds(Arrays.asList(ids));
        return R.ok();
    }


}
