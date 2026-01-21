package com.cl.controller;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.cl.annotation.IgnoreAuth;
import com.cl.entity.QuxiaoyuyueEntity;
import com.cl.entity.view.QuxiaoyuyueView;
import com.cl.service.QuxiaoyuyueService;
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
 * 取消预约
 * 后端接口
 *
 * @author
 * @email
 * @date 2025-02-04 11:06:47
 */
@RestController
@RequestMapping("/quxiaoyuyue")
public class QuxiaoyuyueController {
    @Autowired
    private QuxiaoyuyueService quxiaoyuyueService;


    /**
     * 后台列表
     */
    @RequestMapping("/page")
    public R page(@RequestParam Map<String, Object> params, QuxiaoyuyueEntity quxiaoyuyue,
                  HttpServletRequest request) {
        String tableName = request.getSession().getAttribute("tableName").toString();
        if (tableName.equals("yonghu")) {
            quxiaoyuyue.setYonghuzhanghao((String) request.getSession().getAttribute("username"));
        }
        EntityWrapper<QuxiaoyuyueEntity> ew = new EntityWrapper<QuxiaoyuyueEntity>();


        PageUtils page = quxiaoyuyueService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, quxiaoyuyue), params), params));
        return R.ok().put("data", page);
    }


    /**
     * 前端列表
     */
    @IgnoreAuth
    @RequestMapping("/list")
    public R list(@RequestParam Map<String, Object> params, QuxiaoyuyueEntity quxiaoyuyue,
                  HttpServletRequest request) {
        EntityWrapper<QuxiaoyuyueEntity> ew = new EntityWrapper<QuxiaoyuyueEntity>();

        PageUtils page = quxiaoyuyueService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, quxiaoyuyue), params), params));
        return R.ok().put("data", page);
    }

    /**
     * 列表
     */
    @RequestMapping("/lists")
    public R list(QuxiaoyuyueEntity quxiaoyuyue) {
        EntityWrapper<QuxiaoyuyueEntity> ew = new EntityWrapper<QuxiaoyuyueEntity>();
        ew.allEq(MPUtil.allEQMapPre(quxiaoyuyue, "quxiaoyuyue"));
        return R.ok().put("data", quxiaoyuyueService.selectListView(ew));
    }

    /**
     * 查询
     */
    @RequestMapping("/query")
    public R query(QuxiaoyuyueEntity quxiaoyuyue) {
        EntityWrapper<QuxiaoyuyueEntity> ew = new EntityWrapper<QuxiaoyuyueEntity>();
        ew.allEq(MPUtil.allEQMapPre(quxiaoyuyue, "quxiaoyuyue"));
        QuxiaoyuyueView quxiaoyuyueView = quxiaoyuyueService.selectView(ew);
        return R.ok("查询取消预约成功").put("data", quxiaoyuyueView);
    }

    /**
     * 后端详情
     */
    @RequestMapping("/info/{id}")
    public R info(@PathVariable("id") Long id) {
        QuxiaoyuyueEntity quxiaoyuyue = quxiaoyuyueService.selectById(id);
        quxiaoyuyue = quxiaoyuyueService.selectView(new EntityWrapper<QuxiaoyuyueEntity>().eq("id", id));
        return R.ok().put("data", quxiaoyuyue);
    }

    /**
     * 前端详情
     */
    @IgnoreAuth
    @RequestMapping("/detail/{id}")
    public R detail(@PathVariable("id") Long id) {
        QuxiaoyuyueEntity quxiaoyuyue = quxiaoyuyueService.selectById(id);
        quxiaoyuyue = quxiaoyuyueService.selectView(new EntityWrapper<QuxiaoyuyueEntity>().eq("id", id));
        return R.ok().put("data", quxiaoyuyue);
    }


    /**
     * 后端保存
     */
    @RequestMapping("/save")
    public R save(@RequestBody QuxiaoyuyueEntity quxiaoyuyue, HttpServletRequest request) {
        //ValidatorUtils.validateEntity(quxiaoyuyue);
        quxiaoyuyueService.insert(quxiaoyuyue);
        return R.ok();
    }

    /**
     * 前端保存
     */
    @RequestMapping("/add")
    public R add(@RequestBody QuxiaoyuyueEntity quxiaoyuyue, HttpServletRequest request) {
        //ValidatorUtils.validateEntity(quxiaoyuyue);
        quxiaoyuyueService.insert(quxiaoyuyue);
        return R.ok();
    }


    /**
     * 修改
     */
    @RequestMapping("/update")
    @Transactional
    public R update(@RequestBody QuxiaoyuyueEntity quxiaoyuyue, HttpServletRequest request) {
        //ValidatorUtils.validateEntity(quxiaoyuyue);
        quxiaoyuyueService.updateById(quxiaoyuyue);//全部更新
        return R.ok();
    }


    /**
     * 删除
     */
    @RequestMapping("/delete")
    public R delete(@RequestBody Long[] ids) {
        quxiaoyuyueService.deleteBatchIds(Arrays.asList(ids));
        return R.ok();
    }


}
