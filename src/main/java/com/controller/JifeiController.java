package com.controller;

import com.annotation.IgnoreAuth;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.entity.JifeiEntity;
import com.entity.view.JifeiView;
import com.service.StoreupService;
import com.service.JifeiService;
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
 * 自习室
 * 后端接口
 * @author 
 * @email 
 *   
 */
@RestController
@RequestMapping("/jifei")
public class JifeiController {
    @Autowired
    private JifeiService jifeiService;

    @Autowired
    private StoreupService storeupService;

    


    /**
     * 后端列表
     */
    @RequestMapping("/page")
    public R page(@RequestParam Map<String, Object> params,JifeiEntity jifei,
		HttpServletRequest request){
        EntityWrapper<JifeiEntity> ew = new EntityWrapper<JifeiEntity>();

		PageUtils page = jifeiService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, jifei), params), params));

        return R.ok().put("data", page);
    }
    
    /**
     * 前端列表
     */
	@IgnoreAuth
    @RequestMapping("/list")
    public R list(@RequestParam Map<String, Object> params,JifeiEntity jifei, 
		HttpServletRequest request){
        EntityWrapper<JifeiEntity> ew = new EntityWrapper<JifeiEntity>();

		PageUtils page = jifeiService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, jifei), params), params));
        return R.ok().put("data", page);
    }

	/**
     * 列表
     */
    @RequestMapping("/lists")
    public R list( JifeiEntity jifei){
       	EntityWrapper<JifeiEntity> ew = new EntityWrapper<JifeiEntity>();
      	ew.allEq(MPUtil.allEQMapPre( jifei, "jifei")); 
        return R.ok().put("data", jifeiService.selectListView(ew));
    }

	 /**
     * 查询
     */
    @RequestMapping("/query")
    public R query(JifeiEntity jifei){
        EntityWrapper< JifeiEntity> ew = new EntityWrapper< JifeiEntity>();
 		ew.allEq(MPUtil.allEQMapPre( jifei, "jifei")); 
		JifeiView jifeiView =  jifeiService.selectView(ew);
		return R.ok("查询自习室成功").put("data", jifeiView);
    }
	
    /**
     * 后端详情
     */
    @RequestMapping("/info/{id}")
    public R info(@PathVariable("id") Long id){
        JifeiEntity jifei = jifeiService.selectById(id);
        return R.ok().put("data", jifei);
    }

    /**
     * 前端详情
     */
	@IgnoreAuth
    @RequestMapping("/detail/{id}")
    public R detail(@PathVariable("id") Long id){
        JifeiEntity jifei = jifeiService.selectById(id);
        return R.ok().put("data", jifei);
    }
    



    /**
     * 后端保存
     */
    @RequestMapping("/save")
    public R save(@RequestBody JifeiEntity jifei, HttpServletRequest request){

    	//ValidatorUtils.validateEntity(jifei);
        jifeiService.insert(jifei);
        return R.ok();
    }
    
    /**
     * 前端保存
     */
    @RequestMapping("/add")
    public R add(@RequestBody JifeiEntity jifei, HttpServletRequest request){

    	//ValidatorUtils.validateEntity(jifei);
        jifeiService.insert(jifei);
        return R.ok();
    }



    /**
     * 修改
     */
    @RequestMapping("/update")
    @Transactional
    public R update(@RequestBody JifeiEntity jifei, HttpServletRequest request){
        //ValidatorUtils.validateEntity(jifei);
        jifeiService.updateById(jifei);//全部更新
        return R.ok();
    }
    

    /**
     * 删除
     */
    @RequestMapping("/delete")
    public R delete(@RequestBody Long[] ids){
        jifeiService.deleteBatchIds(Arrays.asList(ids));
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
		
		Wrapper<JifeiEntity> wrapper = new EntityWrapper<JifeiEntity>();
		if(map.get("remindstart")!=null) {
			wrapper.ge(columnName, map.get("remindstart"));
		}
		if(map.get("remindend")!=null) {
			wrapper.le(columnName, map.get("remindend"));
		}


		int count = jifeiService.selectCount(wrapper);
		return R.ok().put("count", count);
	}
	








}
