package com.entity.view;

import com.baomidou.mybatisplus.annotations.TableName;
import com.entity.FangwuleixingEntity;
import org.apache.commons.beanutils.BeanUtils;

import java.io.Serializable;
import java.lang.reflect.InvocationTargetException;
 

/**
 * 房屋类型
 * 后端返回视图实体辅助类   
 * （通常后端关联的表或者自定义的字段需要返回使用）
 * @author 
 * @email 
 *     
 */
@TableName("fangwuleixing")
public class FangwuleixingView  extends FangwuleixingEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	public FangwuleixingView(){
	}
 
 	public FangwuleixingView(FangwuleixingEntity fangwuleixingEntity){
 	try {
			BeanUtils.copyProperties(this, fangwuleixingEntity);
		} catch (IllegalAccessException | InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
 		
	}
}
