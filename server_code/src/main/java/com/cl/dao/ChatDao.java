package com.cl.dao;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;
import com.cl.entity.ChatEntity;
import com.cl.entity.view.ChatView;
import org.apache.ibatis.annotations.Param;

import java.util.List;


/**
 * 客服聊天
 *
 * @author
 * @email
 * @date 2025-02-04 11:06:47
 */
public interface ChatDao extends BaseMapper<ChatEntity> {

    List<ChatView> selectListView(@Param("ew") Wrapper<ChatEntity> wrapper);

    List<ChatView> selectListView(Pagination page, @Param("ew") Wrapper<ChatEntity> wrapper);

    ChatView selectView(@Param("ew") Wrapper<ChatEntity> wrapper);


}
