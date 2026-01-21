package com.cl.service;

import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.service.IService;
import com.cl.entity.ChathelperEntity;
import com.cl.entity.view.ChathelperView;
import com.cl.utils.PageUtils;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;


/**
 * 聊天助手
 *
 * @author
 * @email
 * @date 2025-02-04 11:06:47
 */
public interface ChathelperService extends IService<ChathelperEntity> {

    PageUtils queryPage(Map<String, Object> params);

    List<ChathelperView> selectListView(Wrapper<ChathelperEntity> wrapper);

    ChathelperView selectView(@Param("ew") Wrapper<ChathelperEntity> wrapper);

    PageUtils queryPage(Map<String, Object> params, Wrapper<ChathelperEntity> wrapper);


}

