package com.entity;

import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.beanutils.BeanUtils;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.lang.reflect.InvocationTargetException;
import java.util.Date;


/**
 * 自习室
 * 数据库通用操作实体类（普通增删改查）
 * @author 
 * @email 
 *   
 */
@TableName("jifei")
public class JifeiEntity<T> implements Serializable {
	private static final long serialVersionUID = 1L;


	public JifeiEntity() {
		
	}
	
	public JifeiEntity(T t) {
		try {
			BeanUtils.copyProperties(this, t);
		} catch (IllegalAccessException | InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	/**
	 * 主键id
	 */
	@TableId
	private Long id;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	/**
	 * 名称
	 */
					
	private String yonghuming;
	private String zixishi;
	private String begintime;
	private String price;


	public void setZixishi(String zixishi) {
		this.zixishi = zixishi;
	}

	public String getZixishi() {
		return zixishi;
	}

	public String getBegintime() {
		return begintime;
	}

	public String getPrice() {
		return price;
	}

	public String getYonghuming() {
		return yonghuming;
	}

	public void setBegintime(String begintime) {
		this.begintime = begintime;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public void setYonghuming(String yonghuming) {
		this.yonghuming = yonghuming;
	}
}
