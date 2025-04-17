package com.entity;

import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.poi.ss.formula.functions.T;

import java.lang.reflect.InvocationTargetException;
@TableName("zhuowei")
public class ZhuoweiEntity {
    public ZhuoweiEntity() {

    }

    public ZhuoweiEntity(T t) {
        try {
            BeanUtils.copyProperties(this, t);
        } catch (IllegalAccessException | InvocationTargetException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
    @TableId
    private Long id;
    /**
     * 名称
     */

    private String name;
    private String select;
    private String active;
    private String zixishi;

    public void setId(Long id) {
        this.id = id;
    }

    public Long getId() {
        return id;
    }

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
