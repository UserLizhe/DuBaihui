package com.entity.vo;

import java.io.Serializable;


/**
 * 自习室
 * 手机端接口返回实体辅助类 
 * （主要作用去除一些不必要的字段）
 * @author 
 * @email 
 *   
 */
public class JifeiVO implements Serializable {
	private static final long serialVersionUID = 1L;

	 			
	/**
	 * 图片
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
