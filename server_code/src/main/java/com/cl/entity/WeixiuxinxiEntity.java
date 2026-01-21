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
 * 维修信息
 * 数据库通用操作实体类（普通增删改查）
 *
 * @author
 * @email
 * @date 2025-02-04 11:06:46
 */
@TableName("weixiuxinxi")
public class WeixiuxinxiEntity<T> implements Serializable {
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
     * 是否支付
     */

    private String ispay;
    /**
     * 故障位置
     */

    private String guzhangweizhi;
    /**
     * 故障原因
     */

    private String guzhangyuanyin;
    /**
     * 维修费用
     */

    private Double weixiufeiyong;
    /**
     * 维修内容
     */

    private String weixiuneirong;
    /**
     * 检查报告
     */

    private String jianchabaogao;


    /**
     * 材料费 (新加)
     */
    private Double cailiaofei;

    /**
     * 工时费 (新加)
     */
    private Double gongshifei;
    /**
     * 建议信息
     */

    private String jianyixinxi;
    /**
     * 维修时间
     */

    @JsonFormat(locale = "zh", timezone = "GMT+8", pattern = "yyyy-MM-dd HH:mm:ss")
    @DateTimeFormat
    private Date weixiushijian;
    /**
     * 维修次数
     */

    private Integer weixiucishu;
    @JsonFormat(locale = "zh", timezone = "GMT+8", pattern = "yyyy-MM-dd HH:mm:ss")
    @DateTimeFormat
    private Date addtime;

    public WeixiuxinxiEntity() {

    }


    public WeixiuxinxiEntity(T t) {
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
     * 获取：是否支付
     */
    public String getIspay() {
        return ispay;
    }

    /**
     * 设置：是否支付
     */
    public void setIspay(String ispay) {
        this.ispay = ispay;
    }

    /**
     * 获取：故障位置
     */
    public String getGuzhangweizhi() {
        return guzhangweizhi;
    }

    /**
     * 设置：故障位置
     */
    public void setGuzhangweizhi(String guzhangweizhi) {
        this.guzhangweizhi = guzhangweizhi;
    }

    /**
     * 获取：故障原因
     */
    public String getGuzhangyuanyin() {
        return guzhangyuanyin;
    }

    /**
     * 设置：故障原因
     */
    public void setGuzhangyuanyin(String guzhangyuanyin) {
        this.guzhangyuanyin = guzhangyuanyin;
    }

    /**
     * 获取：维修费用
     */
    public Double getWeixiufeiyong() {
        return weixiufeiyong;
    }

    /**
     * 设置：维修费用
     */
    public void setWeixiufeiyong(Double weixiufeiyong) {
        this.weixiufeiyong = weixiufeiyong;
    }

    /**
     * 获取：维修内容
     */
    public String getWeixiuneirong() {
        return weixiuneirong;
    }

    /**
     * 设置：维修内容
     */
    public void setWeixiuneirong(String weixiuneirong) {
        this.weixiuneirong = weixiuneirong;
    }

    /**
     * 获取：检查报告
     */
    public String getJianchabaogao() {
        return jianchabaogao;
    }

    /**
     * 设置：检查报告
     */
    public void setJianchabaogao(String jianchabaogao) {
        this.jianchabaogao = jianchabaogao;
    }

    /**
     * 获取：建议信息
     */
    public String getJianyixinxi() {
        return jianyixinxi;
    }

    /**
     * 设置：建议信息
     */
    public void setJianyixinxi(String jianyixinxi) {
        this.jianyixinxi = jianyixinxi;
    }

    /**
     * 获取：维修时间
     */
    public Date getWeixiushijian() {
        return weixiushijian;
    }

    /**
     * 设置：维修时间
     */
    public void setWeixiushijian(Date weixiushijian) {
        this.weixiushijian = weixiushijian;
    }

    /**
     * 获取：维修次数
     */
    public Integer getWeixiucishu() {
        return weixiucishu;
    }

    /**
     * 设置：维修次数
     */
    public void setWeixiucishu(Integer weixiucishu) {
        this.weixiucishu = weixiucishu;
    }

    public Double getCailiaofei() { return cailiaofei; }
    public void setCailiaofei(Double cailiaofei) { this.cailiaofei = cailiaofei; }
    public Double getGongshifei() { return gongshifei; }
    public void setGongshifei(Double gongshifei) { this.gongshifei = gongshifei; }

}
