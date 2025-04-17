package com.service.impl;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.dao.JifeiDao;
import com.entity.JifeiEntity;
import com.entity.view.JifeiView;
import com.entity.vo.JifeiVO;
import com.service.JifeiService;
import com.utils.PageUtils;
import com.utils.Query;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service("jifeiService")
public class JifeiServiceImpl extends ServiceImpl<JifeiDao, JifeiEntity> implements JifeiService {
	
	
    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        Page<JifeiEntity> page = this.selectPage(
                new Query<JifeiEntity>(params).getPage(),
                new EntityWrapper<JifeiEntity>()
        );
        return new PageUtils(page);
    }
    
    @Override
	public PageUtils queryPage(Map<String, Object> params, Wrapper<JifeiEntity> wrapper) {
		  Page<JifeiView> page =new Query<JifeiView>(params).getPage();
	        page.setRecords(baseMapper.selectListView(page,wrapper));
	    	PageUtils pageUtil = new PageUtils(page);
	    	return pageUtil;
 	}
    
    @Override
	public List<JifeiVO> selectListVO(Wrapper<JifeiEntity> wrapper) {
 		return baseMapper.selectListVO(wrapper);
	}
	
	@Override
	public JifeiVO selectVO(Wrapper<JifeiEntity> wrapper) {
 		return baseMapper.selectVO(wrapper);
	}
	
	@Override
	public List<JifeiView> selectListView(Wrapper<JifeiEntity> wrapper) {
		return baseMapper.selectListView(wrapper);
	}

	@Override
	public JifeiView selectView(Wrapper<JifeiEntity> wrapper) {
		return baseMapper.selectView(wrapper);
	}


}
