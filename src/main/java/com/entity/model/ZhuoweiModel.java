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
public class ZhuoweiModel implements Serializable {
	private static final long serialVersionUID = 1L;

	 			
	/**
	 * 图片
	 */

	private String name;
	private String select;
	private String active;
	private String zixishi;



	public String getName() {
		return name;
	}

	public String getActive() {
		return active;
	}

	public String getSelect() {
		return select;
	}

	public String getZixishi() {
		return zixishi;
	}

	public void setActive(String active) {
		this.active = active;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setSelect(String select) {
		this.select = select;
	}

	public void setZixishi(String zixishi) {
		this.zixishi = zixishi;
	}
}
