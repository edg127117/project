package com.cl.controller;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.cl.annotation.IgnoreAuth;
import com.cl.entity.ChatEntity;
import com.cl.entity.view.ChatView;
import com.cl.service.ChatService;
import com.cl.utils.MPUtil;
import com.cl.utils.PageUtils;
import com.cl.utils.R;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.Arrays;
import java.util.Map;

/**
 * 客服聊天
 * 后端接口
 *
 * @author
 * @email
 * @date 2025-02-04 11:06:47
 */
@RestController
@RequestMapping("/chat")
public class ChatController {
    @Autowired
    private ChatService chatService;


    /**
     * 后台列表
     */
    @RequestMapping("/page")
    public R page(@RequestParam Map<String, Object> params, ChatEntity chat,
                  HttpServletRequest request) {
        EntityWrapper<ChatEntity> ew = new EntityWrapper<ChatEntity>();


        PageUtils page = chatService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, chat), params), params));
        return R.ok().put("data", page);
    }


    /**
     * 前端列表
     */
    @RequestMapping("/list")
    public R list(@RequestParam Map<String, Object> params, ChatEntity chat,
                  HttpServletRequest request) {
        if (!request.getSession().getAttribute("role").toString().equals("管理员")) {
            chat.setUserid((Long) request.getSession().getAttribute("userId"));
        }
        EntityWrapper<ChatEntity> ew = new EntityWrapper<ChatEntity>();

        PageUtils page = chatService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, chat), params), params));
        return R.ok().put("data", page);
    }

    /**
     * 列表
     */
    @RequestMapping("/lists")
    public R list(ChatEntity chat) {
        EntityWrapper<ChatEntity> ew = new EntityWrapper<ChatEntity>();
        ew.allEq(MPUtil.allEQMapPre(chat, "chat"));
        return R.ok().put("data", chatService.selectListView(ew));
    }

    /**
     * 查询
     */
    @RequestMapping("/query")
    public R query(ChatEntity chat) {
        EntityWrapper<ChatEntity> ew = new EntityWrapper<ChatEntity>();
        ew.allEq(MPUtil.allEQMapPre(chat, "chat"));
        ChatView chatView = chatService.selectView(ew);
        return R.ok("查询客服聊天成功").put("data", chatView);
    }

    /**
     * 后端详情
     */
    @RequestMapping("/info/{id}")
    public R info(@PathVariable("id") Long id) {
        ChatEntity chat = chatService.selectById(id);
        chat = chatService.selectView(new EntityWrapper<ChatEntity>().eq("id", id));
        return R.ok().put("data", chat);
    }

    /**
     * 前端详情
     */
    @IgnoreAuth
    @RequestMapping("/detail/{id}")
    public R detail(@PathVariable("id") Long id) {
        ChatEntity chat = chatService.selectById(id);
        chat = chatService.selectView(new EntityWrapper<ChatEntity>().eq("id", id));
        return R.ok().put("data", chat);
    }


    /**
     * 后端保存
     */
    @RequestMapping("/save")
    public R save(@RequestBody ChatEntity chat, HttpServletRequest request) {
        //ValidatorUtils.validateEntity(chat);
        if (StringUtils.isNotBlank(chat.getAsk())) {
            chatService.updateForSet("isreply=0", new EntityWrapper<ChatEntity>().eq("userid", request.getSession().getAttribute("userId")));
            chat.setUserid((Long) request.getSession().getAttribute("userId"));
            chat.setIsreply(1);
        }
        if (StringUtils.isNotBlank(chat.getReply())) {
            chatService.updateForSet("isreply=0", new EntityWrapper<ChatEntity>().eq("userid", chat.getUserid()));
            chat.setAdminid((Long) request.getSession().getAttribute("userId"));
        }
        chatService.insert(chat);
        return R.ok();
    }

    /**
     * 前端保存
     */
    @RequestMapping("/add")
    public R add(@RequestBody ChatEntity chat, HttpServletRequest request) {
        //ValidatorUtils.validateEntity(chat);
        chat.setUserid((Long) request.getSession().getAttribute("userId"));
        if (StringUtils.isNotBlank(chat.getAsk())) {
            chatService.updateForSet("isreply=0", new EntityWrapper<ChatEntity>().eq("userid", request.getSession().getAttribute("userId")));
            chat.setUserid((Long) request.getSession().getAttribute("userId"));
            chat.setIsreply(1);
        }
        if (StringUtils.isNotBlank(chat.getReply())) {
            chatService.updateForSet("isreply=0", new EntityWrapper<ChatEntity>().eq("userid", chat.getUserid()));
            chat.setAdminid((Long) request.getSession().getAttribute("userId"));
        }
        chatService.insert(chat);
        return R.ok();
    }


    /**
     * 修改
     */
    @RequestMapping("/update")
    @Transactional
    public R update(@RequestBody ChatEntity chat, HttpServletRequest request) {
        //ValidatorUtils.validateEntity(chat);
        chatService.updateById(chat);//全部更新
        return R.ok();
    }


    /**
     * 删除
     */
    @RequestMapping("/delete")
    public R delete(@RequestBody Long[] ids) {
        chatService.deleteBatchIds(Arrays.asList(ids));
        return R.ok();
    }


}
