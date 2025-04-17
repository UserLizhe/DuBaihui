package com.entity.model;

import java.io.Serializable;


/**
 * 自习室
 * 接收传参的实体类  
 *（实际开发中配合移动端接口开发手动去掉些没用的字段， 后端一般用entity就够用了） 
 * 取自ModelAndView 的model名称
 * @author 
 * @email 
 *   
 */
public class JifeiModel implements Serializable {
	private static final long serialVersionUID = 1L;

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
