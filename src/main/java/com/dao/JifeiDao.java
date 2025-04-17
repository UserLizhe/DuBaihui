package com.dao;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;
import com.entity.JifeiEntity;
import com.entity.view.JifeiView;
import com.entity.vo.JifeiVO;
import org.apache.ibatis.annotations.Param;

import java.util.List;


/**
 * 自习室
 * 
 * @author 
 * @email 
 *   
 */
public interface JifeiDao extends BaseMapper<JifeiEntity> {
	
	List<JifeiVO> selectListVO(@Param("ew") Wrapper<JifeiEntity> wrapper);
	
	JifeiVO selectVO(@Param("ew") Wrapper<JifeiEntity> wrapper);
	
	List<JifeiView> selectListView(@Param("ew") Wrapper<JifeiEntity> wrapper);

	List<JifeiView> selectListView(Pagination page,@Param("ew") Wrapper<JifeiEntity> wrapper);
	
	JifeiView selectView(@Param("ew") Wrapper<JifeiEntity> wrapper);
	

}
