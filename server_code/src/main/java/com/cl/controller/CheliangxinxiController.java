package com.cl.controller;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.cl.annotation.IgnoreAuth;
import com.cl.entity.CheliangxinxiEntity;
import com.cl.entity.view.CheliangxinxiView;
import com.cl.service.CheliangxinxiService;
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
 * 车辆信息
 * 后端接口
 *
 * @author
 * @email
 * @date 2025-02-04 11:06:46
 */
@RestController
@RequestMapping("/cheliangxinxi")
public class CheliangxinxiController {
    @Autowired
    private CheliangxinxiService cheliangxinxiService;


    /**
     * 后台列表
     */
    @RequestMapping("/page")
    public R page(@RequestParam Map<String, Object> params, CheliangxinxiEntity cheliangxinxi,
                  HttpServletRequest request) {
        String tableName = request.getSession().getAttribute("tableName").toString();
        if (tableName.equals("yonghu")) {
            cheliangxinxi.setYonghuzhanghao((String) request.getSession().getAttribute("username"));
        }
        EntityWrapper<CheliangxinxiEntity> ew = new EntityWrapper<CheliangxinxiEntity>();


        PageUtils page = cheliangxinxiService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, cheliangxinxi), params), params));
        return R.ok().put("data", page);
    }


    /**
     * 前端列表
     */
    @IgnoreAuth
    @RequestMapping("/list")
    public R list(@RequestParam Map<String, Object> params, CheliangxinxiEntity cheliangxinxi,
                  HttpServletRequest request) {
        EntityWrapper<CheliangxinxiEntity> ew = new EntityWrapper<CheliangxinxiEntity>();

        PageUtils page = cheliangxinxiService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, cheliangxinxi), params), params));
        return R.ok().put("data", page);
    }

    /**
     * 列表
     */
    @RequestMapping("/lists")
    public R list(CheliangxinxiEntity cheliangxinxi) {
        EntityWrapper<CheliangxinxiEntity> ew = new EntityWrapper<CheliangxinxiEntity>();
        ew.allEq(MPUtil.allEQMapPre(cheliangxinxi, "cheliangxinxi"));
        return R.ok().put("data", cheliangxinxiService.selectListView(ew));
    }

    /**
     * 查询
     */
    @RequestMapping("/query")
    public R query(CheliangxinxiEntity cheliangxinxi) {
        EntityWrapper<CheliangxinxiEntity> ew = new EntityWrapper<CheliangxinxiEntity>();
        ew.allEq(MPUtil.allEQMapPre(cheliangxinxi, "cheliangxinxi"));
        CheliangxinxiView cheliangxinxiView = cheliangxinxiService.selectView(ew);
        return R.ok("查询车辆信息成功").put("data", cheliangxinxiView);
    }

    /**
     * 后端详情
     */
    @RequestMapping("/info/{id}")
    public R info(@PathVariable("id") Long id) {
        CheliangxinxiEntity cheliangxinxi = cheliangxinxiService.selectById(id);
        cheliangxinxi = cheliangxinxiService.selectView(new EntityWrapper<CheliangxinxiEntity>().eq("id", id));
        return R.ok().put("data", cheliangxinxi);
    }

    /**
     * 前端详情
     */
    @IgnoreAuth
    @RequestMapping("/detail/{id}")
    public R detail(@PathVariable("id") Long id) {
        CheliangxinxiEntity cheliangxinxi = cheliangxinxiService.selectById(id);
        cheliangxinxi = cheliangxinxiService.selectView(new EntityWrapper<CheliangxinxiEntity>().eq("id", id));
        return R.ok().put("data", cheliangxinxi);
    }


    /**
     * 后端保存
     */
    @RequestMapping("/save")
    public R save(@RequestBody CheliangxinxiEntity cheliangxinxi, HttpServletRequest request) {
        //ValidatorUtils.validateEntity(cheliangxinxi);
        cheliangxinxiService.insert(cheliangxinxi);
        return R.ok();
    }

    /**
     * 前端保存
     */
    @RequestMapping("/add")
    public R add(@RequestBody CheliangxinxiEntity cheliangxinxi, HttpServletRequest request) {
        //ValidatorUtils.validateEntity(cheliangxinxi);
        cheliangxinxiService.insert(cheliangxinxi);
        return R.ok();
    }


    /**
     * 修改
     */
    @RequestMapping("/update")
    @Transactional
    public R update(@RequestBody CheliangxinxiEntity cheliangxinxi, HttpServletRequest request) {
        //ValidatorUtils.validateEntity(cheliangxinxi);
        cheliangxinxiService.updateById(cheliangxinxi);//全部更新
        return R.ok();
    }


    /**
     * 删除
     */
    @RequestMapping("/delete")
    public R delete(@RequestBody Long[] ids) {
        cheliangxinxiService.deleteBatchIds(Arrays.asList(ids));
        return R.ok();
    }


}
