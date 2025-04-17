package com.dao;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;
import com.entity.JiankongEntity;
import com.entity.view.JiankongView;
import com.entity.vo.JiankongVO;
import org.apache.ibatis.annotations.Param;

import java.util.List;


/**
 * 公告信息
 * 
 * @author 
 * @email 
 *     
 */
public interface JiankongDao extends BaseMapper<JiankongEntity> {
	
	List<JiankongVO> selectListVO(@Param("ew") Wrapper<JiankongEntity> wrapper);
	
	JiankongVO selectVO(@Param("ew") Wrapper<JiankongEntity> wrapper);
	
	List<JiankongView> selectListView(@Param("ew") Wrapper<JiankongEntity> wrapper);

	List<JiankongView> selectListView(Pagination page,@Param("ew") Wrapper<JiankongEntity> wrapper);
	
	JiankongView selectView(@Param("ew") Wrapper<JiankongEntity> wrapper);
	

}
