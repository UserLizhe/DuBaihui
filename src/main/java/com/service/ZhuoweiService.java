package com.service;

import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.service.IService;
import com.entity.ZhuoweiEntity;
import com.entity.view.ZhuoweiView;
import com.entity.vo.ZhuoweiVO;
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
public interface ZhuoweiService extends IService<ZhuoweiEntity> {

    PageUtils queryPage(Map<String, Object> params);
    
   	List<ZhuoweiVO> selectListVO(Wrapper<ZhuoweiEntity> wrapper);
   	
   	ZhuoweiVO selectVO(@Param("ew") Wrapper<ZhuoweiEntity> wrapper);
   	
   	List<ZhuoweiView> selectListView(Wrapper<ZhuoweiEntity> wrapper);
   	
   	ZhuoweiView selectView(@Param("ew") Wrapper<ZhuoweiEntity> wrapper);
   	
   	PageUtils queryPage(Map<String, Object> params,Wrapper<ZhuoweiEntity> wrapper);
   	

}

