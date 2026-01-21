package com.cl.controller;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.cl.annotation.IgnoreAuth;
import com.cl.entity.SystemNoticeEntity;
import com.cl.entity.view.SystemNoticeView;
import com.cl.service.SystemNoticeService;
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
 * 系统公告
 * 后端接口
 *
 * @author
 * @email
 * @date 2025-02-04 11:06:47
 */
@RestController
@RequestMapping("/systemnotice")
public class SystemNoticeController {
    @Autowired
    private SystemNoticeService systemNoticeService;


    /**
     * 后台列表
     */
    @RequestMapping("/page")
    public R page(@RequestParam Map<String, Object> params, SystemNoticeEntity systemNotice,
                  HttpServletRequest request) {
        EntityWrapper<SystemNoticeEntity> ew = new EntityWrapper<SystemNoticeEntity>();


        PageUtils page = systemNoticeService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, systemNotice), params), params));
        return R.ok().put("data", page);
    }


    /**
     * 前端列表
     */
    @IgnoreAuth
    @RequestMapping("/list")
    public R list(@RequestParam Map<String, Object> params, SystemNoticeEntity systemNotice,
                  HttpServletRequest request) {
        EntityWrapper<SystemNoticeEntity> ew = new EntityWrapper<SystemNoticeEntity>();

        PageUtils page = systemNoticeService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, systemNotice), params), params));
        return R.ok().put("data", page);
    }

    /**
     * 列表
     */
    @RequestMapping("/lists")
    public R list(SystemNoticeEntity systemNotice) {
        EntityWrapper<SystemNoticeEntity> ew = new EntityWrapper<SystemNoticeEntity>();
        ew.allEq(MPUtil.allEQMapPre(systemNotice, "systemNotice"));
        return R.ok().put("data", systemNoticeService.selectListView(ew));
    }

    /**
     * 查询
     */
    @RequestMapping("/query")
    public R query(SystemNoticeEntity systemNotice) {
        EntityWrapper<SystemNoticeEntity> ew = new EntityWrapper<SystemNoticeEntity>();
        ew.allEq(MPUtil.allEQMapPre(systemNotice, "systemNotice"));
        SystemNoticeView systemNoticeView = systemNoticeService.selectView(ew);
        return R.ok("查询系统公告成功").put("data", systemNoticeView);
    }

    /**
     * 后端详情
     */
    @RequestMapping("/info/{id}")
    public R info(@PathVariable("id") Long id) {
        SystemNoticeEntity systemNotice = systemNoticeService.selectById(id);
        systemNotice = systemNoticeService.selectView(new EntityWrapper<SystemNoticeEntity>().eq("id", id));
        return R.ok().put("data", systemNotice);
    }

    /**
     * 前端详情
     */
    @IgnoreAuth
    @RequestMapping("/detail/{id}")
    public R detail(@PathVariable("id") Long id) {
        SystemNoticeEntity systemNotice = systemNoticeService.selectById(id);
        systemNotice = systemNoticeService.selectView(new EntityWrapper<SystemNoticeEntity>().eq("id", id));
        return R.ok().put("data", systemNotice);
    }


    /**
     * 后端保存
     */
    @RequestMapping("/save")
    public R save(@RequestBody SystemNoticeEntity systemNotice, HttpServletRequest request) {
        //ValidatorUtils.validateEntity(systemNotice);
        systemNoticeService.insert(systemNotice);
        return R.ok();
    }

    /**
     * 前端保存
     */
    @RequestMapping("/add")
    public R add(@RequestBody SystemNoticeEntity systemNotice, HttpServletRequest request) {
        //ValidatorUtils.validateEntity(systemNotice);
        systemNoticeService.insert(systemNotice);
        return R.ok();
    }


    /**
     * 修改
     */
    @RequestMapping("/update")
    @Transactional
    public R update(@RequestBody SystemNoticeEntity systemNotice, HttpServletRequest request) {
        //ValidatorUtils.validateEntity(systemNotice);
        systemNoticeService.updateById(systemNotice);//全部更新
        return R.ok();
    }


    /**
     * 删除
     */
    @RequestMapping("/delete")
    public R delete(@RequestBody Long[] ids) {
        systemNoticeService.deleteBatchIds(Arrays.asList(ids));
        return R.ok();
    }


}
