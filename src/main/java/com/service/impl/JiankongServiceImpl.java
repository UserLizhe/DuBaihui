package com.service.impl;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.dao.JiankongDao;
import com.entity.JiankongEntity;
import com.entity.view.JiankongView;
import com.entity.vo.JiankongVO;
import com.service.JiankongService;
import com.utils.PageUtils;
import com.utils.Query;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service("jiankongService")
public class JiankongServiceImpl extends ServiceImpl<JiankongDao, JiankongEntity> implements JiankongService {
	
	
    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        Page<JiankongEntity> page = this.selectPage(
                new Query<JiankongEntity>(params).getPage(),
                new EntityWrapper<JiankongEntity>()
        );
        return new PageUtils(page);
    }
    
    @Override
	public PageUtils queryPage(Map<String, Object> params, Wrapper<JiankongEntity> wrapper) {
		  Page<JiankongView> page =new Query<JiankongView>(params).getPage();
	        page.setRecords(baseMapper.selectListView(page,wrapper));
	    	PageUtils pageUtil = new PageUtils(page);
	    	return pageUtil;
 	}
    
    @Override
	public List<JiankongVO> selectListVO(Wrapper<JiankongEntity> wrapper) {
 		return baseMapper.selectListVO(wrapper);
	}
	
	@Override
	public JiankongVO selectVO(Wrapper<JiankongEntity> wrapper) {
 		return baseMapper.selectVO(wrapper);
	}
	
	@Override
	public List<JiankongView> selectListView(Wrapper<JiankongEntity> wrapper) {
		return baseMapper.selectListView(wrapper);
	}

	@Override
	public JiankongView selectView(Wrapper<JiankongEntity> wrapper) {
		return baseMapper.selectView(wrapper);
	}


}
