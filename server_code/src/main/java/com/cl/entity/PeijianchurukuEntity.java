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

@TableName("peijianchuruku")
public class PeijianchurukuEntity<T> implements Serializable {
    private static final long serialVersionUID = 1L;

    @TableId(type = IdType.AUTO)
    private Long id;
    private String peijianmingcheng;
    private String peijianleixing;
    private Integer shuliang;
    private String caozuoleixing; // 入库 或 出库
    private String beizhu;
    private String caozuoren;

    @JsonFormat(locale = "zh", timezone = "GMT+8", pattern = "yyyy-MM-dd HH:mm:ss")
    @DateTimeFormat
    private Date addtime;

    public PeijianchurukuEntity() {}
    public PeijianchurukuEntity(T t) {
        try { BeanUtils.copyProperties(this, t); } catch (Exception e) { e.printStackTrace(); }
    }

    // Getters and Setters
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }
    public String getPeijianmingcheng() { return peijianmingcheng; }
    public void setPeijianmingcheng(String peijianmingcheng) { this.peijianmingcheng = peijianmingcheng; }
    public String getPeijianleixing() { return peijianleixing; }
    public void setPeijianleixing(String peijianleixing) { this.peijianleixing = peijianleixing; }
    public Integer getShuliang() { return shuliang; }
    public void setShuliang(Integer shuliang) { this.shuliang = shuliang; }
    public String getCaozuoleixing() { return caozuoleixing; }
    public void setCaozuoleixing(String caozuoleixing) { this.caozuoleixing = caozuoleixing; }
    public String getBeizhu() { return beizhu; }
    public void setBeizhu(String beizhu) { this.beizhu = beizhu; }
    public String getCaozuoren() { return caozuoren; }
    public void setCaozuoren(String caozuoren) { this.caozuoren = caozuoren; }
    public Date getAddtime() { return addtime; }
    public void setAddtime(Date addtime) { this.addtime = addtime; }
}
