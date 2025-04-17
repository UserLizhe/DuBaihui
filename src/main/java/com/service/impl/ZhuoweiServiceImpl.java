package com.service.impl;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.dao.ZhuoweiDao;
import com.entity.ZhuoweiEntity;
import com.entity.view.ZhuoweiView;
import com.entity.vo.ZhuoweiVO;
import com.service.ZhuoweiService;
import com.utils.PageUtils;
import com.utils.Query;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service("zhuoweiService")
public class ZhuoweiServiceImpl extends ServiceImpl<ZhuoweiDao, ZhuoweiEntity> implements ZhuoweiService {
	
	
    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        Page<ZhuoweiEntity> page = this.selectPage(
                new Query<ZhuoweiEntity>(params).getPage(),
                new EntityWrapper<ZhuoweiEntity>()
        );
        return new PageUtils(page);
    }
    
    @Override
	public PageUtils queryPage(Map<String, Object> params, Wrapper<ZhuoweiEntity> wrapper) {
		  Page<ZhuoweiView> page =new Query<ZhuoweiView>(params).getPage();
	        page.setRecords(baseMapper.selectListView(page,wrapper));
	    	PageUtils pageUtil = new PageUtils(page);
	    	return pageUtil;
 	}
    
    @Override
	public List<ZhuoweiVO> selectListVO(Wrapper<ZhuoweiEntity> wrapper) {
 		return baseMapper.selectListVO(wrapper);
	}
	
	@Override
	public ZhuoweiVO selectVO(Wrapper<ZhuoweiEntity> wrapper) {
 		return baseMapper.selectVO(wrapper);
	}
	
	@Override
	public List<ZhuoweiView> selectListView(Wrapper<ZhuoweiEntity> wrapper) {
		return baseMapper.selectListView(wrapper);
	}

	@Override
	public ZhuoweiView selectView(Wrapper<ZhuoweiEntity> wrapper) {
		return baseMapper.selectView(wrapper);
	}


}
