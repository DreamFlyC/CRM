package com.lw.sysworktaskprocessing.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * sys_worktask_processing
 * @author 
 */
public class SysWorktaskProcessing implements Serializable {
    
    private int id;

    private String processingNumber;

    private String title;

    private String remark;

    /**
     * 完成进度
     */
    private int progress;

    private int type;

    /**
     * 开始日期时间
     */
    private Date startTime;

    /**
     * 结束日期时间
     */
    private Date endTime;

    private Date addTime;

    /**
     * 状态 0未完成  1已完成
     */
    private int status;

    private static final long serialVersionUID = 1L;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getProcessingNumber() {
        return processingNumber;
    }

    public void setProcessingNumber(String processingNumber) {
        this.processingNumber = processingNumber;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public int getProgress() {
        return progress;
    }

    public void setProgress(int progress) {
        this.progress = progress;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public Date getStartTime() {
        return startTime;
    }

    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

    public Date getAddTime() {
        return addTime;
    }

    public void setAddTime(Date addTime) {
        this.addTime = addTime;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
}