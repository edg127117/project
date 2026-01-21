package com.cl.entity;

import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.IdType;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.beanutils.BeanUtils;
import org.springframework.format.annotation.DateTimeFormat;


import java.io.Serializable;
import java.lang.reflect.InvocationTargetException;
import java.util.Date;

@TableName("peijian")
public class PeijianEntity<T> implements Serializable {
    private static final long serialVersionUID = 1L;

    @TableId(type = IdType.AUTO)
    private Long id;

    /**
     * 配件名称
     */
    private String peijianmingcheng;

    /**
     * 图片
     */
    private String tupian;

    /**
     * 配件类型
     */
    private String peijianleixing;

    /**
     * 规格
     */
    private String guige;

    /**
     * 库存数量
     */
    private Integer shuliang;

    /**
     * 单价
     */
    private Double danjia;

    /**
     * 备注
     */
    private String beizhu;

    @JsonFormat(locale = "zh", timezone = "GMT+8", pattern = "yyyy-MM-dd HH:mm:ss")
    @DateTimeFormat
    private Date addtime;

    public PeijianEntity() {
    }

    public PeijianEntity(T t) {
        try {
            BeanUtils.copyProperties(this, t);
        } catch (IllegalAccessException | InvocationTargetException e) {
            e.printStackTrace();
        }
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getPeijianmingcheng() {
        return peijianmingcheng;
    }

    public void setPeijianmingcheng(String peijianmingcheng) {
        this.peijianmingcheng = peijianmingcheng;
    }

    public String getTupian() {
        return tupian;
    }

    public void setTupian(String tupian) {
        this.tupian = tupian;
    }

    public String getPeijianleixing() {
        return peijianleixing;
    }

    public void setPeijianleixing(String peijianleixing) {
        this.peijianleixing = peijianleixing;
    }

    public String getGuige() {
        return guige;
    }

    public void setGuige(String guige) {
        this.guige = guige;
    }

    public Integer getShuliang() {
        return shuliang;
    }

    public void setShuliang(Integer shuliang) {
        this.shuliang = shuliang;
    }

    public Double getDanjia() {
        return danjia;
    }

    public void setDanjia(Double danjia) {
        this.danjia = danjia;
    }

    public String getBeizhu() {
        return beizhu;
    }

    public void setBeizhu(String beizhu) {
        this.beizhu = beizhu;
    }

    public Date getAddtime() {
        return addtime;
    }

    public void setAddtime(Date addtime) {
        this.addtime = addtime;
    }
}
