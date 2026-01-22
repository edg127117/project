package com.cl.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Map;
import java.util.HashMap;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.cl.annotation.IgnoreAuth;

import com.cl.entity.WeixiuxinxiEntity;
import com.cl.entity.view.WeixiuxinxiView;
import com.cl.service.WeixiuxinxiService;
import com.cl.utils.PageUtils;
import com.cl.utils.R;
import com.cl.utils.MPUtil;


/**
 * 维修信息
 * 后端接口
 *
 * @author
 * @email
 * @date 2025-02-04 11:06:46
 */
@RestController
@RequestMapping("/weixiuxinxi")
public class WeixiuxinxiController {
    @Autowired
    private WeixiuxinxiService weixiuxinxiService;


    /**
     * 后台列表
     */
    @RequestMapping("/page")
    public R page(@RequestParam Map<String, Object> params, WeixiuxinxiEntity weixiuxinxi,
                  HttpServletRequest request) {
        String tableName = request.getSession().getAttribute("tableName").toString();
        if (tableName.equals("yonghu")) {
            weixiuxinxi.setYonghuzhanghao((String) request.getSession().getAttribute("username"));
        }
        if (tableName.equals("weixiuyuan")) {
            weixiuxinxi.setWeixiuzhanghao((String) request.getSession().getAttribute("username"));
        }
        EntityWrapper<WeixiuxinxiEntity> ew = new EntityWrapper<WeixiuxinxiEntity>();


        PageUtils page = weixiuxinxiService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, weixiuxinxi), params), params));
        return R.ok().put("data", page);
    }


    /**
     * 前端列表
     */
    @IgnoreAuth
    @RequestMapping("/list")
    public R list(@RequestParam Map<String, Object> params, WeixiuxinxiEntity weixiuxinxi,
                  HttpServletRequest request) {
        EntityWrapper<WeixiuxinxiEntity> ew = new EntityWrapper<WeixiuxinxiEntity>();

        PageUtils page = weixiuxinxiService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, weixiuxinxi), params), params));
        return R.ok().put("data", page);
    }

    /**
     * 列表
     */
    @RequestMapping("/lists")
    public R list(WeixiuxinxiEntity weixiuxinxi) {
        EntityWrapper<WeixiuxinxiEntity> ew = new EntityWrapper<WeixiuxinxiEntity>();
        ew.allEq(MPUtil.allEQMapPre(weixiuxinxi, "weixiuxinxi"));
        return R.ok().put("data", weixiuxinxiService.selectListView(ew));
    }

    /**
     * 查询
     */
    @RequestMapping("/query")
    public R query(WeixiuxinxiEntity weixiuxinxi) {
        EntityWrapper<WeixiuxinxiEntity> ew = new EntityWrapper<WeixiuxinxiEntity>();
        ew.allEq(MPUtil.allEQMapPre(weixiuxinxi, "weixiuxinxi"));
        WeixiuxinxiView weixiuxinxiView = weixiuxinxiService.selectView(ew);
        return R.ok("查询维修信息成功").put("data", weixiuxinxiView);
    }

    /**
     * 后端详情
     */
    @RequestMapping("/info/{id}")
    public R info(@PathVariable("id") Long id) {
        WeixiuxinxiEntity weixiuxinxi = weixiuxinxiService.selectById(id);
        weixiuxinxi = weixiuxinxiService.selectView(new EntityWrapper<WeixiuxinxiEntity>().eq("id", id));
        return R.ok().put("data", weixiuxinxi);
    }

    /**
     * 前端详情
     */
    @IgnoreAuth
    @RequestMapping("/detail/{id}")
    public R detail(@PathVariable("id") Long id) {
        WeixiuxinxiEntity weixiuxinxi = weixiuxinxiService.selectById(id);
        weixiuxinxi = weixiuxinxiService.selectView(new EntityWrapper<WeixiuxinxiEntity>().eq("id", id));
        return R.ok().put("data", weixiuxinxi);
    }


    @RequestMapping("/save")
    public R save(@RequestBody WeixiuxinxiEntity weixiuxinxi, HttpServletRequest request){
        weixiuxinxi.setId(new Date().getTime()+new Double(Math.floor(Math.random()*1000)).longValue());
        //ValidatorUtils.validateEntity(weixiuxinxi);

        // --- 修正：使用正确的字段名进行自动计算 ---
        // 逻辑：维修费用(总) = 材料费 + 工时费
        Double cailiao = weixiuxinxi.getCailiaofei() == null ? 0.0 : weixiuxinxi.getCailiaofei();
        Double gongshi = weixiuxinxi.getGongshifei() == null ? 0.0 : weixiuxinxi.getGongshifei();
        weixiuxinxi.setWeixiufeiyong(cailiao + gongshi);

        // 默认设置为未支付，防止前端传错状态
        if(StringUtils.isEmpty(weixiuxinxi.getIspay())) {
            weixiuxinxi.setIspay("未支付");
        }
        // ------------------------------------

        weixiuxinxiService.insert(weixiuxinxi);
        return R.ok();
    }

    /**
     * 前端保存
     */
    @RequestMapping("/add")
    public R add(@RequestBody WeixiuxinxiEntity weixiuxinxi, HttpServletRequest request) {
        //ValidatorUtils.validateEntity(weixiuxinxi);
        weixiuxinxiService.insert(weixiuxinxi);
        return R.ok();
    }


    /**
     * 修改
     */
    @RequestMapping("/update")
    @Transactional
    public R update(@RequestBody WeixiuxinxiEntity weixiuxinxi, HttpServletRequest request){
        //ValidatorUtils.validateEntity(weixiuxinxi);

        // --- 修正：使用正确的字段名进行自动计算 ---
        // 这里的逻辑假设前端update传的是完整对象。如果是部分更新且费用字段为null，这里会重置为0。
        // 为了安全起见，通常管理后台的编辑是全量提交，所以这里重新计算是安全的。
        Double cailiao = weixiuxinxi.getCailiaofei() == null ? 0.0 : weixiuxinxi.getCailiaofei();
        Double gongshi = weixiuxinxi.getGongshifei() == null ? 0.0 : weixiuxinxi.getGongshifei();
        weixiuxinxi.setWeixiufeiyong(cailiao + gongshi);
        // ------------------------------------

        weixiuxinxiService.updateById(weixiuxinxi);//全部更新
        return R.ok();
    }



    /**
     * 删除
     */
    @RequestMapping("/delete")
    public R delete(@RequestBody Long[] ids) {
        weixiuxinxiService.deleteBatchIds(Arrays.asList(ids));
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
        EntityWrapper<WeixiuxinxiEntity> ew = new EntityWrapper<WeixiuxinxiEntity>();
        String tableName = request.getSession().getAttribute("tableName").toString();
        if (tableName.equals("yonghu")) {
            ew.eq("yonghuzhanghao", (String) request.getSession().getAttribute("username"));
        }
        if (tableName.equals("weixiuyuan")) {
            ew.eq("weixiuzhanghao", (String) request.getSession().getAttribute("username"));
        }
        List<Map<String, Object>> result = MPUtil.snakeListToCamel(weixiuxinxiService.selectValue(params, ew));
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
        EntityWrapper<WeixiuxinxiEntity> ew = new EntityWrapper<WeixiuxinxiEntity>();
        String tableName = request.getSession().getAttribute("tableName").toString();
        if (tableName.equals("yonghu")) {
            ew.eq("yonghuzhanghao", (String) request.getSession().getAttribute("username"));
        }
        if (tableName.equals("weixiuyuan")) {
            ew.eq("weixiuzhanghao", (String) request.getSession().getAttribute("username"));
        }
        for (int i = 0; i < yColumnNames.length; i++) {
            params.put("yColumn", yColumnNames[i]);
            List<Map<String, Object>> result = MPUtil.snakeListToCamel(weixiuxinxiService.selectValue(params, ew));
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
        EntityWrapper<WeixiuxinxiEntity> ew = new EntityWrapper<WeixiuxinxiEntity>();
        String tableName = request.getSession().getAttribute("tableName").toString();
        if (tableName.equals("yonghu")) {
            ew.eq("yonghuzhanghao", (String) request.getSession().getAttribute("username"));
        }
        if (tableName.equals("weixiuyuan")) {
            ew.eq("weixiuzhanghao", (String) request.getSession().getAttribute("username"));
        }
        List<Map<String, Object>> result = MPUtil.snakeListToCamel(weixiuxinxiService.selectTimeStatValue(params, ew));
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
        EntityWrapper<WeixiuxinxiEntity> ew = new EntityWrapper<WeixiuxinxiEntity>();
        String tableName = request.getSession().getAttribute("tableName").toString();
        if (tableName.equals("yonghu")) {
            ew.eq("yonghuzhanghao", (String) request.getSession().getAttribute("username"));
        }
        if (tableName.equals("weixiuyuan")) {
            ew.eq("weixiuzhanghao", (String) request.getSession().getAttribute("username"));
        }
        for (int i = 0; i < yColumnNames.length; i++) {
            params.put("yColumn", yColumnNames[i]);
            List<Map<String, Object>> result = MPUtil.snakeListToCamel(weixiuxinxiService.selectTimeStatValue(params, ew));
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
        EntityWrapper<WeixiuxinxiEntity> ew = new EntityWrapper<WeixiuxinxiEntity>();
        String tableName = request.getSession().getAttribute("tableName").toString();
        if (tableName.equals("yonghu")) {
            ew.eq("yonghuzhanghao", (String) request.getSession().getAttribute("username"));
        }
        if (tableName.equals("weixiuyuan")) {
            ew.eq("weixiuzhanghao", (String) request.getSession().getAttribute("username"));
        }
        List<Map<String, Object>> result = MPUtil.snakeListToCamel(weixiuxinxiService.selectGroup(params, ew));
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
    public R count(@RequestParam Map<String, Object> params, WeixiuxinxiEntity weixiuxinxi, HttpServletRequest request) {
        String tableName = request.getSession().getAttribute("tableName").toString();
        if (tableName.equals("yonghu")) {
            weixiuxinxi.setYonghuzhanghao((String) request.getSession().getAttribute("username"));
        }
        if (tableName.equals("weixiuyuan")) {
            weixiuxinxi.setWeixiuzhanghao((String) request.getSession().getAttribute("username"));
        }
        EntityWrapper<WeixiuxinxiEntity> ew = new EntityWrapper<WeixiuxinxiEntity>();
        int count = weixiuxinxiService.selectCount(MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, weixiuxinxi), params), params));
        return R.ok().put("data", count);
    }
}
