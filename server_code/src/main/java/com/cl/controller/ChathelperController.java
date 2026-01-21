package com.cl.controller;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.cl.annotation.IgnoreAuth;
import com.cl.entity.ChathelperEntity;
import com.cl.entity.view.ChathelperView;
import com.cl.service.ChathelperService;
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
 * 聊天助手
 * 后端接口
 *
 * @author
 * @email
 * @date 2025-02-04 11:06:47
 */
@RestController
@RequestMapping("/chathelper")
public class ChathelperController {
    @Autowired
    private ChathelperService chathelperService;


    /**
     * 后台列表
     */
    @RequestMapping("/page")
    public R page(@RequestParam Map<String, Object> params, ChathelperEntity chathelper,
                  HttpServletRequest request) {
        EntityWrapper<ChathelperEntity> ew = new EntityWrapper<ChathelperEntity>();


        PageUtils page = chathelperService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, chathelper), params), params));
        return R.ok().put("data", page);
    }


    /**
     * 前端列表
     */
    @IgnoreAuth
    @RequestMapping("/list")
    public R list(@RequestParam Map<String, Object> params, ChathelperEntity chathelper,
                  HttpServletRequest request) {
        EntityWrapper<ChathelperEntity> ew = new EntityWrapper<ChathelperEntity>();

        PageUtils page = chathelperService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, chathelper), params), params));
        return R.ok().put("data", page);
    }

    /**
     * 列表
     */
    @RequestMapping("/lists")
    public R list(ChathelperEntity chathelper) {
        EntityWrapper<ChathelperEntity> ew = new EntityWrapper<ChathelperEntity>();
        ew.allEq(MPUtil.allEQMapPre(chathelper, "chathelper"));
        return R.ok().put("data", chathelperService.selectListView(ew));
    }

    /**
     * 查询
     */
    @RequestMapping("/query")
    public R query(ChathelperEntity chathelper) {
        EntityWrapper<ChathelperEntity> ew = new EntityWrapper<ChathelperEntity>();
        ew.allEq(MPUtil.allEQMapPre(chathelper, "chathelper"));
        ChathelperView chathelperView = chathelperService.selectView(ew);
        return R.ok("查询聊天助手成功").put("data", chathelperView);
    }

    /**
     * 后端详情
     */
    @RequestMapping("/info/{id}")
    public R info(@PathVariable("id") Long id) {
        ChathelperEntity chathelper = chathelperService.selectById(id);
        chathelper = chathelperService.selectView(new EntityWrapper<ChathelperEntity>().eq("id", id));
        return R.ok().put("data", chathelper);
    }

    /**
     * 前端详情
     */
    @IgnoreAuth
    @RequestMapping("/detail/{id}")
    public R detail(@PathVariable("id") Long id) {
        ChathelperEntity chathelper = chathelperService.selectById(id);
        chathelper = chathelperService.selectView(new EntityWrapper<ChathelperEntity>().eq("id", id));
        return R.ok().put("data", chathelper);
    }


    /**
     * 后端保存
     */
    @RequestMapping("/save")
    public R save(@RequestBody ChathelperEntity chathelper, HttpServletRequest request) {
        //ValidatorUtils.validateEntity(chathelper);
        chathelperService.insert(chathelper);
        return R.ok();
    }

    /**
     * 前端保存
     */
    @RequestMapping("/add")
    public R add(@RequestBody ChathelperEntity chathelper, HttpServletRequest request) {
        //ValidatorUtils.validateEntity(chathelper);
        chathelperService.insert(chathelper);
        return R.ok();
    }


    /**
     * 修改
     */
    @RequestMapping("/update")
    @Transactional
    public R update(@RequestBody ChathelperEntity chathelper, HttpServletRequest request) {
        //ValidatorUtils.validateEntity(chathelper);
        chathelperService.updateById(chathelper);//全部更新
        return R.ok();
    }


    /**
     * 删除
     */
    @RequestMapping("/delete")
    public R delete(@RequestBody Long[] ids) {
        chathelperService.deleteBatchIds(Arrays.asList(ids));
        return R.ok();
    }


}
