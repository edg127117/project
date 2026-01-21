package com.cl.controller;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.cl.annotation.IgnoreAuth;
import com.cl.entity.WeixiupingjiaEntity;
import com.cl.entity.view.WeixiupingjiaView;
import com.cl.service.WeixiupingjiaService;
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
 * 维修评价
 * 后端接口
 *
 * @author
 * @email
 * @date 2025-02-04 11:06:47
 */
@RestController
@RequestMapping("/weixiupingjia")
public class WeixiupingjiaController {
    @Autowired
    private WeixiupingjiaService weixiupingjiaService;


    /**
     * 后台列表
     */
    @RequestMapping("/page")
    public R page(@RequestParam Map<String, Object> params, WeixiupingjiaEntity weixiupingjia,
                  HttpServletRequest request) {
        String tableName = request.getSession().getAttribute("tableName").toString();
        if (tableName.equals("yonghu")) {
            weixiupingjia.setYonghuzhanghao((String) request.getSession().getAttribute("username"));
        }
        if (tableName.equals("weixiuyuan")) {
            weixiupingjia.setWeixiuzhanghao((String) request.getSession().getAttribute("username"));
        }
        EntityWrapper<WeixiupingjiaEntity> ew = new EntityWrapper<WeixiupingjiaEntity>();


        PageUtils page = weixiupingjiaService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, weixiupingjia), params), params));
        return R.ok().put("data", page);
    }


    /**
     * 前端列表
     */
    @IgnoreAuth
    @RequestMapping("/list")
    public R list(@RequestParam Map<String, Object> params, WeixiupingjiaEntity weixiupingjia,
                  HttpServletRequest request) {
        EntityWrapper<WeixiupingjiaEntity> ew = new EntityWrapper<WeixiupingjiaEntity>();

        PageUtils page = weixiupingjiaService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, weixiupingjia), params), params));
        return R.ok().put("data", page);
    }

    /**
     * 列表
     */
    @RequestMapping("/lists")
    public R list(WeixiupingjiaEntity weixiupingjia) {
        EntityWrapper<WeixiupingjiaEntity> ew = new EntityWrapper<WeixiupingjiaEntity>();
        ew.allEq(MPUtil.allEQMapPre(weixiupingjia, "weixiupingjia"));
        return R.ok().put("data", weixiupingjiaService.selectListView(ew));
    }

    /**
     * 查询
     */
    @RequestMapping("/query")
    public R query(WeixiupingjiaEntity weixiupingjia) {
        EntityWrapper<WeixiupingjiaEntity> ew = new EntityWrapper<WeixiupingjiaEntity>();
        ew.allEq(MPUtil.allEQMapPre(weixiupingjia, "weixiupingjia"));
        WeixiupingjiaView weixiupingjiaView = weixiupingjiaService.selectView(ew);
        return R.ok("查询维修评价成功").put("data", weixiupingjiaView);
    }

    /**
     * 后端详情
     */
    @RequestMapping("/info/{id}")
    public R info(@PathVariable("id") Long id) {
        WeixiupingjiaEntity weixiupingjia = weixiupingjiaService.selectById(id);
        weixiupingjia = weixiupingjiaService.selectView(new EntityWrapper<WeixiupingjiaEntity>().eq("id", id));
        return R.ok().put("data", weixiupingjia);
    }

    /**
     * 前端详情
     */
    @IgnoreAuth
    @RequestMapping("/detail/{id}")
    public R detail(@PathVariable("id") Long id) {
        WeixiupingjiaEntity weixiupingjia = weixiupingjiaService.selectById(id);
        weixiupingjia = weixiupingjiaService.selectView(new EntityWrapper<WeixiupingjiaEntity>().eq("id", id));
        return R.ok().put("data", weixiupingjia);
    }


    /**
     * 后端保存
     */
    @RequestMapping("/save")
    public R save(@RequestBody WeixiupingjiaEntity weixiupingjia, HttpServletRequest request) {
        //ValidatorUtils.validateEntity(weixiupingjia);
        weixiupingjiaService.insert(weixiupingjia);
        return R.ok();
    }

    /**
     * 前端保存
     */
    @RequestMapping("/add")
    public R add(@RequestBody WeixiupingjiaEntity weixiupingjia, HttpServletRequest request) {
        //ValidatorUtils.validateEntity(weixiupingjia);
        weixiupingjiaService.insert(weixiupingjia);
        return R.ok();
    }


    /**
     * 修改
     */
    @RequestMapping("/update")
    @Transactional
    public R update(@RequestBody WeixiupingjiaEntity weixiupingjia, HttpServletRequest request) {
        //ValidatorUtils.validateEntity(weixiupingjia);
        weixiupingjiaService.updateById(weixiupingjia);//全部更新
        return R.ok();
    }


    /**
     * 删除
     */
    @RequestMapping("/delete")
    public R delete(@RequestBody Long[] ids) {
        weixiupingjiaService.deleteBatchIds(Arrays.asList(ids));
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
        EntityWrapper<WeixiupingjiaEntity> ew = new EntityWrapper<WeixiupingjiaEntity>();
        String tableName = request.getSession().getAttribute("tableName").toString();
        if (tableName.equals("yonghu")) {
            ew.eq("yonghuzhanghao", (String) request.getSession().getAttribute("username"));
        }
        if (tableName.equals("weixiuyuan")) {
            ew.eq("weixiuzhanghao", (String) request.getSession().getAttribute("username"));
        }
        List<Map<String, Object>> result = MPUtil.snakeListToCamel(weixiupingjiaService.selectValue(params, ew));
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
        EntityWrapper<WeixiupingjiaEntity> ew = new EntityWrapper<WeixiupingjiaEntity>();
        String tableName = request.getSession().getAttribute("tableName").toString();
        if (tableName.equals("yonghu")) {
            ew.eq("yonghuzhanghao", (String) request.getSession().getAttribute("username"));
        }
        if (tableName.equals("weixiuyuan")) {
            ew.eq("weixiuzhanghao", (String) request.getSession().getAttribute("username"));
        }
        for (int i = 0; i < yColumnNames.length; i++) {
            params.put("yColumn", yColumnNames[i]);
            List<Map<String, Object>> result = MPUtil.snakeListToCamel(weixiupingjiaService.selectValue(params, ew));
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
        EntityWrapper<WeixiupingjiaEntity> ew = new EntityWrapper<WeixiupingjiaEntity>();
        String tableName = request.getSession().getAttribute("tableName").toString();
        if (tableName.equals("yonghu")) {
            ew.eq("yonghuzhanghao", (String) request.getSession().getAttribute("username"));
        }
        if (tableName.equals("weixiuyuan")) {
            ew.eq("weixiuzhanghao", (String) request.getSession().getAttribute("username"));
        }
        List<Map<String, Object>> result = MPUtil.snakeListToCamel(weixiupingjiaService.selectTimeStatValue(params, ew));
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
        EntityWrapper<WeixiupingjiaEntity> ew = new EntityWrapper<WeixiupingjiaEntity>();
        String tableName = request.getSession().getAttribute("tableName").toString();
        if (tableName.equals("yonghu")) {
            ew.eq("yonghuzhanghao", (String) request.getSession().getAttribute("username"));
        }
        if (tableName.equals("weixiuyuan")) {
            ew.eq("weixiuzhanghao", (String) request.getSession().getAttribute("username"));
        }
        for (int i = 0; i < yColumnNames.length; i++) {
            params.put("yColumn", yColumnNames[i]);
            List<Map<String, Object>> result = MPUtil.snakeListToCamel(weixiupingjiaService.selectTimeStatValue(params, ew));
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
        EntityWrapper<WeixiupingjiaEntity> ew = new EntityWrapper<WeixiupingjiaEntity>();
        String tableName = request.getSession().getAttribute("tableName").toString();
        if (tableName.equals("yonghu")) {
            ew.eq("yonghuzhanghao", (String) request.getSession().getAttribute("username"));
        }
        if (tableName.equals("weixiuyuan")) {
            ew.eq("weixiuzhanghao", (String) request.getSession().getAttribute("username"));
        }
        List<Map<String, Object>> result = MPUtil.snakeListToCamel(weixiupingjiaService.selectGroup(params, ew));
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
    public R count(@RequestParam Map<String, Object> params, WeixiupingjiaEntity weixiupingjia, HttpServletRequest request) {
        String tableName = request.getSession().getAttribute("tableName").toString();
        if (tableName.equals("yonghu")) {
            weixiupingjia.setYonghuzhanghao((String) request.getSession().getAttribute("username"));
        }
        if (tableName.equals("weixiuyuan")) {
            weixiupingjia.setWeixiuzhanghao((String) request.getSession().getAttribute("username"));
        }
        EntityWrapper<WeixiupingjiaEntity> ew = new EntityWrapper<WeixiupingjiaEntity>();
        int count = weixiupingjiaService.selectCount(MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, weixiupingjia), params), params));
        return R.ok().put("data", count);
    }


}
