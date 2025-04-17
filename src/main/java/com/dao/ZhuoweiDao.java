package com.dao;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;
import com.entity.ZhuoweiEntity;
import com.entity.view.ZhuoweiView;
import com.entity.vo.ZhuoweiVO;
import org.apache.ibatis.annotations.Param;

import java.util.List;


/**
 * 自习室
 * 
 * @author 
 * @email 
 *   
 */
public interface ZhuoweiDao extends BaseMapper<ZhuoweiEntity> {
	
	List<ZhuoweiVO> selectListVO(@Param("ew") Wrapper<ZhuoweiEntity> wrapper);
	
	ZhuoweiVO selectVO(@Param("ew") Wrapper<ZhuoweiEntity> wrapper);
	
	List<ZhuoweiView> selectListView(@Param("ew") Wrapper<ZhuoweiEntity> wrapper);

	List<ZhuoweiView> selectListView(Pagination page,@Param("ew") Wrapper<ZhuoweiEntity> wrapper);
	
	ZhuoweiView selectView(@Param("ew") Wrapper<ZhuoweiEntity> wrapper);
	

}
