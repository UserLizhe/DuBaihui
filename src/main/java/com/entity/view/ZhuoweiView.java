package com.entity.view;

import com.baomidou.mybatisplus.annotations.TableName;
import com.entity.ZhuoweiEntity;
import org.apache.commons.beanutils.BeanUtils;

import java.io.Serializable;
import java.lang.reflect.InvocationTargetException;


/**
 * 自习室
 * 后端返回视图实体辅助类   
 * （通常后端关联的表或者自定义的字段需要返回使用）
 * @author 
 * @email 
 *   
 */
@TableName("zhuowei")
public class ZhuoweiView extends ZhuoweiEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	public ZhuoweiView(){
	}
 
 	public ZhuoweiView(ZhuoweiEntity zhuoweiEntity){
 	try {
			BeanUtils.copyProperties(this, zhuoweiEntity);
		} catch (IllegalAccessException | InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
 		
	}
}
