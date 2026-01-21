package com.cl.controller;

import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Map;
import java.util.Date;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.cl.entity.WeixiufenpeiEntity;
import com.cl.service.WeixiufenpeiService;
import com.cl.utils.PageUtils;
import com.cl.utils.R;
import com.cl.utils.MPUtil;

/**
 * 维修分配 / 工单管理
 */
@RestController
@RequestMapping("/weixiufenpei")
public class WeixiufenpeiController {
    @Autowired
    private WeixiufenpeiService weixiufenpeiService;

    @RequestMapping("/page")
    public R page(@RequestParam Map<String, Object> params,WeixiufenpeiEntity weixiufenpei,
                  HttpServletRequest request){
        String tableName = request.getSession().getAttribute("tableName").toString();
        if(tableName.equals("yonghu")) {
            weixiufenpei.setYonghuzhanghao((String)request.getSession().getAttribute("username"));
        }
        if(tableName.equals("weixiuyuan")) {
            weixiufenpei.setWeixiuzhanghao((String)request.getSession().getAttribute("username"));
        }
        EntityWrapper<WeixiufenpeiEntity> ew = new EntityWrapper<WeixiufenpeiEntity>();
        PageUtils page = weixiufenpeiService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, weixiufenpei), params), params));
        return R.ok().put("data", page);
    }

    @RequestMapping("/info/{id}")
    public R info(@PathVariable("id") Long id){
        WeixiufenpeiEntity weixiufenpei = weixiufenpeiService.selectById(id);
        return R.ok().put("data", weixiufenpei);
    }

    /**
     * 派单保存
     */
    @RequestMapping("/save")
    public R save(@RequestBody WeixiufenpeiEntity weixiufenpei, HttpServletRequest request){
        weixiufenpei.setId(new Date().getTime()+new Double(Math.floor(Math.random()*1000)).longValue());

        // 核心逻辑：如果没有填状态，默认就是“待维修”
        if(weixiufenpei.getWeixiuzhuangtai() == null || "".equals(weixiufenpei.getWeixiuzhuangtai())) {
            weixiufenpei.setWeixiuzhuangtai("待维修");
        }
        // 自动生成分配时间
        weixiufenpei.setFenpeishijian(new Date());

        weixiufenpeiService.insert(weixiufenpei);
        return R.ok();
    }

    /**
     * 进度更新 (维修员点开始/完成时调用)
     */
    @RequestMapping("/update")
    public R update(@RequestBody WeixiufenpeiEntity weixiufenpei, HttpServletRequest request){
        weixiufenpeiService.updateById(weixiufenpei);
        return R.ok();
    }

    @RequestMapping("/delete")
    public R delete(@RequestBody Long[] ids){
        weixiufenpeiService.deleteBatchIds(Arrays.asList(ids));
        return R.ok();
    }
}