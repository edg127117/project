package com.cl.controller;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.cl.annotation.IgnoreAuth;
import com.cl.entity.GuzhangleixingEntity;
import com.cl.entity.view.GuzhangleixingView;
import com.cl.service.GuzhangleixingService;
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
 * 故障类型
 * 后端接口
 *
 * @author
 * @email
 * @date 2025-02-04 11:06:47
 */
@RestController
@RequestMapping("/guzhangleixing")
public class GuzhangleixingController {
    @Autowired
    private GuzhangleixingService guzhangleixingService;


    /**
     * 后台列表
     */
    @RequestMapping("/page")
    public R page(@RequestParam Map<String, Object> params, GuzhangleixingEntity guzhangleixing,
                  HttpServletRequest request) {
        EntityWrapper<GuzhangleixingEntity> ew = new EntityWrapper<GuzhangleixingEntity>();


        PageUtils page = guzhangleixingService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, guzhangleixing), params), params));
        return R.ok().put("data", page);
    }


    /**
     * 前端列表
     */
    @IgnoreAuth
    @RequestMapping("/list")
    public R list(@RequestParam Map<String, Object> params, GuzhangleixingEntity guzhangleixing,
                  HttpServletRequest request) {
        EntityWrapper<GuzhangleixingEntity> ew = new EntityWrapper<GuzhangleixingEntity>();

        PageUtils page = guzhangleixingService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, guzhangleixing), params), params));
        return R.ok().put("data", page);
    }

    /**
     * 列表
     */
    @RequestMapping("/lists")
    public R list(GuzhangleixingEntity guzhangleixing) {
        EntityWrapper<GuzhangleixingEntity> ew = new EntityWrapper<GuzhangleixingEntity>();
        ew.allEq(MPUtil.allEQMapPre(guzhangleixing, "guzhangleixing"));
        return R.ok().put("data", guzhangleixingService.selectListView(ew));
    }

    /**
     * 查询
     */
    @RequestMapping("/query")
    public R query(GuzhangleixingEntity guzhangleixing) {
        EntityWrapper<GuzhangleixingEntity> ew = new EntityWrapper<GuzhangleixingEntity>();
        ew.allEq(MPUtil.allEQMapPre(guzhangleixing, "guzhangleixing"));
        GuzhangleixingView guzhangleixingView = guzhangleixingService.selectView(ew);
        return R.ok("查询故障类型成功").put("data", guzhangleixingView);
    }

    /**
     * 后端详情
     */
    @RequestMapping("/info/{id}")
    public R info(@PathVariable("id") Long id) {
        GuzhangleixingEntity guzhangleixing = guzhangleixingService.selectById(id);
        guzhangleixing = guzhangleixingService.selectView(new EntityWrapper<GuzhangleixingEntity>().eq("id", id));
        return R.ok().put("data", guzhangleixing);
    }

    /**
     * 前端详情
     */
    @IgnoreAuth
    @RequestMapping("/detail/{id}")
    public R detail(@PathVariable("id") Long id) {
        GuzhangleixingEntity guzhangleixing = guzhangleixingService.selectById(id);
        guzhangleixing = guzhangleixingService.selectView(new EntityWrapper<GuzhangleixingEntity>().eq("id", id));
        return R.ok().put("data", guzhangleixing);
    }


    /**
     * 后端保存
     */
    @RequestMapping("/save")
    public R save(@RequestBody GuzhangleixingEntity guzhangleixing, HttpServletRequest request) {
        if (guzhangleixingService.selectCount(new EntityWrapper<GuzhangleixingEntity>().eq("guzhangleixing", guzhangleixing.getGuzhangleixing())) > 0) {
            return R.error("故障类型已存在");
        }
        //ValidatorUtils.validateEntity(guzhangleixing);
        guzhangleixingService.insert(guzhangleixing);
        return R.ok();
    }

    /**
     * 前端保存
     */
    @RequestMapping("/add")
    public R add(@RequestBody GuzhangleixingEntity guzhangleixing, HttpServletRequest request) {
        if (guzhangleixingService.selectCount(new EntityWrapper<GuzhangleixingEntity>().eq("guzhangleixing", guzhangleixing.getGuzhangleixing())) > 0) {
            return R.error("故障类型已存在");
        }
        //ValidatorUtils.validateEntity(guzhangleixing);
        guzhangleixingService.insert(guzhangleixing);
        return R.ok();
    }


    /**
     * 修改
     */
    @RequestMapping("/update")
    @Transactional
    public R update(@RequestBody GuzhangleixingEntity guzhangleixing, HttpServletRequest request) {
        //ValidatorUtils.validateEntity(guzhangleixing);
        guzhangleixingService.updateById(guzhangleixing);//全部更新
        return R.ok();
    }


    /**
     * 删除
     */
    @RequestMapping("/delete")
    public R delete(@RequestBody Long[] ids) {
        guzhangleixingService.deleteBatchIds(Arrays.asList(ids));
        return R.ok();
    }


}
