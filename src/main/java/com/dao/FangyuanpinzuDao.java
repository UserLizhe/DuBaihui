package com.dao;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;
import com.entity.FangyuanpinzuEntity;
import com.entity.view.FangyuanpinzuView;
import com.entity.vo.FangyuanpinzuVO;
import org.apache.ibatis.annotations.Param;

import java.util.List;


/**
 * 房源拼租
 * 
 * @author 
 * @email 
 *     
 */
public interface FangyuanpinzuDao extends BaseMapper<FangyuanpinzuEntity> {
	
	List<FangyuanpinzuVO> selectListVO(@Param("ew") Wrapper<FangyuanpinzuEntity> wrapper);
	
	FangyuanpinzuVO selectVO(@Param("ew") Wrapper<FangyuanpinzuEntity> wrapper);
	
	List<FangyuanpinzuView> selectListView(@Param("ew") Wrapper<FangyuanpinzuEntity> wrapper);

	List<FangyuanpinzuView> selectListView(Pagination page,@Param("ew") Wrapper<FangyuanpinzuEntity> wrapper);
	
	FangyuanpinzuView selectView(@Param("ew") Wrapper<FangyuanpinzuEntity> wrapper);
	

}
