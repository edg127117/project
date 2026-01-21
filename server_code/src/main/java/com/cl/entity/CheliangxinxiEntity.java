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
 * 车辆信息
 * 数据库通用操作实体类（普通增删改查）
 *
 * @author
 * @email
 * @date 2025-02-04 11:06:46
 */
@TableName("cheliangxinxi")
public class CheliangxinxiEntity<T> implements Serializable {
    private static final long serialVersionUID = 1L;
    /**
     * 主键id
     */
    @TableId(type = IdType.AUTO)
    private Long id;
    /**
     * 车牌号
     */

    private String chepaihao;
    /**
     * 车型
     */

    private String chexing;
    /**
     * 车身颜色
     */

    private String cheshenyanse;
    /**
     * 车辆图片
     */

    private String cheliangtupian;
    /**
     * 车辆品牌
     */

    private String cheliangpinpai;
    /**
     * 车辆型号
     */

    private String cheliangxinghao;
    /**
     * 用户账号
     */

    private String yonghuzhanghao;
    /**
     * 用户姓名
     */

    private String yonghuxingming;
    /**
     * 手机号码
     */

    private String shoujihaoma;
    @JsonFormat(locale = "zh", timezone = "GMT+8", pattern = "yyyy-MM-dd HH:mm:ss")
    @DateTimeFormat
    private Date addtime;

    public CheliangxinxiEntity() {

    }


    public CheliangxinxiEntity(T t) {
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
     * 获取：车牌号
     */
    public String getChepaihao() {
        return chepaihao;
    }

    /**
     * 设置：车牌号
     */
    public void setChepaihao(String chepaihao) {
        this.chepaihao = chepaihao;
    }

    /**
     * 获取：车型
     */
    public String getChexing() {
        return chexing;
    }

    /**
     * 设置：车型
     */
    public void setChexing(String chexing) {
        this.chexing = chexing;
    }

    /**
     * 获取：车身颜色
     */
    public String getCheshenyanse() {
        return cheshenyanse;
    }

    /**
     * 设置：车身颜色
     */
    public void setCheshenyanse(String cheshenyanse) {
        this.cheshenyanse = cheshenyanse;
    }

    /**
     * 获取：车辆图片
     */
    public String getCheliangtupian() {
        return cheliangtupian;
    }

    /**
     * 设置：车辆图片
     */
    public void setCheliangtupian(String cheliangtupian) {
        this.cheliangtupian = cheliangtupian;
    }

    /**
     * 获取：车辆品牌
     */
    public String getCheliangpinpai() {
        return cheliangpinpai;
    }

    /**
     * 设置：车辆品牌
     */
    public void setCheliangpinpai(String cheliangpinpai) {
        this.cheliangpinpai = cheliangpinpai;
    }

    /**
     * 获取：车辆型号
     */
    public String getCheliangxinghao() {
        return cheliangxinghao;
    }

    /**
     * 设置：车辆型号
     */
    public void setCheliangxinghao(String cheliangxinghao) {
        this.cheliangxinghao = cheliangxinghao;
    }

    /**
     * 获取：用户账号
     */
    public String getYonghuzhanghao() {
        return yonghuzhanghao;
    }

    /**
     * 设置：用户账号
     */
    public void setYonghuzhanghao(String yonghuzhanghao) {
        this.yonghuzhanghao = yonghuzhanghao;
    }

    /**
     * 获取：用户姓名
     */
    public String getYonghuxingming() {
        return yonghuxingming;
    }

    /**
     * 设置：用户姓名
     */
    public void setYonghuxingming(String yonghuxingming) {
        this.yonghuxingming = yonghuxingming;
    }

    /**
     * 获取：手机号码
     */
    public String getShoujihaoma() {
        return shoujihaoma;
    }

    /**
     * 设置：手机号码
     */
    public void setShoujihaoma(String shoujihaoma) {
        this.shoujihaoma = shoujihaoma;
    }

}
