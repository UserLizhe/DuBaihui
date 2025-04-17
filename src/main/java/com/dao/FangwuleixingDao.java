package com.dao;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;
import com.entity.FangwuleixingEntity;
import com.entity.view.FangwuleixingView;
import com.entity.vo.FangwuleixingVO;
import org.apache.ibatis.annotations.Param;

import java.util.List;


/**
 * 房屋类型
 * 
 * @author 
 * @email 
 *     
 */
public interface FangwuleixingDao extends BaseMapper<FangwuleixingEntity> {
	
	List<FangwuleixingVO> selectListVO(@Param("ew") Wrapper<FangwuleixingEntity> wrapper);
	
	FangwuleixingVO selectVO(@Param("ew") Wrapper<FangwuleixingEntity> wrapper);
	
	List<FangwuleixingView> selectListView(@Param("ew") Wrapper<FangwuleixingEntity> wrapper);

	List<FangwuleixingView> selectListView(Pagination page,@Param("ew") Wrapper<FangwuleixingEntity> wrapper);
	
	FangwuleixingView selectView(@Param("ew") Wrapper<FangwuleixingEntity> wrapper);
	

}
