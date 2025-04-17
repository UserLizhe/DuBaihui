package com.entity.view;

import com.baomidou.mybatisplus.annotations.TableName;
import com.entity.JiankongEntity;
import org.apache.commons.beanutils.BeanUtils;

import java.io.Serializable;
import java.lang.reflect.InvocationTargetException;
 

/**
 * 公告信息
 * 后端返回视图实体辅助类   
 * （通常后端关联的表或者自定义的字段需要返回使用）
 * @author 
 * @email 
 *     
 */
@TableName("jiankong")
public class JiankongView  extends JiankongEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	public JiankongView(){
	}
 
 	public JiankongView(JiankongEntity jiankongEntity){
 	try {
			BeanUtils.copyProperties(this, jiankongEntity);
		} catch (IllegalAccessException | InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
 		
	}
}
