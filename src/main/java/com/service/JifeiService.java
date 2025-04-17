package com.service;

import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.service.IService;
import com.entity.JifeiEntity;
import com.entity.view.JifeiView;
import com.entity.vo.JifeiVO;
import com.utils.PageUtils;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;


/**
 * 自习室
 *
 * @author 
 * @email 
 *   
 */
public interface JifeiService extends IService<JifeiEntity> {

    PageUtils queryPage(Map<String, Object> params);
    
   	List<JifeiVO> selectListVO(Wrapper<JifeiEntity> wrapper);
   	
   	JifeiVO selectVO(@Param("ew") Wrapper<JifeiEntity> wrapper);
   	
   	List<JifeiView> selectListView(Wrapper<JifeiEntity> wrapper);
   	
   	JifeiView selectView(@Param("ew") Wrapper<JifeiEntity> wrapper);
   	
   	PageUtils queryPage(Map<String, Object> params,Wrapper<JifeiEntity> wrapper);
   	

}

