package com.cl.controller;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.cl.annotation.IgnoreAuth;
import com.cl.entity.WeixiuyuanEntity;
import com.cl.entity.view.WeixiuyuanView;
import com.cl.service.TokenService;
import com.cl.service.WeixiuyuanService;
import com.cl.utils.MPUtil;
import com.cl.utils.PageUtils;
import com.cl.utils.R;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.*;

/**
 * 维修员
 * 后端接口
 *
 * @author
 * @email
 * @date 2025-02-04 11:06:47
 */
@RestController
@RequestMapping("/weixiuyuan")
public class WeixiuyuanController {
    @Autowired
    private WeixiuyuanService weixiuyuanService;


    @Autowired
    private TokenService tokenService;

    /**
     * 登录
     */
    @IgnoreAuth
    @RequestMapping(value = "/login")
    public R login(String username, String password, String captcha, HttpServletRequest request) {
        WeixiuyuanEntity u = weixiuyuanService.selectOne(new EntityWrapper<WeixiuyuanEntity>().eq("weixiuzhanghao", username));
        if (u == null || !u.getMima().equals(password)) {
            return R.error("账号或密码不正确");
        }
        if (!"是".equals(u.getSfsh())) return R.error("账号已锁定，请联系管理员审核。");
        String token = tokenService.generateToken(u.getId(), username, "weixiuyuan", "维修员");
        return R.ok().put("token", token);
    }


    /**
     * 注册
     */
    @IgnoreAuth
    @RequestMapping("/register")
    public R register(@RequestBody WeixiuyuanEntity weixiuyuan) {
        //ValidatorUtils.validateEntity(weixiuyuan);
        WeixiuyuanEntity u = weixiuyuanService.selectOne(new EntityWrapper<WeixiuyuanEntity>().eq("weixiuzhanghao", weixiuyuan.getWeixiuzhanghao()));
        if (u != null) {
            return R.error("注册用户已存在");
        }
        Long uId = new Date().getTime();
        weixiuyuan.setId(uId);
        weixiuyuanService.insert(weixiuyuan);
        return R.ok();
    }


    /**
     * 退出
     */
    @RequestMapping("/logout")
    public R logout(HttpServletRequest request) {
        request.getSession().invalidate();
        return R.ok("退出成功");
    }

    /**
     * 获取用户的session用户信息
     */
    @RequestMapping("/session")
    public R getCurrUser(HttpServletRequest request) {
        Long id = (Long) request.getSession().getAttribute("userId");
        return R.ok().put("data", weixiuyuanService.selectView(new EntityWrapper<WeixiuyuanEntity>().eq("id", id)));
    }

    /**
     * 密码重置
     */
    @IgnoreAuth
    @RequestMapping(value = "/resetPass")
    public R resetPass(String username, HttpServletRequest request) {
        WeixiuyuanEntity u = weixiuyuanService.selectOne(new EntityWrapper<WeixiuyuanEntity>().eq("weixiuzhanghao", username));
        if (u == null) {
            return R.error("账号不存在");
        }
        u.setMima("123456");
        weixiuyuanService.updateById(u);
        return R.ok("密码已重置为：123456");
    }


