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


/**
 * 收费标准
 * 数据库通用操作实体类（普通增删改查）
 *
 * @author
 * @email
 * @date 2025-02-04 11:06:47
 */
@TableName("shoufeibiaozhun")
public class ShoufeibiaozhunEntity<T> implements Serializable {
    private static final long serialVersionUID = 1L;
    /**
     * 主键id
     */
    @TableId(type = IdType.AUTO)
    private Long id;
    /**
     * 收费项目
     */

    private String shoufeixiangmu;
    /**
     * 封面
     */

    private String fengmian;
    /**
     * 执行标准
     */

    private String zhixingbiaozhun;
    /**
     * 收费详情
     */

    private String shoufeixiangqing;
    /**
     * 发布日期
     */

    @JsonFormat(locale = "zh", timezone = "GMT+8", pattern = "yyyy-MM-dd")
    @DateTimeFormat
    private Date faburiqi;
    /**
     * 收藏数
     */

    private Integer storeupNumber;
    @JsonFormat(locale = "zh", timezone = "GMT+8", pattern = "yyyy-MM-dd HH:mm:ss")
    @DateTimeFormat
    private Date addtime;

    public ShoufeibiaozhunEntity() {

    }


    public ShoufeibiaozhunEntity(T t) {
        try {
            BeanUtils.copyProperties(this, t);
        } catch (IllegalAccessException | InvocationTargetException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    public Date getAddtime() {
        return addtime;
    }

    public void setAddtime(Date addtime) {
        this.addtime = addtime;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    /**
     * 获取：收费项目
     */
    public String getShoufeixiangmu() {
        return shoufeixiangmu;
    }

    /**
     * 设置：收费项目
     */
    public void setShoufeixiangmu(String shoufeixiangmu) {
        this.shoufeixiangmu = shoufeixiangmu;
    }

    /**
     * 获取：封面
     */
    public String getFengmian() {
        return fengmian;
    }

    /**
     * 设置：封面
     */
    public void setFengmian(String fengmian) {
        this.fengmian = fengmian;
    }

    /**
     * 获取：执行标准
     */
    public String getZhixingbiaozhun() {
        return zhixingbiaozhun;
    }

    /**
     * 设置：执行标准
     */
    public void setZhixingbiaozhun(String zhixingbiaozhun) {
        this.zhixingbiaozhun = zhixingbiaozhun;
    }

    /**
     * 获取：收费详情
     */
    public String getShoufeixiangqing() {
        return shoufeixiangqing;
    }

    /**
     * 设置：收费详情
     */
    public void setShoufeixiangqing(String shoufeixiangqing) {
        this.shoufeixiangqing = shoufeixiangqing;
    }

    /**
     * 获取：发布日期
     */
    public Date getFaburiqi() {
        return faburiqi;
    }

    /**
     * 设置：发布日期
     */
    public void setFaburiqi(Date faburiqi) {
        this.faburiqi = faburiqi;
    }

    /**
     * 获取：收藏数
     */
    public Integer getStoreupNumber() {
        return storeupNumber;
    }

    /**
     * 设置：收藏数
     */
    public void setStoreupNumber(Integer storeupNumber) {
        this.storeupNumber = storeupNumber;
    }

}
