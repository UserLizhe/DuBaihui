package com.entity.view;

import com.baomidou.mybatisplus.annotations.TableName;
import com.entity.FangyuanpinzuEntity;
import org.apache.commons.beanutils.BeanUtils;

import java.io.Serializable;
import java.lang.reflect.InvocationTargetException;
 

/**
 * 房源拼租
 * 后端返回视图实体辅助类   
 * （通常后端关联的表或者自定义的字段需要返回使用）
 * @author 
 * @email 
 *     
 */
@TableName("fangyuanpinzu")
public class FangyuanpinzuView  extends FangyuanpinzuEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	public FangyuanpinzuView(){
	}
 
 	public FangyuanpinzuView(FangyuanpinzuEntity fangyuanpinzuEntity){
 	try {
			BeanUtils.copyProperties(this, fangyuanpinzuEntity);
		} catch (IllegalAccessException | InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
 		
	}
}
