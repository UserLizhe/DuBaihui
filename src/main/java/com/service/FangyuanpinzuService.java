package com.service;

import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.service.IService;
import com.entity.FangyuanpinzuEntity;
import com.entity.view.FangyuanpinzuView;
import com.entity.vo.FangyuanpinzuVO;
import com.utils.PageUtils;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;


/**
 * 房源拼租
 *
 * @author 
 * @email 
 *     
 */
public interface FangyuanpinzuService extends IService<FangyuanpinzuEntity> {

    PageUtils queryPage(Map<String, Object> params);
    
   	List<FangyuanpinzuVO> selectListVO(Wrapper<FangyuanpinzuEntity> wrapper);
   	
   	FangyuanpinzuVO selectVO(@Param("ew") Wrapper<FangyuanpinzuEntity> wrapper);
   	
   	List<FangyuanpinzuView> selectListView(Wrapper<FangyuanpinzuEntity> wrapper);
   	
   	FangyuanpinzuView selectView(@Param("ew") Wrapper<FangyuanpinzuEntity> wrapper);
   	
   	PageUtils queryPage(Map<String, Object> params,Wrapper<FangyuanpinzuEntity> wrapper);
   	

}

