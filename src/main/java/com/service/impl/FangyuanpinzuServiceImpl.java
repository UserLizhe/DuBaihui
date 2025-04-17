package com.service.impl;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.dao.FangyuanpinzuDao;
import com.entity.FangyuanpinzuEntity;
import com.entity.view.FangyuanpinzuView;
import com.entity.vo.FangyuanpinzuVO;
import com.service.FangyuanpinzuService;
import com.utils.PageUtils;
import com.utils.Query;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service("fangyuanpinzuService")
public class FangyuanpinzuServiceImpl extends ServiceImpl<FangyuanpinzuDao, FangyuanpinzuEntity> implements FangyuanpinzuService {
	
	
    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        Page<FangyuanpinzuEntity> page = this.selectPage(
                new Query<FangyuanpinzuEntity>(params).getPage(),
                new EntityWrapper<FangyuanpinzuEntity>()
        );
        return new PageUtils(page);
    }
    
    @Override
	public PageUtils queryPage(Map<String, Object> params, Wrapper<FangyuanpinzuEntity> wrapper) {
		  Page<FangyuanpinzuView> page =new Query<FangyuanpinzuView>(params).getPage();
	        page.setRecords(baseMapper.selectListView(page,wrapper));
	    	PageUtils pageUtil = new PageUtils(page);
	    	return pageUtil;
 	}
    
    @Override
	public List<FangyuanpinzuVO> selectListVO(Wrapper<FangyuanpinzuEntity> wrapper) {
 		return baseMapper.selectListVO(wrapper);
	}
	
	@Override
	public FangyuanpinzuVO selectVO(Wrapper<FangyuanpinzuEntity> wrapper) {
 		return baseMapper.selectVO(wrapper);
	}
	
	@Override
	public List<FangyuanpinzuView> selectListView(Wrapper<FangyuanpinzuEntity> wrapper) {
		return baseMapper.selectListView(wrapper);
	}

	@Override
	public FangyuanpinzuView selectView(Wrapper<FangyuanpinzuEntity> wrapper) {
		return baseMapper.selectView(wrapper);
	}


}
