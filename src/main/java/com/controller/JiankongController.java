package com.controller;

import com.annotation.IgnoreAuth;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.entity.JiankongEntity;
import com.entity.view.JiankongView;
import com.service.JiankongService;
import com.utils.MPUtil;
import com.utils.PageUtils;
import com.utils.R;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.Map;

/**
 * 公告信息
 * 后端接口
 * @author 
 * @email 
 *     
 */
@RestController
@RequestMapping("/jiankong")
public class JiankongController {
    @Autowired
    private JiankongService jiankongService;


    


    /**
     * 后端列表
     */
    @RequestMapping("/page")
    public R page(@RequestParam Map<String, Object> params,JiankongEntity jiankong,
		HttpServletRequest request){
        EntityWrapper<JiankongEntity> ew = new EntityWrapper<JiankongEntity>();

		PageUtils page = jiankongService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, jiankong), params), params));

        return R.ok().put("data", page);
    }
    
    /**
     * 前端列表
     */
	@IgnoreAuth
    @RequestMapping("/list")
    public R list(@RequestParam Map<String, Object> params,JiankongEntity jiankong, 
		HttpServletRequest request){
        EntityWrapper<JiankongEntity> ew = new EntityWrapper<JiankongEntity>();

		PageUtils page = jiankongService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, jiankong), params), params));
        return R.ok().put("data", page);
    }

	/**
     * 列表
     */
    @RequestMapping("/lists")
    public R list( JiankongEntity jiankong){
       	EntityWrapper<JiankongEntity> ew = new EntityWrapper<JiankongEntity>();
      	ew.allEq(MPUtil.allEQMapPre( jiankong, "jiankong")); 
        return R.ok().put("data", jiankongService.selectListView(ew));
    }

	 /**
     * 查询
     */
    @RequestMapping("/query")
    public R query(JiankongEntity jiankong){
        EntityWrapper< JiankongEntity> ew = new EntityWrapper< JiankongEntity>();
 		ew.allEq(MPUtil.allEQMapPre( jiankong, "jiankong")); 
		JiankongView jiankongView =  jiankongService.selectView(ew);
		return R.ok("查询公告信息成功").put("data", jiankongView);
    }
	
    /**
     * 后端详情
     */
    @RequestMapping("/info/{id}")
    public R info(@PathVariable("id") Long id){
        JiankongEntity jiankong = jiankongService.selectById(id);
        return R.ok().put("data", jiankong);
    }

    /**
     * 前端详情
     */
	@IgnoreAuth
    @RequestMapping("/detail/{id}")
    public R detail(@PathVariable("id") Long id){
        JiankongEntity jiankong = jiankongService.selectById(id);
        return R.ok().put("data", jiankong);
    }
    



    /**
     * 后端保存
     */
    @RequestMapping("/save")
    public R save(@RequestBody JiankongEntity jiankong, HttpServletRequest request){
    	jiankong.setId(new Date().getTime()+new Double(Math.floor(Math.random()*1000)).longValue());
    	//ValidatorUtils.validateEntity(jiankong);
        jiankongService.insert(jiankong);
        return R.ok();
    }
    
    /**
     * 前端保存
     */
    @RequestMapping("/add")
    public R add(@RequestBody JiankongEntity jiankong, HttpServletRequest request){
    	jiankong.setId(new Date().getTime()+new Double(Math.floor(Math.random()*1000)).longValue());
    	//ValidatorUtils.validateEntity(jiankong);
        jiankongService.insert(jiankong);
        return R.ok();
    }



    /**
     * 修改
     */
    @RequestMapping("/update")
    @Transactional
    public R update(@RequestBody JiankongEntity jiankong, HttpServletRequest request){
        //ValidatorUtils.validateEntity(jiankong);
        jiankongService.updateById(jiankong);//全部更新
        return R.ok();
    }


    

    /**
     * 删除
     */
    @RequestMapping("/delete")
    public R delete(@RequestBody Long[] ids){
        jiankongService.deleteBatchIds(Arrays.asList(ids));
        return R.ok();
    }
    
    /**
     * 提醒接口
     */
	@RequestMapping("/remind/{columnName}/{type}")
	public R remindCount(@PathVariable("columnName") String columnName, HttpServletRequest request, 
						 @PathVariable("type") String type,@RequestParam Map<String, Object> map) {
		map.put("column", columnName);
		map.put("type", type);
		
		if(type.equals("2")) {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Calendar c = Calendar.getInstance();
			Date remindStartDate = null;
			Date remindEndDate = null;
			if(map.get("remindstart")!=null) {
				Integer remindStart = Integer.parseInt(map.get("remindstart").toString());
				c.setTime(new Date()); 
				c.add(Calendar.DAY_OF_MONTH,remindStart);
				remindStartDate = c.getTime();
				map.put("remindstart", sdf.format(remindStartDate));
			}
			if(map.get("remindend")!=null) {
				Integer remindEnd = Integer.parseInt(map.get("remindend").toString());
				c.setTime(new Date());
				c.add(Calendar.DAY_OF_MONTH,remindEnd);
				remindEndDate = c.getTime();
				map.put("remindend", sdf.format(remindEndDate));
			}
		}
		
		Wrapper<JiankongEntity> wrapper = new EntityWrapper<JiankongEntity>();
		if(map.get("remindstart")!=null) {
			wrapper.ge(columnName, map.get("remindstart"));
		}
		if(map.get("remindend")!=null) {
			wrapper.le(columnName, map.get("remindend"));
		}


		int count = jiankongService.selectCount(wrapper);
		return R.ok().put("count", count);
	}
	









}
