package com.cl.dao;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;
import com.cl.entity.ChathelperEntity;
import com.cl.entity.view.ChathelperView;
import org.apache.ibatis.annotations.Param;

import java.util.List;


/**
 * 聊天助手
 *
 * @author
 * @email
 * @date 2025-02-04 11:06:47
 */
public interface ChathelperDao extends BaseMapper<ChathelperEntity> {

    List<ChathelperView> selectListView(@Param("ew") Wrapper<ChathelperEntity> wrapper);

    List<ChathelperView> selectListView(Pagination page, @Param("ew") Wrapper<ChathelperEntity> wrapper);

    ChathelperView selectView(@Param("ew") Wrapper<ChathelperEntity> wrapper);


}
