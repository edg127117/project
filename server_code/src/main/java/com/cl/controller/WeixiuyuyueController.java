package com.cl.controller;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.cl.annotation.IgnoreAuth;
import com.cl.entity.WeixiuyuyueEntity;
import com.cl.entity.view.WeixiuyuyueView;
import com.cl.service.WeixiuyuyueService;
import com.cl.utils.MPUtil;
import com.cl.utils.PageUtils;
import com.cl.utils.R;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * 维修预约
 * 后端接口
 *
 * @author
 * @email
 * @date 2025-02-04 11:06:46
 */
@RestController
@RequestMapping("/weixiuyuyue")
public class WeixiuyuyueController {
    @Autowired
    private WeixiuyuyueService weixiuyuyueService;


    /**
     * 后台列表
     */
    @RequestMapping("/page")
    public R page(@RequestParam Map<String, Object> params, WeixiuyuyueEntity weixiuyuyue,
                  HttpServletRequest request) {
        String tableName = request.getSession().getAttribute("tableName").toString();
        if (tableName.equals("yonghu")) {
            weixiuyuyue.setYonghuzhanghao((String) request.getSession().getAttribute("username"));
        }
        EntityWrapper<WeixiuyuyueEntity> ew = new EntityWrapper<WeixiuyuyueEntity>();


        PageUtils page = weixiuyuyueService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, weixiuyuyue), params), params));
        return R.ok().put("data", page);
    }


    /**
     * 前端列表
     */
    @IgnoreAuth
    @RequestMapping("/list")
    public R list(@RequestParam Map<String, Object> params, WeixiuyuyueEntity weixiuyuyue,
                  HttpServletRequest request) {
        EntityWrapper<WeixiuyuyueEntity> ew = new EntityWrapper<WeixiuyuyueEntity>();

        PageUtils page = weixiuyuyueService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, weixiuyuyue), params), params));
        return R.ok().put("data", page);
    }

    /**
     * 列表
     */
    @RequestMapping("/lists")
    public R list(WeixiuyuyueEntity weixiuyuyue) {
        EntityWrapper<WeixiuyuyueEntity> ew = new EntityWrapper<WeixiuyuyueEntity>();
        ew.allEq(MPUtil.allEQMapPre(weixiuyuyue, "weixiuyuyue"));
        return R.ok().put("data", weixiuyuyueService.selectListView(ew));
    }

    /**
     * 查询
     */
    @RequestMapping("/query")
    public R query(WeixiuyuyueEntity weixiuyuyue) {
        EntityWrapper<WeixiuyuyueEntity> ew = new EntityWrapper<WeixiuyuyueEntity>();
        ew.allEq(MPUtil.allEQMapPre(weixiuyuyue, "weixiuyuyue"));
        WeixiuyuyueView weixiuyuyueView = weixiuyuyueService.selectView(ew);
        return R.ok("查询维修预约成功").put("data", weixiuyuyueView);
    }

    /**
     * 后端详情
     */
    @RequestMapping("/info/{id}")
    public R info(@PathVariable("id") Long id) {
        WeixiuyuyueEntity weixiuyuyue = weixiuyuyueService.selectById(id);
        weixiuyuyue = weixiuyuyueService.selectView(new EntityWrapper<WeixiuyuyueEntity>().eq("id", id));
        return R.ok().put("data", weixiuyuyue);
    }

    /**
     * 前端详情
     */
    @IgnoreAuth
    @RequestMapping("/detail/{id}")
    public R detail(@PathVariable("id") Long id) {
        WeixiuyuyueEntity weixiuyuyue = weixiuyuyueService.selectById(id);
        weixiuyuyue = weixiuyuyueService.selectView(new EntityWrapper<WeixiuyuyueEntity>().eq("id", id));
        return R.ok().put("data", weixiuyuyue);
    }


    /**
     * 后端保存
     */
    @RequestMapping("/save")
    public R save(@RequestBody WeixiuyuyueEntity weixiuyuyue, HttpServletRequest request) {
        //ValidatorUtils.validateEntity(weixiuyuyue);
        weixiuyuyueService.insert(weixiuyuyue);
        return R.ok();
    }

    /**
     * 前端保存
     */
    @RequestMapping("/add")
    public R add(@RequestBody WeixiuyuyueEntity weixiuyuyue, HttpServletRequest request) {
        //ValidatorUtils.validateEntity(weixiuyuyue);
        weixiuyuyueService.insert(weixiuyuyue);
        return R.ok();
    }


    /**
     * 修改
     */
    @RequestMapping("/update")
    @Transactional
    public R update(@RequestBody WeixiuyuyueEntity weixiuyuyue, HttpServletRequest request) {
        //ValidatorUtils.validateEntity(weixiuyuyue);
        weixiuyuyueService.updateById(weixiuyuyue);//全部更新
        return R.ok();
    }

    /**
     * 审核
     */
    @RequestMapping("/shBatch")
    @Transactional
    public R update(@RequestBody Long[] ids, @RequestParam String sfsh, @RequestParam String shhf) {
        List<WeixiuyuyueEntity> list = new ArrayList<WeixiuyuyueEntity>();
        for (Long id : ids) {
            WeixiuyuyueEntity weixiuyuyue = weixiuyuyueService.selectById(id);
            weixiuyuyue.setSfsh(sfsh);
            weixiuyuyue.setShhf(shhf);
            list.add(weixiuyuyue);
        }
        weixiuyuyueService.updateBatchById(list);
        return R.ok();
    }


    /**
     * 删除
     */
    @RequestMapping("/delete")
    public R delete(@RequestBody Long[] ids) {
        weixiuyuyueService.deleteBatchIds(Arrays.asList(ids));
        return R.ok();
    }


    /**
     * （按值统计）
     */
    @RequestMapping("/value/{xColumnName}/{yColumnName}")
    public R value(@PathVariable("yColumnName") String yColumnName, @PathVariable("xColumnName") String xColumnName, HttpServletRequest request) {
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("xColumn", MPUtil.camelToSnake(xColumnName));
        params.put("yColumn", MPUtil.camelToSnake(yColumnName));
        EntityWrapper<WeixiuyuyueEntity> ew = new EntityWrapper<WeixiuyuyueEntity>();
        String tableName = request.getSession().getAttribute("tableName").toString();
        if (tableName.equals("yonghu")) {
            ew.eq("yonghuzhanghao", (String) request.getSession().getAttribute("username"));
        }
        List<Map<String, Object>> result = MPUtil.snakeListToCamel(weixiuyuyueService.selectValue(params, ew));
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        for (Map<String, Object> m : result) {
            for (String k : m.keySet()) {
                if (m.get(k) instanceof Date) {
                    m.put(k, sdf.format((Date) m.get(k)));
                }
            }
        }
        return R.ok().put("data", result);
    }

    /**
     * （按值统计(多)）
     */
    @RequestMapping("/valueMul/{xColumnName}")
    public R valueMul(@PathVariable("xColumnName") String xColumnName, @RequestParam String yColumnNameMul, HttpServletRequest request) {
        String[] yColumnNames = MPUtil.camelToSnake(yColumnNameMul).split(",");
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("xColumn", MPUtil.camelToSnake(xColumnName));
        List<List<Map<String, Object>>> result2 = new ArrayList<List<Map<String, Object>>>();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        EntityWrapper<WeixiuyuyueEntity> ew = new EntityWrapper<WeixiuyuyueEntity>();
        String tableName = request.getSession().getAttribute("tableName").toString();
        if (tableName.equals("yonghu")) {
            ew.eq("yonghuzhanghao", (String) request.getSession().getAttribute("username"));
        }
        for (int i = 0; i < yColumnNames.length; i++) {
            params.put("yColumn", yColumnNames[i]);
            List<Map<String, Object>> result = MPUtil.snakeListToCamel(weixiuyuyueService.selectValue(params, ew));
            for (Map<String, Object> m : result) {
                for (String k : m.keySet()) {
                    if (m.get(k) instanceof Date) {
                        m.put(k, sdf.format((Date) m.get(k)));
                    }
                }
            }
            result2.add(result);
        }
        return R.ok().put("data", result2);
    }

    /**
     * （按值统计）时间统计类型
     */
    @RequestMapping("/value/{xColumnName}/{yColumnName}/{timeStatType}")
    public R valueDay(@PathVariable("yColumnName") String yColumnName, @PathVariable("xColumnName") String xColumnName, @PathVariable("timeStatType") String timeStatType, HttpServletRequest request) {
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("xColumn", MPUtil.camelToSnake(xColumnName));
        params.put("yColumn", MPUtil.camelToSnake(yColumnName));
        params.put("timeStatType", timeStatType);
        EntityWrapper<WeixiuyuyueEntity> ew = new EntityWrapper<WeixiuyuyueEntity>();
        String tableName = request.getSession().getAttribute("tableName").toString();
        if (tableName.equals("yonghu")) {
            ew.eq("yonghuzhanghao", (String) request.getSession().getAttribute("username"));
        }
        List<Map<String, Object>> result = MPUtil.snakeListToCamel(weixiuyuyueService.selectTimeStatValue(params, ew));
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        for (Map<String, Object> m : result) {
            for (String k : m.keySet()) {
                if (m.get(k) instanceof Date) {
                    m.put(k, sdf.format((Date) m.get(k)));
                }
            }
        }
        return R.ok().put("data", result);
    }

    /**
     * （按值统计）时间统计类型(多)
     */
    @RequestMapping("/valueMul/{xColumnName}/{timeStatType}")
    public R valueMulDay(@PathVariable("xColumnName") String xColumnName, @PathVariable("timeStatType") String timeStatType, @RequestParam String yColumnNameMul, HttpServletRequest request) {
        String[] yColumnNames = MPUtil.camelToSnake(yColumnNameMul).split(",");
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("xColumn", xColumnName);
        params.put("timeStatType", timeStatType);
        List<List<Map<String, Object>>> result2 = new ArrayList<List<Map<String, Object>>>();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        EntityWrapper<WeixiuyuyueEntity> ew = new EntityWrapper<WeixiuyuyueEntity>();
        String tableName = request.getSession().getAttribute("tableName").toString();
        if (tableName.equals("yonghu")) {
            ew.eq("yonghuzhanghao", (String) request.getSession().getAttribute("username"));
        }
        for (int i = 0; i < yColumnNames.length; i++) {
            params.put("yColumn", yColumnNames[i]);
            List<Map<String, Object>> result = MPUtil.snakeListToCamel(weixiuyuyueService.selectTimeStatValue(params, ew));
            for (Map<String, Object> m : result) {
                for (String k : m.keySet()) {
                    if (m.get(k) instanceof Date) {
                        m.put(k, sdf.format((Date) m.get(k)));
                    }
                }
            }
            result2.add(result);
        }
        return R.ok().put("data", result2);
    }

    /**
     * 分组统计
     */
    @RequestMapping("/group/{columnName}")
    public R group(@PathVariable("columnName") String columnName, HttpServletRequest request) {
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("column", MPUtil.camelToSnake(columnName));
        EntityWrapper<WeixiuyuyueEntity> ew = new EntityWrapper<WeixiuyuyueEntity>();
        String tableName = request.getSession().getAttribute("tableName").toString();
        if (tableName.equals("yonghu")) {
            ew.eq("yonghuzhanghao", (String) request.getSession().getAttribute("username"));
        }
        List<Map<String, Object>> result = MPUtil.snakeListToCamel(weixiuyuyueService.selectGroup(params, ew));
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        for (Map<String, Object> m : result) {
            for (String k : m.keySet()) {
                if (m.get(k) instanceof Date) {
                    m.put(k, sdf.format((Date) m.get(k)));
                }
            }
        }
        return R.ok().put("data", result);
    }


    /**
     * 总数量
     */
    @RequestMapping("/count")
    public R count(@RequestParam Map<String, Object> params, WeixiuyuyueEntity weixiuyuyue, HttpServletRequest request) {
        String tableName = request.getSession().getAttribute("tableName").toString();
        if (tableName.equals("yonghu")) {
            weixiuyuyue.setYonghuzhanghao((String) request.getSession().getAttribute("username"));
        }
        EntityWrapper<WeixiuyuyueEntity> ew = new EntityWrapper<WeixiuyuyueEntity>();
        int count = weixiuyuyueService.selectCount(MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, weixiuyuyue), params), params));
        return R.ok().put("data", count);
    }


}
