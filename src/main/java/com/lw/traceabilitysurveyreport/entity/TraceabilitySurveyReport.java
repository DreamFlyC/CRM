package com.lw.traceabilitysurveyreport.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * traceability_survey_report
 * @author 
 */
public class TraceabilitySurveyReport implements Serializable {
    private int id;

    /**
     * 用户ID
     */
    private int userId;

    /**
     * 类型
     */
    private int type;

    /**
     * 添加时间
     */
    private Date addTime;

    /**
     * 检验报告编码
     */
    private String codeNumber;

    /**
     * 生产者ID
     */
    private int producerId;

    /**
     * 购买者D
     */
    private int purchaserId;

    /**
     * 检验结果 -1 不合格  1 合格   0为默认
     */
    private int status;

    /**
     * 生产日期
     */
    private Date makeDate;

    /**
     * 备注
     */
    private String remark;

    private static final long serialVersionUID = 1L;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public Date getAddTime() {
        return addTime;
    }

    public void setAddTime(Date addTime) {
        this.addTime = addTime;
    }

    public String getCodeNumber() {
        return codeNumber;
    }

    public void setCodeNumber(String codeNumber) {
        this.codeNumber = codeNumber;
    }

    public int getProducerId() {
        return producerId;
    }

    public void setProducerId(int producerId) {
        this.producerId = producerId;
    }

    public int getPurchaserId() {
        return purchaserId;
    }

    public void setPurchaserId(int purchaserId) {
        this.purchaserId = purchaserId;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public Date getMakeDate() {
        return makeDate;
    }

    public void setMakeDate(Date makeDate) {
        this.makeDate = makeDate;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }
}