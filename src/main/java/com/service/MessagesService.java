package com.service;

import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.service.IService;
import com.entity.MessagesEntity;
import com.entity.view.MessagesView;
import com.entity.vo.MessagesVO;
import com.utils.PageUtils;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;


/**
 * 留言反馈
 *
 * @author 
 * @email 
 *     
 */
public interface MessagesService extends IService<MessagesEntity> {

    PageUtils queryPage(Map<String, Object> params);
    
   	List<MessagesVO> selectListVO(Wrapper<MessagesEntity> wrapper);
   	
   	MessagesVO selectVO(@Param("ew") Wrapper<MessagesEntity> wrapper);
   	
   	List<MessagesView> selectListView(Wrapper<MessagesEntity> wrapper);
   	
   	MessagesView selectView(@Param("ew") Wrapper<MessagesEntity> wrapper);
   	
   	PageUtils queryPage(Map<String, Object> params,Wrapper<MessagesEntity> wrapper);
   	

}

