package com.service;

import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.service.IService;
import com.entity.FangwuleixingEntity;
import com.entity.view.FangwuleixingView;
import com.entity.vo.FangwuleixingVO;
import com.utils.PageUtils;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;


/**
 * 房屋类型
 *
 * @author 
 * @email 
 *     
 */
public interface FangwuleixingService extends IService<FangwuleixingEntity> {

    PageUtils queryPage(Map<String, Object> params);
    
   	List<FangwuleixingVO> selectListVO(Wrapper<FangwuleixingEntity> wrapper);
   	
   	FangwuleixingVO selectVO(@Param("ew") Wrapper<FangwuleixingEntity> wrapper);
   	
   	List<FangwuleixingView> selectListView(Wrapper<FangwuleixingEntity> wrapper);
   	
   	FangwuleixingView selectView(@Param("ew") Wrapper<FangwuleixingEntity> wrapper);
   	
   	PageUtils queryPage(Map<String, Object> params,Wrapper<FangwuleixingEntity> wrapper);
   	

}