    /**
     * 后台列表
     */
    @RequestMapping("/page")
    public R page(@RequestParam Map<String, Object> params, WeixiuyuanEntity weixiuyuan,
                  HttpServletRequest request) {
        EntityWrapper<WeixiuyuanEntity> ew = new EntityWrapper<WeixiuyuanEntity>();


        PageUtils page = weixiuyuanService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, weixiuyuan), params), params));
        return R.ok().put("data", page);
    }


    /**
     * 前端列表
     */
    @IgnoreAuth
    @RequestMapping("/list")
    public R list(@RequestParam Map<String, Object> params, WeixiuyuanEntity weixiuyuan,
                  HttpServletRequest request) {
        EntityWrapper<WeixiuyuanEntity> ew = new EntityWrapper<WeixiuyuanEntity>();

        PageUtils page = weixiuyuanService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, weixiuyuan), params), params));
        return R.ok().put("data", page);
    }

    /**
     * 列表
     */
    @RequestMapping("/lists")
    public R list(WeixiuyuanEntity weixiuyuan) {
        EntityWrapper<WeixiuyuanEntity> ew = new EntityWrapper<WeixiuyuanEntity>();
        ew.allEq(MPUtil.allEQMapPre(weixiuyuan, "weixiuyuan"));
        return R.ok().put("data", weixiuyuanService.selectListView(ew));
    }

    /**
     * 查询
     */
    @RequestMapping("/query")
    public R query(WeixiuyuanEntity weixiuyuan) {
        EntityWrapper<WeixiuyuanEntity> ew = new EntityWrapper<WeixiuyuanEntity>();
        ew.allEq(MPUtil.allEQMapPre(weixiuyuan, "weixiuyuan"));
        WeixiuyuanView weixiuyuanView = weixiuyuanService.selectView(ew);
        return R.ok("查询维修员成功").put("data", weixiuyuanView);
    }

    /**
     * 后端详情
     */
    @RequestMapping("/info/{id}")
    public R info(@PathVariable("id") Long id) {
        WeixiuyuanEntity weixiuyuan = weixiuyuanService.selectById(id);
        weixiuyuan = weixiuyuanService.selectView(new EntityWrapper<WeixiuyuanEntity>().eq("id", id));
        return R.ok().put("data", weixiuyuan);
    }

    /**
     * 前端详情
     */
    @IgnoreAuth
    @RequestMapping("/detail/{id}")
    public R detail(@PathVariable("id") Long id) {
        WeixiuyuanEntity weixiuyuan = weixiuyuanService.selectById(id);
        weixiuyuan = weixiuyuanService.selectView(new EntityWrapper<WeixiuyuanEntity>().eq("id", id));
        return R.ok().put("data", weixiuyuan);
    }


    /**
     * 后端保存
     */
    @RequestMapping("/save")
    public R save(@RequestBody WeixiuyuanEntity weixiuyuan, HttpServletRequest request) {
        if (weixiuyuanService.selectCount(new EntityWrapper<WeixiuyuanEntity>().eq("weixiuzhanghao", weixiuyuan.getWeixiuzhanghao())) > 0) {
            return R.error("维修账号已存在");
        }
        weixiuyuan.setId(new Date().getTime() + new Double(Math.floor(Math.random() * 1000)).longValue());
        //ValidatorUtils.validateEntity(weixiuyuan);
        WeixiuyuanEntity u = weixiuyuanService.selectOne(new EntityWrapper<WeixiuyuanEntity>().eq("weixiuzhanghao", weixiuyuan.getWeixiuzhanghao()));
        if (u != null) {
            return R.error("用户已存在");
        }
        weixiuyuan.setId(new Date().getTime());
        weixiuyuanService.insert(weixiuyuan);
        return R.ok();
    }

    /**
     * 前端保存
     */
    @RequestMapping("/add")
    public R add(@RequestBody WeixiuyuanEntity weixiuyuan, HttpServletRequest request) {
        if (weixiuyuanService.selectCount(new EntityWrapper<WeixiuyuanEntity>().eq("weixiuzhanghao", weixiuyuan.getWeixiuzhanghao())) > 0) {
            return R.error("维修账号已存在");
        }
        weixiuyuan.setId(new Date().getTime() + new Double(Math.floor(Math.random() * 1000)).longValue());
        //ValidatorUtils.validateEntity(weixiuyuan);
        WeixiuyuanEntity u = weixiuyuanService.selectOne(new EntityWrapper<WeixiuyuanEntity>().eq("weixiuzhanghao", weixiuyuan.getWeixiuzhanghao()));
        if (u != null) {
            return R.error("用户已存在");
        }
        weixiuyuan.setId(new Date().getTime());
        weixiuyuanService.insert(weixiuyuan);
        return R.ok();
    }


    /**
     * 修改
     */
    @RequestMapping("/update")
    @Transactional
    public R update(@RequestBody WeixiuyuanEntity weixiuyuan, HttpServletRequest request) {
        //ValidatorUtils.validateEntity(weixiuyuan);
        weixiuyuanService.updateById(weixiuyuan);//全部更新
        return R.ok();
    }

    /**
     * 审核
     */
    @RequestMapping("/shBatch")
    @Transactional
    public R update(@RequestBody Long[] ids, @RequestParam String sfsh, @RequestParam String shhf) {
        List<WeixiuyuanEntity> list = new ArrayList<WeixiuyuanEntity>();
        for (Long id : ids) {
            WeixiuyuanEntity weixiuyuan = weixiuyuanService.selectById(id);
            weixiuyuan.setSfsh(sfsh);
            weixiuyuan.setShhf(shhf);
            list.add(weixiuyuan);
        }
        weixiuyuanService.updateBatchById(list);
        return R.ok();
    }


    /**
     * 删除
     */
    @RequestMapping("/delete")
    public R delete(@RequestBody Long[] ids) {
        weixiuyuanService.deleteBatchIds(Arrays.asList(ids));
        return R.ok();
    }


}
