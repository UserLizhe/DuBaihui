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
public class ZhuoweiVO implements Serializable {
	private static final long serialVersionUID = 1L;

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
