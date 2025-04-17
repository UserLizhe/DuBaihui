package com.controller;

import com.annotation.IgnoreAuth;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.entity.FangyuanpinzuEntity;
import com.entity.StoreupEntity;
import com.entity.view.FangyuanpinzuView;
import com.service.FangyuanpinzuService;
import com.service.StoreupService;
import com.utils.MPUtil;
import com.utils.PageUtils;
import com.utils.R;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * 房源拼租
 * 后端接口
 * @author 
 * @email 
 *     
 */
@RestController
@RequestMapping("/fangyuanpinzu")
public class FangyuanpinzuController {
    @Autowired
    private FangyuanpinzuService fangyuanpinzuService;

    @Autowired
    private StoreupService storeupService;

    


    /**
     * 后端列表
     */
    @RequestMapping("/page")
    public R page(@RequestParam Map<String, Object> params,FangyuanpinzuEntity fangyuanpinzu,
		HttpServletRequest request){
		String tableName = request.getSession().getAttribute("tableName").toString();
		if(tableName.equals("fangdong")) {
			fangyuanpinzu.setFangdongzhanghao((String)request.getSession().getAttribute("username"));
		}
        EntityWrapper<FangyuanpinzuEntity> ew = new EntityWrapper<FangyuanpinzuEntity>();

		PageUtils page = fangyuanpinzuService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, fangyuanpinzu), params), params));

        return R.ok().put("data", page);
    }
    
    /**
     * 前端列表
     */
	@IgnoreAuth
    @RequestMapping("/list")
    public R list(@RequestParam Map<String, Object> params,FangyuanpinzuEntity fangyuanpinzu, 
		HttpServletRequest request){
        EntityWrapper<FangyuanpinzuEntity> ew = new EntityWrapper<FangyuanpinzuEntity>();

		PageUtils page = fangyuanpinzuService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, fangyuanpinzu), params), params));
        return R.ok().put("data", page);
    }

	/**
     * 列表
     */
    @RequestMapping("/lists")
    public R list( FangyuanpinzuEntity fangyuanpinzu){
       	EntityWrapper<FangyuanpinzuEntity> ew = new EntityWrapper<FangyuanpinzuEntity>();
      	ew.allEq(MPUtil.allEQMapPre( fangyuanpinzu, "fangyuanpinzu")); 
        return R.ok().put("data", fangyuanpinzuService.selectListView(ew));
    }

	 /**
     * 查询
     */
    @RequestMapping("/query")
    public R query(FangyuanpinzuEntity fangyuanpinzu){
        EntityWrapper< FangyuanpinzuEntity> ew = new EntityWrapper< FangyuanpinzuEntity>();
 		ew.allEq(MPUtil.allEQMapPre( fangyuanpinzu, "fangyuanpinzu")); 
		FangyuanpinzuView fangyuanpinzuView =  fangyuanpinzuService.selectView(ew);
		return R.ok("查询房源拼租成功").put("data", fangyuanpinzuView);
    }
	
    /**
     * 后端详情
     */
    @RequestMapping("/info/{id}")
    public R info(@PathVariable("id") Long id){
        FangyuanpinzuEntity fangyuanpinzu = fangyuanpinzuService.selectById(id);
		fangyuanpinzu.setClicknum(fangyuanpinzu.getClicknum()+1);
		fangyuanpinzu.setClicktime(new Date());
		fangyuanpinzuService.updateById(fangyuanpinzu);
        return R.ok().put("data", fangyuanpinzu);
    }

    /**
     * 前端详情
     */
	@IgnoreAuth
    @RequestMapping("/detail/{id}")
    public R detail(@PathVariable("id") Long id){
        FangyuanpinzuEntity fangyuanpinzu = fangyuanpinzuService.selectById(id);
		fangyuanpinzu.setClicknum(fangyuanpinzu.getClicknum()+1);
		fangyuanpinzu.setClicktime(new Date());
		fangyuanpinzuService.updateById(fangyuanpinzu);
        return R.ok().put("data", fangyuanpinzu);
    }
    



    /**
     * 后端保存
     */
    @RequestMapping("/save")
    public R save(@RequestBody FangyuanpinzuEntity fangyuanpinzu, HttpServletRequest request){
    	fangyuanpinzu.setId(new Date().getTime()+new Double(Math.floor(Math.random()*1000)).longValue());
    	//ValidatorUtils.validateEntity(fangyuanpinzu);
        fangyuanpinzuService.insert(fangyuanpinzu);
        return R.ok();
    }
    
    /**
     * 前端保存
     */
    @RequestMapping("/add")
    public R add(@RequestBody FangyuanpinzuEntity fangyuanpinzu, HttpServletRequest request){
    	fangyuanpinzu.setId(new Date().getTime()+new Double(Math.floor(Math.random()*1000)).longValue());
    	//ValidatorUtils.validateEntity(fangyuanpinzu);
        fangyuanpinzuService.insert(fangyuanpinzu);
        return R.ok();
    }



    /**
     * 修改
     */
    @RequestMapping("/update")
    @Transactional
    public R update(@RequestBody FangyuanpinzuEntity fangyuanpinzu, HttpServletRequest request){
        //ValidatorUtils.validateEntity(fangyuanpinzu);
        fangyuanpinzuService.updateById(fangyuanpinzu);//全部更新
        return R.ok();
    }


    

    /**
     * 删除
     */
    @RequestMapping("/delete")
    public R delete(@RequestBody Long[] ids){
        fangyuanpinzuService.deleteBatchIds(Arrays.asList(ids));
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
		
		Wrapper<FangyuanpinzuEntity> wrapper = new EntityWrapper<FangyuanpinzuEntity>();
		if(map.get("remindstart")!=null) {
			wrapper.ge(columnName, map.get("remindstart"));
		}
		if(map.get("remindend")!=null) {
			wrapper.le(columnName, map.get("remindend"));
		}

		String tableName = request.getSession().getAttribute("tableName").toString();
		if(tableName.equals("fangdong")) {
			wrapper.eq("fangdongzhanghao", (String)request.getSession().getAttribute("username"));
		}

		int count = fangyuanpinzuService.selectCount(wrapper);
		return R.ok().put("count", count);
	}
	
	/**
     * 前端智能排序
     */
	@IgnoreAuth
    @RequestMapping("/autoSort")
    public R autoSort(@RequestParam Map<String, Object> params,FangyuanpinzuEntity fangyuanpinzu, HttpServletRequest request,String pre){
        EntityWrapper<FangyuanpinzuEntity> ew = new EntityWrapper<FangyuanpinzuEntity>();
        Map<String, Object> newMap = new HashMap<String, Object>();
        Map<String, Object> param = new HashMap<String, Object>();
		Iterator<Map.Entry<String, Object>> it = param.entrySet().iterator();
		while (it.hasNext()) {
			Map.Entry<String, Object> entry = it.next();
			String key = entry.getKey();
			String newKey = entry.getKey();
			if (pre.endsWith(".")) {
				newMap.put(pre + newKey, entry.getValue());
			} else if (StringUtils.isEmpty(pre)) {
				newMap.put(newKey, entry.getValue());
			} else {
				newMap.put(pre + "." + newKey, entry.getValue());
			}
		}
		params.put("sort", "clicknum");
        params.put("order", "desc");
		PageUtils page = fangyuanpinzuService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, fangyuanpinzu), params), params));
        return R.ok().put("data", page);
    }


    /**
     * 协同算法（按收藏推荐）
     */
    @RequestMapping("/autoSort2")
    public R autoSort2(@RequestParam Map<String, Object> params,FangyuanpinzuEntity fangyuanpinzu, HttpServletRequest request){
        String userId = request.getSession().getAttribute("userId").toString();
        String inteltypeColumn = "fangwuleixing";
        List<StoreupEntity> storeups = storeupService.selectList(new EntityWrapper<StoreupEntity>().eq("type", 1).eq("userid", userId).eq("tablename", "fangyuanpinzu").orderBy("addtime", false));
        List<String> inteltypes = new ArrayList<String>();
        Integer limit = params.get("limit")==null?10:Integer.parseInt(params.get("limit").toString());
        List<FangyuanpinzuEntity> fangyuanpinzuList = new ArrayList<FangyuanpinzuEntity>();
        //去重
        if(storeups!=null && storeups.size()>0) {
            for(StoreupEntity s : storeups) {
                fangyuanpinzuList.addAll(fangyuanpinzuService.selectList(new EntityWrapper<FangyuanpinzuEntity>().eq(inteltypeColumn, s.getInteltype())));
            }
        }
        EntityWrapper<FangyuanpinzuEntity> ew = new EntityWrapper<FangyuanpinzuEntity>();
        params.put("sort", "id");
        params.put("order", "desc");
        PageUtils page = fangyuanpinzuService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, fangyuanpinzu), params), params));
        List<FangyuanpinzuEntity> pageList = (List<FangyuanpinzuEntity>)page.getList();
        if(fangyuanpinzuList.size()<limit) {
            int toAddNum = (limit-fangyuanpinzuList.size())<=pageList.size()?(limit-fangyuanpinzuList.size()):pageList.size();
            for(FangyuanpinzuEntity o1 : pageList) {
                boolean addFlag = true;
                for(FangyuanpinzuEntity o2 : fangyuanpinzuList) {
                    if(o1.getId().intValue()==o2.getId().intValue()) {
                        addFlag = false;
                        break;
                    }
                }
                if(addFlag) {
                    fangyuanpinzuList.add(o1);
                    if(--toAddNum==0) break;
                }
            }
        } else if(fangyuanpinzuList.size()>limit) {
            fangyuanpinzuList = fangyuanpinzuList.subList(0, limit);
        }
        page.setList(fangyuanpinzuList);
        return R.ok().put("data", page);
    }







}
