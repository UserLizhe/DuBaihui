package com.service;

import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.service.IService;
import com.entity.JiankongEntity;
import com.entity.view.JiankongView;
import com.entity.vo.JiankongVO;
import com.utils.PageUtils;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;


/**
 * 公告信息
 *
 * @author 
 * @email 
 *     
 */
public interface JiankongService extends IService<JiankongEntity> {

    PageUtils queryPage(Map<String, Object> params);
    
   	List<JiankongVO> selectListVO(Wrapper<JiankongEntity> wrapper);
   	
   	JiankongVO selectVO(@Param("ew") Wrapper<JiankongEntity> wrapper);
   	
   	List<JiankongView> selectListView(Wrapper<JiankongEntity> wrapper);
   	
   	JiankongView selectView(@Param("ew") Wrapper<JiankongEntity> wrapper);
   	
   	PageUtils queryPage(Map<String, Object> params,Wrapper<JiankongEntity> wrapper);
   	

}

