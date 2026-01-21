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
 * 取消预约
 * 数据库通用操作实体类（普通增删改查）
 *
 * @author
 * @email
 * @date 2025-02-04 11:06:47
 */
@TableName("quxiaoyuyue")
public class QuxiaoyuyueEntity<T> implements Serializable {
    private static final long serialVersionUID = 1L;
    /**
     * 主键id
     */
    @TableId(type = IdType.AUTO)
    private Long id;
    /**
     * 报修编号
     */

    private String baoxiubianhao;
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
     * 故障类型
     */

    private String guzhangleixing;
    /**
     * 报修标题
     */

    private String baoxiubiaoti;
    /**
     * 取消原因
     */

    private String quxiaoyuanyin;
    /**
     * 取消时间
     */

    @JsonFormat(locale = "zh", timezone = "GMT+8", pattern = "yyyy-MM-dd HH:mm:ss")
    @DateTimeFormat
    private Date quxiaoshijian;
    @JsonFormat(locale = "zh", timezone = "GMT+8", pattern = "yyyy-MM-dd HH:mm:ss")
    @DateTimeFormat
    private Date addtime;

    public QuxiaoyuyueEntity() {

    }


    public QuxiaoyuyueEntity(T t) {
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
     * 获取：报修编号
     */
    public String getBaoxiubianhao() {
        return baoxiubianhao;
    }

    /**
     * 设置：报修编号
     */
    public void setBaoxiubianhao(String baoxiubianhao) {
        this.baoxiubianhao = baoxiubianhao;
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
     * 获取：故障类型
     */
    public String getGuzhangleixing() {
        return guzhangleixing;
    }

    /**
     * 设置：故障类型
     */
    public void setGuzhangleixing(String guzhangleixing) {
        this.guzhangleixing = guzhangleixing;
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
     * 获取：取消原因
     */
    public String getQuxiaoyuanyin() {
        return quxiaoyuanyin;
    }

    /**
     * 设置：取消原因
     */
    public void setQuxiaoyuanyin(String quxiaoyuanyin) {
        this.quxiaoyuanyin = quxiaoyuanyin;
    }

    /**
     * 获取：取消时间
     */
    public Date getQuxiaoshijian() {
        return quxiaoshijian;
    }

    /**
     * 设置：取消时间
     */
    public void setQuxiaoshijian(Date quxiaoshijian) {
        this.quxiaoshijian = quxiaoshijian;
    }

}
