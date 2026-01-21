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
 * 维修预约
 * 数据库通用操作实体类（普通增删改查）
 *
 * @author
 * @email
 * @date 2025-02-04 11:06:46
 */
@TableName("weixiuyuyue")
public class WeixiuyuyueEntity<T> implements Serializable {
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
     * 预约次数
     */

    private Integer yuyuecishu;
    /**
     * 报修标题
     */

    private String baoxiubiaoti;
    /**
     * 报修原因
     */

    private String baoxiuyuanyin;
    /**
     * 预约时间
     */

    @JsonFormat(locale = "zh", timezone = "GMT+8", pattern = "yyyy-MM-dd HH:mm:ss")
    @DateTimeFormat
    private Date yuyueshijian;
    /**
     * 是否审核
     */

    private String sfsh;
    /**
     * 回复内容
     */

    private String shhf;
    /**
     * 分配状态
     */

    private String fenpeizhuangtai;
    /**
     * 备注
     */

    private String beizhu;
    @JsonFormat(locale = "zh", timezone = "GMT+8", pattern = "yyyy-MM-dd HH:mm:ss")
    @DateTimeFormat
    private Date addtime;

    public WeixiuyuyueEntity() {

    }


    public WeixiuyuyueEntity(T t) {
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
     * 获取：预约次数
     */
    public Integer getYuyuecishu() {
        return yuyuecishu;
    }

    /**
     * 设置：预约次数
     */
    public void setYuyuecishu(Integer yuyuecishu) {
        this.yuyuecishu = yuyuecishu;
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
     * 获取：报修原因
     */
    public String getBaoxiuyuanyin() {
        return baoxiuyuanyin;
    }

    /**
     * 设置：报修原因
     */
    public void setBaoxiuyuanyin(String baoxiuyuanyin) {
        this.baoxiuyuanyin = baoxiuyuanyin;
    }

    /**
     * 获取：预约时间
     */
    public Date getYuyueshijian() {
        return yuyueshijian;
    }

    /**
     * 设置：预约时间
     */
    public void setYuyueshijian(Date yuyueshijian) {
        this.yuyueshijian = yuyueshijian;
    }

    /**
     * 获取：是否审核
     */
    public String getSfsh() {
        return sfsh;
    }

    /**
     * 设置：是否审核
     */
    public void setSfsh(String sfsh) {
        this.sfsh = sfsh;
    }

    /**
     * 获取：回复内容
     */
    public String getShhf() {
        return shhf;
    }

    /**
     * 设置：回复内容
     */
    public void setShhf(String shhf) {
        this.shhf = shhf;
    }

    /**
     * 获取：分配状态
     */
    public String getFenpeizhuangtai() {
        return fenpeizhuangtai;
    }

    /**
     * 设置：分配状态
     */
    public void setFenpeizhuangtai(String fenpeizhuangtai) {
        this.fenpeizhuangtai = fenpeizhuangtai;
    }

    /**
     * 获取：备注
     */
    public String getBeizhu() {
        return beizhu;
    }

    /**
     * 设置：备注
     */
    public void setBeizhu(String beizhu) {
        this.beizhu = beizhu;
    }

}
