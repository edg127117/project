package com.cl.controller;


import java.util.Arrays;
import java.util.Map;
import java.util.Date;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.cl.annotation.IgnoreAuth;

import com.cl.entity.WeixiufenpeiEntity;
import com.cl.entity.view.WeixiufenpeiView;

import com.cl.service.WeixiufenpeiService;
import com.cl.utils.PageUtils;
import com.cl.utils.R;
import com.cl.utils.MPUtil;


/**
 * 维修分配
 * 后端接口
 * @author
 * @email
 * @date 2024-03-12 18:34:33
 */
@RestController
@RequestMapping("/weixiufenpei")
public class WeixiufenpeiController {
    @Autowired
    private WeixiufenpeiService weixiufenpeiService;

    /**
     * 后端列表
     */
    @RequestMapping("/page")
    public R page(@RequestParam Map<String, Object> params,WeixiufenpeiEntity weixiufenpei,
                  HttpServletRequest request){
        String tableName = request.getSession().getAttribute("tableName").toString();
        if(tableName.equals("yonghu")) {
            weixiufenpei.setYonghuzhanghao((String)request.getSession().getAttribute("username"));
        }
        if(tableName.equals("weixiuyuan")) {
            // 按照您代码中的字段名 weixiuzhanghao
            weixiufenpei.setWeixiuzhanghao((String)request.getSession().getAttribute("username"));
        }
        EntityWrapper<WeixiufenpeiEntity> ew = new EntityWrapper<WeixiufenpeiEntity>();

        PageUtils page = weixiufenpeiService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, weixiufenpei), params), params));

        return R.ok().put("data", page);
    }

    /**
     * 前端列表
     */
    @IgnoreAuth
    @RequestMapping("/list")
    public R list(@RequestParam Map<String, Object> params,WeixiufenpeiEntity weixiufenpei,
                  HttpServletRequest request){
        EntityWrapper<WeixiufenpeiEntity> ew = new EntityWrapper<WeixiufenpeiEntity>();

        PageUtils page = weixiufenpeiService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, weixiufenpei), params), params));
        return R.ok().put("data", page);
    }

    /**
     * 列表
     */
    @RequestMapping("/lists")
    public R list( WeixiufenpeiEntity weixiufenpei){
        EntityWrapper<WeixiufenpeiEntity> ew = new EntityWrapper<WeixiufenpeiEntity>();
        ew.allEq(MPUtil.allEQMapPre( weixiufenpei, "weixiufenpei"));
        return R.ok().put("data", weixiufenpeiService.selectListView(ew));
    }

    /**
     * 查询
     */
    @RequestMapping("/query")
    public R query(WeixiufenpeiEntity weixiufenpei){
        EntityWrapper< WeixiufenpeiEntity> ew = new EntityWrapper< WeixiufenpeiEntity>();
        ew.allEq(MPUtil.allEQMapPre( weixiufenpei, "weixiufenpei"));
        WeixiufenpeiView weixiufenpeiView =  weixiufenpeiService.selectView(ew);
        return R.ok("查询维修分配成功").put("data", weixiufenpeiView);
    }

    /**
     * 详情
     */
    @RequestMapping("/info/{id}")
    public R info(@PathVariable("id") Long id){
        WeixiufenpeiEntity weixiufenpei = weixiufenpeiService.selectById(id);
        return R.ok().put("data", weixiufenpei);
    }

    /**
     * 保存 - 采用您的逻辑：自动生成时间和默认状态
     */
    @RequestMapping("/save")
    public R save(@RequestBody WeixiufenpeiEntity weixiufenpei, HttpServletRequest request){
        weixiufenpei.setId(new Date().getTime()+new Double(Math.floor(Math.random()*1000)).longValue());
        //ValidatorUtils.validateEntity(weixiufenpei);

        // --- 核心逻辑：自动填充默认状态 ---
        if(weixiufenpei.getWeixiuzhuangtai() == null || "".equals(weixiufenpei.getWeixiuzhuangtai())) {
            weixiufenpei.setWeixiuzhuangtai("待维修");
        }

        // --- 核心逻辑：自动生成分配时间 ---
        weixiufenpei.setFenpeishijian(new Date());

        weixiufenpeiService.insert(weixiufenpei);
        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    @Transactional
    public R update(@RequestBody WeixiufenpeiEntity weixiufenpei, HttpServletRequest request){
        //ValidatorUtils.validateEntity(weixiufenpei);
        weixiufenpeiService.updateById(weixiufenpei);//全部更新
        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    public R delete(@RequestBody Long[] ids){
        weixiufenpeiService.deleteBatchIds(Arrays.asList(ids));
        return R.ok();
    }
}
