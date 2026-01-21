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
 * 维修评价
 * 数据库通用操作实体类（普通增删改查）
 *
 * @author
 * @email
 * @date 2025-02-04 11:06:47
 */
@TableName("weixiupingjia")
public class WeixiupingjiaEntity<T> implements Serializable {
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
     * 报修标题
     */

    private String baoxiubiaoti;
    /**
     * 维修账号
     */

    private String weixiuzhanghao;
    /**
     * 维修姓名
     */

    private String weixiuxingming;
    /**
     * 评分
     */

    private String pingfen;
    /**
     * 评语
     */

    private String pingyu;
    /**
     * 评价时间
     */

    @JsonFormat(locale = "zh", timezone = "GMT+8", pattern = "yyyy-MM-dd HH:mm:ss")
    @DateTimeFormat
    private Date pingjiashijian;
    /**
     * 跨表用户id
     */

    private Long crossuserid;
    /**
     * 跨表主键id
     */

    private Long crossrefid;
    @JsonFormat(locale = "zh", timezone = "GMT+8", pattern = "yyyy-MM-dd HH:mm:ss")
    @DateTimeFormat
    private Date addtime;

    public WeixiupingjiaEntity() {

    }


    public WeixiupingjiaEntity(T t) {
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
     * 获取：报修标题
     */
    public String getBaoxiubiaoti() {
        return baoxiubiaoti;
    }

    /**
     * 设置：报修标题
     */
    public void setBaoxiubiaoti(String baoxiubiaoti) {
        this.baoxiubiaoti = baoxiubiaoti;
    }

    /**
     * 获取：维修账号
     */
    public String getWeixiuzhanghao() {
        return weixiuzhanghao;
    }

    /**
     * 设置：维修账号
     */
    public void setWeixiuzhanghao(String weixiuzhanghao) {
        this.weixiuzhanghao = weixiuzhanghao;
    }

    /**
     * 获取：维修姓名
     */
    public String getWeixiuxingming() {
        return weixiuxingming;
    }

    /**
     * 设置：维修姓名
     */
    public void setWeixiuxingming(String weixiuxingming) {
        this.weixiuxingming = weixiuxingming;
    }

    /**
     * 获取：评分
     */
    public String getPingfen() {
        return pingfen;
    }

    /**
     * 设置：评分
     */
    public void setPingfen(String pingfen) {
        this.pingfen = pingfen;
    }

    /**
     * 获取：评语
     */
    public String getPingyu() {
        return pingyu;
    }

    /**
     * 设置：评语
     */
    public void setPingyu(String pingyu) {
        this.pingyu = pingyu;
    }

    /**
     * 获取：评价时间
     */
    public Date getPingjiashijian() {
        return pingjiashijian;
    }

    /**
     * 设置：评价时间
     */
    public void setPingjiashijian(Date pingjiashijian) {
        this.pingjiashijian = pingjiashijian;
    }

    /**
     * 获取：跨表用户id
     */
    public Long getCrossuserid() {
        return crossuserid;
    }

    /**
     * 设置：跨表用户id
     */
    public void setCrossuserid(Long crossuserid) {
        this.crossuserid = crossuserid;
    }

    /**
     * 获取：跨表主键id
     */
    public Long getCrossrefid() {
        return crossrefid;
    }

    /**
     * 设置：跨表主键id
     */
    public void setCrossrefid(Long crossrefid) {
        this.crossrefid = crossrefid;
    }

}
